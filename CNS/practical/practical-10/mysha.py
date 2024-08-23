# Notations
# ^ Bitwise AND &
# v Bitwise OR |
# (+) Bitwise XOR ^
# - Bitwise Complement ~
# + Addition Mod 2**32
# >> Leftshift 
# << Right Shift

# def ROTL(x: int, n:int):
#     # (x << n) | (x >> w - n) 
#     return (x << n) | (x >> (64 - n))

def ROTR(x: int, n: int):
    return (x >> n) | (x << (64 - n))

def SHR(x: int, n: int):
    return x >> n

# The 6 logical functions

def Ch(x: int, y: int, z: int) -> int:
    return (x & y) ^ (~x & z)

def Maj(x: int, y: int, z: int) -> int:
    return (x & y) ^ (x & z) ^ (y & z)

def sigma0(x: int) -> int:
    return ROTR(x, 28) ^ ROTR(x, 34) ^ ROTR(x, 39)

def sigma1(x: int) -> int:
    return ROTR(x, 14) ^ ROTR(x, 18) ^ ROTR(x, 41)

def gamma0(x: int) -> int:
    return ROTR(x, 1) ^ ROTR(x, 8) ^ SHR(x, 7)

def gamma1(x: int) -> int:
    return ROTR(x, 19) ^ ROTR(x, 61) ^ SHR(x, 6)

_K = """
428a2f98d728ae22 7137449123ef65cd b5c0fbcfec4d3b2f e9b5dba58189dbbc
3956c25bf348b538 59f111f1b605d019 923f82a4af194f9b ab1c5ed5da6d8118
d807aa98a3030242 12835b0145706fbe 243185be4ee4b28c 550c7dc3d5ffb4e2
72be5d74f27b896f 80deb1fe3b1696b1 9bdc06a725c71235 c19bf174cf692694
e49b69c19ef14ad2 efbe4786384f25e3 0fc19dc68b8cd5b5 240ca1cc77ac9c65
2de92c6f592b0275 4a7484aa6ea6e483 5cb0a9dcbd41fbd4 76f988da831153b5
983e5152ee66dfab a831c66d2db43210 b00327c898fb213f bf597fc7beef0ee4
c6e00bf33da88fc2 d5a79147930aa725 06ca6351e003826f 142929670a0e6e70
27b70a8546d22ffc 2e1b21385c26c926 4d2c6dfc5ac42aed 53380d139d95b3df
650a73548baf63de 766a0abb3c77b2a8 81c2c92e47edaee6 92722c851482353b
a2bfe8a14cf10364 a81a664bbc423001 c24b8b70d0f89791 c76c51a30654be30
d192e819d6ef5218 d69906245565a910 f40e35855771202a 106aa07032bbd1b8
19a4c116b8d2d0c8 1e376c085141ab53 2748774cdf8eeb99 34b0bcb5e19b48a8
391c0cb3c5c95a63 4ed8aa4ae3418acb 5b9cca4f7763e373 682e6ff3d6b2b8a3
748f82ee5defb2fc 78a5636f43172f60 84c87814a1f0ab72 8cc702081a6439ec
90befffa23631e28 a4506cebde82bde9 bef9a3f7b2c67915 c67178f2e372532b
ca273eceea26619c d186b8c721c0c207 eada7dd6cde0eb1e f57d4f7fee6ed178
06f067aa72176fba 0a637dc5a2c898a6 113f9804bef90dae 1b710b35131c471b
28db77f523047d84 32caab7b40c72493 3c9ebe0a15c9bebc 431d67c49c100d4c
4cc5d4becb3e42b6 597f299cfc657e2a 5fcb6fab3ad6faec 6c44198c4a475817
"""

K: list[int] = []

for line in _K.splitlines():
    for word in line.split():
        K.append(int.from_bytes(bytes.fromhex(word)))

_IV = "6a09e667f3bcc908 bb67ae8584caa73b 3c6ef372fe94f82b a54ff53a5f1d36f1 510e527fade682d1 9b05688c2b3e6c1f 1f83d9abfb41bd6b 5be0cd19137e2179"
IV = [int.from_bytes(bytes.fromhex(x)) for x in _IV.split()]

def pad(M: bytes) -> bytes:
    length_of_message_bits = len(M) * 8
    ending = length_of_message_bits.to_bytes(16, "big")
    k = 0
    while (length_of_message_bits + 1 + k % 1024 != 896):
        k += 1
    padding = 1 << k
    M += padding.to_bytes((padding.bit_length() // 8))
    M += ending
    return M

def sha512(m: bytes) -> bytes:
    message = pad(m)
    blocks = [message[i:i+128] for i in range(0, len(message), 128)]
    
    hash_value = IV.copy()
    
    for block in blocks:
        message_blocks = [int.from_bytes(block[i:i+8]) for i in range(0, len(block), 8)]
        
        print("Initial hash value:")
        for idx, _h in enumerate(hash_value):
            print(f"\tH[{idx:>2}]={_h.to_bytes(8).hex()}")
        # Step 1
        W = message_blocks.copy() # 0 <= t <= 15
        for t in range(16, 80): # 16 <= t <= 79 
            W.append((gamma1(W[t-2]) + W[t-7] + gamma0(W[t-15]) + W[t-16]) % 2**64)
        
        print("Block Contents:")
        for idx, w in enumerate(W):
            print(f"\tW[{idx:>2}]={w.to_bytes(8).hex()}")
        # Step 2
        a, b, c, d, e, f, g, h = hash_value
        # Step 3
        print("\n\n\t\tA/E\t\t     B/F\t\tC\G\t\t     D/H")
        for t in range(80):
            # t1 = (((h + sigma1(e)) % 2**64) + (Ch(e, f, g) + ((K[t] + W[t]) % 2**64) % 2**64))
            t1 = (h + sigma1(e) + Ch(e, f, g) + K[t] + W[t]) % 2**64
            t2 = (sigma0(a) + Maj(a, b, c)) % 2**64
            
            h = g
            g = f
            f = e
            e = (d + t1) % 2**64
            d = c
            c = b
            b = a
            a = (t1 + t2) % 2**64
            
            print(f"t={t:>2}:\t", end="")
            print(f"{[x.to_bytes(8).hex() for x in (a, b, c, d)]}")
            print(f"\t{[x.to_bytes(8).hex() for x in (e, f, g, h)]}\n")
        
        # Step 4
        hash_value = [
            hash_value[0] + a,
            hash_value[1] + b,
            hash_value[2] + c,
            hash_value[3] + d,
            hash_value[4] + e,
            hash_value[5] + f,
            hash_value[6] + g,
            hash_value[7] + h,
        ]
        hash_value = [x % 2**64 for x in hash_value]
    
    a, b, c, d, e, f, g, h = hash_value
    #64, 128, 192, 256, 320, 384, 448
    return (a << 448 | b << 384 | c << 320 | d << 256 | e << 192 | f << 128 | g << 64 | h).to_bytes(64)

digest = sha512(b"abc").hex()

print(" ".join([digest[i:i+8] for i in range(0, len(digest), 8)]))

# TODO: Convert into a sha.py file, into a class SHA512(), with constructor and update function that take in bytes
# TODO: Continued, on second thought, keeping the function simply as sha512 seems better, no need of complicated class shenanigans, simply pass in bytes and get a digest.
# TODO: Cleanup code.
