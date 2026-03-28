% Paths - UPDATE THESE
originalPath = '/MATLAB Drive/final original image/Flowerresized.png';
encryptedPath = '/MATLAB Drive/Final Encrypted Images/flower_qkdbmke_oneencrypted.png';  % ← Change this!

% Load images (convert to grayscale)
orig = rgb2gray(imread('/MATLAB Drive/final original image/Flowerresized.png'));
enc  = rgb2gray(imread('/MATLAB Drive/Final Encrypted Images/flower_qkdbmke_oneencrypted.png'));

if ~isequal(size(orig), size(enc))
    error('Images must be same size!');
end

figure('Name', 'Visual Comparison');
subplot(1,2,1); imshow(orig); title('Original Image');
subplot(1,2,2); imshow(enc);  title('Encrypted Image');

% Histograms
figure('Name', 'Histogram Comparison');
subplot(1,2,1); imhist(orig); title('Original Histogram');
subplot(1,2,2); imhist(enc);  title('Encrypted Histogram');

% Correlation plots (horizontal as example)
numPairs = 5000;  % random pairs
rows = randi(size(orig,1), numPairs,1);
cols = randi(size(orig,2)-1, numPairs,1);

% Original horizontal
origPixels1 = double(orig(sub2ind(size(orig), rows, cols)));
origPixels2 = double(orig(sub2ind(size(orig), rows, cols+1)));

% Encrypted horizontal
encPixels1 = double(enc(sub2ind(size(enc), rows, cols)));
encPixels2 = double(enc(sub2ind(size(enc), rows, cols+1)));

figure('Name', 'Correlation (Horizontal)');
subplot(1,2,1); scatter(origPixels1, origPixels2, '.'); 
title('Original Correlation'); xlabel('Pixel'); ylabel('Adjacent Pixel');
subplot(1,2,2); scatter(encPixels1, encPixels2, '.'); 
title('Encrypted Correlation'); xlabel('Pixel'); ylabel('Adjacent Pixel');

% Entropy
fprintf('Entropy Original: %.4f\n', entropy(orig));
fprintf('Entropy Encrypted: %.4f (ideal ~8)\n', entropy(enc));