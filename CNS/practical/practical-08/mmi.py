def modular_multiplicative_inverse(n: int, mod: int):
    # MMI using Extended Euclidean Algorithm
    a = mod
    b = n
    q = a // b
    r = a - (b * q)
    t1 = 0
    t2 = 1
    t3 = t1 - q * t2
    #   [mod, n, q, r, t1, t2, t3]
    X = [a, b, q, r,  t1,  t2,  t3]
    print(X)
    while True:
        q = X[1] // X[3]
        r = X[1] - (X[3] * q)
        t3 = X[5] - q * X[6]
        X = [X[1], X[3], q, r, X[5], X[6], t3]
        print(X)
        if X[1] == 1: 
            return X[5] % mod

def modular_multiplicative_inverse_2(n: int, mod: int):
    # MMI using Extended Euclidean Algorithm
    a = mod
    b = n
    q = a // b
    r = a - (b * q)
    t1 = 0
    t2 = 1
    t3 = t1 - q * t2
    while True:
        a = b
        b = r
        q = a // b
        r = a - (b * q)
        t1 = t2
        t2 = t3
        t3 = t1 - q * t2
        
        if b == 1:
            return t2 % mod

print(modular_multiplicative_inverse_2(11, 26))