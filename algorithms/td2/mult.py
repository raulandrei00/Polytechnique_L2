# -*- coding: utf-8 -*-

# Q1

def poly_mult(P,Q):
    n = len(P)
    m = len(Q)
    ret = [0 for i in range(n + m - 1)]
    for i in range(n):
        for j in range(m):
            ret[i+j] += P[i] * Q[j]
    return ret

def cost_poly_mult(n): 
    return 2*n*n - n - n + 1

# Q2

def poly_add(P,Q):
    n = max(len(P) , len(Q))
    m = min(len(P) , len(Q))
    if len(P) < len(Q):
        P , Q = Q , P
    ret = P
    for i in range(m):
        ret[i] += Q[i]

    return ret

def poly_add_list(arr_P):
    ret = [0 for _ in range(max([len(P) for P in arr_P]))]
    for P in arr_P:
        ret = poly_add(ret , P)
    return ret
         
def neg(P):
    return [-coef for coef in P]
   
def shift(P,k):
   return [0 for _ in range(k)] + P
  
# Q3  
  
def poly_kara_mult(P,Q):
    n = len(P)
    if n == 1:
        return [P[0] * Q[0]]
    else:
        k = (n+1) // 2
        p0 = P[:k]
        q0 = Q[:k]
        p1 = P[k:]
        q1 = Q[k:]
        h0 = poly_kara_mult(p0 , q0)
        h1 = poly_kara_mult(poly_add(p0 , p1) , poly_add(q0 , q1))
        h2 = poly_kara_mult(p1 , q1)

        return poly_add_list([h0 , shift(poly_add_list([h1 , neg(h0) , neg(h2)]) , k) , shift(h2 , 2*k)])


from functools import cache

@cache
def cost_poly_kara_mult(n):
    if n == 1: return 1
    else: return 3 * cost_poly_kara_mult((n+1) // 2) + 4 * n

# Q4 

@cache
def cost_poly_tc3_mult(n):
    if n == 1: return 1
    elif n == 2: return 3
    else: return 5*cost_poly_tc3_mult((n+2) // 3) + 30 * n

# Q5 hybrid
   
def poly_switch_mult(d,P,Q):
    n = len(P)
    if n <= d:
        
        return poly_mult(P , Q)
    else: 
        k = (n+1) // 2
        p0 = P[:k]
        q0 = Q[:k]
        p1 = P[k:]
        q1 = Q[k:]
        h0 = poly_switch_mult(d , p0 , q0)
        h1 = poly_switch_mult(d , poly_add(p0 , p1) , poly_add(q0 , q1))
        h2 = poly_switch_mult(d , p1 , q1)

        return poly_add_list([h0 , shift(poly_add_list([h1 , neg(h0) , neg(h2)]) , k) , shift(h2 , 2*k)])

@cache
def cost_switch_mult(d,n):
    if n <= d: return 2 * (n ** 2) - 2 * n + 1
    else: return 3 * cost_switch_mult(d,(n+1) // 2) + 4 * n


   
