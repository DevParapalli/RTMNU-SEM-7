import numpy as np
import sympy as sp
import string
import math

class HillCipher:
    
    _alphabet = string.ascii_uppercase + '1234567890 .-:$'
    mod = len(_alphabet)
    
    @staticmethod
    def _char_to_num(char):
        return HillCipher._alphabet.index(char)
    
    @staticmethod
    def _num_to_char(num):
        return HillCipher._alphabet[num]
    
    def __init__(self, key: str):
        self.key = key
        self._key_size = math.ceil(math.sqrt(len(key)))
        
        self.encryption_key = np.array([self._char_to_num(char) for char in key.upper()] + [26] * (self._key_size**2 - len(self.key)), dtype='int').reshape(self._key_size, self._key_size)
        
        det = int(round(np.linalg.det(self.encryption_key))) % self.mod
        if det == 0 or math.gcd(det, self.mod) != 1:
            raise ValueError('Invalid Key: Key Matrix is not invertible modulo 29')
        
        self.decryption_key = np.array(sp.Matrix(self.encryption_key).inv_mod(self.mod)).astype('int')
        
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
