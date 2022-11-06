clear;
clc;
close all;

%% Funções da biblioteca Machine Vision

% lê imagem
I = imread('sharks.png');
[IL, N] = ilabel(I);

% seleciona região
I2 = IL == 1;

%% Momentos
m00 = mpq(I2,0,0);
m10 = mpq(I2,1,0);
m01 = mpq(I2,0,1);

%% Momentos centrais
u20 = upq(I2,2,0);
u02 = upq(I2,0,2);
u11 = upq(I2,1,1);

%% 
f = imoments(I2);

f.moments