clear;
clc;
%close all;

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

% area
m00 = f_mpq(I2,0,0);

% circularidade
rho = 4*pi*m00/(perimetro^2);

fprintf('Circularidade: %.2f\n', rho);

% curvas de disttância e ângulo
m10 = f_mpq(I2,1,0);
m01 = f_mpq(I2,0,1);

uc = m10/m00;
vc = m01/m00;
[curva_distancia, curva_angulo] = f_shape_from_edge(u,v,uc,vc);

figure; 
subplot(1,2,1), plot(curva_distancia); title('Curva de distância');
subplot(1,2,2), plot(curva_angulo); title('Curva de ângulo');
