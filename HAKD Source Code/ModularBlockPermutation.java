import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;

public class ModularBlockPermutation 
{

    public static BufferedImage permuteBlocks(BufferedImage img, int blockSize,
                                              int a, int b, int c,
                                              int d, int e, int f) {
        int width = img.getWidth();
        int height = img.getHeight();
        BufferedImage permutedImg = new BufferedImage(width, height, img.getType());

        int cols = width / blockSize;
        int rows = height / blockSize;

        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                // Compute new position using modular arithmetic
                int newRow = (a * i + b * j + c) % rows;
                int newCol = (d * i + e * j + f) % cols;

                if (newRow < 0) newRow += rows;  // handle negative modulo
                if (newCol < 0) newCol += cols;

                // Copy block to new position
                for (int y = 0; y < blockSize; y++) {
                    for (int x = 0; x < blockSize; x++) {
                        int pixel = img.getRGB(j * blockSize + x, i * blockSize + y);
                        permutedImg.setRGB(newCol * blockSize + x, newRow * blockSize + y, pixel);
                    }
                }
            }
        }
        return permutedImg;
    }

    public static void main(String[] args) {
        try {
            String imagePath = "C:\\Program Files (x86)\\Java\\jdk1.8.0_131\\bin\\narmadha\\MODULAR PERMUTATION\\roseresized.png"; 
            BufferedImage img = ImageIO.read(new File(imagePath));
            int blockSize = 1;

            // Modular key parameters (must be carefully chosen)
            int a = 1, b = 2, c = 3;
            int d = 4, e = 1, f = 1;

            BufferedImage permutedImage = permuteBlocks(img, blockSize, a, b, c, d, e, f);
            ImageIO.write(permutedImage, "png", new File("27.03 ROSE.png"));

            System.out.println("Modular block permutation completed. Check output image.");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
