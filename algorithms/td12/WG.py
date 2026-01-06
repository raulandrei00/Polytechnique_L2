import random
import math
try:
    from UF import *
except Exception:
    pass

nr_calls = 0


class WG:
    def __init__(self, L):  # L is the list of edges
        L.sort(key=lambda e: e[2])
        self.edges = L
        self.adj = {}
        for x in L:
            if x[0] not in self.adj:
                self.adj[x[0]] = {x[1]: x[2]}
            else:
                self.adj[x[0]][x[1]] = x[2]
            if x[1] not in self.adj:
                self.adj[x[1]] = {x[0]: x[2]}
            else:
                self.adj[x[1]][x[0]] = x[2]

    def min_cycle_aux(self, w, L, S):
        global nr_calls
        nr_calls = nr_calls+1
        a = L[0]
        b = L[-1]
        if len(S) == 0:
            if a not in self.adj[b]:
                return (math.inf, [])
            else:
                Lc = L[:]
                Lc.append(a)
                return (w+self.adj[b][a], Lc)
        res = (math.inf, [])
        for x in self.adj[b]:
            if x in S:
                L.append(x)
                S.remove(x)
                outx = self.min_cycle_aux(w+self.adj[b][x], L, S)
                L.pop()
                S.add(x)
                if outx[0] < res[0]:
                    res = outx
        return res

    def min_cycle(self):
        global nr_calls
        nr_calls = 0
        S = self.vertex_set()
        a = S.pop()
        res = self.min_cycle_aux(0, [a], S)
        print("number of calls to min_cycle_aux: "+str(nr_calls))
        return res

    def vertex_set(self):  # returns the set with all vertices of the graph
        S = set()
        for x in self.adj:
            S.add(x)
        return S

    def lower_bound(self, w, L, S):
        # returns low(L), with w the cost of L, and S the set of vertices not in L
        a = L[0]
        b = L[-1]
        min_a = math.inf
        min_b = math.inf
        for x in self.adj[a]:
            if x in S and self.adj[a][x] < min_a:
                min_a = self.adj[a][x]
        for x in self.adj[b]:
            if x in S and self.adj[b][x] < min_b:
                min_b = self.adj[b][x]
        return w+min_a+min_b+self.weight_min_tree(S)

    def min_cycle_aux_using_bound(self, bestsofar, w, L, S):
        global nr_calls
        nr_calls = nr_calls+1
        a = L[0]
        b = L[-1]
        if len(S) == 0:
            if a not in self.adj[b] or w+self.adj[b][a] >= bestsofar:
                return (math.inf, [])
            else:
                Lc = L[:]
                Lc.append(a)
                return (w+self.adj[b][a], Lc)

        if self.lower_bound(w, L, S) >= bestsofar:
            return (math.inf, [])

        res = (math.inf, [])
        for x in self.adj[b]:
            if x in S:
                L.append(x)
                S.remove(x)
                outx = self.min_cycle_aux_using_bound(
                    bestsofar, w+self.adj[b][x], L, S)
                L.pop()
                S.add(x)
                if outx[0] < res[0]:
                    res = outx
                if outx[0] < bestsofar:
                    bestsofar = outx[0]
        return res

    def min_cycle_using_bound(self):
        global nr_calls
        nr_calls = 0
        S = self.vertex_set()
        a = S.pop()
        res = self.min_cycle_aux_using_bound(math.inf, 0, [a], S)
        print("number of calls to min_cycle_aux_using_bound: "+str(nr_calls))
        return res

    # mincost among all trees whose spanned vertices are those in S
    def weight_min_tree(self, S):
        if len(S) == 1:
            return 0
        if len(S) == 2:
            L = list(S)
            if L[0] in self.adj[L[1]]:
                return self.adj[L[0]][L[1]]
            else:
                return math.inf
        uf = UF(S)
        nr_components = len(S)
        weight = 0
        for e in self.edges:
            if e[0] in S and e[1] in S:
                if uf.find(e[0]) != uf.find(e[1]):
                    weight = weight+e[2]
                    uf.union(e[0], e[1])
                    nr_components = nr_components-1
                    if nr_components == 1:
                        return weight
        return math.inf

    # reduces self.adj to keep only the edges with both ends in S
    def induce_by_subset(self, S):
        new_adj = {}
        for x in self.adj:
            for y in self.adj[x]:
                if x in S and y in S:
                    if x not in new_adj:
                        new_adj[x] = {y: self.adj[x][y]}
                    else:
                        new_adj[x][y] = self.adj[x][y]
                    if y not in new_adj:
                        new_adj[y] = {x: self.adj[y][x]}
                    else:
                        new_adj[y][x] = self.adj[y][x]
        self.adj = new_adj

    def display(self):
        print("Graph has "+str(len(self.adj))+" vertices")
        print()
        for x, y in self.adj.items():
            print("Neighbours of "+str(x)+":")
            for t, u in y.items():
                print(str(t)+" with weight "+str(u))
            print()


