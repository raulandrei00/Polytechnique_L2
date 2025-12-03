# -*- coding: utf-8 -*-

# the input is represented by a list of (left,height,right)
# the output (skyline) is represented by an ordered list of (left,height) and always ends with 
# a (left,0) entry

# Q1: Complexity must O(len(L))
def rects_height_at(L, x):
    """
    Given a list of rectangles (l,h,r) and a position x,
    return h_L(x) = max({0} ∪ { h : (l,h,r) in rects and l <= x < r }).
    Note that the inequality l<=x<r is asymmetric: large on the left and strict on the right.
    """
    ret = 0
    for build in L:
        if build[0] <= x and x < build[2]:
            ret = max(ret , build[1])
    return ret

# Q2: Complexity must be O(len(S))
def simplify_skyline(S):
    """Simplify a skyline by removing redundant entries"""
    simpl = []
    for x, h in S:
        if len(simpl) == 0 or h != simpl[-1][1]:
            simpl.append((x,h))
    return simpl

# Q3: Complexity must be O(len(L))
def skyline_naive(L):
    """Computes the skyline in O(n^2)"""
    N = max([b[2] for b in L])
    ans = []
    for x in range(N):
        ans.append((x,rects_height_at(L,x)))
    ans = simplify_skyline(ans)
    ans.append((N,0))
    if ans[0] == (0,0):
        ans = ans[1:]
    
    return ans

# Q4
def combine_skylines (S1, S2):
    events = sorted([[s, 0] for s in S1] + [[s , 1] for s in S2])

    crt = [0,0]

    skyline = []
    for s,which in events:
        crt[which] = s[1]
        if skyline != [] and skyline[-1][0] == s[0]:
            skyline[-1][1] = max(crt[0],crt[1])
        else:
            skyline.append([s[0],max(crt[0],crt[1])])
    return simplify_skyline(skyline)
# overall complexity O(len(S1 + S2)) * log(len)
# this is because we have one sorting of the events then one for-loop

# Q5
def skyline_dac(L):
    N = len(L)
    # if N == 0: print("WHAHAHAHDXAD")
    if N == 1:
        return [(L[0][0],L[0][1]),(L[0][2],0)]

    return combine_skylines(skyline_dac(L[:N//2]), skyline_dac(L[N//2:]))

    # MT: T(N) = NlogN + 2 * T(N // 2), and NlogN <= N^1.5
    # => the time complexity is under N*sqrt(N) so better than N^2