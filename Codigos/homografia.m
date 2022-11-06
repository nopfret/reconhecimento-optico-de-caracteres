function homografia(I)
[IL, laiers] = bwlabel(I);
for i = 1:laiers
I2 = IL == i;

[u,v] = borda(I2);

N = numel(u);
perimetro = sqrt((v(N)-v(1))^2 + (u(N)-u(1))^2);

for k = 1:N-1
   distancia = sqrt((v(k)-v(k+1))^2 + (u(k)-u(k+1))^2);
   perimetro = perimetro + distancia;
end

m00 = mpq(I2,0,0);

rho = 4*pi*m00/(perimetro^2);

if(rho < 0.9)
    break
end
end

fprintf('Circularidade: %.2f\n', rho);
end