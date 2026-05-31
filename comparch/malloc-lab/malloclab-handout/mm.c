/*
 * 
 *
 * overview
 * ---------------
 * Blocks carry a 4-byte (one word) header holding the block size and two low
 * status bits:
 *      bit 0  -> this block is allocated
 *      bit 1  -> the physically previous block is allocated (prev_alloc)
 *
 * Free blocks additionally carry a 4-byte boundary-tag footer (a copy of the
 * header) so that the previous block can be coalesced in O(1).  Allocated
 * blocks are footerless: because every block records whether its predecessor
 * is allocated via the prev_alloc bit, an allocated block never needs a footer.
 * Dropping it improves memory utilization for small allocations.
 *
 * Free blocks are threaded onto one of NLISTS segregated free lists, chosen by
 * size class (roughly powers of two).  Each free block stores a predecessor and
 * successor pointer in its first two words.  Allocation does a first fit in the
 * appropriate size class, falling through to larger classes.
 *
 * Two placement/realloc policies keep fragmentation low:
 *
 *   1. When a request is carved out of a larger free block, the allocated part
 *      is placed at the back of the block and the free remainder is left at
 *      the front.  This keeps the free remainder adjacent to the previous
 *      block, which is crucial for a repeatedly-grown realloc array: a small
 *      allocation never lands immediately behind it, so it can keep growing in
 *      place instead of relocating and stranding large abandoned blocks.
 *
 *   2. realloc grows in place by absorbing a following free block or extending
 *      the heap at the epilogue, avoiding a copy whenever possible.
 *
 * Block layout (sizes are bytes, words are 4 bytes; build is 32-bit / -m32):
 *
 *   Allocated:  | header |          payload            | (no footer)
 *   Free:       | header | pred | succ | junk | footer |
 *
 * Minimum block size is 16 bytes: header(4) + pred(4) + succ(4) + footer(4).
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/*********************************************************
 * NOTE TO STUDENTS: Before you do anything else, please
 * provide your team information in the following struct.
 ********************************************************/
team_t team = {
    /* Team name */
    "ReLU",
    /* First member's full name */
    "Raul-Andrei Pop",
    /* First member's email address */
    "raul-andrei.pop@polytechnique.edu",
    /* Second member's full name (leave blank if none) */
    "",
    /* Second member's email address (leave blank if none) */
    ""
};

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~0x7)

/* ---- Basic constants and macros ------------------------------------- */

#define WSIZE       4        // word / header / footer size (bytes)   
#define DSIZE       8        // double word size (bytes)              
#define MINBLOCK    16       // minimum block size (hdr+pred+succ+ftr)
#define CHUNKSIZE   (1 << 9) // amount to extend heap by (bytes)      
#define NLISTS      20       // number of segregated free lists       

#define MAX(x, y) ((x) > (y) ? (x) : (y))

/* Pack a size and the prev_alloc (bit 1) / alloc (bit 0) bits into a word */
#define PACK(size, prev, alloc) ((size) | (prev) | (alloc))

/* Read and write a word at address p */
#define GET(p)       (*(unsigned int *)(p))
#define PUT(p, val)  (*(unsigned int *)(p) = (unsigned int)(val))

/* Extract fields from a header/footer word */
#define GET_SIZE(p)        (GET(p) & ~0x7)
#define GET_ALLOC(p)       (GET(p) & 0x1)
#define GET_PREV_ALLOC(p)  (GET(p) & 0x2)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)  ((char *)(bp) - WSIZE)
#define FTRP(bp)  ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Given block ptr bp, compute address of next / previous block payloads.
 * PREV_BLKP is only valid when the previous block is free (has a footer). */
#define NEXT_BLKP(bp)  ((char *)(bp) + GET_SIZE(HDRP(bp)))
#define PREV_BLKP(bp)  ((char *)(bp) - GET_SIZE((char *)(bp) - DSIZE))

