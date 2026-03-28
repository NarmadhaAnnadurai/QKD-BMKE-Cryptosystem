% Read the image
img = imread('/MATLAB Drive/Final Encrypted Images/rosepermutedbmke_oneencrypted.png');  % Replace with your image path

% Convert to grayscale (optional, for simplicity)
gray_img = rgb2gray(img);

% Get the size of the image
[rows, cols] = size(gray_img);

% Extract vertical pixel values (shifted by 1 pixel down)
vertical_pixels_1 = double(gray_img(1:end-1, :)); % Original pixels (excluding last row)
vertical_pixels_2 = double(gray_img(2:end, :));   % Shifted pixels (excluding first row)

% Extract diagonal pixel values (shifted by 1 pixel down and right)
diagonal_pixels_1 = double(gray_img(1:end-1, 1:end-1)); % Original pixels (excluding last row and last column)
diagonal_pixels_2 = double(gray_img(2:end, 2:end));     % Shifted diagonally pixels

% Scatter plot for vertical correlation
figure;
scatter(vertical_pixels_1(:), vertical_pixels_2(:), 1, 'b'); % Plot all pixel correlations
xlabel('Pixel Intensity (i, j)');
ylabel('Pixel Intensity (i+1, j)');
title('Vertical Correlation Plot of Rose Image');
axis equal;

% Scatter plot for diagonal correlation
figure;
scatter(diagonal_pixels_1(:), diagonal_pixels_2(:), 1, 'r'); % Plot all pixel correlations
xlabel('Pixel Intensity (i, j)');
ylabel('Pixel Intensity (i+1, j+1)');
title('Diagonal Correlation Plot of Rose Image');
axis equal;
