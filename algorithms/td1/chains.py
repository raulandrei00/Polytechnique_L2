# -*- coding: utf-8 -*-

import math
try:
    from PowerTree import *
except:
    pass

## Q1 ##

# binary powering, returns x^n
def bin_pow(x, n):
    pass

## Q2 ##

# returns the number of multiplications of a call to
# bin_pow(x,n)
def cost_bin_pow(n):
    pass

## Q3 ##

# returns -1 if n is prime, and returns the smallest factor
# p>=2 of n if n is composite
def smallest_factor(n):
    pass

## Q4 ##

# factorization powering, returns x^n
def factor_pow(x, n):
    pass

## Q5 ##

# returns the number of multiplications of a call to
# factor_pow(x,n)
def cost_factor_pow(n):
    pass

## Q6 ##

# returns x^n from an addition chain of n (stored in the parameter chain)
def power_from_chain(x, chain):
    pass

## Q8 ##

# returns the addition chain for n (path from the root
# to n in the power tree) after inserting enough
# layers of the tree so that n is part of it
def power_tree_chain(n):
    pass

# power tree powering, returns x^n
def power_tree_pow(x, n):
    pass

## Q9 ##

# number of multiplications of a call to power_tree_pow(x,n)
# does not count the cost of building the tree
def cost_power_tree_pow(n):
    pass

# prints the compared costs
def compare_costs(m):
    pass
