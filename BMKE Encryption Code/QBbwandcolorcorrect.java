import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.security.MessageDigest;
import java.util.Random;

public class QBbwandcolorcorrect {

    // ✅ Load and FORCE ARGB (prevents grayscale + preserves color)
    public static BufferedImage loadImage(String path) throws Exception {
        BufferedImage original = ImageIO.read(new File(path));

        BufferedImage argb = new BufferedImage(
                original.getWidth(),
                original.getHeight(),
                BufferedImage.TYPE_INT_ARGB
        );

        Graphics2D g = argb.createGraphics();
        g.drawImage(original, 0, 0, null);
        g.dispose();

        return argb;
    }

    // Save image
    public static void saveImage(BufferedImage image, String path) throws Exception {
        ImageIO.write(image, "png", new File(path));
    }

    // ✅ Deterministic key generation (same for encryption & decryption)
    public static int[][] generateKey(String secret, int w, int h) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(secret.getBytes("UTF-8"));

        long seed = 0;
        for (int i = 0; i < 8; i++) {
            seed = (seed << 8) | (hash[i] & 0xff);
        }

        Random rand = new Random(seed);

        int[][] key = new int[h][w];
        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {
                key[y][x] = rand.nextInt(256);
            }
        }
        return key;
    }

    // ✅ XOR encryption/decryption (with alpha preservation)
    public static BufferedImage xorRGB(BufferedImage img, int[][] key) {
        int w = img.getWidth();
        int h = img.getHeight();

        BufferedImage out = new BufferedImage(w, h, BufferedImage.TYPE_INT_ARGB);

        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {

                int pixel = img.getRGB(x, y);

                int a = (pixel >> 24) & 0xff;
                int r = (pixel >> 16) & 0xff;
                int g = (pixel >> 8) & 0xff;
                int b = pixel & 0xff;

                // XOR operation
                r ^= key[y][x];
                g ^= key[y][x];
                b ^= key[y][x];

                // ✅ Preserve FULL opacity (fix for dark image issue)
                int newPixel = (0xFF << 24) | (r << 16) | (g << 8) | b;

                out.setRGB(x, y, newPixel);
            }
        }
        return out;
    }

    // ✅ Convert encrypted image to grayscale ONLY for display
    public static BufferedImage toGray(BufferedImage img) {
        int w = img.getWidth();
        int h = img.getHeight();

        BufferedImage gray = new BufferedImage(w, h, BufferedImage.TYPE_BYTE_GRAY);

        for (int y = 0; y < h; y++) {
            for (int x = 0; x < w; x++) {

                int pixel = img.getRGB(x, y);

                int r = (pixel >> 16) & 0xff;
                int g = (pixel >> 8) & 0xff;
                int b = pixel & 0xff;

                int grayVal = (r + g + b) / 3;

                gray.getRaster().setSample(x, y, 0, grayVal);
            }
        }
        return gray;
    }

    public static void main(String[] args) throws Exception {

        String inputPath = "C:\\Users\\sk\\Pictures\\NARMADHA\\final original image\\roseresized.png";

        BufferedImage original = loadImage(inputPath);

        int w = original.getWidth();
        int h = original.getHeight();

        String secret = "11011010100001000011100101111001010111101110110101000011110011100001110111101011111110011111111100111000111111101010011111110000001001110111010011";

        int[][] key = generateKey(secret, w, h);

        // 🔐 Step 1: Encrypt (COLOR data)
        BufferedImage encryptedColor = xorRGB(original, key);

        // ⚫ Step 2: Convert to grayscale for output ONLY
        BufferedImage encryptedBW = toGray(encryptedColor);

        // 🔓 Step 3: Decrypt using ORIGINAL encrypted COLOR data
        BufferedImage decrypted = xorRGB(encryptedColor, key);

        // Save results
        saveImage(encryptedBW, "qkdoricolorcorrectrose_enc.png");     // Black & White encrypted image
        saveImage(decrypted, "qkdoricolorcorrectrose_dec.png");    // Original color recovered

        System.out.println("✅ SUCCESS:");
        System.out.println("Encrypted image (B/W) saved as encrypted_bw.png");
        System.out.println("Decrypted image (Color) saved as decrypted_color.png");
    }
}