u = imread("RCB.jpg");
subplot(2,2,1);
imshow(u);
title("Original image");

Hm = fspecial('motion' , 20 , 45);

MotionBlur = imfilter(u , Hm , 'replicate');
subplot(2,2,2);
imshow(MotionBlur);
title("Motion blur");

Hb = fspecial('disk' , 10);
blurred = imfilter(u , Hb , 'replicate');
subplot(2,2,3);
imshow(blurred);
title("Blurred image");

