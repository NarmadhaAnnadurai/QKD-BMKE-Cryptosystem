I = imread('/MATLAB Drive/final original image/QRcoderesized.png');
rho_plain = imageCorrelation(I);
fprintf('Correlation of plain image = %.4f\n', rho_plain);

% Suppose you have an encrypted image
C = imread('/MATLAB Drive/Final Encrypted Images/qrcodepermutedbmke_oneencrypted.png');
rho_cipher = imageCorrelation(C);
fprintf('Correlation of cipher image = %.4f\n', rho_cipher);

p = imread('/MATLAB Drive/Final Permuted Images/logopermuted_image.png');
rho_cipher = imageCorrelation(p);
fprintf('Correlation of permuted image = %.4f\n', rho_cipher);

function rho = imageCorrelation(img)
    [M,N] = size(img);
    X = double(img(:,1:N-1));
    Y = double(img(:,2:N));
    X = X(:);  
    Y = Y(:);
    R = corrcoef(X, Y);
    rho = R(1,2);
end