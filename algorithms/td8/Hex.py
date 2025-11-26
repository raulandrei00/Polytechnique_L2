# -*- coding: utf-8 -*-

from uf import Rank_UF

import random

class Hex:
    def __init__(self, N):
        # size of the board (counting extra rows / columns)
        self.size = N+2
        # initialisation of the board (all hexagons are free)
        self.board = [[0 for j in range(self.size)] for i in range(self.size)]

        # initialisation of the Union-Find object
        nelem = self.size**2
        self.uf = Rank_UF(nelem)

        # first player to play is player 1
        self.player = 1


        l = self.size-1
        # union of sides of each player
        # player 1 is affected to the extra rows, player 2 extra columns
        for i in range(1,self.size-1):
            self.board[0][i] = 1
            self.board[l][i] = 1
            self.board[i][0] = 2
            self.board[i][l] = 2


            if i > 0:
                self.uf.union(self.hex_to_int(1,0), self.hex_to_int(i,0))
                self.uf.union(self.hex_to_int(1,l), self.hex_to_int(i,l))

                self.uf.union(self.hex_to_int(0,1), self.hex_to_int(0,i))
                self.uf.union(self.hex_to_int(l,1), self.hex_to_int(l,i))

        # get the indices in UF of the bottom and top sides of each player
        self.bot = [-1, self.hex_to_int(0,1), self.hex_to_int(1,0)]
        self.top = [-1, self.hex_to_int(l,1), self.hex_to_int(1,l)]

    def hex_to_int(self, i, j):
        return i*(self.size) +j

    def print_board(self):
        for i in range(1, self.size-1):
            print(' '*(i-1),end='')
            for j in range(1, self.size-1):
                if self.board[i][j] == 0:
                    print('_', end='')
                if self.board[i][j] == 1:
                    print('X', end='')
                if self.board[i][j] == 2:
                    print('O', end='')
            print()

    def belong (self,x,y):
        return self.board[x][y] == self.player

    def neighbours(self, i, j):
        dir = [(1,0),(0,1),(-1,0),(0,-1),(1,-1),(-1,1)]
        return sorted( [[i+d[0],j+d[1]] for d in dir if self.belong(i+d[0],j+d[1])] )


    def is_game_over(self):
        if self.player == 1:
            return self.uf.is_connected(self.hex_to_int(0,1), self.hex_to_int(self.size-1,1))
        else:
            return self.uf.is_connected(self.hex_to_int(1,0), self.hex_to_int(1,self.size-1))

    def random_turn(self):
        (i,j) = (0,0)
        while (self.board([i][j] != 0)):
            (i,j) = (random.randint(1,self.size-1),random.randint(1,self.size-1))
        self.board[i][j] = self.player
        for n1,n2 in self.neighbours(i,j):
            self.uf.union(self.hex_to_int(n1,n2),self.hex_to_int(i,j))


        

    def random_play(self):
        self.player = 1
        no_turns = 0
        while (not self.is_game_over()):
            self.random_turn()
            no_turns += 1
            self.player = (self.player+1)%2+1
        return no_turns / (self.size ** 2)