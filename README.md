# AES
AES encryption and decryption - key generation  - ECB &amp; CBC

The MATLAB app (.mlapp) is designed to work with hexadecimal input, such as follows (avoid whitespaces):

## Test cases for each layer:
### S-Box and its inverse:
• Input to S-Box: 6a84867cd77e12ad07ea1be895c53fa3\
• Output from S-Box: 025f44100ef3c995c587af9b2aa6750a

### Shiftrows and its inverse:
• Input to shiftrows: 025f44100ef3c995c587af9b2aa6750a\
• Output from shiftrows: 02f3af0a0e877510c5a644952a5fc99b

### MixColumns and its inverse:
• Input to MixColumns: 02f3af0a0e877510c5a644952a5fc99b\
• Output from MixColumns: af1faa4eeb9453c0b1cb4f87e74f4ac5

### Key Addition layer:
• Input to Key Addition Layer: af1faa4eeb9453c0b1cb4f87e74f4ac5\
• Key: 62636363626363636263636362636363\
• Output: cd7cc92d89f730a3d3a82ce4852c29a6

## Examples of Known Test cases:
### Encryption & Decryption using AES – 128
### CBC
• Plain Text: 58c8e00b2631686d54eab84b91f0aca1\
• Key: 00000000000000000000000000000000\
• IV (CBC): 00000000000000000000000000000000\
• Cipher Text: 08a4e2efec8a8e3312ca7460b9040bbf

### ECB
• Plain Text: 58c8e00b2631686d54eab84b91f0aca1\
• Key: 00000000000000000000000000000000\
• Cipher Text: 08a4e2efec8a8e3312ca7460b9040bbf

## Multi-block Message Test
### Encryption & Decryption using AES – 128
### CBC
• PlainText:
807bc4ea684eedcfdcca30180680b0f1ae2814f35f36d053c5aea6595a386c1442770f4d7297d8b91825ee7237241da8925dd594ccf676aecd46ca2068e8d37a3a0ec8a7d5185a201e663b5ff36ae197110188a23503763b8218826d23ced74b31e9f6e2d7fbfa6cb43420c7807a8625\
• Key: 89a553730433f7e6d67d16d373bd5360\
• IV (CBC): f724558db3433a523f4e51a5bea70497\
• CipherText:
406af1429a478c3d07e555c5287a60500d37fc39b68e5bbb9bafd6ddb223828561d6171a308d5b1a4551e8a5e7d572918d25c968d3871848d2f16635caa9847f38590b1df58ab5efb985f2c66cfaf86f61b3f9c0afad6c963c49cee9b8bc81a2ddb06c967f325515a4849eec37ce721a

### ECB
• Key: 00cc73c990d376b82246e45ea3ae2e37\
• PlainText:
37a1205ea929355d2e4ee52d5e1d9cda279ae01e640287ccb153276e7e0ecf2d633cf4f2b3afaecb548a2590ce0445c6a168bac3dc601813eb74591bb1ce8dfcd740cdbb6388719e8cd283d9cc7e736938240b410dd5a6a48ba49dd2066503e63ab592ffdf3be49e7d2de74f82158b8c\
• CipherText:
c88e03383ba9da6f982c057fe92c0bb3ed5b9cd18295a100e13a4e12d440b919bbb8b221abead362902ce44d30d0b80e56bee1f66a7d8de0b1e1b4dbf76c90c1807a3bc5f277e9814c82ab120f7e10217dfdf6092ce4958f8906c5e32279c6537dd1fbae20cb7a1d9f89d0490b6aefc1


