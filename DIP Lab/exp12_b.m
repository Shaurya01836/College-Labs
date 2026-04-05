%(b) dilation


clc;
clear all;
close all;
po=imgetfile;
I = imread(po);
se = strel('ball',5,5);
I2 = imdilate(I,se);
imshow(I), title('Original')
figure, imshow(I2), title('Dilated')

% Result: We have perform the erosion and dilation operations in an image.