u = imread("vk.jpg");
subplot(2,2,1);
imshow(u);
title('Original Image');

oip = rgb2gray(u);
subplot(2,2,2);
imshow(oip);
title('Grayscale Image');

uiop = fft2(oip);
subplot(2,2,3);
imshow(uiop);
title('FFT of Image');

uyiop = ifft2(uiop);
subplot(2,2,4);
imshow(uint8(uyiop));
title('Reconstructed Image (IFFT)');
