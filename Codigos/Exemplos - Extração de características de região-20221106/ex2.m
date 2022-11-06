clear;
clc;
close all;

I = imread('formas.png');
[IL, N] = bwlabel(I);

I2 = uint8(IL*255/N);
I3 = ind2rgb(I2,jet(256));
figure; imshow(I3);

% Momentos dos componentes conectados
I4 = (IL == 2);
figure; imshow(I4);

m00 = f_mpq(I4, 0, 0);
m10 = f_mpq(I4, 1, 0);
m01 = f_mpq(I4, 0, 1);

% centroide
uc = m10/m00;
vc = m01/m00;

hold on;
plot(uc, vc, 'b*');