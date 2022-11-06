clear;
clc;
close all;

%% Funções da biblioteca Machine Vision

% lê imagem
I = imread('multiblobs.png');
figure; imshow(I);

% rotulamento
[IL, N, parents, cls] = ilabel(I);

figure; imagesc(IL);