/* Free-list predecessor / successor pointers (stored in the payload). */
#define GET_PRED(bp)       (*(char **)(bp))
#define GET_SUCC(bp)       (*(char **)((char *)(bp) + WSIZE))
#define SET_PRED(bp, val)  (*(char **)(bp) = (char *)(val))
#define SET_SUCC(bp, val)  (*(char **)((char *)(bp) + WSIZE) = (char *)(val))

/* ---- Global state --------------------------------------------------- */

static char *heap_listp;          // prologue block pointer              
static char *free_lists[NLISTS];  // segregated free-list heads          

/* ---- Forward declarations ------------------------------------------- */

static void *extend_heap(size_t words);
static void *coalesce(void *bp);
static void *find_fit(size_t asize);
static void *place(void *bp, size_t asize);
static void  insert_node(void *bp);
static void  delete_node(void *bp);
static int   get_index(size_t size);
static void  set_prev_alloc(void *bp, size_t prev);
int          mm_check(void);

/* ---- Size-class selection ------------------------------------------- */

/* Map a block size to its segregated-list index (size classes ~ 2^k). */
static int get_index(size_t size)
{
    int idx = 0;
    size_t bound = MINBLOCK;
    while (idx < NLISTS - 1 && size > bound) {
        bound <<= 1;
        idx++;
    }
    return idx;
}

/* ---- Free-list maintenance (LIFO insertion) ------------------------- */

static void insert_node(void *bp)
{
    int idx = get_index(GET_SIZE(HDRP(bp)));
    char *head = free_lists[idx];

    SET_PRED(bp, NULL);
    SET_SUCC(bp, head);
    if (head != NULL)
        SET_PRED(head, bp);
    free_lists[idx] = bp;
}

static void delete_node(void *bp)
{
    int idx = get_index(GET_SIZE(HDRP(bp)));
    char *pred = GET_PRED(bp);
    char *succ = GET_SUCC(bp);

    if (pred != NULL)
        SET_SUCC(pred, succ);
    else
        free_lists[idx] = succ;
    if (succ != NULL)
        SET_PRED(succ, pred);
}

/* ---- prev_alloc bit maintenance ------------------------------------- */

/* Set block bp's prev_alloc bit (prev is 0 or 2) without touching others. */
static void set_prev_alloc(void *bp, size_t prev)
{
    unsigned int hdr = GET(HDRP(bp));
    if (prev)
        hdr |= 0x2;
    else
        hdr &= ~0x2u;
    PUT(HDRP(bp), hdr);
}

/* ---- Heap initialization -------------------------------------------- */

int mm_init(void)
{
    int i;
    for (i = 0; i < NLISTS; i++)
        free_lists[i] = NULL;

    /* Create the initial empty heap: padding + prologue + epilogue. */
    if ((heap_listp = mem_sbrk(4 * WSIZE)) == (void *)-1)
        return -1;

    PUT(heap_listp, 0);                                /* alignment padding   */
    PUT(heap_listp + (1 * WSIZE), PACK(DSIZE, 2, 1));  /* prologue header     */
    PUT(heap_listp + (2 * WSIZE), PACK(DSIZE, 2, 1));  /* prologue footer     */
    PUT(heap_listp + (3 * WSIZE), PACK(0, 2, 1));      /* epilogue header     */
    heap_listp += (2 * WSIZE);

    /* Do not pre-extend the heap: the first mm_malloc sizes the initial
     * region exactly to what is requested.  Pre-allocating a fixed CHUNKSIZE
     * block would otherwise sit as dead weight when the first requests do not
     * happen to fit it (e.g. the coalescing-bal trace), hurting utilization. */
    return 0;
}

/* ---- Heap extension ------------------------------------------------- */

