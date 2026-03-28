clc; clear; close all;

% Read Original and Modified Encrypted Images
originalImage = imread('/MATLAB Drive/Final Permuted Images/xraypermuted_image.png'); % First encrypted image
modifiedImage = imread('/MATLAB Drive/Final Encrypted Images/xraypermutedbmke_oneencrypted.png'); % Second encrypted image (with one pixel change)

% Convert to grayscale if needed
if size(originalImage,3) == 3
    originalImage = rgb2gray(originalImage);
end
if size(modifiedImage,3) == 3
    modifiedImage = rgb2gray(modifiedImage);
end

% Convert images to double for calculation
originalImage = double(originalImage);
modifiedImage = double(modifiedImage);

% Get Image Size
[M, N] = size(originalImage);

% Compute UACI
UACI = (sum(abs(originalImage - modifiedImage), 'all') / (M * N * 255)) * 100;

% Display Result
fprintf('UACI Value: %.2f%%\n', UACI);
