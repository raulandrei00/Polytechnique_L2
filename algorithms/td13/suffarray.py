# -*- coding: utf-8 -*-

def str_compare(a, b):
    N = min(len(a),len(b))
    for i in range(N):
        if a[i] < b[i]:
            return -1
        elif a[i] > b[i]:
            return 1

    return len(a)-len(b)

def str_compare_m(a,b, m):
    if len(a) >= m and len(b) >= m:
        # len(a) >= m and len(b) >= m
        return str_compare(a[:m], b[:m])
    else:
        # len(a) < m or len(b) > m
        return str_compare(a,b)

def longest_common_prefix(a, b):
    N = min(len(a),len(b))
    for i in range(N):
        if a[i] != b[i]:
            return i
    return N


class suffix_array:

    # Question 1
    def __init__(self, t):
        self.T = t
        self.N = len(t)
        self.suffixId = sorted(range(self.N), key=lambda i: t[i:])

    # Question 2
    def suffix(self, i):
        return self.T[self.suffixId[i]:]
    
    # Question 3
    
    def findL(self, S):
        l = 0
        r = self.N
        while l < r:
            m = (l + r) // 2
            if str_compare_m(self.T[self.suffixId[m]:], S, len(S)) >= 0:
                r = m
            else:
                l = m + 1
        return l

    
    def findR(self,S):
        l = 0
        r = self.N
        while l < r:
            m = (l + r) // 2
            if str_compare_m(self.T[self.suffixId[m]:], S, len(S)) <= 0:
                l = m + 1
            else:
                r = m
        return l

    # Question 4
    def findLR(self,S):
        return (self.findL(S),self.findR(S))

# Question 5
def KWIC(sa, S, c = 15):
    l, r = sa.findLR(S)
    res = []
    for i in range(l, r):
        start = max(0, sa.suffixId[i] - c)
        end = min(sa.N, sa.suffixId[i] + len(S) + c)
        res.append(sa.T[start:end])
    return res

import os 

# Question 6
def longest_repeated_substring(sa):
    lcp = ""
    for i in range(1, sa.N):
        p = longest_common_prefix(sa.suffix(i), sa.suffix(i-1))
        if p > len(lcp):
            lcp = sa.suffix(i)[:p]
    return lcp