static void *extend_heap(size_t words)
{
    char *bp;
    size_t size;
    size_t prev_alloc;

    /* Allocate an even number of words to maintain alignment. */
    size = (words % 2) ? (words + 1) * WSIZE : words * WSIZE;
    if (size < MINBLOCK)
        size = MINBLOCK;
    if ((long)(bp = mem_sbrk(size)) == -1)
        return NULL;

    /* The old epilogue header becomes the new free block's header; inherit
     * its prev_alloc bit. */
    prev_alloc = GET_PREV_ALLOC(HDRP(bp));
    PUT(HDRP(bp), PACK(size, prev_alloc, 0));   /* free block header  */
    PUT(FTRP(bp), PACK(size, prev_alloc, 0));   /* free block footer  */
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 0, 1));    /* new epilogue header */

    /* Coalesce if the previous block was free, and add to a free list. */
    return coalesce(bp);
}

/* ---- Coalescing ----------------------------------------------------- */

static void *coalesce(void *bp)
{
    size_t prev_alloc = GET_PREV_ALLOC(HDRP(bp));
    size_t next_alloc = GET_ALLOC(HDRP(NEXT_BLKP(bp)));
    size_t size = GET_SIZE(HDRP(bp));

    if (prev_alloc && next_alloc) {                 /* Case 1: no merge    */
        /* nothing to merge */
    }
    else if (prev_alloc && !next_alloc) {           /* Case 2: merge next  */
        delete_node(NEXT_BLKP(bp));
        size += GET_SIZE(HDRP(NEXT_BLKP(bp)));
        PUT(HDRP(bp), PACK(size, 2, 0));
        PUT(FTRP(bp), PACK(size, 2, 0));
    }
    else if (!prev_alloc && next_alloc) {           /* Case 3: merge prev  */
        size_t pa = GET_PREV_ALLOC(HDRP(PREV_BLKP(bp)));
        delete_node(PREV_BLKP(bp));
        size += GET_SIZE(HDRP(PREV_BLKP(bp)));
        bp = PREV_BLKP(bp);
        PUT(HDRP(bp), PACK(size, pa, 0));
        PUT(FTRP(bp), PACK(size, pa, 0));
    }
    else {                                          /* Case 4: merge both  */
        size_t pa = GET_PREV_ALLOC(HDRP(PREV_BLKP(bp)));
        delete_node(PREV_BLKP(bp));
        delete_node(NEXT_BLKP(bp));
        size += GET_SIZE(HDRP(PREV_BLKP(bp))) + GET_SIZE(HDRP(NEXT_BLKP(bp)));
        bp = PREV_BLKP(bp);
        PUT(HDRP(bp), PACK(size, pa, 0));
        PUT(FTRP(bp), PACK(size, pa, 0));
    }

    /* The coalesced block is free, so its successor's prev_alloc bit is 0. */
    set_prev_alloc(NEXT_BLKP(bp), 0);
    insert_node(bp);
    return bp;
}

/* ---- Placement / splitting ------------------------------------------ */

/* Place an asize-byte allocated block within free block bp, splitting if the
 * remainder is large enough.  When splitting, the allocated block is put at
 * the BACK so the free remainder stays adjacent to the previous block (see the
 * file header).  Returns the payload pointer of the allocated block. */
static void *place(void *bp, size_t asize)
{
    size_t csize = GET_SIZE(HDRP(bp));
    size_t prev_alloc = GET_PREV_ALLOC(HDRP(bp));

    delete_node(bp);

    if ((csize - asize) >= MINBLOCK) {
        size_t rsize = csize - asize;               /* free remainder size  */
        char *abp;

        /* Free remainder at the front (keeps prev_alloc of original block). */
        PUT(HDRP(bp), PACK(rsize, prev_alloc, 0));
        PUT(FTRP(bp), PACK(rsize, prev_alloc, 0));
        insert_node(bp);

        /* Allocated block at the back; its predecessor (remainder) is free. */
        abp = NEXT_BLKP(bp);
        PUT(HDRP(abp), PACK(asize, 0, 1));
        set_prev_alloc(NEXT_BLKP(abp), 2);          /* successor: prev alloc */
        return abp;
    }

    /* Use the whole block. */
    PUT(HDRP(bp), PACK(csize, prev_alloc, 1));
    set_prev_alloc(NEXT_BLKP(bp), 2);               /* successor: prev alloc */
    return bp;
}

