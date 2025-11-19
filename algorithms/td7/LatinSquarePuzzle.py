# -*- coding: utf-8 -*-

import inspect
try:
    from Sat import *
except Exception:
    pass

class LatinSquarePuzzle:
    def __init__(self,k,initial):
      self.k=k  
      self.initial=initial
      self.sat=Sat(self.k**3,[])   
      self.final=[]
        
    def triple_to_int(self,v,i,j):
        return (i*self.k + j)*self.k + v + 1
        
    def int_to_triple(self,r):
        temp = r - 1
        v = temp % self.k

        temp //= self.k
        j = temp % self.k

        temp //= self.k
        i = temp % self.k

        return [v,i,j]

    # Question 3
    
    def build_generic_clauses(self):
        
        k = self.k
        # Each cell (i,j) has at least one value and at most one value
        for i in range(k):
            for j in range(k):
                # at least one value in cell
                self.sat.add_clause([self.triple_to_int(v, i, j) for v in range(k)])
                # at most one value in cell (pairwise)
                for v in range(k):
                    for vp in range(v + 1, k):
                        self.sat.add_clause([-self.triple_to_int(v, i, j), -self.triple_to_int(vp, i, j)])
        # Each value v appears exactly once in each row i
        for i in range(k):
            for v in range(k):
                # at least once in the row
                self.sat.add_clause([self.triple_to_int(v, i, j) for j in range(k)])
                # at most once in the row (pairwise across columns)
                for j in range(k):
                    for jp in range(j + 1, k):
                        self.sat.add_clause([-self.triple_to_int(v, i, j), -self.triple_to_int(v, i, jp)])
        # Each value v appears exactly once in each column j
        for j in range(k):
            for v in range(k):
                # at least once in the column
                self.sat.add_clause([self.triple_to_int(v, i, j) for i in range(k)])
                # at most once in the column (pairwise across rows)
                for i in range(k):
                    for ip in range(i + 1, k):
                        self.sat.add_clause([-self.triple_to_int(v, i, j), -self.triple_to_int(v, ip, j)])

    # Question 4
    
    def add_fixed_value_clauses(self):
        
        for i in range(self.k):
            for j in range(self.k):
                v = self.initial[i][j]
                if v != '*':
                    val = int(v)
                    self.sat.add_clause([self.triple_to_int(val, i, j)])
    
    # Questions 5 & 8
    
    def solve(self, propagation=False):
    
        # build clauses
        self.build_generic_clauses()
        self.add_fixed_value_clauses()

        n = self.k ** 3
        R = 4 * n * n

        # try to find a WalkSAT method on self.sat and call it with sensible signatures

        walk_fn = None
        for name in ("walksat", "WalkSAT", "walkSAT", "walk_sat", "walk_sat_solver"):
            if hasattr(self.sat, name):
                walk_fn = getattr(self.sat, name)
                break
        if walk_fn is None and hasattr(self.sat, "solve"):
            walk_fn = getattr(self.sat, "solve")

        if walk_fn is None:
            raise AttributeError("No WalkSAT/solve method found on Sat object")

        # attempt calls with different common signatures
        model = None
        for args in ((R,), (R, 0.5), (100, R), (100, R, 0.5), ()):
            try:
                sig = inspect.signature(walk_fn)
                # check if number of parameters fits
                if len(sig.parameters) == len(args) or len(args) == 0:
                    if len(args) == 0:
                        model = walk_fn()
                    else:
                        model = walk_fn(*args)
                    break
            except TypeError:
                # try calling anyway (some implementations accept varargs)
                try:
                    if len(args) == 0:
                        model = walk_fn()
                    else:
                        model = walk_fn(*args)
                    break
                except Exception:
                    continue
            except Exception:
                continue

        if model is None:
            return False

        # helper to check if variable r (1-based) is true in returned model
        def var_true(r, m):
            # dict mapping var->bool
            if isinstance(m, dict):
                return bool(m.get(r, False))
            # set of positive true variable indices
            if isinstance(m, set):
                return r in m
            # list/tuple: could be length n (0-based for var1) or n+1 (1-based with dummy 0)
            if isinstance(m, (list, tuple)):
                if len(m) == n + 1:
                    return bool(m[r])
                if len(m) == n:
                    return bool(m[r - 1])
                # fallback: try to find integer r in list
                return r in m
            # string of space-separated integers?
            if isinstance(m, str):
                try:
                    return str(r) in m.split()
                except Exception:
                    return False
            return False

        # fill final grid
        self.final = [[ '*' for _ in range(self.k)] for _ in range(self.k)]
        for r in range(1, n + 1):
            if var_true(r, model):
                v, i, j = self.int_to_triple(r)
                self.final[i][j] = v

        return True
         
    ##################################################
    # DISPLAY METHODS
    ##################################################      
     
    def display_before_solving(self, prefix=""):
        print(prefix + "Initial configuration:")
        for r in range(self.k): 
            print(prefix + "[{0}]".format(', '.join(map(str, self.initial[r]))))
        print("")    

    def display_after_solving(self, prefix=""):
        if(len(self.final)==0):
            print(prefix + "Not yet solved")
            return
        print(prefix + "Solved configuration:")
        for r in range(self.k):    
            print(prefix + "[{0}]".format(', '.join(map(str, self.final[r]))))
        print("")     
