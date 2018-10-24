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

% When considering 4 Traffic Lights, we assign traffic density there, to be A,B,C,D respectively.
% Assuming total time allotted to the 4 Signals combined is T seconds.
%Traffic density is calculated by taking into account the area in pixels that the cars waiting in front of that particular signal occupy.
% Time allotted to Signal A would be (A*T)/(A+B+C+D) seconds.
% Time allotted to Signal B would be (B*T)/(A+B+C+D) seconds.
% Time allotted to Signal C would be (C*T)/(A+B+C+D) seconds.
% Time allotted to Signal D would be (D*T)/(A+B+C+D) seconds.
