# -*- coding: utf-8 -*-

### Question 1 ###
def peak_naive(L):

    if len(L) == 1: return 0
    
    for i in range(len(L)):
        if (i == 0 and L[i] >= L[i+1]): return i
        elif (i == len(L)-1 and L[i] >= L[i-1]): return i
        elif (L[i-1] <= L[i] and L[i] >= L[i+1]): return i
    raise AssertionError()


def _is_peak (ind , L):
    if len(L) == 1: return True
    if (ind == 0 and L[ind] >= L[ind+1]): return True
    elif (ind == len(L)-1 and L[ind] >= L[ind-1]): return True
    elif (L[ind-1] <= L[ind] and L[ind] >= L[ind+1]): return True
    return False
    
### Question 2 ###   
def peak(L):    
    return peak_aux(L , 0 , len(L))
    
def peak_aux(L,p,q):    
    
    if (p == q-1): return p
    l = (p + q) // 2
    if _is_peak(l , L): return l
    elif (L[l-1] >= L[l]): return peak_aux(L , p , l)
    else: return peak_aux(L , l , q)


    
### Question 3 ###
def is_peak(M,i,j):
    
    I = len(M)
    J = len(M[0])
    if (i != 0 and M[i-1][j] > M[i][j]): return False
    if (j != 0 and M[i][j-1] > M[i][j]): return False
    if (j != J-1 and M[i][j+1] > M[i][j]): return False
    if (i != I-1 and M[i+1][j] > M[i][j]): return False
    return True

UR = 1
UL = 0
DL = 2
DR = 3

def ret_larger (M,i,j):
    I = len(M)
    J = len(M[0])
    if (i != 0 and M[i-1][j] > M[i][j]): return i-1,j
    if (j != 0 and M[i][j-1] > M[i][j]): return i,j-1
    if (j != J-1 and M[i][j+1] > M[i][j]): return i,j+1
    if (i != I-1 and M[i+1][j] > M[i][j]): return i+1,j
    raise AssertionError()
    
### Question 4 ###
def peak2d_naive(M):
    I = len(M)
    J = len(M[0])
    for i in range(I):
        for j in range(J):
            if (is_peak(M,i,j)): return i,j
    
    raise AssertionError()


### Question 5 ###
def pivot(M,p,q,r,s):
    MM = [x[r:s] for x in M[p:q]]
    I = len(MM) 
    J = len(MM[0])
    mi = I//2
    mj = J//2
    maxx = MM[0][0]
    for j in range(J):
        maxx = max(maxx , MM[0][j] , MM[mi][j] , MM[I-1][j])
    for i in range(I):
        maxx = max(maxx , MM[i][0] , MM[i][mj] , MM[i][J-1])

    for i in [0 , mi , I-1]:
        for j in range(J):
            if maxx == MM[i][j]: return i,j
    for i in range (I):
        for j in [0, mj, J-1]:
            if MM[i][j] == maxx: return i,j

    raise AssertionError()
    

def _in (x,y , p,q,r,s):
    return (p <= x and x < q and r <= y and y < s)

### Question 6 ###
def peak2d(M):    
    data = peak2d_aux(M)
    i,j = 0,0
    
    for r in range(0 , len(data) , 2):
        
        i += data[r]
        j += data[r+1]
    return i,j
  
# def peak2d_aux(M,p,q,r,s):
    # print(p,q,r,s)
    # pi,pj = pivot(M,p,q,r,s)
    # if is_peak(M[p:q][r:s],pi,pj): return pi,pj
    # dir = ret_larger(M[p:q][r:s],pi,pj)
    # I = len() this is INSANE

def peak2d_aux (M):
    I = len(M)
    J = len(M[0])
    if I == 1 and J == 1: return 0,0
    pi,pj = pivot(M , 0 , I , 0 , J)
    mi = I//2
    mj = J//2
    if is_peak(M , pi,pj): return pi,pj
    gi , gj = ret_larger(M , pi , pj)
    # apparently we have python from 1999 and can't use SWITCH
    #case UL
    if (_in(gi , gj , 0,mi,0,mj)):
        return peak2d_aux([x[0:mj] for x in M[0:mi]])
    #case DL
    elif _in(gi,gj , mi+1,I,0,mj): 
        return peak2d_aux([x[0:mj] for x in M[mi+1:I]]) + (mi+1,0)
    #case UR
    elif _in(gi,gj , 0, mi, mj+1, J):
        return peak2d_aux([x[mj+1:J] for x in M[0:mi]]) + (0,mj+1)
    else:
        return peak2d_aux([x[mj+1:J] for x in M[mi+1:I]]) + (mi+1,mj+1)
    

