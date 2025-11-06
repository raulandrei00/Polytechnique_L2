import math
import random

## Question 5 ##


def random_element(dict: dict):
    norm = sum(list(dict.values()))
    # print(random.choices(list(dict.keys()), [val/norm for val in dict.values()]))
    return random.choices(list(dict.keys()), [val/norm for val in dict.values()])[0]


def mincut_karger(L, p):  # p is the desired error bound
    # TO COMPLETE
    pass

## Contains Questions 4 and 6 ##


class MultiGraph:
    def __init__(self, L):
        self.adj = {}
        self.deg = {}
        for x in L[1]:
            self.add_edges(x)

    def add_edges (self,edge):
        # print(edge)
        if edge[0] not in self.adj:
            self.adj[edge[0]] = {edge[1]: edge[2]}
            self.deg[edge[0]] = edge[2]
        else:
            if edge[1] not in self.adj[edge[0]]:
                self.adj[edge[0]][edge[1]] = edge[2]
            else:
                self.adj[edge[0]][edge[1]] += edge[2]
            self.deg[edge[0]] += edge[2]
        if edge[1] not in self.adj:
            self.adj[edge[1]] = {edge[0]: edge[2]}
            self.deg[edge[1]] = edge[2]
        else:
            if edge[0] not in self.adj[edge[1]]:
                self.adj[edge[1]][edge[0]] = edge[2]
            else:
                self.adj[edge[1]][edge[0]] += edge[2]
            self.deg[edge[1]] += edge[2]

    def delete_edges (self , i , j):
        self.deg[i] -= self.adj[i][j]
        self.deg[j] -= self.adj[i][j]
        del self.adj[i][j]
        del self.adj[j][i]

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
        assert(j in self.adj[i])
        self.delete_edges(i,j)
        for node in self.adj[j]:
            self.add_edges([i , node , self.adj[j][node]])
            # self.display()
        for node in self.adj[j]:
            self.deg[node] -= self.adj[j][node]
            del self.adj[node][j]
        del self.adj[j]
        del self.deg[j]

    ## Question 6.1 ##
    def random_vertex(self):
        return random_element(self.deg)

    ## Question 6.2 ##
    def random_edge(self):
        first = self.random_vertex()
        second = random_element(self.adj[first])
        return (first , second)

## Question 7 ##


def random_cut(m: MultiGraph):
    partition = {node : [node] for node in m.deg.keys()}
    n = len(m.deg)
    active = {node for node in m.deg.keys()}
    for i in range (n-2):
        a,b = m.random_edge()
        partition[a]+=partition[b]
        m.contract(a,b)
        active.remove(b)
        # print(partition)
        # print(active)
        # m.display()
    # print(active)
    assert(len(active) == 2)
    for node in active:
        # print(node, partition[node])
        return (m.deg[node] , partition[node])

L_graph = [4, [['a', 'b', 1], ['b', 'c', 1], ['c', 'd', 1], ['a', 'd', 2]]]
m = MultiGraph(L_graph)
    

print(random_cut(m))