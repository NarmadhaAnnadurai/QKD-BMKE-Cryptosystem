import cv2
import numpy as np
import matplotlib.pyplot as plt
from collections import Counter
import math
import os

def calculate_entropy(image_path):
    """Calculate information entropy for a grayscale image."""
    if not os.path.exists(image_path):
        raise FileNotFoundError(f"Image not found: {image_path}")
    
    img = cv2.imread(image_path, cv2.IMREAD_GRAYSCALE)
    if img is None:
        raise ValueError(f"Could not read image (possibly corrupted or unsupported format): {image_path}")
    
    total_pixels = img.size
    hist = Counter(img.flatten())
    
    entropy = 0.0
    for count in hist.values():
        p = count / total_pixels
        if p > 0:
            entropy -= p * math.log2(p)
    
    return entropy, img.shape[1], img.shape[0]  # width, height

# === YOUR FULL IMAGE PATHS ===
original_path = r"C:\Users\sk\Pictures\NARMADHA\final original image\Flowerresized.png"

encrypted_path = r"C:\Program Files (x86)\Java\jdk1.8.0_131\bin\narmadha\Final Encrypted Images\flower_qkdbmke_oneencrypted.png"

# === Calculate entropy ===
try:
    entropy_original, w1, h1 = calculate_entropy(original_path)
    entropy_encrypted, w2, h2 = calculate_entropy(encrypted_path)

    print(f"Original Image ({w1}x{h1}): Entropy = {entropy_original:.4f} bits")
    print(f"Encrypted Image ({w2}x{h2}): Entropy = {entropy_encrypted:.4f} bits")

    # === Create bar graph ===
    labels = ['Original Image', 'Encrypted Image']
    entropies = [entropy_original, entropy_encrypted]
    colors = ['#3498DB', '#E74C3C']  # Blue for original, Red for encrypted (good contrast)

    plt.figure(figsize=(8, 6))
    bars = plt.bar(labels, entropies, color=colors, width=0.5, edgecolor='black', linewidth=1.2)

    # Add exact values on top of bars
    for bar in bars:
        height = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2., height + 0.08,
                 f'{height:.4f}', ha='center', va='bottom', fontsize=13, fontweight='bold')

    plt.ylabel('Information Entropy (bits)', fontsize=14)
    plt.title('Entropy Comparison: Original vs Encrypted Flower Image', fontsize=16, pad=20)
    plt.ylim(0, 8.2)
    plt.grid(axis='y', linestyle='--', alpha=0.6)

    # Ideal maximum line
    plt.axhline(y=8.0, color='green', linestyle='--', linewidth=2, label='Theoretical Maximum = 8.0')
    plt.legend(fontsize=12)

    plt.tight_layout()
    
    # Save high-resolution graph for your paper
    output_graph = "entropy_comparison_flower.png"
    plt.savefig(output_graph, dpi=300, bbox_inches='tight')
    print(f"\nGraph successfully saved as: {os.path.abspath(output_graph)}")

    plt.show()

except FileNotFoundError as e:
    print(f"Error: {e}")
    print("Please double-check the file paths and folder names.")
except Exception as e:
    print(f"Unexpected error: {e}")
