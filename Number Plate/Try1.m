clc
clear all
f=rgb2gray(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\carplate4.jpg'));
BW = imbinarize(f, 0.3);
figure, imshow(f)
% X - 23 to 600
% Y - 149 to 306
%XStart = input('Start of X - ')
BW = BW(100:199,37:427 );
figure, imshow(BW)
Column = [];
%Count = 0;
L = [];
Chars = [];
FindElement = 0;
X = 0;
TempArray = [];
for i = 1:size(BW, 2)
    %Count = Count + 1;
    %disp(i)
    Column = BW(:, i);
    if (FindElement == 0)
        result = find(Column == 0);
        if (size(result, 1) ~= 0)
            FindElement = 1;
            TempArray = [TempArray, i-1];
        end
    else
        result = find(Column == 1);
        if (size(result, 1) == size(BW, 1))
            FindElement = 0;
            TempArray = [TempArray, i-1];
            Chars = [Chars; TempArray];
            TempArray = [];
        end
    end
end
for i = 1:size(Chars, 1)
    Points = Chars(i, :);
    xstart = Points(1);
    xend = Points(2);
    if (xend - xstart < 15)
        continue
    else
        figure, imshow(BW(:, xstart:xend))
    end
end