%Neelabhro Roy & Munish Thakral
%Image Analysis Project

clear all;
close all;
clc;

%We are performing 2D Gaussian Filtering (Smoothing) of the image
I = imread('Friends.png');
X = rgb2gray(I);

imshow(I);
title('Input Image');
figure;

imshow(X);
title('Greyscale Image');
figure;

% Threshold image P1.1.png- global threshold
BW = imbinarize(X);

imshow(BW);
title('Binarized Image');
figure;


% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;

B = bwmorph(BW,'clean');
imshow(B);
title('Denoised Image');

%imwrite(B,'filtered1.png')
I_double = im2double(B);
%B_Area = find(I_double==0);
%W_Area = find(I_double==1);

binaryImage = (I_double > 0);
B_Area = sum(~binaryImage(:));
%Calculating the total number of Black Pixels in the image
W_Area = sum(binaryImage(:));
%Calculating the total number of Black Pixels in the image



Density = W_Area / B_Area
%This would roughly give us the proportion of the area, the cars are
%occupying in the image, as after the above operations, they are of pixel
%value 1
