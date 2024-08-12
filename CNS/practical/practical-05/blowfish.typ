= Blowfish: A Symmetric Block Cipher

== Introduction
Blowfish is a symmetric block cipher designed by Bruce Schneier in 1993. It's known for its simplicity, speed, and strong encryption. Blowfish operates on 64-bit blocks and uses a variable-length key, from 32 bits to 448 bits.

== Key Features
- Fast: Efficient on 32-bit processors
- Compact: Requires only 4 KB of memory
- Simple: Easy to implement and analyze
- Variable key length: Flexible security levels
- Unpatented: Free for public use

== How Blowfish Works

=== Key Expansion
The key expansion process in Blowfish is a crucial step that converts the variable-length key (up to 448 bits) into subkeys totaling 4168 bytes. This process initializes two key-dependent structures:

1. P-array: An array of 18 32-bit subkeys, denoted as $P_1, P_2, ..., P_18$
2. S-boxes: Four 256-entry S-boxes, each entry being a 32-bit word
   - $S_1$: 256 entries
   - $S_2$: 256 entries
   - $S_3$: 256 entries
   - $S_4$: 256 entries

The key expansion process follows these steps:

1. Initialize P-array and S-boxes with a fixed string based on the hexadecimal digits of π (pi).

2. XOR $P_1$ with the first 32 bits of the key, $P_2$ with the second 32 bits, and so on. Repeat the key cyclically until the entire P-array is XORed.

3. Encrypt the all-zero string with the Blowfish algorithm using the subkeys described in steps 1 and 2.

4. Replace $P_1$ and $P_2$ with the output of step 3.

5. Encrypt the output of step 3 using the modified subkeys.

6. Replace $P_3$ and $P_4$ with the output of step 5.

7. Continue this process, replacing all elements of the P-array and then all four S-boxes in order.

In total, 521 iterations are required to generate all required subkeys. This makes the key setup a relatively expensive operation, but it also helps protect against weak keys and enhances the overall security of the cipher.

Mathematically, we can represent the initial subkey generation process as:

$
"For" i = 1 "to" 18: \
    P_i = P_i xor K[(i-1) "mod" k]
$

Where $K$ is the original key divided into 32-bit blocks, and $k$ is the number of 32-bit blocks in the key.

=== Data Encryption
The encryption process operates on a 64-bit block of plaintext $(x)$. Let $x = x_L || x_R$, where $x_L$ and $x_R$ are the left and right 32-bit halves.

#align(left)[
  #h(1fr)
$"For" i = 1 "to" 16: \
#h(2em)x_L = x_L xor P_i \
#h(2em)x_R = F(x_L) xor x_R \
#h(2em)"Swap" x_L "and" x_R \

"Swap" x_L "and" x_R\
x_R = x_R xor P_17 \
x_L = x_L xor P_18$
#h(1fr)
]

The ciphertext is then $(x_R || x_L)$.

=== The F Function
The F function is a key component of Blowfish. It takes a 32-bit input and produces a 32-bit output. Mathematically, it can be expressed as:

$
F(x) = ((S_(1,a) + S_(2,b) "mod" 2^32) xor S_(3,c)) + S_(4,d) "mod" 2^32
$

Where $a, b, c,$ and $d$ are the four bytes of $x$, with $a$ being the most significant byte.

$S_(1,a)$ denotes the $a$'th entry in S-box 1, and so on.

=== Decryption
Decryption is essentially the same process as encryption, but with the P-array subkeys used in reverse order. The F function remains the same.

== Security Considerations
- Strong against differential and linear cryptanalysis
- Weak keys exist but are detectable during the key expansion process
- While still secure for many applications, modern alternatives like AES are often preferred for new designs due to more extensive security analysis and wider adoption

#pagebreak()

#align(center)[Listing 1: blowfish.py]

#set text(size: 11pt)

#raw(
  read("blowfish.py"),
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