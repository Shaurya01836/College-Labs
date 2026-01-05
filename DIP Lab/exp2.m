clc;
clear;

I=imread('eye.jpg');
figure;
imshow(I);
title('Original image');

% resize 
 R = imresize(I , [256,256]);
 figure;
 imshow(R);
 title('Resize image');

% sharpening
 Sh= imresize(I , 50);
 figure;
 imshow(Sh);
 title('Resize image by 50');

% smoothning
 sm = imresize(I , 0.5);
 figure;
 imshow(sm);
  title('Resize image by 0.5');

% rotate
 rot=imrotate(I,60);
 figure;
 imshow(rot);
 title('Rotate image by 60'); 
 
 
% translate
 trans=imtranslate(I, [50,50]);
 figure;
 imshow(trans);
  title('Translate image by [50,50]'); 

% crop
cr = imcrop(I , [200,200,200,200]);
figure;
imshow(cr);
title('Croped image');