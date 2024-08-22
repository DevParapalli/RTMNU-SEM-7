= Diffie-Hellman Key Exchange (Finite Field)

The Diffie-Hellman Key Exchange is a method of securely exchanging cryptographic keys over a public channel. 
// This explainer focuses on the finite field version of the algorithm.

== Overview

The Diffie-Hellman protocol allows two parties to establish a shared secret key without ever having to transmit the key itself. This is achieved through the use of modular arithmetic and the difficulty of the discrete logarithm problem.

== Key Components

1. A large prime number $p$
2. A generator $g$ (usually a primitive root modulo $p$)
3. Private keys $a$ and $b$ (chosen by Alice and Bob respectively)
4. Public keys $A$ and $B$ (computed and shared by Alice and Bob)

== The Protocol

1. Alice and Bob agree on public parameters $p$ and $g$.

2. Alice chooses a private key $a$ and computes her public key:
   $A = g^a mod p$

3. Bob chooses a private key $b$ and computes his public key:
   $B = g^b mod p$

4. Alice and Bob exchange their public keys.

5. Alice computes the shared secret:
   $s = B^a mod p$

6. Bob computes the shared secret:
   $s = A^b mod p$

7. Both Alice and Bob now have the same shared secret $s$.

== Mathematical Proof


The Diffie-Hellman Key Exchange results in the same shared secret for both parties.



  The reason this works is due to the properties of modular exponentiation:

  $s = B^a mod p = (g^b)^a mod p = g^(a b) mod p$

  $s = A^b mod p = (g^a)^b mod p = g^(a b) mod p$

  As we can see, both computations result in the same value: $g^(a b) mod p$.


// == Example (with small numbers for illustration)

// Let $p = 23$ and $g = 5$

// 1. Alice chooses $a = 6$ and computes $A = 5^6 mod 23 = 8$
// 2. Bob chooses $b = 15$ and computes $B = 5^15 mod 23 = 19$
// 3. They exchange public keys: Alice sends 8, Bob sends 19
// 4. Alice computes $s = 19^6 mod 23 = 2$
// 5. Bob computes $s = 8^15 mod 23 = 2$

// Both Alice and Bob now share the secret key 2, without ever having transmitted it directly.

#pagebreak()

#align(center)[Listing 1: diffehellman_a.py]

#set text(size: 8pt)

#raw(
  read("diffehellman_a.py"),
  lang: "python",
  block: true
)

#align(center)[Listing 2: diffehellman_b.py]

// #set text(size: 8pt)

#raw(
  read("diffehellman_b.py"),
  lang: "python",
  block: true
)

#align(center)[Listing 3: diffehellman.py]

#set text(size: 11pt)

#raw(
  read("diffehellman.py"),
  lang: "python",
  block: true
)

#pagebreak()

#v(1fr)

#figure(
  image("output.png", width: 100%),
  caption: [Output]
)
#v(1fr)