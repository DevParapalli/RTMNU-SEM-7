= Advanced Encryption Standard (AES)

The Advanced Encryption Standard (AES) is a symmetric block cipher algorithm widely used for secure data encryption. It operates on fixed-size blocks of 128 bits, with key sizes of 128, 192, or 256 bits.

== Key Components

1. *State*: A 4x4 matrix, in column-major order, of bytes representing the current block being processed.
2. *Key Schedule*: Derived round keys from the original key.
3. *Rounds*: The number of transformation rounds (10, 12, or 14) based on key size.

== Main Operations

AES employs four main transformations:

1. *SubBytes*: Non-linear substitution using an S-box.
2. *ShiftRows*: Cyclical shifting of rows in the state.
3. *MixColumns*: Linear mixing operation on columns.
4. *AddRoundKey*: XOR of the state with the round key.

== Mathematical Foundation

AES operates in the finite field GF(2^8), defined by the irreducible polynomial:

$ m(x) = x^8 + x^4 + x^3 + x + 1 $

Byte multiplication is performed modulo this polynomial.

The MixColumns step uses a fixed polynomial $c(x)$:

$ c(x) = 3x^3 + x^2 + x + 2 $

This is used in matrix multiplication with the state column vector.

== Encryption Process

1. Initial AddRoundKey
2. 9, 11, or 13 rounds of:
   - SubBytes
   - ShiftRows
   - MixColumns
   - AddRoundKey
3. Final round (without MixColumns)

The decryption process inverts these operations, using inverse S-boxes and inverse MixColumns.

AES's strength lies in its combination of substitution, permutation, and key mixing, making it resistant to known cryptanalytic attacks.

#pagebreak()

#align(center)[Listing 1: aes.py]

#set text(size: 9pt)

#raw(
  read("aes.py"),
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