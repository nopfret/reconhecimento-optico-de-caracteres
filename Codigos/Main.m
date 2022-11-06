clc
clear all
close all

%% carrega imagens

Im = init();

I = Im{1};

I = f_color_segmentation(I,[120,180,106],0.5);

homografia(I);


