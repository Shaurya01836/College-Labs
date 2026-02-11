I = imread('red.jpg');
J = rgb2gray(I);

[r,c] = size(J);
s=r*c;

h = zeros(1,256);
z= zeros(1,300);

for i = 1 :r
    for j = 1:c
        t = J(i,j);
    h(t+1) = h(t+1) + 1;
    end
end

pdf = h/s;
cdf(1) = pdf(1);

for i = 2:256
    cdf(i) = cdf(i-1) + pdf(i);
end


new = round(cdf * 256);
new = new + 1 ; 

for i = 1 :r
    for j = 1: c
        temp = J(i,j);
        b(i,j) = new(temp + 1);
        t = b(i,j);
        z(t) = z(t) + 1; 
    end
end

b = b -1 ; 
        
        
subplot(2,2,1);
imshow(J);
title("Gray image");
        

subplot(2,2,2);
bar(h , "b");
title("Histogram calculated");


subplot(2,2,3);
imshow(uint8(b));
title("Enhanced image calcualtion");


subplot(2,2,4);
bar(z , "b");
title("Histogram calculated for enhanced image");







        
        
        
        
        





