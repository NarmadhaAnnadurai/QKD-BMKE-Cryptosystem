% Read the image
img = imread('/MATLAB Drive/image data/permuted_image.jpg');  % Replace with your image path

% Convert the image to grayscale (optional, for simplicity)
gray_img = rgb2gray(img);

% Define the size of the patch (sub-region) to compare with the rest of the image
patch_size = [50 50];  % You can change this to other values

% Extract a small patch from the image (top-left corner)
patch = gray_img(1:patch_size(1), 1:patch_size(2));

% Perform cross-correlation (normalized) between the patch and the entire image
correlation_map = normxcorr2(patch, gray_img);

% Display the original image
figure;
imshow(gray_img);
title('Original Grayscale Image');

% Display the correlation plot
figure;
imshow(correlation_map, []);
title('Correlation Plot of the Image');
