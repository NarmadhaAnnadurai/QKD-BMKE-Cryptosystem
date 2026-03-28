% Read the image
img = imread('/MATLAB Drive/final original image/roseresized.png');  % Replace with your image path

% Convert the image to grayscale (optional)
gray_img = im2gray(img);

% Display the original image
figure;
imshow(img);
title('Original Image');

% Display the histogram for the grayscale image
figure;
imhist(gray_img);
title('Original Image');

% Separate the RGB channels
redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);

% Display the histograms for each channel
figure;
subplot(3,1,1);
imhist(redChannel);
title('Histogram of Red Channel');

subplot(3,1,2);
imhist(greenChannel);
title('Histogram of Green Channel');

subplot(3,1,3);
imhist(blueChannel);
title('Histogram of Blue Channel');
