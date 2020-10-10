%% Objective
%% Plot and visualize the circulant matrix from real-time target image taken from RGB camera

clear all;
clc;
%% 
% Read a sample image and crop parts of the image

srishti_path = 'data/Benchmark/ASrishtialone/img/00180.jpg';
im_rgb = imread(srishti_path);
im_rgb = rgb2gray(im_rgb);

% Create a m x n x k dimention aray from the image crops
% m x n is the size of each individual matrix block a
% k x k is the circulant pattern
I2 = imcrop(im_rgb, 1.0e+03 * [1.0785    0.3605+(0*0.031)    0.0290    0.0290]);
I2(:,:,2) = imcrop(im_rgb, 1.0e+03 * [1.0785    0.3605+(1*0.031)    0.0290    0.0290]);
I2(:,:,3) = imcrop(im_rgb, 1.0e+03 * [1.0785    0.3605+(2*0.031)    0.0290    0.0290]);
I2(:,:,4) = imcrop(im_rgb, 1.0e+03 * [1.0785    0.3605+(3*0.031)    0.0290    0.0290]);

%% 
% Plot the original image with the cropped images to be circularly shifted

figure();
subplot(2,4,2)
imshow(im_rgb)
title('Original Image')

subplot(2,4,5)
imshow(I2(:,:,1))
title('Cropped Image:1')

subplot(2,4,6)
imshow(I2(:,:,2))
title('Cropped Image:4')

subplot(2,4,7)
imshow(I2(:,:,3))
title('Cropped Image:3')

subplot(2,4,8)
imshow(I2(:,:,4))
title('Cropped Image:2')
%% 
% Define the first row of the circulant matrix. Here, $M\;x\;N$  is the size 
% of each individual matrix block and we are making a $K\;x\;K$ circulant pattern

I2_size = size(I2) % siz of the image
M = I2_size(1)
N = I2_size(2)
K = I2_size(3)
%%

A = I2;
% Coefficients for block circulant
Ac = permute(A, [1 3 2]);
Ac = cat(2, Ac(:, 2:K, :), Ac);
% Create the block-circulant matrix using convn
I = reshape(eye(K), [1 K 1 K]);
C = convn(I, Ac);
C = reshape(C(:, K:(2*K-1), :, :), [M*K, N*K]);
disp(C);
figure();
imagesc(C);
% Plot the HOG features of the cropped patch

features.hog_orientations = 9;
cell_size = 4;

for i=1:4
    %HOG features, from Piotr's Toolbox
    x = double(fhog(single(I2(:,:,i)) / 255, cell_size, features.hog_orientations));
    x(:,:,end) = [];  %remove all-zeros channel ("truncation feature")
    im_hog(:,:,i) = x(:,:,31);
end
%% 
% Plot the original image with the cropped images to be circularly shifted

figure();
subplot(2,4,2)
imshow(im_rgb)
title('Original Image')

subplot(2,4,5)
imshow(im_hog(:,:,1))
title('Cropped Image:1')

subplot(2,4,6)
imshow(im_hog(:,:,2))
title('Cropped Image:2')

subplot(2,4,7)
imshow(im_hog(:,:,3))
title('Cropped Image:3')

subplot(2,4,8)
imshow(im_hog(:,:,4))
title('Cropped Image:4')
%%
im_hog_size = size(im_hog) % siz of the image
M = im_hog_size(1)
N = im_hog_size(2)
K = im_hog_size(3)

% Coefficients for block circulant
Ac = permute(im_hog, [1 3 2]);
Ac = cat(2, Ac(:, 2:K, :), Ac);
% Create the block-circulant matrix using convn
I = reshape(eye(K), [1 K 1 K]);
C = convn(I, Ac);
C = reshape(C(:, K:(2*K-1), :, :), [M*K, N*K]);
disp(C);
figure();
imagesc(C)