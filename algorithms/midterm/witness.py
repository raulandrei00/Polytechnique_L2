#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import numpy as np
import random
import math

#Q6
def compute_witness_trivial(A,B):
    N = len(A)
    C = [[0 for _ in range(N)] for __ in range(N)]
    W = [[0 for _ in range(N)] for __ in range(N)]
    for i in range(N):
        for j in range(N):
            for k in range(N):
                if (A[i][k] == 1 and B[k][j] == 1):
                    C[i][j] = 1
                    W[i][j] = k+1
    # complexity O(N^3)
    return W

#Q7
def expose_column(A):
    N = len(A)
    A_bar = [[A[i][j] for j in range(N)] for i in range(N)]
    for i in range(N):
        for j in range(N):
            A_bar[i][j] = (j+1) * A_bar[i][j]
    return A_bar
    
#Q7
def compute_witness_unique(A,B):
    return multiply_matrices(expose_column(A) , B)
    #time complexity: O(N^2) + O(np.matmul)

#Q8
def nullify_columns(A,R):
    N = len(A)
    A_ret = [[0 for _ in range(N)] for _ in range(N)]
    for c in R:
        for i in range(N):
            A_ret[i][c-1] = A[i][c-1]
    return A_ret
    

# both of these have time complexity O(len(R) * N)

#Q8
def nullify_rows(A,R):
    # print(A)
    N = len(A)
    A_ret = [[0 for _ in range(N)] for _ in range(N)]
    for r in R:
        for i in range(N):
            A_ret[r-1][i] = A[r-1][i]
    return A_ret

#Q8
def compute_witness_restricted(A,B,R):
    return multiply_matrices ( expose_column(nullify_columns(A,R)) , nullify_rows(B,R) )
# time complexity: O(lenR * N) + O(np.matmul) + O(N^2)

#Q9 answer: (1 - 1/(2e)) ^ (2*e*logN) ----> e^(-log(N)) == 1/N
#=> this means overall, assuming independence, we expect ~ N cells to be computed using the brute force at the end, 
# which does not increase complexity, since O(np.matmul) >> O(N^2)

#Q10

def compute_witness_random(A,B):
    N = len(A)
    W = multiply_matrices(inverse(A),B)
    for t in range (int(math.log2(N))):
        r = 2 ** t
        for T in range(int (2 * math.e * math.log2(N))):
            R = random . sample ( range (1 , N +1) , r )
            W_r = compute_witness_restricted(A,B,R)
            for i in range(N):
                for j in range(N):
                    if W[i][j] < 0 and W_r[i][j] > 0 and W_r[i][j] <= N and A[i][W_r[i][j]-1] == 1 and B[W_r[i][j]-1][j] == 1:
                        W[i][j] = W_r[i][j]
    for i in range(N):
        for j in range(N):
            if (W[i][j] < 0):
                W[i][j] = 0
                for k in range(N):
                    if A[i][k] == 1 and B[k][j] == 1:
                        W[i][j] = k+1
    return W

# =============================================================================
# Matrix operations
# =============================================================================

# this is Negative, NOT inverse :)
def inverse(A):  
    C = [[0 for i in range(len(A))] for j in range(len(A))]
    for i in range(len(A)):
        for j in range(len(A)):
            C[i][j] = -A[i][j]
    return C

def multiply_matrices(A,B):
    X = np.array(A)
    Y = np.array(B)
    Z = np.matmul(X,Y)
    return Z.tolist()

