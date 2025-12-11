from numpy import linalg as la
import numpy as np
import sympy as sp


#              a  b  c  d  e  f  g  h  i  l  w
B = sp.Matrix([[1, 1, 0, 0, 0, 0, 0, 0, 0, -1, 0],
              [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, -1],
              [0, 0, 1, 1, 1, 0, 0, 0, 0, -1, 0],
              [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1],
              [0, 0, 0, 0, 0, 1, -1, 0, -1, 0, 0],
              [0, 0, 0, 0, 0, 0, 1, -1, -1, 0, 0],
              [1, 0, 0, 0, -1, -1, 0, 0, -1, 0, 0],
              [1, -1, 0, 0, 0, 0, 0, -1, 1, 0, 0],
              [0, 1, -1, 0, 0, 0, 0, -1, 0, 0, 0],
              [0, 0, 1, -1, 0, 0, -1, -1, 0, 0, 0],
              [0, 0, 0, -1, 1, -1, 0, 0, 0, 0, 0],
              [0, 0, 0, 1, 0, -1, -1, 0, 0, 0, 0]])

print(B.rank())
nullspace = B.nullspace()
print(nullspace)
# X_exact = nullspace[0]  # first nullspace vector
# print(X_exact)