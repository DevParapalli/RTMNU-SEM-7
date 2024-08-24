= SHA-512: Secure Hash Algorithm 512-bit

SHA-512 is a cryptographic hash function that produces a 512-bit (64-byte) hash value. It's part of the SHA-2 family of hash functions, designed by the U.S. National Security Agency (NSA).

== Key Characteristics

- *Input*: Can process messages up to 2^128 bits in length
- *Output*: 512-bit hash value
- *Block size*: 1024 bits
- *Word size*: 64 bits

== Algorithm Steps

1. *Preprocessing*:
   - Pad the message:
     1. Append a single '1' bit to the message
     2. Add '0' bits until the length is 896 mod 1024
     3. Append the original message length as a 128-bit integer
   - Parse the padded message into 1024-bit blocks (M_1, M_2, ..., M_N)

2. *Initialize Hash Values*:
   - Set eight 64-bit words ($H_0^(0)$ to $H_7^(0)$) with specific initial values

3. *Process Message Blocks*:
   - For each 1024-bit block M_i (i = 1 to N):
     
     1. Prepare the message schedule (W_t):
        - Set $W_0$, $W_1$, $...$, $W_15$ as the 64-bit words of the current block
        - For t = 16 to 79:
          $W_t = σ_1(W_(t-2)) + W_(t-7) + σ_0(W_(t-15)) + W_(t-16)$
          where $σ_0$ and $σ_1$ are specialized functions
     
     2. Initialize working variables:
        $a = H_0^(i-1), b = H_1^(i-1), ..., h = H_7^(i-1)$
     
     3. Main loop (t = 0 to 79):
        - $T_1 = h + Σ_1(e) + "Ch"(e,f,g) + K_t + W_t$
        - $T_2 = Σ_0(a) + "Maj"(a,b,c)$
        - $h = g, g = f, f = e, e = d + T_1$
        - $d = c, c = b, b = a, a = T_1 + T_2$
        where $Σ_0$, $Σ_1$, $"Ch"$, and $"Maj"$ are specialized functions
     
     4. Compute intermediate hash value:
        $H_0^(i) = a + H_0^(i-1), H_1^(i) = b + H_1^(i-1), ..., H_7^(i) = h + H_7^(i-1)$

4. *Produce Final Hash*:
   - Concatenate $H_0^(N) || H_1^(N) || ... || H_7^(N)$ to form the 512-bit hash
== Key Features

- One-way function: computationally infeasible to reverse
- Deterministic: same input always produces the same output
- Designed to be collision-resistant
- Used in various security applications and protocols

#pagebreak()

#align(center)[Listing 1: sha.py]

#set text(size: 9pt)

#raw(
  read("sha.py"),
  lang: "python",
  block: true
)

#pagebreak()

#v(1fr)

#set text(size: 12pt)

#figure(
  image("output.png", width: 100%),
  caption: [Output]
)

#v(1fr)