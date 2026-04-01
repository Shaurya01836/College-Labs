clc; clear all; close all;

% Read image
I = imread('rv.jpg');
imshow(I); title('Original Image');

% Convert to grayscale
Igray = rgb2gray(I);

% Convert to binary (adjust threshold if needed)
BW = imbinarize(Igray);

% Show binary image
figure; imshow(BW); title('Binary Image');

% Morphological operations
BW2 = bwmorph(BW,'remove');
figure; imshow(BW2); title('Remove Operation');

BW3 = bwmorph(BW,'skel',Inf);
figure; imshow(BW3); title('Skeleton Operation');
