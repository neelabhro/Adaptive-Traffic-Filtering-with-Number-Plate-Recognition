clc
clear all
close all
f=rgb2gray(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\carplate1.jpg'));
BW = imbinarize(f, 0.3);
figure, imshow(BW)
FirstMax = 0;
FirstElement = 0;
SecondMax = 0;
SecondElement = 0;
for i = 1:size(BW, 2)/2
    Column = BW(:, i);
    Zeros = find(Column == 0);
    Size = size(Zeros, 1);
    if ( Size > FirstMax)
        FirstMax = Size;
        FirstElement = i + 5;
    end
end

for i = size(BW, 2)/2 : size(BW, 2)
    Column = BW(:, i);
    Zeros = find(Column == 0);
    Size = size(Zeros, 1);
    if ( Size > SecondMax)
        SecondMax = Size;
        SecondElement = i - 5;
    end
end
figure, imshow(BW(:, FirstElement:SecondElement))
BW = BW(:, FirstElement:SecondElement);
FirstMax = 0;
FirstElement = 0;
SecondMax = 0;
SecondElement = 0;
for i = 1:size(BW, 1)/2
    Row = BW(i, :);
    Zeros = find(Row == 0);
    Size = size(Zeros, 2);
    if ( Size > FirstMax)
        FirstMax = Size;
        FirstElement = i + 5;
    end
end

for i = size(BW, 1)/2 : size(BW, 1)
    Row = BW(i, :);
    Zeros = find(Row == 0);
    Size = size(Zeros, 2);
    if ( Size > SecondMax)
        SecondMax = Size;
        SecondElement = i - 5;
    end
end
figure, imshow(BW(FirstElement:SecondElement, :))
BW = BW(FirstElement:SecondElement, :);
