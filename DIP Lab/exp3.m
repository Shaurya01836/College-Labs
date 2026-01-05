I = imread('eye.jpg');
J = imread('tota.jpg');

K = imfuse(I,J);
figure;
imshow(K);
title("Fused image");


x=imresize(I, [256,256]);
y=imresize(J, [256,256]);
L = imadd(x,y);
figure ;
imshow(L);
title("image after addition");

s=imsubtract(x,y);
figure;
imshow(s);
title("image after subtraction");

m=immultiply(x,y);
figure;
imshow(m);
title("image after multiplication");

d=imdivide(x,y);
figure;
imshow(d);
title("image after divide");