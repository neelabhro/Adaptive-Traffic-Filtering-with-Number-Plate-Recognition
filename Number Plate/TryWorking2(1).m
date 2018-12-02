clc
clear all
close all
FINDCHARATTHISPOS = input('CHAR AT THIS POS - ');
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
            TempArray = [TempArray, i];
        end
    else
        result = find(Column == 1);
        if (size(result, 1) == size(BW, 1))
            FindElement = 0;
            TempArray = [TempArray, i];
            Chars = [Chars; TempArray];
            TempArray = [];
        end
    end
end
CharImg = [];
for i = 1:size(Chars, 1)
    Points = Chars(i, :);
    xstart = Points(1);
    xend = Points(2);
    if (xend - xstart < 15)
        continue
    else
        figure, imshow(BW(:, xstart:xend))
    if (i == FINDCHARATTHISPOS)
        CharImg = BW(:, xstart:xend);
    end 
    end
end
CharImg = bwmorph(CharImg, 'clean');
FindElement = 0;
Test = [];
XPoint = [];
Count = 0;
for i = 1:size(CharImg, 1)
    %Count = Count + 1;
    %disp(i)
    Row = CharImg(i , :);
    result = find(Row == 1);
    %size(result, 2)
    Test = [Test, size(result, 2)];
    if (Count == 0)
        if (size(result, 2) ~= size(CharImg, 2))
            Count = 1;
            XPoint = [XPoint, i];
        end
    end
    if (Count == 1)
        if (size(result, 2) == size(CharImg, 2))
            XPoint = [XPoint, i-1]
            Count = 0;
        end
    end
end
CharImg = CharImg(XPoint(size(XPoint, 2) - 1):XPoint(size(XPoint, 2)), :);
imshow(CharImg);
I0 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\0.bmp'));
I1 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\1.bmp'));
I2 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\2.bmp'));
I3 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\3.bmp'));
I4 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\4.bmp'));
I5 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\5.bmp'));
I6 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\6.bmp'));
I7 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\7.bmp'));
I8 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\8.bmp'));
I9 = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\9.bmp'));

IA = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\A.bmp'));
IB = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\B.bmp'));
IC = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\C.bmp'));
ID = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\D.bmp'));
IE = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\E.bmp'));
IF = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\F.bmp'));
IG = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\G.bmp'));
IH = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\H.bmp'));
II = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\I.bmp'));
IJ = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\J.bmp'));
IK = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\K.bmp'));
IL = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\L.bmp'));
IM = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\M.bmp'));
IN = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\N.bmp'));
IO = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\O.bmp'));
IP = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\P.bmp'));
IQ = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\Q.bmp'));
IR = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\R.bmp'));
IS = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\S.bmp'));
IT = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\T.bmp'));
IU = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\U.bmp'));
IV = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\V.bmp'));
IW = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\W.bmp'));
IX = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\X.bmp'));
IY = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\Y.bmp'));
IZ = ~(imread('E:\IIIT Delhi Course\Semester 5\IA - Image Analysis\Number_Plate_Extraction\Number_Plate_Extraction\Z.bmp'));

figure, imshow(I0)
J = imresize(CharImg,[size(I0, 1) size(I0, 2)]);
figure, imshow(J)
I = I0;
I(:, :, 2) = I1;
I(:, :, 3) = I2;
I(:, :, 4) = I3;
I(:, :, 5) = I4;
I(:, :, 6) = I5;
I(:, :, 7) = I6;
I(:, :, 8) = I7;
I(:, :, 9) = I8;
I(:, :, 10) = I9;

I(:, :, 11) = IA;
I(:, :, 12) = IB;
I(:, :, 13) = IC;
I(:, :, 14) = ID;
I(:, :, 15) = IE;
I(:, :, 16) = IF;
I(:, :, 17) = IG;
I(:, :, 18) = IH;
I(:, :, 19) = II;
I(:, :, 20) = IJ;
I(:, :, 21) = IK;
I(:, :, 22) = IL;
I(:, :, 23) = IM;
I(:, :, 24) = IN;
I(:, :, 25) = IO;
I(:, :, 26) = IP;
I(:, :, 27) = IQ;
I(:, :, 28) = IR;
I(:, :, 29) = IS;
I(:, :, 30) = IT;
I(:, :, 31) = IU;
I(:, :, 32) = IV;
I(:, :, 33) = IW;
I(:, :, 34) = IX;
I(:, :, 35) = IY;
I(:, :, 36) = IZ;

Max = 0;
Element = -1;
for i = 1:36
    M = I(:, :, i);
    CheckImg = (J == M);
    Check1 = find(CheckImg == 1);
    Size = size(Check1, 1);
    if (Size > Max)
        Max = Size;
        Element = i-1;
    end
end
disp(Element)