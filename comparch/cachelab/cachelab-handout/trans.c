/* 
 * trans.c - Matrix transpose B = A^T
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */

void tr_32 (int M , int N , int A[N][M], int B[M][N]) {

    int BS = 8;
    int a0, a1, a2, a3, a4, a5, a6, a7;
    int ii, jj, i;

    for ( ii = 0; ii < M; ii += BS) {
        for ( jj = 0; jj < N; jj += BS) {
            for (i = ii; i < ii + BS; i++) {
                a0 = A[i][jj];
                a1 = A[i][jj + 1];
                a2 = A[i][jj + 2];
                a3 = A[i][jj + 3];
                a4 = A[i][jj + 4];
                a5 = A[i][jj + 5];
                a6 = A[i][jj + 6];
                a7 = A[i][jj + 7];
                B[jj][i] = a0;
                B[jj + 1][i] = a1;
                B[jj + 2][i] = a2;
                B[jj + 3][i] = a3;
                B[jj + 4][i] = a4;
                B[jj + 5][i] = a5;
                B[jj + 6][i] = a6;
                B[jj + 7][i] = a7;
            }
        }
    }

}

void tr_64(int M, int N, int A[N][M], int B[M][N]) {
    int ii, jj, i;
    int a0, a1, a2, a3, a4, a5, a6, a7;

    for (ii = 0; ii < N; ii += 8) {
        for (jj = 0; jj < M; jj += 8) {

            for (i = 0; i < 4; i++) {
                a0 = A[ii + i][jj    ];
                a1 = A[ii + i][jj + 1];
                a2 = A[ii + i][jj + 2];
                a3 = A[ii + i][jj + 3];
                a4 = A[ii + i][jj + 4];
                a5 = A[ii + i][jj + 5];
                a6 = A[ii + i][jj + 6];
                a7 = A[ii + i][jj + 7];

                B[jj    ][ii + i] = a0;
                B[jj + 1][ii + i] = a1;
                B[jj + 2][ii + i] = a2;
                B[jj + 3][ii + i] = a3;

                // store second A-block here temporarily for cache optimization
                B[jj    ][ii + i + 4] = a4;
                B[jj + 1][ii + i + 4] = a5;
                B[jj + 2][ii + i + 4] = a6;
                B[jj + 3][ii + i + 4] = a7;
            }

            
            for (i = 0; i < 4; i++) {
                
                a0 = A[ii + 4][jj + i];
                a1 = A[ii + 5][jj + i];
                a2 = A[ii + 6][jj + i];
                a3 = A[ii + 7][jj + i];

                
                a4 = B[jj + i][ii + 4];
                a5 = B[jj + i][ii + 5];
                a6 = B[jj + i][ii + 6];
                a7 = B[jj + i][ii + 7];

                
                B[jj + i][ii + 4] = a0;
                B[jj + i][ii + 5] = a1;
                B[jj + i][ii + 6] = a2;
                B[jj + i][ii + 7] = a3;

                // move B block to correct place
                B[jj + i + 4][ii    ] = a4;
                B[jj + i + 4][ii + 1] = a5;
                B[jj + i + 4][ii + 2] = a6;
                B[jj + i + 4][ii + 3] = a7;

                
                B[jj + i + 4][ii + 4] = A[ii + 4][jj + 4 + i];
                B[jj + i + 4][ii + 5] = A[ii + 5][jj + 4 + i];
                B[jj + i + 4][ii + 6] = A[ii + 6][jj + 4 + i];
                B[jj + i + 4][ii + 7] = A[ii + 7][jj + 4 + i];
            }
        }
    }
}

