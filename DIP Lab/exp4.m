I = imread('symbol1.jpg');
J = imread('symbol2.jpg');

% Resize
R = imresize(I , [256,256]);
M = imresize(J , [256,256]);

% Grayscale
R_gray = im2gray(R);
M_gray = im2gray(M);

% Binary
A = imbinarize(R_gray);
figure;
imshow(A);
title('Binary image 1');

B = imbinarize(M_gray);
figure;
imshow(B);
title('Binary image 2');

% NOT operation
A_not = ~A;
figure;
imshow(A_not);
title('NOT of Binary image 1');

B_not = ~B;
figure;
imshow(B_not);
title('NOT of Binary image 2');

% AND operation
AND = A & B ; 
figure;
imshow(AND);
title("AND operation");


% OR operation
OR = A | B ; 
figure;
imshow(OR);
title("OR operation");

% XOR operation
XOR = xor(A,B) ; 
figure;
imshow(XOR);
title("XOR operation");

