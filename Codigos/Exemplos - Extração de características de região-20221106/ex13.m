clear;
clc;
close all;

%% Fun��es da biblioteca Machine Vision

% l� imagem
I = imread('multiblobs.png');
figure; imshow(I);

% rotulamento
[IL, N, parents, cls] = ilabel(I);

figure; imagesc(IL);

