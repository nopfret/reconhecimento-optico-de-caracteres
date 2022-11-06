clear;
clc;
close all;

%% Fun��es da biblioteca Machine Vision

% l� imagem
I = imread('multiblobs.png');
[IL, N] = ilabel(I);

figure; imagesc(IL);

%% obt�m informa��es sobre todas regi�es da imagem
f = iblobs(I);

figure; imshow(I);
f(1).plot_box('g');
f(1).children