import numpy as np

def modinv(num, mod):
    num = num % mod
    for i in range(1, mod):
        if (num * i) % mod == 1:
            return i
    return None

def modinv_matrix(matrix, mod):
    det = int(round(np.linalg.det(matrix)))
    inv_det = modinv(det, mod)
    adj_mat = (np.linalg.inv(matrix).T * det).T
    mat_inv = (inv_det * adj_mat) % mod
    return np.round(mat_inv).astype('int')

if __name__ == '__main__':
    # print(modinv(3, 26)) # 9
    print(modinv_matrix(np.array([[6, 24, 1], [13, 16, 10], [20, 17, 15]]), 26)) 