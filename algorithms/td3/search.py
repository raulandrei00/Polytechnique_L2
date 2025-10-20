# -*- coding: utf-8 -*-

import math

def binary_search_rec(A,v,left,right):
    if (right >= left):
        mid = left + (right - left)//2 # using `(right + left)//2` can lead to an integer overflow
        if (v == A[mid]):
            return mid
        elif (v < A[mid]):
            return binary_search_rec(A,v,left,mid-1)
        else:
            return binary_search_rec(A,v,mid+1,right)
    
    return -1
        
## Q1 ##
def binary_search(A,v):
    if (A[0] == v): return 0
    bit = 1
    n = len(A)
    while (bit < n): bit <<= 1
    bit >>= 1
    pos = 0
    while (bit > 0):
        if ((pos | bit) < n and A[pos | bit] < v):
            pos |= bit
        bit >>= 1
    if (pos+1 < n and A[pos+1] == v): return pos+1
    else: return -1

from functools import cache
@cache
def cost_binary_search(n):
    if (n == 0): return 1
    elif (n == 1): return 4
    else: return cost_binary_search(n//2) + 3
    
## Q2 ##
def ternary_search(A,v):
    n = len(A)
    l , r = 0,n-1
    while l != r:
        b1 , b2 = l + (r-l)//3 , r - (r-l)//3
        if (A[b1] >= v): l,r = l,b1
        elif (A[b2] >= v): l,r = b1+1,b2
        else: l,r = b2+1,r
    if (A[l] == v): return l
    else: return -1


@cache 
def cost_ternary_search(n):
    if n == 0: return 1
    elif n == 1: return 3
    else: return 4 + cost_ternary_search(n // 3)
    
def cost_binary_search_value(A,v):
    # if len(A) == 0: return 1
    left = 0
    right = len(A) - 1

    cost = 1
    while (right >= left):
        mid = left + (right - left)//2
        cost += 1 
        if (v == A[mid]):
            return cost
        else: # decomposed elif into else if, then inserted "cost += 1" before the if
            cost += 1
            if (v < A[mid]):
                right = mid - 1
            else:
                left = mid + 1
        cost += 1

    return cost

def cost_ternary_search_value(A,v):
    n = len(A)
    l , r = 0,n-1
    cost = 1
    while l != r:
        b1 , b2 = l + (r-l)//3 , r - (r-l)//3
        cost += 2
        if (A[b1] >= v): l,r = l,b1 
            
        elif (A[b2] >= v):
            cost += 1
            l,r = b1+1,b2
        else:
            cost += 2 
            l,r = b2+1,r
        cost += 1
    if (A[l] == v): return l
    else: return -1

## Q3 ##
def exponential_search(A,v):
    if A[0] == v: return 0
    bit = 1
    n = len(A)
    while (bit < n and A[bit] <= v): bit <<= 1
    return (bit >> 1) + binary_search(A[(bit >> 1):min(n , bit)] , v)

def cost_exponential_search(v):
    pass

## Q4 ##
def interpolation_search(A,v):
    n = len(A)
    l , r = 0 , n-1
    try:
        while l < r and A[l] < A[r]:
            k = l + (v - A[l]) * (r-l) // (A[r] - A[l])
            if (A[k] < v): l , r = k+1 , r
            elif A[k] > v: l , r = l , k-1
            else: l = r = k
        if (A[l] == v): return l
        else: return -1
    except: return -1

## Q6 ##
def findFirstOccurrence(A, v):
    if (A[0] == v): return 0
    bit = 1
    n = len(A)
    while (bit < n): bit <<= 1
    bit >>= 1
    pos = 0
    while (bit > 0):
        if ((pos | bit) < n and A[pos | bit] < v):
            pos |= bit
        bit >>= 1
    if (pos+1 < n and A[pos+1] == v): return pos+1
    else: return -1

def findLastOccurrence(A, v):
    
    bit = 1
    n = len(A)
    while (bit < n): bit <<= 1
    bit >>= 1
    pos = 0
    while (bit > 0):
        if ((pos | bit) < n and A[pos | bit] <= v):
            pos |= bit
        bit >>= 1
    if (A[pos] == v): return pos
    elif (pos+1 < n and A[pos+1] == v): return pos+1
    else: return -1

def upper_bound (A , v):
    bit = 1
    n = len(A)
    while (bit < n): bit <<= 1
    bit >>= 1
    pos = 0
    while (bit > 0):
        if ((pos | bit) < n and A[pos | bit] < v):
            pos |= bit
        bit >>= 1
    
    return pos

from math import *

## Q7 ##
def findKClosestElements(A, v, k):
    n = len(A)
    start = upper_bound(A , v)
    if (start < n-1 and abs(v - A[start+1]) < abs(v - A[start])):
        start = start+1
    l , r = start,start
    while r - l + 1 < k:
        if (l == 0): r += 1
        elif r == n-1: l -= 1
        elif(abs(v - A[l-1]) < abs(v-A[r+1])): l -= 1
        else: r += 1
    return A[l:r+1]

## Q8 ##
def findFrequency(A):
    n = len(A)
    freq = dict()
    index = 0
    while (index < n):
        el = A[index]
        last_pos = findLastOccurrence(A , el)
        freq[el] = last_pos - index + 1
        index = last_pos+1
    return freq
