clear;
clc;
close all;

I = imread('formas.png');
[IL, N] = bwlabel(I);

I2 = uint8(IL*255/N);
I3 = ind2rgb(I2,jet(256));
figure; imshow(I3);

% Seleciona componente conectado
I4 = (IL == 1);
figure; imshow(I4);

u20 = f_upq(I4, 2, 0);
u02 = f_upq(I4, 0, 2);
u11 = f_upq(I4, 1, 1);

% matriz de inércia
J = [u20, u11; u11, u02];

% elipse equivalente
m00 = f_mpq(I4, 0, 0);
Je = 4/m00 * J;

% centro da elipse equivalente
m10 = f_mpq(I4, 1, 0);
m01 = f_mpq(I4, 0, 1);
uc = m10/m00;
vc = m01/m00;

plot_ellipse(Je, [uc, vc], 'g');

% métricas
[V, Ld] = eig(Je);
v1 = V(:,1);
v2 = V(:,2);

ld1 = Ld(1,1);
ld2 = Ld(2,2);

a = sqrt(ld1);
b = sqrt(ld2);

r = a/b;
theta = atan(v2(2)/v2(1)) * 180/pi;

fprintf('Menor raio = %.2f\n', a);
fprintf('Maior raio = %.2f\n', b);
fprintf('Excentricidade = %.2f\n', r);
fprintf('Orientação = %.2fº\n', theta);

