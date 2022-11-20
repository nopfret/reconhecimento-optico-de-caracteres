%% LImpeza
close all
clear 
clc

%% abre imagem
cd ..
cd banco_de_imagens
I = imread('etiqueta_8.png  ');
I2 = double(I)/255;

f1 = figure;
imshow(I2);axis on;

%% imagem original
U = zeros(4,1); V = zeros(4,1);

[U(1,1),V(1,1)] = ginput(1);
[U(2,1),V(2,1)] = ginput(1);
hold on
plot(U(1:2,1),V(1:2,1),'r','LineWidth',3)

[U(3,1),V(3,1)] = ginput(1);
plot(U(2:3,1),V(2:3,1),'r','LineWidth',3)
hold on
[U(4,1),V(4,1)] = ginput(1);
plot(U(3:4,1),V(3:4,1),'r','LineWidth',3)
hold on
plot(U([1 4],1),V([1 4],1),'r','LineWidth',3)
hold on

%% posição que deseja
U1 = zeros(4,1); V1 = zeros(4,1);

[U1(1,1),V1(1,1)] = ginput(1);
[U1(2,1),V1(2,1)] = ginput(1);
hold on
plot(U1(1:2,1),V1(1:2,1),'b','LineWidth',3)

[U1(3,1),V1(3,1)] = ginput(1);
plot(U1(2:3,1),V1(2:3,1),'b','LineWidth',3)
hold on
[U1(4,1),V1(4,1)] = ginput(1);
plot(U1(3:4,1),V1(3:4,1),'b','LineWidth',3)
hold on
plot(U1([1 4],1),V1([1 4],1),'b','LineWidth',3)
hold on

%% processando os dados 

h = zeros(4)


A = [ 
    U(1,1) V(1,1) 1 0 0 0 -U(1,1)*U1(1,1) -V(1,1)*U1(1,1);
    0 0 0 U(1,1) V(1,1) 1 -U(1,1)*V1(1,1) -V(1,1)*V1(1,1);
    U(2,1) V(2,1) 1 0 0 0 -U(2,1)*U1(2,1) -V(2,1)*U1(2,1);
    0 0 0 U(2,1) V(2,1) 1 -U(2,1)*V1(2,1) -V(2,1)*V1(2,1);
    U(3,1) V(3,1) 1 0 0 0 -U(3,1)*U1(3,1) -V(3,1)*U1(3,1);
    0 0 0 U(3,1) V(3,1) 1 -U(3,1)*V1(3,1) -V(3,1)*V1(3,1);
    U(4,1) V(4,1) 1 0 0 0 -U(4,1)*U1(4,1) -V(4,1)*U1(4,1);
    0 0 0 U(4,1) V(4,1) 1 -U(4,1)*V1(4,1) -V(4,1)*V1(4,1)
]
b = [U1(1,1) V1(1,1) U1(2,1) V1(2,1) U1(3,1) V1(3,1) U1(4,1) V1(4,1)]
h1 = inv(A)*b.'


h = [
h1(1,1) h1(2,1) h1(3,1);
h1(4,1) h1(5,1) h1(6,1);
h1(7,1) h1(8,1) 1;
]


tform  = projective2d(h.');
[I2,ref] = imwarp(I,tform);

imshow(I2)
















