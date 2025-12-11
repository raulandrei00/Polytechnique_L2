# -*- coding: utf-8 -*-

import random
import math

class UF:
    def __init__(self,S):
        self.id={}
        for x in S:
            self.id[x]=x
        self.rank ={}
        for x in S:
            self.rank[x]=1  
        
    def union(self, p, q):
        r1 = self.find(p)
        r2 = self.find(q)
        
        if r1 == r2:
            return
                    
        if self.rank[r2] > self.rank[r1]:
            self.id[r1] = r2
        else:
            self.id[r2] = r1
            
        if self.rank[r2] == self.rank[r1]:
            self.rank[r1] += 1
        
    def find(self, p):
        if self.id[p] == p:
            return p
        # path compression
        self.id[p] = self.find(self.id[p])
        return self.id[p]

class WG:
    def __init__(self, L): # L is the list of edges
        L.sort(key= lambda e: e[2])
        self.edges=L
        self.adj={}
        for x in L:
            if x[0] not in self.adj:
                self.adj[x[0]]={x[1]:x[2]}
            else:
                self.adj[x[0]][x[1]]=x[2]
            if x[1] not in self.adj:
                self.adj[x[1]]={x[0]:x[2]}
            else:
                self.adj[x[1]][x[0]]=x[2]

    # QUESTION 1
    def min_cycle_aux(self,w,L,S):
        if len(S) == 0 and L[0] == L[-1]:
            return w,L
        elif len(S) == 0:
            S.add(L[0])
        node = L[-1]
        (W, L_fin) = (1e18, L)
        for to, cost in self.adj[node].items():
            if to not in S: continue
       
            W_new, L_new = self.min_cycle_aux(w + cost, L + [to], S - {to})
            if W_new < W:
                W, L_fin = W_new, L_new
        return W, L_fin

    # QUESTION 2
    def min_cycle(self):
        return self.min_cycle_aux(0, [next(iter(self.adj))], self.adj.keys())

    '''
    Question 3
    T_s is the minimum spanning tree, hence any path that connects all nodes in s has w_{S,path} >= w_S (*)
    Now, to complete the hamiltonian cycle from L and S, we have to 
    2) make a path from nodes in S (* => >= w_S)
    1) connect L[-1] to a node in S (cost >= w_end)
    3) connect the last node in the path in S to L[0] (cost >= w_start)
    the conclusion follows
    Put your answer here
    '''

    # QUESTION 4
    def lower_bound(self,w,L,S): # returns low(L), with w the cost of L, and S the set of vertices not in L
        w_S = self.weight_min_tree(S)
        w_start = min([cost for node, cost in self.adj[L[0]].items() if node in S])
        w_end = min([cost for node, cost in self.adj[L[-1]].items() if node in S])
        return w + w_S + w_start + w_end

    # QUESTION 5
    def min_cycle_aux_using_bound(self,bestsofar,w,L,S):
        if w > bestsofar: return (math.inf, [])
        if len(S) < 1: print(len(S))
        if len(S) == 0 and L[0] == L[-1]:
            return w,L
        elif len(S) == 0:
            S.add(L[0])
        node = L[-1]
        (W, L_fin) = (math.inf, L)
        for to, cost in self.adj[node].items():
            if to not in S: continue
       
            W_new, L_new = self.min_cycle_aux_using_bound(bestsofar,w + cost,  L + [to], S - {to})
            if W_new < W:
                W, L_fin = W_new, L_new
                bestsofar = min(W, bestsofar)
        return W, L_fin

    def min_cycle_using_bound(self):
        return self.min_cycle_aux_using_bound(math.inf, 0, [next(iter(self.adj))], self.adj.keys())

#################################################################
## Auxiliary methods
#################################################################

    def weight_min_tree(self,S): # mincost among all trees whose spanned vertices are those in S
        if len(S)==1: return 0
        if len(S)==2:
            L=list(S)
            if L[0] in self.adj[L[1]]: return self.adj[L[0]][L[1]]
            else: return math.inf
        uf=UF(S)
        nr_components=len(S)
        weight=0
        for e in self.edges:
            if e[0] in S and e[1] in S:
                if uf.find(e[0])!=uf.find(e[1]):
                    weight=weight+e[2]
                    uf.union(e[0],e[1])
                    nr_components=nr_components-1
                    if nr_components==1:
                        return weight
        return math.inf

    def induce_by_subset(self,S): # reduces self.adj to keep only the edges with both ends in S
        new_adj={}
        for x in self.adj:
            for y in self.adj[x]:
                if x in S and y in S:
                    if x not in new_adj:
                        new_adj[x]={y:self.adj[x][y]}
                    else:
                        new_adj[x][y]=self.adj[x][y]
                    if y not in new_adj:
                        new_adj[y]={x:self.adj[y][x]}
                    else:
                        new_adj[y][x]=self.adj[y][x]
        self.adj=new_adj

    def display(self):
        print("Graph has "+str(len(self.adj))+" vertices")
        print()
        for x,y in self.adj.items():
            print("Neighbours of "+str(x)+":")
            for t,u in y.items():
                print(str(t)+" with weight "+str(u))
            print()
