
= Practical 08 - RSA

RSA (Rivest-Shamir-Adleman) is one of the first public-key cryptosystems and is widely used for secure data transmission. It is an asymmetric cryptographic algorithm, meaning it uses two different keys: a public key for encryption and a private key for decryption.

= RSA Algorithm

== Key Generation

1. Choose two large prime numbers $p$ and $q$.
2. Compute $n = p q$.
3. Compute $phi(n) = (p - 1)(q - 1)$.
4. Choose an integer $e$ such that $1 < e < phi(n)$ and $gcd(e, phi(n)) = 1$. Usually $2^16 + 1 = 65537$ is used.
5. Compute $d$ such that $d e equiv 1 (mod phi(n))$.

The public key is $(n, e)$ and the private key is $(n, d)$.

== Encryption

For a plaintext message $M$, the ciphertext $C$ is computed as:

$ C equiv M^e (mod n) $

== Decryption

To decrypt the ciphertext $C$ and recover the plaintext $M$:

$ M equiv C^d (mod n) $


= Security Considerations

RSA's security relies on the difficulty of factoring large numbers. As computational power increases, larger key sizes are needed to maintain security.

// == Key Size

// - 2048 bits for general purpose use
// - 3072 bits for high-security applications
// - 4096 bits for extremely sensitive data

== Potential Attacks

1. *Factorization attacks:* Attempts to factor $n$ to find $p$ and $q$.
2. *Timing attacks:* Exploiting the time taken to perform private key operations.
3. *Padding oracle attacks:* Exploiting weaknesses in padding schemes.

To mitigate these, use:
- Large key sizes
- Secure padding schemes (e.g., OAEP)
- Constant-time implementations

// = Practical Applications

// RSA is widely used in:

// - Secure email (PGP, S/MIME)
// - SSL/TLS for secure web browsing
// - Secure shell (SSH) for remote login
// - Digital signatures

= Conclusion

RSA remains a cornerstone of modern cryptography. While its relative slowness compared to symmetric algorithms limits its use for bulk data encryption, its role in key exchange and digital signatures ensures its continued relevance in cybersecurity.

#pagebreak()

#align(center)[Listing 1: rsa.py]

#set text(size: 9pt)

#raw(
  read("rsa.py"),
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