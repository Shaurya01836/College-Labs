i = imread("RGB.jpg");
subplot(2,2,1);
imshow(i);
title("Original image");

r = i(:,:,1);
subplot(2,2,2);
imshow(r);
title("Red channel");

g = i(:,:,2);
subplot(2,2,3);
imshow(g);
title("Green channel");

b = i(:,:,3);
subplot(2,2,4);
imshow(b);
title("Blue channel");
