# -*- coding: utf-8 -*-

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
        # TO COMPLETE
        pass  

    # Question 4
    
    def add_fixed_value_clauses(self):
        # TO COMPLETE
        pass
    
    # Questions 5 & 8
    
    def solve(self, propagation=False):
       # TO COMPLETE
       pass 
         
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
