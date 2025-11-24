# -*- coding: utf-8 -*-

from uf import Rank_UF

import random

def draw_grid(grid, N):
    for ii in range(N):
        i = ii+1
        for j in range(N):
            if not grid[i][j]:
                print('X', end='')
            else:
                print(' ', end='')
        print()

def pos_to_int(N, i, j):
    return N*i+j

def inside (G,x,y):
    N = len(G)
    return 0 <= x and x < N and 0 <= y and y < N

def vacant (G,x,y):
    return inside(G,x,y) and G[x][y] == True

def get_vacant_neighbors(G,N,i,j):
    dir = [(1,0),(0,1),(-1,0),(0,-1)]
    
    return sorted( [[i+d[0],j+d[1]] for d in dir if vacant(G,i+d[0],j+d[1])] )

def make_vacant(UF, G, N, i, j):
    
    G[i][j] = True

    for cell in get_vacant_neighbors(G,N,i,j):
        UF.union(pos_to_int(N,i,j), pos_to_int(N,cell[0],cell[1]))


def ratio_to_percolate(N):
    G = [[False for _ in range(N)] for __ in range(N+2)]
    for i in range (N):
        G[0][i] = True
        G[N+1][i] = True
    UF = Rank_UF(pos_to_int(N,N+2,N))
    for i in range(1,N):
        UF.union(pos_to_int(N,0,i),pos_to_int(N,0,0))
        UF.union(pos_to_int(N,N+1,i),pos_to_int(N,N+1,0))
    
    vacant = 0
    while (not UF.is_connected(pos_to_int(N,0,0),pos_to_int(N,N+1,0))):
        (i,j) = (random.randint(1,N),random.randint(1,N))
        if (G[i][j] == False):
            vacant += 1
            G[i][j] = True
            for cell in get_vacant_neighbors(G,N,i,j):
                UF.union(pos_to_int(N,i,j), pos_to_int(N,cell[0],cell[1]))
    
    return vacant / N*N