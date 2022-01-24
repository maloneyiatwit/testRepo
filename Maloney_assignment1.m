%Assignment 1
%Ian Maloney
%Image Processing 
%1/19/22

clc; 
close all; 
clear all;

%Part 1

A = imread("peppers.bmp");
figure;

imshow(A);
title("Figure 1 : RGB Original Image");
disp(A);

pause;

%Part 2

B = rgb2gray(A);
TB = transpose(B);

figure;
subplot(1,2,1);
imshow(B);
subplot(1,2,2);
imshow(TB);

disp("Max:" + max(max(B)));
disp("Min:" + min(min(B)));
disp("Mean:" + mean(mean(B)));
disp("Median:" + median(median(B)));

pause;

%Part 3

B = im2double(B);
C = (B - min(min(B)) ./max(max(B)) - min(min(B)));

figure;
imshow(C);
title("Fig. 3 Normalized Gray Scale Image");
disp(C);

%Part 4

D1 = imadjust(C,[],[],0.25);
D2 = imadjust(C,[],[],1.25);

figure;
subplot(2,1,1);
imshow(D1);
title("Gamma = .25");

subplot(2,1,2);
imshow(D2);
title("Gamma = 1.25");


disp("The 0.25 gamma adjustment made the image lighter, while the 1.25 gamma adjustment made it darker");

imwrite(D2,"Ian_D2.jpg");

pause;

%Part 5

[m,n,z] = size(C);

bw1 = zeros(m,n);

for i = 1:m
    for j = 1:n
        if C(i,j) >= 0.3
            bw1(i,j) = 1;
        end
    end
end

bw2 = im2bw(C,0.3);

if bw1 == bw2
    disp("My method worked");
else
    disp("My method did not work");
end

figure;
subplot(1,2,1);
imshow(bw1);
title("My Method");
subplot(1,2,2);
imshow(bw2);
title("Matlab Method");

pause;

% Part 6
close all; 
clear all;

pause;

%Part 7

%output = (reduceGrayScaleFunc(C));

function [output] = reduceGrayScaleFunc(input)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n,z] = size(input);

output = zeros(m,n);
for i = 1:m
    for j = 1:n
        output(i,j) = (input(i,j)/4);
    end
end

end



