# -*- coding: utf-8 -*-

from uf import Rank_UF

import random
import math
 
def Erdos_Renyi(N):
    Dsu = Rank_UF(N)
    edges = 0
    while Dsu.get_count() > 1:
        (u,v) = (random.randint(0,N-1),random.randint(0,N-1))
        
        if not Dsu.is_connected(u,v):
            Dsu.union(u,v)
            edges += 1
    return edges