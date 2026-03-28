clc; clear; close all;

% Read Original and Modified Encrypted Images
originalImage = imread('/MATLAB Drive/Final Permuted Images/facepermuted_image.png'); % First encrypted image
modifiedImage = imread('/MATLAB Drive/Final Encrypted Images/facepermutedbmke_oneencrypted.png'); % Second encrypted image (with one pixel change)

% Convert to grayscale if needed
if size(originalImage,3) == 3
    originalImage = rgb2gray(originalImage);
end
if size(modifiedImage,3) == 3
    modifiedImage = rgb2gray(modifiedImage);
end

% Get Image Size
[M, N] = size(originalImage);

% Compute NPCR
D = (originalImage ~= modifiedImage); % Binary difference map
NPCR = (sum(D(:)) / (M * N)) * 100;

% Display Result
fprintf('NPCR Value: %.2f%%\n', NPCR);
