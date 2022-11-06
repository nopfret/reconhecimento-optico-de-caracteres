clear;
clc;

I = imread('text.png');
figure; imshow(I);

% limiariza��o
I2 = I < 128;
figure; imshow(I2);

% opera��o morfol�gica de dilata��o
S = strel('line', 5, 0);
I3 = imdilate(I2, S);

S = strel('line', 3, 90);
I3 = imdilate(I3, S);
figure; imshow(I3);

% obtem bounding box das regi�es
info = f_analisa_regioes(I3);

% apresenta bouding boxes
figure; imshow(I);
f_plot_bbs(info);
