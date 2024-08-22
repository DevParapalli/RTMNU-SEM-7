// #import "@preview/codly:1.0.0": *
// #show: codly-init.with()
// #codly(zebra-fill: none, display-icon: false, display-name: false, smart-indent: true)

#set heading(numbering: "1.")

= Data Encryption Standard (DES) Algorithm

== Introduction

The Data Encryption Standard (DES) is a symmetric-key block cipher algorithm developed in the 1970s. It was widely used for secure electronic communication before being superseded by more advanced encryption methods.

== Key Characteristics

- Block size: 64 bits
- Key size: 56 bits (technically 64 bits, but every 8th bit is used for parity)
- Number of rounds: 16

== Algorithm Overview

=== Step 1: Initial Permutation

The 64-bit plaintext block undergoes an initial permutation.

=== Step 2: 16 Rounds of Encryption

Each round consists of:
- Splitting the block into two 32-bit halves (Left and Right)
- Expanding the Right half from 32 to 48 bits
- XORing with a 48-bit round key
- Passing through 8 S-boxes to reduce back to 32 bits
- Permutation of the resulting 32 bits
- XORing with the Left half
- Swapping Left and Right halves (except in the final round)

=== Step 3: Final Permutation

The output of the 16th round undergoes a final permutation (inverse of the initial permutation).

== Key Schedule

- The 56-bit key is divided into two 28-bit halves
- For each round:
  - Both halves are rotated left by 1 or 2 bits (depending on the round)
  - 48 bits are selected from the 56 bits to form the round key

== Security Considerations

While innovative for its time, DES is now considered insecure due to its short key length. Modern systems use more robust algorithms like AES.

#pagebreak()

#align(center)[
  #table(
    columns: (auto, auto),
    inset: 10pt,
    align: horizon,
    ["Strength", "Weakness"],
    ["Fast and easy to implement", "Short key length (56 bits)"],
    ["Well-studied and analyzed", "Vulnerable to brute-force attacks"],
    ["Resistant to differential cryptanalysis", "Superseded by more secure algorithms"]
  )
]

#align(center)[Listing 1: DES-file.py]

#set text(size: 11pt)

#raw(
  read("DES-file.py"),
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
