clear;
clc;
close all;

I = imread('sharks.png');
figure; imshow(I);

[IL, ~] = bwlabel(I);
I2 = IL == 4;
figure; imshow(I2);

[u,v] = f_pixels_of_edge(I2);

hold on;
plot(u, v, 'b');

% cálculo do perímetro
N = numel(u);
perimetro = sqrt((v(N)-v(1))^2 + (u(N)-u(1))^2);

for k = 1:N-1
   distancia = sqrt((v(k)-v(k+1))^2 + (u(k)-u(k+1))^2);
   perimetro = perimetro + distancia;
end

fprintf('Perimetro: %.2f\n', perimetro);