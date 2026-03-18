clc;

myimage = imread('vk.jpg');
u = rgb2gray(myimage);
u = imresize(u, [256 256]);
subplot(4,3,1);
imshow(myimage); title('Original Image');

% Gaussian low-pass filter of sisze 3
gaussmask = fspecial('gaussian', 3);
filtimg = imfilter(u, gaussmask);
subplot(4,3,2);
imshow(filtimg, []), title('Output of gaussian filter 3x3');

%low pass filter of sizee 7x7
avgfilt = [1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;
    1 1 1 1 1 1 1;];

avgfiltmask = avgfilt/sum(avgfilt);
convimg = conv2(double(u), double(avgfiltmask));

subplot(4,3,3);
imshow(convimg, []);
title('Average filter with conv2()');

subplot(4,3,4);

u = imread('vk.jpg');
noisyimg = imnoise(u, 'Salt & Pepper', 0.5);
imshow(noisyimg, []);
title('Noisy Image');
u = rgb2gray(u);

%median filter of size size 3
mymed3img = medfilt2(u, [3,3]);
subplot(4,3,5);
imshow(mymed3img, []), title('Output of 3x3 median filter');

% median filter of size 7
mymed7img = medfilt2(u, [7,7]);
subplot(4,3,6);
imshow(mymed7img, []); title('Output of 7x7 median filter');

% low pass filter
h = [-1 2 1; 1 -3.5 1; -1 2 -1];
hpt3 = conv2(double(u), double(h));
subplot(4,3,7);
imshow(hpt3/100), title('Output of low-pass filter');

% high pass filter
h = [1 -2 -1; -1 5 -1; 1 -2 1];
hpt3 = conv2(double(u), double(h));
subplot(4,3,8);
imshow(hpt3/100), title('Output of high-pass filter');

% Sharpening - user defined mask
h = [-1 -1 -1; -1 9 -1; -1 -1 -1];
hpt3 = conv2(double(u), double(h));
subplot(4,3,9);
imshow(hpt3/100), title('Sharpening - user defined mask');

% unsharp mask filter
h = fspecial('unsharp', 0.3);
hpt3 = imfilter(u, h);
subplot(4,3,10);
imshow(hpt3, []), title('Output of unsharp mask filter');