/* ---- Fit search ----------------------------------------------------- */

static void *find_fit(size_t asize)
{
    int i;
    for (i = get_index(asize); i < NLISTS; i++) {
        char *bp = free_lists[i];
        while (bp != NULL) {
            if (GET_SIZE(HDRP(bp)) >= asize)
                return bp;
            bp = GET_SUCC(bp);
        }
    }
    return NULL;
}

/* ---- malloc --------------------------------------------------------- */

void *mm_malloc(size_t size)
{
    size_t asize;       /* adjusted (aligned) block size */
    size_t extendsize;  /* amount to grow heap if no fit */
    char *bp;

    if (size == 0)
        return NULL;

    /* Allocated blocks need only a header, then 8-byte align;
     * enforce the minimum free-block size so the block can be freed later. */
    asize = ALIGN(size + WSIZE);
    if (asize < MINBLOCK)
        asize = MINBLOCK;

    if ((bp = find_fit(asize)) != NULL) {
        void *_r = place(bp, asize);
        // { static long _c=0; if ((++_c % 500)==0  && !mm_check()) { fprintf(stderr,"CHECK FAILED at malloc #%ld\n",_c); exit(2);} }
        return _r;
    }

    /* No fit found: grow the heap. */
    extendsize = MAX(asize, CHUNKSIZE);
    if ((bp = extend_heap(extendsize / WSIZE)) == NULL)
        return NULL;
    return place(bp, asize);
}

/* ---- free ----------------------------------------------------------- */

void mm_free(void *bp)
{
    size_t size;
    size_t prev_alloc;

    if (bp == NULL)
        return;

    size = GET_SIZE(HDRP(bp));
    prev_alloc = GET_PREV_ALLOC(HDRP(bp));

    PUT(HDRP(bp), PACK(size, prev_alloc, 0));   /* mark free, add footer */
    PUT(FTRP(bp), PACK(size, prev_alloc, 0));
    coalesce(bp);
}

/* ---- realloc -------------------------------------------------------- */

