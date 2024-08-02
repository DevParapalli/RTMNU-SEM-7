#import "@preview/codly:1.0.0": *
#show: codly-init.with()
#codly(zebra-fill: none, display-icon: false, display-name: false, smart-indent: true)
// #show: project.with(
//   title: "Hill Cipher: Theoretical Overview",
//   authors: (),
// )


= Hill Cipher: Theoretical Overview

== Hill Cipher

The Hill cipher is a polygraphic substitution cipher based on linear algebra, invented by Lester S. Hill in 1929. It was the first polygraphic cipher in which it was practical to operate on more than three symbols at once.

=== Encryption

To encrypt a message, each block of $n$ letters (considered as an $n$-component vector) is multiplied by an invertible $n times n$ matrix, against a modulus that depends on the size of the alphabet (26 for the English alphabet). Each letter is represented by a number modulo 26, with A=0, B=1, ..., Z=25.

For example, consider the message 'ACT' and the key matrix:

$
mat(
  6, 24, 1;
  13, 16, 10;
  20, 17, 15
)
$

Since 'A' is 0, 'C' is 2, and 'T' is 19, the message can be written as the vector:

$
vec(0, 2, 19)
$

The enciphered vector is then obtained by matrix multiplication:

$
mat(
  6, 24, 1;
  13, 16, 10;
  20, 17, 15
)
vec(0, 2, 19)
==
vec(67, 222, 319)
equiv
vec(15, 14, 7) (mod 26)
$

which corresponds to a ciphertext of 'POH'.

=== Decryption

To decrypt a message, we turn the ciphertext back into a vector and multiply it by the inverse of the key matrix used for encryption.

For example, using the same key matrix as above, the inverse matrix is:

$
mat(
  6, 24, 1;
  13, 16, 10;
  20, 17, 15
)^(-1)
equiv
mat(
  8, 5, 10;
  21, 8, 21;
  21, 12, 8
) (mod 26)
$

If we have the ciphertext 'POH', we can decrypt it as follows:

$
mat(
  8, 5, 10;
  21, 8, 21;
  21, 12, 8
)
vec(15, 14, 7)
==
vec(260, 574, 539)
equiv
vec(0, 2, 19) (mod 26)
$

which gets us back to 'ACT'.

=== Choosing the Key Matrix

Not all matrices can be used as key matrices in the Hill cipher. The determinant of the matrix must be non-zero and must not have any common factors with the modular base (26 for the English alphabet). This ensures that the matrix is invertible, which is necessary for decryption.

For example, the determinant of the 3x3 key matrix above is:

$
|mat(
  6, 24, 1;
  13, 16, 10;
  20, 17, 15
)|
== 6(16 dot 15 - 10 dot 17) - 24(13 dot 15 - 10 dot 20) + 1(13 dot 17 - 16 dot 20) = 441 equiv 25 (mod 26)
$

Since 25 is prime with 26 (i.e., they have no common factors), this matrix can be used for the Hill cipher.

=== Variants and Extensions

The basic Hill cipher is vulnerable to known-plaintext attacks because it is completely linear. However, it can be combined with other non-linear operations to increase its security. For example, the MixColumns step in AES is a matrix multiplication, and the Twofish cipher uses a combination of non-linear S-boxes with a carefully chosen matrix multiplication.

The Hill cipher can also be extended to work with larger blocks of letters by using larger key matrices. Hill himself invented a machine that mechanically implemented a 6 x 6 version of the cipher, which was very secure. However, the machine was unable to change the key setting, limiting its use in practice.

#pagebreak()

#align(center)[Listing 1: hill-cipher.py]

#set text(size: 12pt)

#raw(
  read("hill-cipher.py"),
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