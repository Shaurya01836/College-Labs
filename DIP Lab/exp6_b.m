i = imread('red.jpg');
j = rgb2gray(i);
[r,c] = size(j);
h = zeros(1,256);

for a = 1:r
    for b=1:r
        t = j(a,b);
        h(t+1) = h(t+1)+1;
    end
end

disp(h);
bar(h);

subplot(2,2,1);
imshow(i);
title('RGB image');

subplot(2,2,2);
imshow(j);
title('Gray image');


subplot(2,2,3);
imhist(j);
title('Histogram using imhist');

subplot(2,2,4);
bar(h , "b");
title("Histogram calculated");










    