void *mm_realloc(void *ptr, size_t size)
{
    size_t oldsize, asize;
    void *newptr;

    if (ptr == NULL)
        return mm_malloc(size);
    if (size == 0) {
        mm_free(ptr);
        return NULL;
    }

    asize = ALIGN(size + WSIZE);
    if (asize < MINBLOCK)
        asize = MINBLOCK;

    oldsize = GET_SIZE(HDRP(ptr));

    /* Shrinking or same size: keep the block in place, splitting off the tail. */
    if (asize <= oldsize) {
        size_t prev_alloc = GET_PREV_ALLOC(HDRP(ptr));
        if ((oldsize - asize) >= MINBLOCK) {
            char *rem;
            PUT(HDRP(ptr), PACK(asize, prev_alloc, 1));
            rem = NEXT_BLKP(ptr);
            PUT(HDRP(rem), PACK(oldsize - asize, 2, 0));
            PUT(FTRP(rem), PACK(oldsize - asize, 2, 0));
            set_prev_alloc(NEXT_BLKP(rem), 0);
            coalesce(rem);
        }
        return ptr;
    }

    /* Growing in place. */
    {
        size_t prev_alloc = GET_PREV_ALLOC(HDRP(ptr));
        char *next = NEXT_BLKP(ptr);

        /* Absorb a following free block when it makes the block big enough. */
        if (!GET_ALLOC(HDRP(next))) {
            size_t combined = oldsize + GET_SIZE(HDRP(next));
            if (combined >= asize) {
                delete_node(next);
                if ((combined - asize) >= MINBLOCK) {
                    char *rem;
                    PUT(HDRP(ptr), PACK(asize, prev_alloc, 1));
                    rem = NEXT_BLKP(ptr);
                    PUT(HDRP(rem), PACK(combined - asize, 2, 0));
                    PUT(FTRP(rem), PACK(combined - asize, 2, 0));
                    insert_node(rem);
                    set_prev_alloc(NEXT_BLKP(rem), 0);
                } else {
                    PUT(HDRP(ptr), PACK(combined, prev_alloc, 1));
                    set_prev_alloc(NEXT_BLKP(ptr), 2);
                }
                return ptr;
            }
           
            
            if (GET_SIZE(HDRP(NEXT_BLKP(next))) == 0) {
                delete_node(next);
                oldsize = combined;
                PUT(HDRP(ptr), PACK(oldsize, prev_alloc, 1));
                next = NEXT_BLKP(ptr);              /* now the epilogue */
            }
        }

        /* If ptr ends the heap, extend the heap in place instead of copying.
        */
        if (GET_SIZE(HDRP(next)) == 0) {            /* next is the epilogue */
            size_t need = asize - oldsize;          /* multiple of 8 */
            if ((long)mem_sbrk(need) != -1) {
                PUT(HDRP(ptr), PACK(asize, prev_alloc, 1));
                PUT(HDRP(NEXT_BLKP(ptr)), PACK(0, 2, 1));  /* new epilogue */
                return ptr;
            }
        }
    }

    /* Fall back to allocate-copy-free. */
    newptr = mm_malloc(size);
    if (newptr == NULL)
        return NULL;

    /* Copy the old payload (block size minus the one-word header). */
    {
        size_t copysize = oldsize - WSIZE;
        if (size < copysize)
            copysize = size;
        memcpy(newptr, ptr, copysize);
    }
    mm_free(ptr);
    return newptr;
}

/* ---- Heap consistency checker --------------------------------------- */

/*
 * mm_check - scan the heap and the free lists and verify every invariant the
 * allocator relies on.  Returns nonzero if the heap is consistent; otherwise
 * prints a description of the first violation found (to stderr) and returns 0.
 * (only used during debugging)
 *
 * Checks performed
 *   Heap walk (physical order, prologue -> epilogue):
 *     - prologue is an allocated DSIZE block; epilogue is an allocated size-0
 *       header sitting exactly at the end of the heap;
 *     - every block lies within [mem_heap_lo, mem_heap_hi];
 *     - every payload is 8-byte aligned and every block is at least MINBLOCK;
 *     - a free block's header and footer agree;
 *     - each header's prev_alloc bit matches the real allocation state of the
 *       physically preceding block;
 *     - no two consecutive free blocks exist (coalescing is immediate).
 *   Free-list walk (every size class):
 *     - each listed block is actually marked free and lies in the heap;
 *     - pred/succ links are mutually consistent;
 *     - each block sits in the size class its size maps to.
 *   Cross-check:
 *     - the number of free blocks found by the heap walk equals the number
 *       reachable through the free lists (no lost or duplicated free blocks).
 */
