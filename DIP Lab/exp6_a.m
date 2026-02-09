i= imread('vk.jpg');
i = rgb2gray(i);
subplot(2,2,1);
imshow(i);
title("Original image");

subplot(2,2,2);
imhist(i) ; 
title("Histogram of original");

j = histeq(i);
subplot(2,2,3);
imshow(j) ; 
title("Histogram eq image");

subplot(2,2,4);
imhist(j) ; 
title("Histogram equivalent");

