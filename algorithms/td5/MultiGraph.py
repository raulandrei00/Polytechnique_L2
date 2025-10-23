import math
import random

## Question 5 ##


def random_element(dict):
    # TO COMPLETE
    pass

## Question 7 ##


def random_cut(m):
    # TO COMPLETE
    pass


def mincut_karger(L, p):  # p is the desired error bound
    # TO COMPLETE
    pass

## Contains Questions 4 and 6 ##


class MultiGraph:
    def __init__(self, L):
        self.adj = {}
        self.deg = {}
        for x in L[1]:
            if x[0] not in self.adj:
                self.adj[x[0]] = {x[1]: x[2]}
                self.deg[x[0]] = x[2]
            else:
                self.adj[x[0]][x[1]] = x[2]
                self.deg[x[0]] += x[2]
            if x[1] not in self.adj:
                self.adj[x[1]] = {x[0]: x[2]}
                self.deg[x[1]] = x[2]
            else:
                self.adj[x[1]][x[0]] = x[2]
                self.deg[x[1]] += x[2]

    # i is an integer between 1 and 2^n - 2, with n the number of vertices
    def subset_from_integer(self, i):
        subset = {}
        for x in self.adj:
            if i % 2 == 1:
                subset[x] = True
            i = i >> 1
        return subset

    def cutsize(self, i):  # i is an integer between 1 and 2^n - 2, with n the number of vertices
        subset = self.subset_from_integer(i)
        res = 0
        for x, y in self.adj.items():
            for t, u in y.items():
                if x in subset and not t in subset:
                    res += u
        return [res, [x for x in subset]]

    def display(self):
        for x, y in self.adj.items():
            print("Neighbors of " + str(x) +
                  ", which has degree " + str(self.deg[x]))
            for t, u in y.items():
                print(str(t) + " with multiplicity " + str(u))

    ## Question 4 ##
    def contract(self, i, j):  # contracts edge i, j (i absorbs j)
        # TO COMPLETE
        pass

    ## Question 6.1 ##
    def random_vertex(self):
        # TO COMPLETE
        pass

    ## Question 6.2 ##
    def random_edge(self):
        # TO COMPLETE
        pass
