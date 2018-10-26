clc
close all
clear all


P0 = rgb2gray(imread('C:\Users\thakr\Pictures\Screenshots\P1.1.4.png'));
P1 = imread('C:\Users\thakr\Pictures\Screenshots\P1.1.png');

figure, imshow(P1), title('ORIGINAL IMAGE')

P2 = rgb2gray(P1);
figure;
imshow(P2), title('GRAYSCALE IMAGE')

P3 = im2bw(P2, 137 / 255 );
P03 = im2bw(P0, 137 / 255 );
P3 = P3 - P03;


figure, imshow(P3), title('BINARY IMAGE')
[~, threshold] = edge(P3, 'sobel');
%fudgeFactor = .5;
%P1 = imclearborder(P1);


P4 = edge(P3,'sobel', threshold);
figure, imshow(P4), title('SOBEL IMAGE')


P5 = imclearborder(P4);
figure, imshow(P5), title('BORDER CLEAR IMAGE')
[M, N] = size(P5);

P6 = P5(320:M, 1125:N);
figure, imshow(P6), title('PROCESSED IMAGE')
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);

P7 = imdilate(P6, [se90 se0]);
figure, imshow(P7), title('DILATED GRADIENT MASK');


P8 = imfill(P7, 'holes');
figure, imshow(P8), title('FILLED IMAGE')

P9 = imread('C:\Users\thakr\Pictures\Screenshots\P1.1.4.png');
figure, imshow(P9), title('ORIGINAL IMAGE')


P10 = rgb2gray(P9);
P11 = im2bw(P10, 137 / 255 );
[~, threshold] = edge(P11, 'sobel');
%fudgeFactor = .5;
%P1 = imclearborder(P1);


P12 = edge(P11,'sobel', threshold);
P13 = imclearborder(P12);
[M, N] = size(P13);


P14 = P13(320:M, 1125:N);
figure, imshow(P14), title('PROCESSED IMAGE')

se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);


P15 = imdilate(P14, [se90 se0]);
figure, imshow(P15), title('DILATED GRADIENT MASK');
P16 = imfill(P15, 'holes');

figure, imshow(P16), title('FILLED IMAGE')
figure, imshow(P8-P16);


I_double = im2double(P16);
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
