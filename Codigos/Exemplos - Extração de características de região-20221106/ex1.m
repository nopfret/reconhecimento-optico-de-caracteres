clear;
clc;

I = imread('formas.png');
figure; imshow(I);

% Rotulamento
[Ilabel, N] = bwlabel(I);
I2 = uint8(Ilabel * 255/N);
figure; imshow(I2);

% Obtém bounding boxes dos componentes conectados
I3 = (Ilabel == 3);
figure; imshow(I3);

[v,u] = find(I3);

umin = min(u);
umax = max(u);
vmin = min(v);
vmax = max(v);

hold on;
bb = [umin, vmin, umax, vmax];
f_plot_bb(bb);