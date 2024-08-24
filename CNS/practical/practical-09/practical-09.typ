= Digital Signature using RSA

RSA Digital Signature is a digital signature scheme based on the RSA (Rivest-Shamir-Adleman) cryptosystem. It provides a way to verify the authenticity and integrity of a message, ensuring that it comes from a known sender and hasn't been tampered with.

== Key Concepts

1. *Public-Private Key Pair*: RSA uses asymmetric cryptography, where each user has a public key (widely shared) and a private key (kept secret).

2. *Signing Process*: The sender uses their private key to create a signature for a message.

3. *Verification Process*: Anyone with the sender's public key can verify the signature.

== How RSA Digital Signature Works

=== Signing a Message

1. The sender computes a hash (e.g., SHA-256) of the message.
2. This hash is then encrypted using the sender's private key, creating the signature.
3. The original message and the signature are sent together.

=== Verifying a Signature

1. The receiver computes the hash of the received message.
2. The receiver decrypts the signature using the sender's public key.
3. If the decrypted signature matches the computed hash, the signature is valid.

== Mathematical Foundation

RSA Digital Signature relies on the mathematical properties of modular exponentiation and the difficulty of factoring large numbers.

- Private Key: (d, n)
- Public Key: (e, n)

Where n is the product of two large prime numbers, e is the public exponent, and d is the private exponent.

Signing: $S = M^d mod n$

Verifying: $M = S^e mod n$

(M is the message hash, S is the signature)

== Security Considerations

- The security of RSA Digital Signature depends on keeping the private key secret.
- The key size should be sufficiently large (e.g., 2048 bits or more) to resist factorization attacks.
- Proper padding schemes (e.g., PSS) should be used to enhance security.

== Applications

RSA Digital Signature is widely used in various applications, including:
- Secure email (PGP, S/MIME)
- Code signing
- SSL/TLS certificates
- Blockchain transactions

#pagebreak()

#align(center)[Listing 1: signature.py]

#set text(size: 9pt)

#raw(
  read("signature.py"),
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