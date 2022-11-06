clear;
clc;
close all;

%% Fun��es da biblioteca Machine Vision

% l� imagem
I = imread('sharks.png');


%% Filtragem por �rea
f = iblobs(I, 'area', [0 10000]);

%% Filtragem por 'touch'
f = iblobs(I, 'touch', 0);

%% Filtragem
f = iblobs(I, 'area', [0 10000], 'touch', 0, 'class', 1);