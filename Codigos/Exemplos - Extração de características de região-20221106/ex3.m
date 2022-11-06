clear;
clc;
close all;

clear;
clc;
close all;

I = imread('formas.png');
[IL, N] = bwlabel(I);

info = f_analisa_regioes(IL);

figure; imshow(I);
f_plot_bbs(info);
f_plot_centroides(info);