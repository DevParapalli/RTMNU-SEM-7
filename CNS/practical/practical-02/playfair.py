def prepare_key(key):
    key = key.upper().replace("J", "I")
    key = "".join(dict.fromkeys(key + "ABCDEFGHIKLMNOPQRSTUVWXYZ"))
    matrix = [list(key[i:i+5]) for i in range(0, 25, 5)]
    return matrix

def find_position(matrix, char):
    for i, row in enumerate(matrix):
        if char in row:
            return i, row.index(char)

def playfair_encrypt(plaintext, key):
    matrix = prepare_key(key)
    plaintext = plaintext.upper().replace("J", "I")
    plaintext = [plaintext[i:i+2] for i in range(0, len(plaintext), 2)]
    if len(plaintext[-1]) == 1:
        plaintext[-1] += 'X'
    ciphertext = ""
    for pair in plaintext:
        r1, c1 = find_position(matrix, pair[0])
        r2, c2 = find_position(matrix, pair[1])
        if r1 == r2:
            ciphertext += matrix[r1][(c1+1)%5] + matrix[r2][(c2+1)%5]
        elif c1 == c2:
            ciphertext += matrix[(r1+1)%5][c1] + matrix[(r2+1)%5][c2]
        else:
            ciphertext += matrix[r1][c2] + matrix[r2][c1]

    return ciphertext

def playfair_decrypt(ciphertext, key):
    matrix = prepare_key(key)
    ciphertext = [ciphertext[i:i+2] for i in range(0, len(ciphertext), 2)]
    plaintext = ""
    for pair in ciphertext:
        r1, c1 = find_position(matrix, pair[0])
        r2, c2 = find_position(matrix, pair[1])
        if r1 == r2:
            plaintext += matrix[r1][(c1-1)%5] + matrix[r2][(c2-1)%5]
        elif c1 == c2:
            plaintext += matrix[(r1-1)%5][c1] + matrix[(r2-1)%5][c2]
        else:
            plaintext += matrix[r1][c2] + matrix[r2][c1]
    return plaintext

key = "DEVANSH"
plaintext = "CNSPRACTICALTWO"
ciphertext = playfair_encrypt(plaintext, key)
decrypted = playfair_decrypt(ciphertext, key)

print(f"Plaintext: {plaintext}")
print(f"Ciphertext: {ciphertext}")
print("Matrix:")
(__import__("pprint").pprint(prepare_key(key)))
print(f"Decrypted: {decrypted}")