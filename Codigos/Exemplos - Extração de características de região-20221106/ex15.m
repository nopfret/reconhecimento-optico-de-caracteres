clear;
clc;
close all;

%% Funções da biblioteca Machine Vision

% lê imagem
I = imread('multiblobs.png');
[IL, N] = ilabel(I);

figure; imagesc(IL);

%% obtém informações sobre todas regiões da imagem
f = iblobs(I);

figure; imshow(I);
f(1).plot_box('g');
f(1).children