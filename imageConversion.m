%Neelabhro Roy

clear all;
close all;
clc;

%We are performing 2D Gaussian Filtering (Smoothing) of the image
I = imread('Friends.png');
X = rgb2gray(I);

imshow(I);
figure;

imshow(X);
figure;

% Threshold image P1.1.png- global threshold
BW = imbinarize(X);

imshow(BW);
figure;


% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;

B = bwmorph(BW,'clean');
imshow(B);
