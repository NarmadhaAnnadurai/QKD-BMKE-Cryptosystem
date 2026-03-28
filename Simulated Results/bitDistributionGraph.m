function bitDistributionGraph()
    % === YOUR IMAGE PATHS ===
    originalPath = '/MATLAB Drive/final original image/QRcoderesized.png';
    encryptedPath = '/MATLAB Drive/Final Encrypted Images/qrcodepermutedbmke_oneencrypted.png';

    % Calculate bit distribution for original
    percOrig = calculateBitDistribution(originalPath);
    
    % Calculate bit distribution for encrypted
    percEnc = calculateBitDistribution(encryptedPath);
    
    % Display in command window
    fprintf('Bit Plane (0=LSB to 7=MSB)\n');
    fprintf('Original:  ');
    fprintf('%.4f%%  ', percOrig);
    fprintf('\nEncrypted: ');
    fprintf('%.4f%%  ', percEnc);
    fprintf('\n');

    % Create grouped bar graph
    figure('Name', 'Bit Distribution Comparison', 'Position', [100, 100, 900, 600]);
    barData = [percOrig; percEnc]';  % 8 x 2 matrix
    b = bar(barData, 'grouped');
    
    % Colors: Blue for original, Red for encrypted
    b(1).FaceColor = [0.2 0.6 1];
    b(2).FaceColor = [1 0.3 0.3];
    
    % Labels and styling
    set(gca, 'XTickLabel', {'Bit 0 (LSB)', 'Bit 1', 'Bit 2', 'Bit 3', ...
                            'Bit 4', 'Bit 5', 'Bit 6', 'Bit 7 (MSB)'}, 'FontSize', 12);
    ylabel('Percentage of 1s (%)', 'FontSize', 14);
    title('Bit Distribution Comparison: Original vs Encrypted Image', 'FontSize', 16);
    ylim([0 100]);
    grid on;
    
    % Legend
    legend({'Original Image', 'Encrypted Image'}, 'Location', 'northeastoutside', 'FontSize', 12);
    
    % Ideal 50% line
    hold on;
    plot([0.5 8.5], [50 50], 'k--', 'LineWidth', 2);
    text(8.3, 52, 'Ideal = 50%', 'FontSize', 12, 'FontWeight', 'bold');
    hold off;
    
    % Add exact values on bars (optional, uncomment if needed)
    % for i = 1:8
    %     text(i-0.2, percOrig(i)+2, sprintf('%.2f', percOrig(i)), 'HorizontalAlignment','center');
    %     text(i+0.2, percEnc(i)+2, sprintf('%.2f', percEnc(i)), 'HorizontalAlignment','center');
    % end

    % Save high-resolution figure
    saveas(gcf, 'bit_distribution_comparison.png');
    print('-dpng', '-r300', 'bit_distribution_comparison_highres.png');  % 300 DPI
    disp('Bit distribution graph saved as bit_distribution_comparison.png and high-res version');
end

function percentages = calculateBitDistribution(imagePath)
    img = imread(imagePath);
    
    % Convert to grayscale
    if size(img, 3) == 3
        img = rgb2gray(img);
    end
    
    % Ensure uint8
    img = uint8(img);
    
    totalPixels = numel(img);
    oneCounts = zeros(1,8);
    
    for bit = 0:7
        % Extract bit plane
        bitPlane = bitand(img, 2^bit) > 0;
        oneCounts(bit+1) = sum(bitPlane(:));
    end
    
    percentages = (oneCounts / totalPixels) * 100;
end