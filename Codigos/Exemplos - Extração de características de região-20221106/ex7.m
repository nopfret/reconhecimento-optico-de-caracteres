clear;
clc;
close all;

I = imread('sharks.png');
figure; imshow(I);

[IL, N] = bwlabel(I);
I2 = IL == 1;
figure; imshow(I2);

[u,v] = f_pixels_of_edge(I2);

hold on;
plot(u, v, 'b');