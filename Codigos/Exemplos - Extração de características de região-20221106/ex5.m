clear;
clc;
close all;

I = imread('formas.png');
[IL, N] = bwlabel(I);

I2 = uint8(IL*255/N);
I3 = ind2rgb(I2,jet(256));
figure; imshow(I3);

% Seleciona componente conectado
I4 = (IL == 3);
figure; imshow(I4);

u20 = f_upq(I4, 2, 0);
u02 = f_upq(I4, 0, 2);
u11 = f_upq(I4, 1, 1);