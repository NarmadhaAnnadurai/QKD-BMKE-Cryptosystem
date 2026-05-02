# QKD-BMKE-Cryptosystem
BMKE Image Encryption and Decryption using Quantum inspired Key and Hexa Affine Permutation
**Title : 
Enhanced Image Encryption Scheme Using Hexa-Affine Key Deterministic Modular Permutation Secured by Basis Matched Key Extraction Technique**

**Authors :**
1. A. NARMADHA  , Research Scholar- Part Time (External), Department of Computer Applications, SRM Institute of Science & Technology, Ramapuram, Chennai., na0968@srmist.edu.in
2. Dr. AGUSTHIYAR R, Professor & Head PG, Department of Computer Applications, SRM Institute of Science & Technology, Ramapuram, Chennai.
agusthir@srmist.edu.in,

**Description:**
The proposed framework involves hybrid approach that uses  Hexa-Affine Key Deterministic Modular Permutation (HAKDMP) along with Quantum inspired Basis Matching Key Extraction (BMKE) techniques incorporated with pixel transformation. 

**Requirements**
Java , 
Python Libraries : Matplotlib ,
MATLAB
**Compile and Run Code**
# Java Code : 
1. Save file using filename.java
2. Compile - javac filename.java
3. Run - java filename
# Python Code
1. save as filename.py
2. run the python code

# Security measures evaluated
1. NPCR
2. UACI
3. Correlation Analysis
4. Entropy Analysis
5. Bit Distribution
6. Histograms
7. Correlation plots
8. Entropy graph
9. Bit Distribution chart
10. Visual Analysis

# Formulas used for evaluation
Attached as separate file for reference

# Cryptographic Techniques Used
1. Modular Arithmetic Block Permutation
2. XOR operation on bits for Pixel Transformation
3. Stream cipher mechanism
4. Pseudo Random Number Generation
5. SHA 256 hash function

# Objectives
* To propose a hybrid image encryption framework
* To provide higher level of security for digital image data transferred through network
* To integrate quantum based key generation for encryption.

# Findings and Results Achieved
* Strong Shuffling Achieved : Bit distribution chart shows evenly distributed bits of 0's and 1's
* Entropy value approches 7.996 nearing optimal value of 8
* Correlation plots shows the randomly distributed pixels
* Resistance to stattistical attacks
* Resistance to Differential Attacks : NPCR and UACI values are calculated

# Process of Hexa Affine Key Deterministic Modular Permutation (HAKDMP)
The Proposed HAKDMP methodology takes an input image of different sizes and segments the image into blocks of equal sizes. Segmented blocks are rearranged into the grid dimensions using Affine Transformation modulo. Six integer parameters are mathematically chosen as secret keys which control the modular permutation process. The proposed technique is considered to be key deterministic technique because it rearranges the image blocks based on the secret keys rather than creating a random shuffle. Choosing different keys can produce different patterns of permuted images as output. It also ensures that the same key always produces exactly the same permuted image, thus making the permuted image completely reversible with the correct keys. To ensure every new positions stay within the image boundaries and to wrap the position around the edges of the image, modulo based arithmetic computation is carried on each row and each column. Six keys are chosen since it is required to define a 2D affine transformation.

#  Working of Basis Matched Key Extraction (BMKE) 
The Basis Matched Key Extraction (BMKE) is the second phase of the proposed framework, which involves the encryption using quantum inspired deterministic key generation and pixel transformation mechanism. In this phase a shared secret key agreed between the communicating parties is generated using the cryptographic SHA-256 hash function.  Firstly, a secret key, we refer as shared secret here is generated using a randomization technique that mimics quantum inspired method in classical approaches to generate a unique bit sequence. This key is transferred to the transmitter and recipient to use in encryption and decryption implementation. In this BMKE framework the shared secret is taken as the input for encryption. This is then transformed into a fixed length hash value of 256 bits with the help of SHA-256 cryptographic hash mechanism. 64-bit seed value is extracted from the beginning of the obtained hash. A sequence of random bits is extracted from the seed which contains 64 bits. Pseudo Random Number Generator is used in this case to generate those random values. These numbers are arranged into a key matrix which has the same dimensions as that of the input image. The seed generation process is deterministic in nature, hence produces the same identical matrix for the same secret information. The key is independently generated at both the ends using the secret message. The produced key matrix encrypts every image pixel. This key generation concept is also inspired from the synchronised quantum key distribution principle where synchronized keys are generated at both ends independently using commonly shared information. Finally, the generated key matrix is combined with each corresponding pixel to obtain the encrypted pixel by applying bitwise XOR operation. This encryption process achieves a strong diffusion and ensures that even minute change made in input creates great change in cipher image. Moreover, the deterministic property of the key generation helps to reproduce the same key matrix during reverse process involved in decryption thus obtains real image back accurately.

# CONCLUSION
This paper proposes a new image encryption scheme by integrating Hexa Affine Key Deterministic Modular Permutation (HAKDM) and Basis Matched Key Extraction (BMKE) to provide better visual strength to the image.  The innovated method has focused on combining image permutation and transformation techniques along with quantum inspired key generation. This key generation ensures a secure key transmission. The encrypted images become more complex and unpredictable due to the generation of keys inspired by quantum mechanics. Encryption phase using BMKE technique involves various cryptographic approaches like stream cipher mechanism, pseudo random key generation, SHA 256 hash function and XOR pixel transformation. The effectiveness of proposed techniques towards statistical and differential attacks it has been tested with various security measures. Results are presented as evidence for its efficiency. All the images that are eencrypted appear completely random and immune to visual interpretation. Therefore, proposed techniques can be considered as a secure approach for images. 




force attacks. This framework is evaluated with security measures and experimental results show that it provides higher level of security and resilience with attacks.
