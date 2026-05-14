// Name: Raul-Andrei Pop
// ID: raul-andrei.pop@polytechnique.edu

#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

#include "cachelab.h"


/* Globals set by command line args */
int verbosity = 0; /* print trace if set */
int s = 0;         /* set index bits */
int S = -1;
int b = 0;         /* block offset bits */
int E = 0;         /* associativity */
char* trace_file = NULL;

/*
 * printUsage - Print usage info
 */
void printUsage(char* argv[])
{
    printf("Usage: %s [-hv] -s <num> -E <num> -b <num> -t <file>\n", argv[0]);
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n");
    printf("\nExamples:\n");
    printf("  linux>  %s -s 4 -E 1 -b 4 -t traces/yi.trace\n", argv[0]);
    printf("  linux>  %s -v -s 8 -E 2 -b 4 -t traces/yi.trace\n", argv[0]);
    exit(0);
}

typedef struct {
  int valid;
  unsigned long timestamp;
  unsigned long tag;
} line_t;

struct Statistics {
  int hits, misses, evictions;
} stats;

line_t ** cache;
int time = 0;

void access (unsigned long addr) {
  time++;
  unsigned long set_ind = (addr >> b) & ((1ul << s) - 1);
  unsigned long tag = addr >> (s + b);
  // printf("tag %ld\n" , tag);
  line_t* _set = cache[set_ind];

  int repl = 0;
  int evict = _set[0].valid, hit = 0;

  for (int block = 0; block < E; block ++) {
    if (_set[block].tag == tag && _set[block].valid) {
      // hit;
      stats.hits++;
      hit = 1;
      repl = block; // artificially replace to keep it simple
      evict = 0;
      break;
    }
    else if (_set[block].valid == 0) {
      evict = 0;
      repl = block;
    }
    else if (_set[block].timestamp < _set[repl].timestamp) {
      repl = block;
    }
  }

  if (!hit) {
    stats.misses++;
  }
  if (evict) stats.evictions++;

  line_t add_line = {1, time, tag};
  _set[repl] = add_line;
  if (verbosity) {
    if (hit) printf("hit ");
    else printf("miss ");
    if (evict) printf("eviction ");
  }
}


/*
 * main - Main routine 
 */
int main(int argc, char* argv[])
{
  char c;
  
  while( (c=getopt(argc,argv,"s:E:b:t:vh")) != -1){
    switch(c){
    case 's':
      s = atoi(optarg);
      break;
    case 'E':
      E = atoi(optarg);
      break;
    case 'b':
      b = atoi(optarg);
      break;
    case 't':
      trace_file = optarg;
      break;
    case 'v':
      verbosity = 1;
      break;
    case 'h':
      printUsage(argv);
      exit(0);
    default:
      printUsage(argv);
      exit(1);
    }
  }

  

  /* Make sure that all required command line args were specified */
  if (s == 0 || E == 0 || b == 0 || trace_file == NULL) {
    printf("%s: Missing required command line argument\n", argv[0]);
    printUsage(argv);
    exit(1);
  }

  // allocate cache simulator 
  S = (1 << s);
  cache = malloc (S * sizeof (line_t* ));
  for (int _set = 0; _set < S; _set++) {
    cache[_set] = calloc (E , sizeof(line_t));
  }

  FILE *fp = fopen(trace_file, "r");
  if (fp == NULL) {
      fprintf(stderr, "Could not open %s\n", trace_file);
      exit(1);
  }

  // parse valgirnd file
  char op;
  unsigned long addr;
  int size;
  while (fscanf(fp, " %c %lx,%d", &op, &addr, &size) == 3) {
    printf("%c %lx,%d ", op, addr, size);
    if (op == 'I') continue;
    access(addr);
    if (op == 'M') access(addr);
    putchar('\n');

  }

  printSummary(stats.hits, stats.misses, stats.evictions);
  return 0;
}
