from random import getrandbits

class DiffeHellmanKeyExchangeB:
    # 512-bit pre-shared g and p values
    g = 0x678471b27a9cf44ee91a49c5147db1a9aaf244f05a434d6486931d2d14271b9e35030b71fd73da179069b32e2935630e1c2062354d0da20a6c416e50be794ca4
    p = 0xfca682ce8e12caba26efccf7110e526db078b05edecbcd1eb4a208f3ae1617ae01f35b91a47e6df63413c5e12ed0899bcd132acd50d99151bdc43ee737592e17
    def __init__(self):
        self.private_key = getrandbits(512)
        self.public_key = pow(self.g, self.private_key, self.p)
    
    def recv_public_key(self, other_combination: int):
        self.shared_secret = pow(other_combination, self.private_key, self.p)
        