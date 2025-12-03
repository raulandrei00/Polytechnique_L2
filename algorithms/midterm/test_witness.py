# -*- coding: utf-8 -*-

import numpy as np
from witness import *

grading_mode = False

def inclusion_matrix(A1,A2):
    n = len(A1)
    for i in range(n):
        for j in range(n):
            if (A1[i][j]>0 and A1[i][j] not in A2[i][j]):
                print("{},{}".format(i,j))
                return False
            if (A1[i][j] == 0 and len(A2[i][j])>0):
                print("{},{}".format(i,j))
                return False
    return True

def equal_matrix(A1,A2):
    n = len(A1)
    m = len(A2)
    if (m != n):
        return False
    for i in range(n):
        for j in range(n):
            if (A1[i][j]!=A2[i][j]):
                return False
    return True
    
def compute_witness_complete(A,B):
    n = len(A)
    W = [[[] for i in range(n)] for j in range(n)]
    for i in range(n):
        for j in range(n):
            for k in range(n):
                if (A[i][k] == 1 and B[k][j] == 1):
                    W[i][j].append(k+1)
    return W

A1 = [[1,1,0],[1,1,0],[0,1,0]]
B1 = [[1,0,1],[0,1,0],[0,1,0]]

A2 = [[1,0,1,0],[0,0,1,1],[0,1,0,1],[0,1,1,0]]
B2 = [[1,1,1,1],[0,1,0,1],[0,0,1,1],[0,0,0,1]]

A3 = [[1,1],[1,0]]
B3 = [[0,1],[1,0]]

AB3 = [[1,1,1],[1,1,1],[1,1,1]]
AB4 = [[0,0,0],[0,0,0],[0,0,0]]

def check_witness(func,A,B):
    T1 = func(A,B)
    T2 = compute_witness_complete(A,B)
    if (not inclusion_matrix(T1,T2)):
        print(f"\n***** {func.__name__}\n your result\n {T1}\n should be included (component-wise) in\n {T2}\n*****", end="")
        assert not grading_mode

def test_compute_witness_trivial():
    print("testing compute_witness_trivial...\t", end="")
    if compute_witness_trivial(A1,B1) is None:
        print("***** skipping compute_witness_trivial (unimplemeneted)")
        assert not grading_mode
        return
    check_witness(compute_witness_trivial,A1,B1)
    check_witness(compute_witness_trivial,A2,B2)
    check_witness(compute_witness_trivial,AB3,AB3)
    check_witness(compute_witness_trivial,AB4,AB4)
    print("done.")

def test_expose_column():
    print("testing expose_column...\t\t", end="")
    if expose_column(A1) is None:
        print("***** skipping expose_column (unimplemeneted)")
        assert not grading_mode
        return
    A = [[0,1,1],[1,1,0],[0,0,1]]
    T1 = expose_column(A)
    T2 = [[0,2,3],[1,2,0],[0,0,3]]
    if (not equal_matrix(T1,T2)):
        print(f"\n***** expose_column\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    T1 = expose_column(AB3)
    T2 = [[1,2,3],[1,2,3],[1,2,3]]
    if (not equal_matrix(T1,T2)):
        print(f"***** expose_column\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    print("done.")
        
def test_compute_witness_unique():
    print("testing compute_witness_unique...\t", end="")
    if compute_witness_unique(A1,B1) is None:
        print("***** skipping compute_witness_unique (unimplemeneted)")
        assert not grading_mode
        return
    check_witness(compute_witness_unique,A3,B3)
    check_witness(compute_witness_unique,AB4,AB4)
    print("done.")
    
def test_nullify_rows():
    print("testing nullify_rows...\t\t\t", end="")
    if nullify_rows(AB3,[1,3]) is None:
        print("***** skipping nullify_rows (unimplemeneted)")
        assert not grading_mode
        return
    T1 = nullify_rows(AB3,[1,3])
    T2 = [[1,1,1],[0,0,0],[1,1,1]]
    if (not equal_matrix(T1,T2)):
        print(f"\n***** nullify_rows\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    T1 = nullify_rows(AB3,[2,3])
    T2 = [[0,0,0],[1,1,1],[1,1,1]]
    if (not equal_matrix(T1,T2)):
        print(f"\n***** nullify_rows\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    T1 = nullify_rows(AB3,[1,2,3])
    if (not equal_matrix(T1,AB3)):
        print(f"\n***** nullify_rows\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    print("done.")

def test_nullify_columns():
    print("testing nullify_columns...\t\t", end="")
    if nullify_columns(AB3,[1,3]) is None:
        print("***** skipping nullify_columns (unimplemeneted)")
        assert not grading_mode
        return
    T1 = nullify_columns(AB3,[1,3])
    T2 = [[1,0,1],[1,0,1],[1,0,1]]
    if (not equal_matrix(T1,T2)):
        print(f"\n***** nullify_columns\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    T1 = nullify_columns(AB3,[2,3])
    T2 = [[0,1,1],[0,1,1],[0,1,1]]
    if (not equal_matrix(T1,T2)):
        print(f"\n***** nullify_columns\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    T1 = nullify_columns(AB3,[1,2,3])
    if (not equal_matrix(T1,AB3)):
        print(f"\n***** nullify_columns\n your result\n {T1}\n is different from the expected\n {T2}\n*****", end="")
        assert not grading_mode
    print("done.")

def check_witness_restricted(func,A,B,R):
    T1 = func(A,B,R)
    T2 = compute_witness_complete(A,B)
    for i in range(len(T2)):
        for j in range(len(T2)):
            for k in range(len(T2)):
                if (k not in R and k in T2[i][j]):
                    T2[i][j].remove(k)
    if (not inclusion_matrix(T1,T2)):
        print(f"\n***** {func.__name__}\n your result\n {T1}\n should be included (component-wise) in\n {T2}\n*****", end="")
        assert not grading_mode

def test_compute_witness_restricted():
    print("testing compute_witness_restricted...\t", end="")
    if compute_witness_restricted(A1,B1,[1]) is None:
        print("***** skipping compute_witness_restricted (unimplemeneted)")
        assert not grading_mode
        return
    check_witness_restricted(compute_witness_restricted,A1,B1,[1,3])
    check_witness_restricted(compute_witness_restricted,A1,B1,[2,3])
    check_witness_restricted(compute_witness_restricted,AB4,AB4,[1,2,3])
    check_witness_restricted(compute_witness_restricted,AB4,AB4,[1,2])
    print("done.")

def test_compute_witness_random(t,n):
    print("testing compute_witness_random...\t", end="")
    if compute_witness_random(A1,B1) is None:
        print("***** skipping compute_witness_random (unimplemeneted)")
        assert not grading_mode
        return
    check_witness(compute_witness_random,A1,B1)
    check_witness(compute_witness_random,A2,B2)
    check_witness(compute_witness_random,AB3,AB3)
    check_witness(compute_witness_random,AB4,AB4)
    total_trivial = 0
    total_random = 0
    for _ in range(t):
        A = [[0 for i in range(n)] for j in range(n)]
        B = [[0 for i in range(n)] for j in range(n)]
        for i in range(n):
            for j in range(n):
                A[i][j] = random.randint(0,1)
                B[i][j] = random.randint(0,1)
        check_witness(compute_witness_random,A,B)
    print("done.")
    

test_compute_witness_trivial()
test_expose_column()
test_compute_witness_unique()
test_nullify_rows()
test_nullify_columns()
test_compute_witness_restricted()
test_compute_witness_random(10,10)