##############################
## Approximation algorithms ##
##############################

# Provided

    def random_cycle(self):
        # construct a random cycle
        T = [x for x in self.adj]
        random.shuffle(T)
        return (T, self.eval_cycle(T))

    def eval_cycle(self, T):
        # evaluate a cycle
        w = 0
        for i in range(1, len(self.adj)):
            w += self.adj[T[i - 1]][T[i]]

        w += self.adj[T[len(self.adj) - 1]][T[0]]
        return w

    def get(self, T, i):
        # returns the node at L[i] (cyclic: Safe if i < 0 or i > len(L))
        return T[(i + len(self.adj)) % len(self.adj)]

#########################
## Greedy construction ##
#########################

    # Question 1
    def greedily_select_edges(self):
        uf = UF(self.vertex_set())
        selected_edges = []
        self.edges.sort(key=lambda e: e[2])
        deg = {x: 0 for x in self.vertex_set()}
        for e in self.edges:
            if (deg[e[0]] < 2 and deg[e[1]] < 2) and ((not uf.is_connected(e[0], e[1])) or len(selected_edges) == len(self.vertex_set())-1):
                uf.union(e[0], e[1])
                selected_edges.append(e)
                deg[e[0]] += 1
                deg[e[1]] += 1
        return selected_edges

    # Question 2
    def build_cycle_from_edges(self, edges):
        adj_cycle = {}
        for e in edges:
            if e[0] not in adj_cycle:
                adj_cycle[e[0]] = [e[1]]
            else:
                adj_cycle[e[0]].append(e[1])
            if e[1] not in adj_cycle:
                adj_cycle[e[1]] = [e[0]]
            else:
                adj_cycle[e[1]].append(e[0])

        start_node = edges[0][0]
        cycle = [start_node]
        current_node = start_node
        previous_node = None

        while len(cycle) < len(self.vertex_set()):
            neighbors = adj_cycle[current_node]
            for neighbor in neighbors:
                if neighbor != previous_node:
                    cycle.append(neighbor)
                    previous_node = current_node
                    current_node = neighbor
                    break

        return sum(edge[2] for edge in edges), cycle

    # Greedy approximation algorithm
    def greedy_min(self):
        selected_edges = self.greedily_select_edges()
        return self.build_cycle_from_edges(selected_edges)

###########
## 2-opt ##
###########

    # Question 3
    def evaluate_flip(self, T, i, j):
        # Weight of removed edges
        removed = self.adj[self.get(T, i-1)][self.get(T, i)] + self.adj[self.get(T, j)][self.get(T, j+1)]
        # Weight of added edges
        added = self.adj[self.get(T, i-1)][self.get(T, j)] + self.adj[self.get(T, i)][self.get(T, j+1)]
        # Gain is removed - added
        return removed - added

    # Question 4
    def find_best_opt2(self, T):
        best_gain = 0
        best_pair = None
        n = len(T)
        for i in range(n):
            for j in range(i + 1, n):
                if i == 0 and j == n - 1:
                    continue
                gain = self.evaluate_flip(T, i, j)
                if gain > best_gain:
                    best_gain = gain
                    best_pair = (i, j)
        return (best_pair, best_gain)

    # Question 5
    def opt_2(self, W, T):
        (i,j), gain = self.find_best_opt2(T)
        self.flip(T, i, j)
        
        return self.eval_cycle(T), T

    # Perform a flip in the list of nodes
    def flip(self, T, i, j):
        k = j + 1
        T[i:k] = reversed(T[i:k])

    # Question 6
    def neighborhood_search_opt2(self, W, T):
        while self.find_best_opt2(T)[1] > 0:
            W, T = self.opt_2(W, T)
        return (W, T)
