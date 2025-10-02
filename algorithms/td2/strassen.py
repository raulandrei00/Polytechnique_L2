#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# import numpy as np


#Q6
def mult_matrix(A,B):
    n = len(A)
    m = len(A[0])
    p = len(B[0])
    ret = [[0 for _ in range(p)] for _ in range(n)]
    for i in range(n):
        for j in range(m):
            for k in range(p):
                ret[i][k] += A[i][j] * B[j][k] # n ** 3 mul + (n ** 2 * (n-1)) add
    return ret


#Q7
def cost_mult_matrix(n):
    return n ** 3 + (n ** 2 * (n-1))

#Functions split, merge, add_matrix and sub_matrix are given
def split(A):
    row, col = len(A), len(A[0])
    row2, col2 = row//2, col//2
    return [A[i][:col2] for i in range(row2)], [A[i][col2:] for i in range(row2)], [A[i][:col2] for i in range(row2,row)], [A[i][col2:] for i in range(row2,row)]

def merge(a,b,c,d):
    return list(map(lambda e : e[0]+e[1], zip(a,b))) + list(map(lambda e : e[0]+e[1], zip(c,d)))

# def split(A):
#    A=np.array(A)
#    row, col = A.shape
#    row2, col2 = row//2, col//2
#    return A[:row2, :col2].tolist(), A[:row2, col2:].tolist(), A[row2:, :col2].tolist(), A[row2:, col2:].tolist()

#def merge(a,b,c,d):
#    return np.vstack((np.hstack((a, b)), np.hstack((c, d)))).tolist()

#Computes the matrix A+B
def add_matrix(A,B):
    n = len(A)
    C = [[0 for i in range(n)] for j in range(n)]
    for i in range(n):
        for j in range(n):
                C[i][j] = A[i][j] + B[i][j]
    return C

def cost_add(n):
    return n ** 2

def add_mat_arr(mat_arr):
    n = len(mat_arr[0])
    ret = [[0 for _ in range(n)] for _ in range(n)]
    for a in mat_arr:
        ret = add_matrix(ret , a)
    return ret

def neg (A):
    n = len(A)
    return [[-a for a in A[i]] for i in range(n)]

#Computes the matrix A-B ????? why the inconsistency with the previous ex 
def sub_matrix(A,B):
    n = len(A)
    C = [[0 for i in range(n)] for j in range(n)]
    for i in range(n):
        for j in range(n):
                C[i][j] = A[i][j] - B[i][j]
    return C

#Q8
def strassen(A,B):
    n = len(A)
    if n == 1: return mult_matrix(A , B)
    else:
        a1 , a2 , a3 , a4 = split(A) # 0
        b1 , b2 , b3 , b4 = split(B) # 0

        q1 = strassen(a1 , add_matrix(b1 , b3)) # add(n // 2) + strassen(n // 2)
        q2 = strassen(a4 , add_matrix(b2 , b4))
        q3 = strassen(add_matrix(a4 , neg(a1)) , add_matrix(b3 , neg(b2)))
        q4 = strassen(add_matrix(a2 , neg(a4)) , add_matrix(b3 , b4))
        q5 = strassen(add_matrix(a2 , neg(a1)) , b3)
        q6 = strassen(add_matrix(a3 , neg(a1)) , add_matrix(b1 , b2))
        q7 = strassen(add_matrix(a3 , neg(a4)) , b2)


        return merge(a= (add_matrix(q1 , q5)), b= add_mat_arr([q2 , q3 , q4 , neg(q5)]) 
                     , c= add_mat_arr([q1 , q3 , q6 , neg(q7)]) , d= add_matrix(q2 , q7))

from functools import cache
#Q9
@cache
def cost_strassen(k):
    if (k == 0): return 1
    else:
        return 7 * cost_strassen(k-1) + 18 * cost_add(2 ** (k-1))


#Q10
def convert_01(A):
    n = len(A)
    B = [[0 for _ in range(n)] for _ in range(n)]
    for i in range(n):
        for j in range(n):
            if A[i][j] > 0: B[i][j] = 1
    return B

def I(n):
    In = [[0 for _ in range(n)] for _ in range(n)]
    for i in range(n):
        In[i][i] = 1
    return In

#Q11
def transitive_closure(A):
    n = len(A)
    R = convert_01(add_matrix(I(n) , A))
    pow = n-1
    Base = R
    R = I(n)
    while pow:
        if (pow % 2):
            R = strassen(R , Base)
        Base = strassen(Base , Base)
        pow //= 2
    
    return convert_01(R)






