clc;
close all;
clear all;

% Read the colour image and convert it to a grey scale image
% Display the original image
mycolourimage = imread('rcb.jpg');
myimage = rgb2gray(mycolourimage);
subplot(3, 3, 1);
imshow(myimage); 
title('Original image');

% Apply Sobel operator
% Display only the horizontal edges
sobelhz = edge(myimage, 'sobel', 'horizontal');
subplot(3, 3, 2);
imshow(sobelhz, []); 
title('Sobel - horizontal edges');

% Apply Sobel operator
% Display only the vertical edges
sobelvrt = edge(myimage, 'sobel', 'vertical');
subplot(3, 3, 3);
imshow(sobelvrt, []); 
title('Sobel - vertical edges');

% Apply Sobel operator
% Display both horizontal and vertical edges
sobelvrthz = edge(myimage, 'sobel', 'both');
subplot(3, 3, 4);
imshow(sobelvrthz, []); 
title('Sobel - all edges');

% Apply Roberts operator
% Display both horizontal and vertical edges
robertsedg = edge(myimage, 'roberts');
subplot(3, 3, 5);
imshow(robertsedg, []); 
title('Roberts - all edges');

% Apply Prewitt operator
% Display both horizontal and vertical edges
prewittedg = edge(myimage, 'prewitt');
subplot(3, 3, 6);
imshow(prewittedg, []); 
title('Prewitt - all edges');

% Apply Laplacian filter
f = fspecial('laplacian');
lapedg = imfilter(myimage, f, 'symmetric');
subplot(3, 3, 7);
imshow(lapedg, []); 
title('Laplacian filter');

% Apply LOG edge detection
% The sigma used is 3
f = fspecial('log', [15, 15], 3.0);
logedg1 = edge(myimage, 'zerocross', [], f);
subplot(3, 3, 8);
imshow(logedg1); 
title('Log with sigma 3');

% Apply Canny edge detection
cannyedg = edge(myimage, 'canny');
subplot(3, 3, 9);
imshow(cannyedg, []); 
title('Canny edge');