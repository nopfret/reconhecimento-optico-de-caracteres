clear;
clc;
close all;

%% Funções da biblioteca Machine Vision

% lê imagem
I = imread('sharks.png');


%% Filtragem por área
f = iblobs(I, 'area', [0 10000]);

%% Filtragem por 'touch'
f = iblobs(I, 'touch', 0);

%% Filtragem
f = iblobs(I, 'area', [0 10000], 'touch', 0, 'class', 1);