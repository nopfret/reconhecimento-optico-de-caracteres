function ret = homografia(I)
[U,V] = pontos(I);
Io = I;

U1 = [29.5000  791.4321  791.4321   27.5679];
V1 = [27.5000   25.5679  345.4321  345.4321]; 

U1 = U1.';
V1 = V1.';
U = U.';
V = V.';


h = zeros(4);
A = [ 
    U(1,1) V(1,1) 1 0 0 0 -U(1,1)*U1(1,1) -V(1,1)*U1(1,1);
    0 0 0 U(1,1) V(1,1) 1 -U(1,1)*V1(1,1) -V(1,1)*V1(1,1);
    U(2,1) V(2,1) 1 0 0 0 -U(2,1)*U1(2,1) -V(2,1)*U1(2,1);
    0 0 0 U(2,1) V(2,1) 1 -U(2,1)*V1(2,1) -V(2,1)*V1(2,1);
    U(3,1) V(3,1) 1 0 0 0 -U(3,1)*U1(3,1) -V(3,1)*U1(3,1);
    0 0 0 U(3,1) V(3,1) 1 -U(3,1)*V1(3,1) -V(3,1)*V1(3,1);
    U(4,1) V(4,1) 1 0 0 0 -U(4,1)*U1(4,1) -V(4,1)*U1(4,1);
    0 0 0 U(4,1) V(4,1) 1 -U(4,1)*V1(4,1) -V(4,1)*V1(4,1)
];


b = [U1(1,1) V1(1,1) U1(2,1) V1(2,1) U1(3,1) V1(3,1) U1(4,1) V1(4,1)];
h1 = inv(A)*b.';

h = [
h1(1,1) h1(2,1) h1(3,1);
h1(4,1) h1(5,1) h1(6,1);
h1(7,1) h1(8,1) 1;
];

tform  = projective2d(h.');
[I2,ref] = imwarp(Io,tform);
I2 = double(I2)/255;
I = I2;
%imshow(I2);
% [U,V] = pontos(I2);
% I2 = I2([round(V(1)):round(V(3))],[round(U(1)):round(U(2))],:);
ret = I2;
end