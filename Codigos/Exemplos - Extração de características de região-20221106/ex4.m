clear;
clc;

I = imread('text.png');
figure; imshow(I);

% limiarização
I2 = I < 128;
figure; imshow(I2);

% operação morfológica de dilatação
S = strel('line', 5, 0);
I3 = imdilate(I2, S);

S = strel('line', 3, 90);
I3 = imdilate(I3, S);
figure; imshow(I3);

% obtem bounding box das regiões
info = f_analisa_regioes(I3);

% apresenta bouding boxes
figure; imshow(I);
f_plot_bbs(info);
