# -*- coding: utf-8 -*-
import random

class Sat:
      
  def __init__(self,n,L):
    self.nr_var=n   # variables are x1,...,xn
    self.clauses=L
    self.values=[True for i in range(n+1)] # position 0 in this list is not used
    self.fixed={}

  # Question 1

  def add_clause (self, C):
     self.clauses.append(C)

  def eval_prop (self , P):
     if P < 0:
        return not self.values[-P]
     else: return self.values[P]
  
  def is_clause_satisfied(self,c):
    return any (self.eval_prop(i) for i in c)
        
  def satisfied(self):
    return all (self.is_clause_satisfied(c) for c in self.clauses)

  # Questions 2 & 8
  
  def initialize(self):
    self.values = [random.choice([True , False]) for _ in range (self.nr_var+1)]
      
  def flip (self , P):
     self.values[abs(P)] ^= 1

  def walk_sat(self,R,N=0):
    self.clauses.sort(key=len)
    n_trials = 0
    self.initialize()
    while ((not N) or n_trials < N):
      n_trials += 1
      for clause in self.clauses:
          if not self.is_clause_satisfied(clause):
             self.flip(clause[0])
      if n_trials % R == 0:
        self.initialize()
      if self.satisfied(): break
    
   
  ##################################################
  # PROPAGATION METHODS
  ##################################################  

  # Question 6
  
  def fix_values_from_1clauses(self):
    
      found = False
      for c in self.clauses:
          if len(c) == 1:
              lit = c[0]
              var = abs(lit)
              val = True if lit > 0 else False
              if var not in self.fixed or self.fixed[var] != val:
                  self.fixed[var] = val
                  self.values[var] = val
                  found = True
      return found

  # Helper functions for Question 7
  
  def simplify_clause(self,c):
    res=[]
    for x in c:
        if not abs(x) in self.fixed:
            res.append(x)
        else:
            if (x>0 and self.values[x]) or (x<0 and not self.values[-x]):
                return -1
    return res   

  def simplify_clauses(self):
    res=[]    
    for c in self.clauses:  
       cp=self.simplify_clause(c)
       if not cp==-1:
           res.append(cp)
    return res        

  # Question 7
  
  def simplify_formula_by_propagation(self):
    
    while True:
        
        found = self.fix_values_from_1clauses()
        if not found:
            break
        self.clauses = self.simplify_clauses()
    self.clauses = self.simplify_clauses()

  ##################################################
  # DISPLAY METHODS
  ##################################################                      
                                  
  def clause_to_string(self,c):
     res="" 
     for i in range(0,len(c)):
         if i==0: res="("
         else: res=res+" ∨ "
         if(c[i]>0): res=res+"x"+str(c[i])
         else: res=res+"¬x"+str(-c[i])
     return res+")"
     
  def display_statistics(self):
      print("Number of clauses: "+str(len(self.clauses)))
      print("Number of non-fixed variables: "+str(self.nr_var-len(self.fixed)))
      print("")

  def display_formula(self):
     L=self.clauses
     res=self.clause_to_string(L[0])
     for i in range(1,len(L)):     
         res=res+" ∧ "+self.clause_to_string(L[i])   
     print(res)    
              
  def display_values(self):
     res="" 
     for i in range(1,self.nr_var+1):
         res=res+"x"+str(i)+"="+str(self.values[i])+" "
     print(res)    

            
