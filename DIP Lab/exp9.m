i = imread("RCB.jpg");
i = imresize(i,[256,256], 'bilinear');
g = rgb2gray(i);

subplot(3,3,1);
imshow(i);
title("Original Image");

% Salt & Pepper on grayscale
salt = imnoise(g, "salt & pepper", 0.02);
subplot(3,3,2);
imshow(salt);
title("Salt-and-pepper");

% Uniform Noise (replaced Gaussian imnoise)
uniform_noise = rand(256,256) * 50;
uniform_img = double(g) + uniform_noise;
subplot(3,3,3);
imshow(uniform_img, []);
title("Uniform Noise Image");

mynoise = 6+sqrt(225)*randn(256,256);
subplot(3,3,4);
imshow(mynoise, []);
title("Generated Gaussian noise");

subplot(3,3,5);
mynoise_img = double(g)+mynoise;
imshow(mynoise_img, []);
title("Gaussian image - mean 6 and variance 225");

subplot(3,3,6);
[x,y] = meshgrid(1:256, 1:256);
mysinusoidalnoise = 15*sin(2*pi/14*x+2*pi/14*y);
mynoise_img1 = double(g) + mysinusoidalnoise;
imshow(mynoise_img1, []);
title("Generated sinusoidal noise");

% Rayleigh Noise
rayleigh_noise = sqrt(-2*log(1-rand(256,256))) * 20;
rayleigh_img = double(g) + rayleigh_noise;
subplot(3,3,7);
imshow(rayleigh_img, []);
title("Rayleigh Noise Image");

% Exponential Noise
exp_noise = -log(1-rand(256,256)) * 20;
exp_img = double(g) + exp_noise;
subplot(3,3,8);
imshow(exp_img, []);
title("Exponential Noise Image");

% Gamma Noise
gamma_noise = gamrnd(2, 10, [256 256]);
gamma_img = double(g) + gamma_noise;
subplot(3,3,9);
imshow(gamma_img, []);
title("Gamma Noise Image");