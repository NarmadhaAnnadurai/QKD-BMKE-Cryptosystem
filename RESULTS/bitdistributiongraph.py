import matplotlib.pyplot as plt
import numpy as np

# Your data
bits = ['Bit 0\n(LSB)', 'Bit 1', 'Bit 2', 'Bit 3', 'Bit 4', 'Bit 5', 'Bit 6', 'Bit 7\n(MSB)']
original_1s = [49.6817, 49.9800, 50.7528, 48.9089, 47.3153, 44.6186, 36.5966, 4.9930]
encrypted_1s = [50.5606, 50.0641, 50.1522, 50.0260, 50.3203, 49.8058, 49.8599, 49.7798]

original_0s = [100 - x for x in original_1s]
encrypted_0s = [100 - x for x in encrypted_1s]

x = np.arange(len(bits))  # 0 to 7
width = 0.35  # Bar width

fig, ax = plt.subplots(figsize=(12, 7))

# Original: 0s (bottom) + 1s (top)
ax.bar(x - width/2, original_0s, width, label='Original 0s', color='lightgray')
ax.bar(x - width/2, original_1s, width, bottom=original_0s, label='Original 1s', color='#3498DB')  # Blue

# Encrypted: 0s (bottom) + 1s (top)
ax.bar(x + width/2, encrypted_0s, width, label='Encrypted 0s', color='darkgray')
ax.bar(x + width/2, encrypted_1s, width, bottom=encrypted_0s, label='Encrypted 1s', color='#E74C3C')  # Red

# Styling
ax.set_ylabel('Percentage (%)', fontsize=14)
ax.set_title('Bit Distribution: Percentage of 0s and 1s in Each Bit Plane\n(Original vs Encrypted Flower Image)', fontsize=16)
ax.set_xticks(x)
ax.set_xticklabels(bits, fontsize=12)
ax.set_ylim(0, 100)
ax.grid(axis='y', linestyle='--', alpha=0.5)

# Ideal 50% line (for 1s)
ax.axhline(y=50, color='green', linestyle='--', linewidth=2, label='Ideal 50% for 1s')

ax.legend(loc='upper right', fontsize=12)

# Add value labels on top of 1s bars
for i in range(len(bits)):
    # Original 1s
    ax.text(i - width/2, original_1s[i] + 2, f'{original_1s[i]:.2f}%', ha='center', fontsize=10, fontweight='bold')
    # Encrypted 1s
    ax.text(i + width/2, encrypted_1s[i] + 2, f'{encrypted_1s[i]:.2f}%', ha='center', fontsize=10, fontweight='bold')

plt.tight_layout()
plt.savefig('bit_distribution_0s_1s_plot.png', dpi=300)  # High-res for paper
plt.show()
