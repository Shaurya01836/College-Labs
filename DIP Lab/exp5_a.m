i = imread("RGB.jpg");
subplot(2,2,1);
imshow(i);

r = i(:,:,1);
subplot(2,2,2);
imshow(r);

g = i(:,:,2);
subplot(2,2,3);
imshow(g);

b = i(:,:,3);
subplot(2,2,4);
imshow(b);