int mm_check(void)
{
    char *lo = (char *)mem_heap_lo();
    char *hi = (char *)mem_heap_hi();
    char *bp;
    int prev_free = 0;          /* was the previous block free? */
    int prev_alloc_actual = 1;  /* prologue acts as an allocated predecessor */
    long heap_free = 0;         /* free blocks seen in the physical heap */
    long list_free = 0;         /* free blocks reachable via the free lists */
    int i;

    /* The prologue payload pointer is heap_listp. */
    if (heap_listp == NULL) {
        fprintf(stderr, "mm_check: heap not initialized\n");
        return 0;
    }
    if (GET_SIZE(HDRP(heap_listp)) != DSIZE || !GET_ALLOC(HDRP(heap_listp))) {
        fprintf(stderr, "mm_check: bad prologue block\n");
        return 0;
    }

    /* Walk every block in physical order up to the epilogue. */
    for (bp = NEXT_BLKP(heap_listp); GET_SIZE(HDRP(bp)) > 0; bp = NEXT_BLKP(bp)) {
        size_t size = GET_SIZE(HDRP(bp));
        int alloc = GET_ALLOC(HDRP(bp));

        /* In-bounds: header and the whole block must lie within the heap. */
        if (HDRP(bp) < lo || (char *)bp + size - 1 > hi) {
            fprintf(stderr, "mm_check: block %p (size %zu) out of heap bounds\n",
                    (void *)bp, size);
            return 0;
        }
        /* Payload alignment. */
        if (((size_t)bp & (ALIGNMENT - 1)) != 0) {
            fprintf(stderr, "mm_check: block %p payload not %d-byte aligned\n",
                    (void *)bp, ALIGNMENT);
            return 0;
        }
        /* Minimum size and 8-byte multiple. */
        if (size < MINBLOCK || (size & (ALIGNMENT - 1)) != 0) {
            fprintf(stderr, "mm_check: block %p has invalid size %zu\n",
                    (void *)bp, size);
            return 0;
        }
        /* prev_alloc bit must reflect the real predecessor state. */
        if (!!GET_PREV_ALLOC(HDRP(bp)) != prev_alloc_actual) {
            fprintf(stderr, "mm_check: block %p prev_alloc bit disagrees with "
                    "actual predecessor state\n", (void *)bp);
            return 0;
        }
        if (!alloc) {
            /* Free block: header and footer must match. */
            if (GET(HDRP(bp)) != GET(FTRP(bp))) {
                fprintf(stderr, "mm_check: free block %p header/footer mismatch\n",
                        (void *)bp);
                return 0;
            }
            /* No two consecutive free blocks. */
            if (prev_free) {
                fprintf(stderr, "mm_check: uncoalesced adjacent free blocks "
                        "before %p\n", (void *)bp);
                return 0;
            }
            heap_free++;
        }

        prev_free = !alloc;
        prev_alloc_actual = alloc;
    }

    /* The loop stopped at the epilogue: verify it. */
    if (GET_SIZE(HDRP(bp)) != 0 || !GET_ALLOC(HDRP(bp))) {
        fprintf(stderr, "mm_check: bad epilogue block\n");
        return 0;
    }
    if (bp - 1 != hi) {
        fprintf(stderr, "mm_check: epilogue not at end of heap\n");
        return 0;
    }

    /* Walk every free list. */
    for (i = 0; i < NLISTS; i++) {
        char *prev = NULL;
        for (bp = free_lists[i]; bp != NULL; bp = GET_SUCC(bp)) {
            /* In-bounds and aligned. */
            if (HDRP(bp) < lo || (char *)bp > hi ||
                ((size_t)bp & (ALIGNMENT - 1)) != 0) {
                fprintf(stderr, "mm_check: free-list %d node %p out of bounds\n",
                        i, (void *)bp);
                return 0;
            }
            /* Must be marked free. */
            if (GET_ALLOC(HDRP(bp))) {
                fprintf(stderr, "mm_check: allocated block %p on free list %d\n",
                        (void *)bp, i);
                return 0;
            }
            /* pred link must point back to the previous node. */
            if (GET_PRED(bp) != prev) {
                fprintf(stderr, "mm_check: free-list %d broken pred link at %p\n",
                        i, (void *)bp);
                return 0;
            }
            /* Must be filed in the size class matching its size. */
            if (get_index(GET_SIZE(HDRP(bp))) != i) {
                fprintf(stderr, "mm_check: block %p (size %zu) in wrong size "
                        "class %d\n", (void *)bp, GET_SIZE(HDRP(bp)), i);
                return 0;
            }
            prev = bp;
            list_free++;
        }
    }

    /* Every free block must appear on exactly one list, and vice versa. */
    if (heap_free != list_free) {
        fprintf(stderr, "mm_check: %ld free blocks in heap but %ld on free "
                "lists\n", heap_free, list_free);
        return 0;
    }

    return 1;
}
