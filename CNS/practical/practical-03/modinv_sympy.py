import numpy as np
import sympy as sp

A = np.array([6, 24, 1, 13, 16, 10, 20, 17, 15]).reshape(3, 3)

print(A)
print(np.array(sp.Matrix(A).inv_mod(26)))