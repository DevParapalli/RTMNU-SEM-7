from diffehellman_a import DiffeHellmanKeyExchangeA
from diffehellman_b import DiffeHellmanKeyExchangeB

# This file represents the Public Channel 
# over which A and B communicate
print(f"g={hex(DiffeHellmanKeyExchangeA.g)}")
print(f"p={hex(DiffeHellmanKeyExchangeA.p)}")

# Agree on g and p, stored in implementation
A = DiffeHellmanKeyExchangeA() 
print(f"A.public_key={hex(A.public_key)}")
# generate g^a mod p, store in A.public_key
B = DiffeHellmanKeyExchangeB() 
print(f"B.public_key={hex(B.public_key)}")
# generate g_b mod p, store in B.public_key

# Exchange 
A.recv_public_key(B.public_key)
B.recv_public_key(A.public_key)

# Assertion that the secret is same
assert A.shared_secret == B.shared_secret

print(f"A.shared_secret={hex(A.shared_secret)}")
