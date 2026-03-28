% Step 1: Read the input image
img = imread('/MATLAB Drive/image data/permuted_image.jpg');  % Replace with your actual image file

% Step 2: Extract a small region for zoomed view (e.g., top-left 5x5)
region = img(1:5, 1:5, :);  % You can modify the region if needed

% Step 3: Zoom the image region for visualization
zoomFactor = 50;  % Enlarges each pixel
zoomedRegion = imresize(region, zoomFactor, 'nearest');

% Step 4: Display the zoomed image
figure;
imshow(zoomedRegion);
title('Zoomed Image with Pixel RGB Values');
hold on;

% Step 5: Overlay RGB values on each zoomed pixel
[rows, cols, ~] = size(region);
for i = 1:rows
    for j = 1:cols
        % Get RGB values of the pixel
        R = region(i, j, 1);
        G = region(i, j, 2);
        B = region(i, j, 3);
        
        % Format the RGB text
        pixelText = sprintf('R:%d\nG:%d\nB:%d', R, G, B);
        
        % Compute text position centered in the zoomed pixel
        x = (j - 0.5) * zoomFactor;
        y = (i - 0.5) * zoomFactor;
        
        % Place text on the zoomed image
        text(x, y, pixelText, ...
            'Color', 'white', ...
            'FontSize', 7, ...
            'FontWeight', 'bold', ...
            'HorizontalAlignment', 'center');
    end
end
hold off;
