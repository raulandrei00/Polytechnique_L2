# -*- coding: utf-8 -*-

### For comparing strings

def string_compare(P,S):
    for j in range(len(P)):
        if not P[j] == S[j]:
            return False
    return True


### naive string matcher
def string_match(T, P):
    ret = []
    n, k = len(T), len(P)
    for i in range (len(T) - len(P)+1):
        if (string_compare(T[i:i+k], P)):
            ret.append(i)
    return ret

### number of characters
base = 256

### karp_rabin_sum

def hash_string_sum(S):
    return sum((ord(ch) for ch in S))

def hash_string_sum_update(h, Ti, Tim):
    return h - ord(Ti) + ord(Tim)

def karp_rabin_sum(T,P):
    ret = [[] , 0]
    n, k = len(T), len(P)
    pattern = hash_string_sum(P)
    crt = hash_string_sum(T[0:k])
    for i in range (k , n+1):
        if crt == pattern:
            if not string_compare(P , T[i-k:i]): ret[1] += 1
            else: ret[0].append(i-k)
        if i < n: 
            crt = hash_string_sum_update(crt , T[i-k] , T[i])
    return tuple(ret)


### karp_rabin_mod

def hash_string_mod(S, q):
    m = len(S)
    ans = 0
    for ch in S:
        ans = ans * base + ord(ch)
        ans %= q
    return ans

def logpow (x , pw, mod):
    
    bit = 1
    ans = 1

    while bit <= pw:
        if (bit & pw): ans = ans * x % mod
        x = x * x % mod
        bit <<= 1
    return ans



def hash_string_mod_update(h, Ti, Tim, q, dm):
    return (ord(Tim) + base * (h - dm * ord(Ti))) % q 

def karp_rabin_mod(T,P, q):
    m , n = len(P), len(T)
    ret = [[],0]
    dm = logpow (base , m-1, q)
    pattern = hash_string_mod(P, q)
    crt = hash_string_mod(T[0:m], q)
    for i in range (m, n+1):
        if (crt == pattern):
            if (string_compare(T[i-m:i], P)):
                ret[0].append(i-m)
            else:
                ret[1] += 1
        if (i < n):
            crt = hash_string_mod_update(crt , T[i-m] , T[i] , q , dm)
    return tuple(ret)

