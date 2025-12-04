from math import dist
from functools import cmp_to_key


# Question 1

def linear_scan(P,query):
    return min(P, key=lambda point: dist(point, query))

# Question 2

def partition(P, query, coord):
    L,R = [],[]
    for point in P:
        if point[coord] < query[coord]:
            L.append(point)
        elif point[coord] > query[coord]: R.append(point)
    return L,R

# Question 3
def MoMSelect(P,coord,k):
    n = len(P)
    def cmp (p1, p2):
        return p1[coord] - p2[coord]
    if (n < 10):
        # print (sorted(P, key=cmp_to_key(cmp)))
        # print(k , n)
        return sorted(P, key=cmp_to_key(cmp))[k]
    else:
        groups = [P[i:i+5] for i in range(0,n-4,5)]
        B = [sorted(grup, key=cmp_to_key(cmp))[2] for grup in groups]
        p = MoMSelect(B,coord,n // 10)
        (L,R) = partition(P,p,coord)
        if (k < len(L)):
            return MoMSelect(L,coord,k)
        elif (k > len(L)):
            return MoMSelect(R,coord,k-len(L)-1)
        else: return p
        
INF = 1e18
def _dist (x , y):
    if y is None: return INF
    else: return dist(x,y)


class KDTree:
    
    # Question 4
    def __init__ (self,P,coord = 0):
        self.k = coord
        self.coord = coord
        # print(P)
        if len(P) == 0: 
            self.rootPoint = None
            self.left = self.right = None
        else:
            # print("here")
            x = MoMSelect(P,coord,len(P)//2)
            # print(x)
            self.rootPoint = x
            (L,R) = partition(P,x,coord)
            if (len(L)):
                self.left = KDTree(L,(coord+1)%len(x))
            else: self.left = None
            if (len(R)):
                self.right = KDTree(R,(coord+1)%len(x))
            else: self.right = None
            # print(self)
            
    
    def __repr__(self):
        st = ""
        if not self.rootPoint is None:
            st += f"{self.rootPoint}(C{self.coord})("
            if not self.left is None:
                st += f"L:({self.left.__repr__()})"
            if not self.right is None:
                st += f"R:({self.right.__repr__()})"
            st += ")"
        return st
            
    def __str__(self, level=0):
        st = ""
        if self.rootPoint is None:
            st = "Empty"
        else:
            if level > 0:
                st = "|\t"*(level-1)+"|-->"
            st += f"{self.rootPoint} Coord= {self.coord}"
            if not self.left is None:
                st += f"\n {self.left.__str__(level+1)}"
            if not self.right is None:
                st += f"\n {self.right.__str__(level+1)}"
        return st

    def print_as_list(self):
        ll = [self.rootPoint]
        if not self.left is None:
            ll += self.left.give_list()
        if not self.right is None:
            ll += self.right.give_list()
        return ll
    
    # Question 5

    def NN_exhaustive_search(self, query):
        ans = self.rootPoint
        if self.left is not None:
            _left = self.left.NN_exhaustive_search(query)
            if (dist(ans, query) > dist(_left, query)):
                ans = _left

        if self.right is not None:
            _right = self.right.NN_exhaustive_search(query)
            if (dist(ans, query) > dist(_right, query)):
                ans = _right

        return ans

    # Question 6

    def NN_defeatist_search(self, query):
        if self.rootPoint is None: return None
        c = self.coord
        # print(self.rootPoint)
        med = self.rootPoint[c]
        if query[c] <= med: 
            if (self.left is not None):
                cand = self.left.NN_defeatist_search(query)
                if dist(query, cand) < dist(self.rootPoint,query):
                    return cand
        else:
            if self.right is not None:
                cand = self.right.NN_defeatist_search(query)
                if dist(query, cand) < dist(self.rootPoint,query):
                    return cand

        return self.rootPoint

    # Question 7
    def NN_backtracking_search(self,query, cand = None):
        if (_dist(query,self.rootPoint) < _dist(query,cand)):
            cand = self.rootPoint
        
        
