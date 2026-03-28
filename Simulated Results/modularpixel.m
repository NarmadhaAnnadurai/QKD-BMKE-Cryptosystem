% MATLAB Code: Show Image Division + Modular Block Permutation

clc; clear; close all;

% Read the image
img = imread('/MATLAB Drive/image data/rose.jpg');    % Replace with your image
img = imresize(img, [256 256]); % Resize for uniform division

% Define block size
blockSize = [64 64];   % Each block is 64x64
numBlocksRow = size(img,1) / blockSize(1);
numBlocksCol = size(img,2) / blockSize(2);
numBlocks = numBlocksRow * numBlocksCol;

%% --- Step 1: Show image division with block boundaries ---
figure;
imshow(img); title('Image Divided into Blocks'); hold on;

% Draw grid lines
for r = 1:blockSize(1):size(img,1)
    line([1 size(img,2)], [r r], 'Color','r','LineWidth',1);
end
for c = 1:blockSize(2):size(img,2)
    line([c c], [1 size(img,1)], 'Color','r','LineWidth',1);
end
hold off;

%% --- Step 2: Divide image into blocks ---
blocks = cell(numBlocksRow, numBlocksCol);
for i = 1:numBlocksRow
    for j = 1:numBlocksCol
        rowStart = (i-1)*blockSize(1)+1;
        rowEnd   = i*blockSize(1);
        colStart = (j-1)*blockSize(2)+1;
        colEnd   = j*blockSize(2);
        blocks{i,j} = img(rowStart:rowEnd, colStart:colEnd, :);
    end
end

%% --- Step 3: Generate a permutation (key) ---
permKey = randperm(numBlocks);   % random permutation
disp('Permutation Key:');
disp(permKey);

%% --- Step 4: Apply block permutation ---
permutedImg = zeros(size(img), 'uint8');
count = 1;
for i = 1:numBlocksRow
    for j = 1:numBlocksCol
        % Find new position from key
        newPos = permKey(count);
        newRow = ceil(newPos / numBlocksCol);
        newCol = mod(newPos-1, numBlocksCol) + 1;
        
        % Place block at new location
        rowStart = (newRow-1)*blockSize(1)+1;
        rowEnd   = newRow*blockSize(1);
        colStart = (newCol-1)*blockSize(2)+1;
        colEnd   = newCol*blockSize(2);
        
        permutedImg(rowStart:rowEnd, colStart:colEnd, :) = blocks{i,j};
        count = count + 1;
    end
end

%% --- Step 5: Show Results ---
figure;
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(permutedImg); title('Block Permuted Image');