void tr_67 (int M, int N, int A[N][M], int B[M][N]) {
    int BS = 23;
    int ii, jj, i;
    int a0, a1, a2, a3, a4, a5, a6, a7;

    for (ii = 0; ii < N; ii += BS) {
        for (jj = 0; jj < M; jj += BS) {
            for (i = ii; i < N && i < ii + BS; i++) {
                if (jj + BS <= M) {
                    // load A into registers to avoid evict
                    if (ii == jj) {
                        // if we are on diagonal, we process in reverse order to get smt like:
                        // [ii][jj+B/3] [ii][j + b/2] ...
                        a0 = A[i][jj+16];  a1 = A[i][jj+17];  a2 = A[i][jj+18]; a3 = A[i][jj+19];
                        a4 = A[i][jj+20]; a5 = A[i][jj+21]; a6 = A[i][jj+22];
                        B[jj+16][i] = a0; B[jj+17][i] = a1; B[jj+18][i] = a2; B[jj+19][i] = a3;
                        B[jj+20][i] = a4; B[jj+21][i] = a5; B[jj+22][i] = a6;

                        a0 = A[i][jj+8];  a1 = A[i][jj+9];  a2 = A[i][jj+10]; a3 = A[i][jj+11];
                        a4 = A[i][jj+12]; a5 = A[i][jj+13]; a6 = A[i][jj+14]; a7 = A[i][jj+15];
                        B[jj+8 ][i] = a0; B[jj+9 ][i] = a1; B[jj+10][i] = a2; B[jj+11][i] = a3;
                        B[jj+12][i] = a4; B[jj+13][i] = a5; B[jj+14][i] = a6; B[jj+15][i] = a7;
                        a0 = A[i][jj];   a1 = A[i][jj+1]; a2 = A[i][jj+2]; a3 = A[i][jj+3];
                        a4 = A[i][jj+4]; a5 = A[i][jj+5]; a6 = A[i][jj+6]; a7 = A[i][jj+7];
                        B[jj  ][i] = a0; B[jj+1][i] = a1; B[jj+2][i] = a2; B[jj+3][i] = a3;
                        B[jj+4][i] = a4; B[jj+5][i] = a5; B[jj+6][i] = a6; B[jj+7][i] = a7;
                    }
                    else {
                        a0 = A[i][jj];
                        a1 = A[i][jj + 1];
                        a2 = A[i][jj + 2];
                        a3 = A[i][jj + 3];
                        a4 = A[i][jj + 4];
                        a5 = A[i][jj + 5];
                        a6 = A[i][jj + 6];
                        a7 = A[i][jj + 7];
                        B[jj][i] = a0;
                        B[jj + 1][i] = a1;
                        B[jj + 2][i] = a2;
                        B[jj + 3][i] = a3;
                        B[jj + 4][i] = a4;
                        B[jj + 5][i] = a5;
                        B[jj + 6][i] = a6;
                        B[jj + 7][i] = a7;
                        jj += 8;
                        a0 = A[i][jj];
                        a1 = A[i][jj + 1];
                        a2 = A[i][jj + 2];
                        a3 = A[i][jj + 3];
                        a4 = A[i][jj + 4];
                        a5 = A[i][jj + 5];
                        a6 = A[i][jj + 6];
                        a7 = A[i][jj + 7];
                        B[jj][i] = a0;
                        B[jj + 1][i] = a1;
                        B[jj + 2][i] = a2;
                        B[jj + 3][i] = a3;
                        B[jj + 4][i] = a4;
                        B[jj + 5][i] = a5;
                        B[jj + 6][i] = a6;
                        B[jj + 7][i] = a7;
                        jj += 8;
                        a0 = A[i][jj];
                        a1 = A[i][jj + 1];
                        a2 = A[i][jj + 2];
                        a3 = A[i][jj + 3];
                        a4 = A[i][jj + 4];
                        a5 = A[i][jj + 5];
                        a6 = A[i][jj + 6];
                        B[jj][i] = a0;
                        B[jj + 1][i] = a1;
                        B[jj + 2][i] = a2;
                        B[jj + 3][i] = a3;
                        B[jj + 4][i] = a4;
                        B[jj + 5][i] = a5;
                        B[jj + 6][i] = a6;
                        jj -= 16;
                    }
                } else {
                    if (ii == jj) {
                        a0 = A[i][jj+16];  a1 = A[i][jj+17];  a2 = A[i][jj+18]; a3 = A[i][jj+19];
                        a4 = A[i][jj+20]; 
                        B[jj+16][i] = a0; B[jj+17][i] = a1; B[jj+18][i] = a2; B[jj+19][i] = a3;
                        B[jj+20][i] = a4; 

                        a0 = A[i][jj+8];  a1 = A[i][jj+9];  a2 = A[i][jj+10]; a3 = A[i][jj+11];
                        a4 = A[i][jj+12]; a5 = A[i][jj+13]; a6 = A[i][jj+14]; a7 = A[i][jj+15];
                        B[jj+8 ][i] = a0; B[jj+9 ][i] = a1; B[jj+10][i] = a2; B[jj+11][i] = a3;
                        B[jj+12][i] = a4; B[jj+13][i] = a5; B[jj+14][i] = a6; B[jj+15][i] = a7;
                        a0 = A[i][jj];   a1 = A[i][jj+1]; a2 = A[i][jj+2]; a3 = A[i][jj+3];
                        a4 = A[i][jj+4]; a5 = A[i][jj+5]; a6 = A[i][jj+6]; a7 = A[i][jj+7];
                        B[jj  ][i] = a0; B[jj+1][i] = a1; B[jj+2][i] = a2; B[jj+3][i] = a3;
                        B[jj+4][i] = a4; B[jj+5][i] = a5; B[jj+6][i] = a6; B[jj+7][i] = a7;
                    }
                    else {
                        a0 = A[i][jj];
                        a1 = A[i][jj + 1];
                        a2 = A[i][jj + 2];
                        a3 = A[i][jj + 3];
                        a4 = A[i][jj + 4];
                        a5 = A[i][jj + 5];
                        a6 = A[i][jj + 6];
                        a7 = A[i][jj + 7];
                        B[jj][i] = a0;
                        B[jj + 1][i] = a1;
                        B[jj + 2][i] = a2;
                        B[jj + 3][i] = a3;
                        B[jj + 4][i] = a4;
                        B[jj + 5][i] = a5;
                        B[jj + 6][i] = a6;
                        B[jj + 7][i] = a7;
                        jj += 8;
                        a0 = A[i][jj];
                        a1 = A[i][jj + 1];
                        a2 = A[i][jj + 2];
                        a3 = A[i][jj + 3];
                        a4 = A[i][jj + 4];
                        a5 = A[i][jj + 5];
                        a6 = A[i][jj + 6];
                        a7 = A[i][jj + 7];
                        B[jj][i] = a0;
                        B[jj + 1][i] = a1;
                        B[jj + 2][i] = a2;
                        B[jj + 3][i] = a3;
                        B[jj + 4][i] = a4;
                        B[jj + 5][i] = a5;
                        B[jj + 6][i] = a6;
                        B[jj + 7][i] = a7;
                        jj += 8;
                        a0 = A[i][jj];
                        a1 = A[i][jj + 1];
                        a2 = A[i][jj + 2];
                        a3 = A[i][jj + 3];
                        a4 = A[i][jj + 4];
                        
                        B[jj][i] = a0;
                        B[jj + 1][i] = a1;
                        B[jj + 2][i] = a2;
                        B[jj + 3][i] = a3;
                        B[jj + 4][i] = a4;
                        
                        jj -= 16;
                    }
                    
                }
            }
        }
    }
}

void tr67_testing (int M, int N, int A[N][M], int B[M][N]) {

    int BS = 4;
    int a0;
    int ii, jj, i, j;

    for ( ii = 0; ii < M; ii += BS) {
        for ( jj = 0; jj < N; jj += BS) {
            for (i = ii; i < N && i < ii + BS; i++) {
                for (j = jj; j < N && j < jj + BS; j++) {
                    a0 = A[i][j];
                    B[j][i] = a0;
                }
            }
        }
    }

}

char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    if (M == 32) tr_32(M, N, A, B);
    else if (M == 64) tr_64(M, N, A, B);
    else tr_67(M, N, A, B);
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

