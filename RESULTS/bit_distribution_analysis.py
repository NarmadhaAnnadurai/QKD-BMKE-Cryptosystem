import numpy as np
import cv2
from collections import Counter
import math

# Change this to your image filename/path
img = cv2.imread('encrypted.png', cv2.IMREAD_GRAYSCALE)

if img is None:
    print("Error: Could not load the image. Check the file path and name!")
else:
    h, w = img.shape
    total_pixels = h * w

    # Byte (pixel value) distribution
    hist = Counter(img.flatten())
    values = list(hist.values())
    if values:  # Avoid error if no pixels
        print("Histogram variance:", np.var(values))  # Lower = more uniform

    # Information Entropy
    entropy = 0
    for count in hist.values():
        p = count / total_pixels
        if p > 0:
            entropy -= p * math.log2(p)
    print(f"Entropy: {entropy:.4f} (ideal ≈ 8.0 for good encryption)")

    # Bit-level distribution (8 bit planes)
    print("\nBit plane analysis (percentage of 1s):")
    for k in range(8):
        bits = (img >> k) & 1
        ones_count = np.sum(bits)
        perc_1 = (ones_count / total_pixels) * 100
        print(f"Bit plane {k} (LSB=0): {perc_1:.2f}% 1s  (ideal ≈ 50%)")










