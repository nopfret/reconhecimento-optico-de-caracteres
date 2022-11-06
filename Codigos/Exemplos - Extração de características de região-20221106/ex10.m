clear;
clc;
close all;

I = imread('sharks.png');
figure; imshow(I);

[IL, ~] = bwlabel(I);
I2 = IL == 2;
figure; imshow(I2);

[u,v] = f_pixels_of_edge(I2);

hold on;
plot(u, v, 'b');

[u2, v2] = f_interpolation(u,v,400);
hold on;
plot(u2, v2, 'r.');


% curvas de disttância e ângulo
m00 = f_mpq(I2,0,0);
m10 = f_mpq(I2,1,0);
m01 = f_mpq(I2,0,1);

uc = m10/m00;
vc = m01/m00;
[curva_distancia, curva_angulo] = f_shape_from_edge(u2,v2,uc,vc);

figure; 
subplot(1,2,1), plot(curva_distancia); title('Curva de distância');
subplot(1,2,2), plot(curva_angulo); title('Curva de ângulo');
