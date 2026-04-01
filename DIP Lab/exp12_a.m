
%(a) erosion

clc;
clear all;
close all;
po=imgetfile;
I = imread(po);
originalBW = I; 
se = strel('disk',11); 
erodedBW = imerode(originalBW,se);
imshow(originalBW), figure, imshow(erodedBW)
