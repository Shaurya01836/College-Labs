I = imread('tota.jpg');
figure ; 
imshow(I);
title("Original image");

figure ; 
improfile(I , [20,30], [50,100]);
title("Profile of original image");

G = rgb2gray(I) ;
figure ; 
imshow(G);
title("Gray image");

figure ; 
improfile(G , [20,30], [50,100]);
title("Profile of Gray image");


M = rgb2hsv(I);
figure ; 
imshow(M);
title("HSV image");

figure ; 
improfile(M , [20,30], [50,100]);
title("Profile of HSV image");


S = im2bw(I);
figure ; 
imshow(M);
title("Binary image");

figure ; 
improfile(S , [20,30], [50,100]);
title("Profile of Binary image");
