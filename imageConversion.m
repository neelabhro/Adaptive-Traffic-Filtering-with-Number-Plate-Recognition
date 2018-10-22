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



% When considering 4 Traffic Lights, we assign traffic density there, to be A,B,C,D respectively.
% Assuming total time allotted to the 4 Signals combined is T seconds.
%Traffic density is calculated by taking into account the area in pixels that the cars waiting in front of that particular signal occupy
% Time allotted to Signal A would be (A*T)/(A+B+C+D) seconds.
% Time allotted to Signal B would be (B*T)/(A+B+C+D) seconds.
% Time allotted to Signal C would be (C*T)/(A+B+C+D) seconds.
% Time allotted to Signal D would be (D*T)/(A+B+C+D) seconds.
