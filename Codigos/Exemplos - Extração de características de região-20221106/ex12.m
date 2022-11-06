clear;
clc;
close all;

I = imread('sharks.png');
figure; imshow(I);

info = f_analisa_regioes(I);

d1 = info{1}.curva_distancia;
d2 = info{2}.curva_distancia;
figure; plot(d1, 'k'); hold on; plot(d2);

similiridade = f_compute_match(d1, d2)

