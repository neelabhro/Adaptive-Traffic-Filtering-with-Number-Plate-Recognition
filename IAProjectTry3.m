clc
close all
clear all
P1 = imread('C:\Users\thakr\Pictures\Screenshots\P1.1.png');
figure, imshow(P1), title('ORIGINAL IMAGE')
P2 = rgb2gray(P1);
figure, imshow(P2), title('GRAYSCALE IMAGE')
P3 = im2bw(P2, 137 / 255 );
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