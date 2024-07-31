import numpy as np
import string
import math


def modinv(num, mod):
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

class HillCipher:
    
    _alphabet = string.ascii_uppercase + '1234567890 .-:$'
    mod = len(_alphabet)
    
    
    def _char_to_num(self, char):
        return self._alphabet.index(char)
    
    
    def _num_to_char(self, num):
        return self._alphabet[num]
    
    def __init__(self, key: str, alphabet=None):
        self.key = key
        self._key_size = math.ceil(math.sqrt(len(key)))
        
        if alphabet:
            self._alphabet = alphabet
            self.mod = len(alphabet)
        
        self.encryption_key = np.array([self._char_to_num(char) for char in key.upper()] + [26] * (self._key_size**2 - len(self.key)), dtype='int').reshape(self._key_size, self._key_size)
        
        det = int(round(np.linalg.det(self.encryption_key))) % self.mod
        if det == 0 or math.gcd(det, self.mod) != 1:
            raise ValueError('Invalid Key: Key Matrix is not invertible modulo 29')
        
        self.decryption_key = modinv_matrix(self.encryption_key, self.mod)
        
    def encrypt(self, plaintext: str):
        _plaintext = [self._char_to_num(c) for c in plaintext.upper()]
        while len(_plaintext) % self._key_size != 0:
            _plaintext.append(len(self._alphabet)-1)
        
        _ct = []
        for i in range(0, len(_plaintext), self._key_size):
            block = np.array(_plaintext[i:i+self._key_size])
            e_block = np.dot(self.encryption_key, block) % self.mod
            _ct.extend(e_block)
        
        return "".join([self._num_to_char(n) for n in _ct])
            
            
    def decrypt(self, ciphertext: str):
        _ciphertext = [self._char_to_num(c) for c in ciphertext.upper()]
        if len(_ciphertext) % self._key_size != 0:
            raise ValueError("Ciphertext length must be a multiple of key size")
        
        _pt = []
        for i in range(0, len(_ciphertext), self._key_size):
            block = np.array(_ciphertext[i:i+self._key_size])
            d_block = np.dot(self.decryption_key, block) % self.mod
            _pt.extend(d_block)
        
        while _pt and _pt[-1] == len(self._alphabet)-1:
            _pt.pop()
        
        return "".join([self._num_to_char(n) for n in _pt])
    
    
KEY = 'DEVANSH'
PLAINTEXT = "DATE:2024-07-26$CNS:PRACTICAL THREE"

cipher = HillCipher(KEY)
print(f'[KEY]\n{cipher.key}')
print(f'[PLAINTEXT]\n{PLAINTEXT}')
print(f'[ENCRYPTION KEY]\n{cipher.encryption_key}')
e_text = cipher.encrypt(PLAINTEXT)
print(f'[ENCRYPTED]\n{e_text}')
print(f'[DECRYPTION KEY]\n{cipher.decryption_key}')
d_text = cipher.decrypt(e_text)
print(f'[DECRYPTED]\n{d_text}')
