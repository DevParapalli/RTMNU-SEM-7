import random
import os

def miller_rabin(n, k=5):
    if n <= 1 or n == 4:
        return False
    if n <= 3:
        return True
    
    # Find r and s
    s = 0
    d = n - 1
    while d % 2 == 0:
        s += 1
        d //= 2
    
    # Witness loop
    for _ in range(k):
        a = random.randrange(2, n - 1)
        x = pow(a, d, n)
        if x == 1 or x == n - 1:
            continue
        for _ in range(s - 1):
            x = pow(x, 2, n)
            if x == n - 1:
                break
        else:
            return False
    return True

def generate_prime(bits=512):
    while True:
        n = random.getrandbits(bits)
        # Ensure n is odd
        n |= (1 << bits - 1) | 1
        if miller_rabin(n):
            return n

def greatest_common_divisor(a: int, b: int):
    if b == 0: 
        return a
    else:
        return greatest_common_divisor(b, a % b)

def least_common_multiple(a: int, b: int):
    # LCM using the Euclidean Algorithm
    gcd = greatest_common_divisor(a, b)
    return abs(a * b) // gcd


class RSA:
    def __init__(self):
        self.p = generate_prime()
        self.q = generate_prime()
        
        # Compute n = pq
        self.n = self.p * self.q
        
        # Carmichael's totient function (lambda(n))
        self.lambda_n = least_common_multiple(self.p - 1, self.q - 1)
        # IMP: Secret
        
        # Choose e such that 1 < e < lambda(n) and 
        # gcd(e, lambda(n)) == 1, that is e and lambda(n) are co-prime
        # for i in range(lambda_n, 1, -1):
        #     if greatest_common_divisor(i, lambda_n) == 1:
        #         self.e = i

        # Most common value for e is 65537 (2**16 + 1)
        self.e = 65537
        
        # MMI(of x in base p) => pow(x, -1, p)
        self.d = pow(self.e, -1, self.lambda_n)
        # IMP: Secret
        
        self.private_key = (self.d, self.lambda_n)
        self.public_key = (self.e, self.n)
    
    @staticmethod
    def pad_pkcs1(unpadded: bytes, n: int) -> bytes:
        """pads a RSA string using PKCS1 v1.5 padding scheme

        Args:
            unpadded (bytes): Unpadded Plaintext (M)
            n (int): the modulus, from the public key

        Returns:
            bytes: padded plaintext (m)
        """
        mod_len = (n.bit_length() + 7) // 8 # Round up to next byte
        msg_len = len(unpadded)
        
        # Padding String must be atleast 8 bytes
        if msg_len > mod_len - 11:
            raise ValueError("[PKCS1 v1.5] PaddingError: Message too long.")
        
        padding_length = mod_len - msg_len - 3
        padding_string = b""
        while len(padding_string) < padding_length:
            padding_byte = os.urandom(1)
            if padding_byte != b"\x00":
                padding_string += padding_byte
        
        #            00||02  ||       PS      ||    00  ||M
        padded = b"\x00\x02" + padding_string + b"\x00" + unpadded
        
        return padded
            
    @staticmethod
    def unpad_pkcs1(padded: bytes) -> bytes:
        if len(padded) < 11:
            raise ValueError("[PKCS1 v1.5] PaddingError: Padded message too short.")

        if padded[:2] != b"\x00\x02":
            raise ValueError("[PKCS1 v1.5] PaddingError: Incorrect padding format.")
        
        sep_idx = padded.find(b'\x00', 2)
        if sep_idx == -1:
            raise ValueError("[PKCS1 v1.5] PaddingError: Separator not found.")

        return padded[sep_idx+1:]
        
    @staticmethod
    def encrypt(plaintext: bytes, public_key: tuple[int, int]) -> bytes:
        e, n = public_key
        
        padded = RSA.pad_pkcs1(plaintext, n)
        
        x = int.from_bytes(padded, "big")

        if x >= n:
            raise ValueError("[RSA] Padded message is too large to encrypt using this key")
        
        c = pow(x, e, n)
        return c.to_bytes((n.bit_length() + 7) // 8)
            
    def decrypt(self, ciphertext: bytes) -> bytes:
        c = int.from_bytes(ciphertext, "big")
        if c >= self.n:
            raise ValueError("[RSA] Ciphertext is too large to decrypt for this key")
        
        m = pow(c, self.d, self.n)
        padded = m.to_bytes((self.n.bit_length() + 7) // 8)
        return RSA.unpad_pkcs1(padded)
    
    def sign(self, message: bytes) -> bytes:
        """
        Sign a message using the private key.
        
        Args:
            message (bytes): The message to be signed.
        
        Returns:
            bytes: The signature.
        """
        # Hash the message
        # message = hashlib.sha256(message).digest()
        
        # Pad the hash (message)
        padded = self.pad_pkcs1(message, self.n)
        
        # Convert to integer
        m = int.from_bytes(padded, "big")
        
        # Sign (encrypt with private key)
        s = pow(m, self.d, self.n)
        
        return s.to_bytes((self.n.bit_length() + 7) // 8, "big")
    
    @staticmethod
    def verify(message: bytes, signature: bytes, public_key: tuple[int, int]) -> bool:
        """
        Verify a signature using the public key.
        
        Args:
            message (bytes): The original message.
            signature (bytes): The signature to verify.
            public_key (tuple[int, int]): The public key (e, n).
        
        Returns:
            bool: True if the signature is valid, False otherwise.
        """
        e, n = public_key
        
        # Convert signature to integer
        s = int.from_bytes(signature, "big")
        
        # Verify (decrypt with public key)
        m = pow(s, e, n)
        padded = m.to_bytes((n.bit_length() + 7) // 8, "big")
        
        try:
            _message = RSA.unpad_pkcs1(padded)
        except ValueError:
            return False
        
        # Compare with the hash of the original message
        return _message == message


class ANSI:
    RED = "\033[0;31m"
    GREEN = "\033[0;32m"
    BLUE = "\033[0;34m"
    
    BOLD = "\033[1m"
    
    END = "\033[0m"


if __name__ == "__main__":
    RSA_A = RSA()
    
    print(f"{ANSI.BOLD}RSA Components:{ANSI.END}")
    print(f"p (first prime): {hex(RSA_A.p)}")
    print(f"\nq (second prime): {hex(RSA_A.q)}")

    print(f"\n{ANSI.GREEN}Public Key (e, n):")
    print(f"({ANSI.BOLD}{hex(RSA_A.e)}{ANSI.END}{ANSI.GREEN}, {hex(RSA_A.n)}){ANSI.END}")
    print(f"\n{ANSI.RED}Private Key (d, λ(n)):")
    print(f"({ANSI.BOLD}{hex(RSA_A.d)}{ANSI.END}{ANSI.RED}, {hex(RSA_A.lambda_n)}){ANSI.END}")
    
    message = b"Practical 09 - Rivest-Shamir-Adleman PKCS Signing - Devansh Parapalli"
    print(f"\nOriginal message: {message}")
    
    signature = RSA_A.sign(message)
    print(f"\nMessage Signature: {signature.hex()}")
    
    print(f"\n{ANSI.BOLD}Sender A (Correct){ANSI.END}")
    verification = RSA.verify(message, signature, RSA_A.public_key)
    print(f"Message Authenticated (Sender A): {verification}")
    
    RSA_B = RSA()
    
    print(f"\n{ANSI.BOLD}Sender B (Incorrect){ANSI.END}")
    
    verify_b = RSA.verify(message, signature, RSA_B.public_key)
    print(f"Message Authenticated (Sender B): {verify_b}")