img = imread('/MATLAB Drive/image data/rose.jpg');  % Replace with your file

% Display image
figure;
imshow(img);
title('Original Image');

% View pixel values
impixelinfo;  % Shows pixel values when hovering over the image
% Convert to grayscale if image is RGB (optional)
if size(img, 3) == 3
    grayImg = rgb2gray(img);  % For grayscale analysis
else
    grayImg = img;
end

% Pixel intensity inversion
invertedImg = 255 - grayImg;

% Display inverted image
figure;
imshow(invertedImg);
title('Inverted Image');
impixelinfo;
% Example: View pixel at (50, 100)
row = 50;
col = 100;
originalVal = grayImg(row, col);
invertedVal = invertedImg(row, col);

fprintf('Pixel at (%d, %d): Original = %d, Inverted = %d\n', ...
        row, col, originalVal, invertedVal);
disp('Original 5x5 block:');
disp(grayImg(1:5, 1:5));

disp('Inverted 5x5 block:');
disp(invertedImg(1:5, 1:5));







