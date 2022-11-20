function [U,V]=pontos(I)
Io = I;
I = f_color_segmentation(I,[120,180,106],0.5);

se = strel('disk',3);
I = imclose(I,se);
[IL, laiers] = bwlabel(I);

for i = 1:laiers
    i;
I2 = IL == i;
    
[u,v] = borda(I2);

N = numel(u);
perimetro = sqrt((v(N)-v(1))^2 + (u(N)-u(1))^2);

for k = 1:N-1
   distancia = sqrt((v(k)-v(k+1))^2 + (u(k)-u(k+1))^2);
   perimetro = perimetro + distancia;
end

m00 = mpq(I2,0,0);

rho(i) = 4*pi*m00/(perimetro^2);

end
cir = max(rho);
for z = 1:size(rho,2)
    if (cir>rho(z))
    cir = rho(z);
    i= z;
    end
end



clear u
clear v

for j = 1:laiers
    cam{j} = IL == j;
    m00 = mpq(cam{j},0,0);
    m01 = mpq(cam{j},0,1);
    m10 = mpq(cam{j},1,0);
    uc(j) = m10/m00;
    vc(j) = m01/m00; 
end

for n = 1 : laiers
   d(n) = sqrt((uc(i)-uc(n)).^2+(vc(i)-vc(n)).^2);
end
d1 = d;
n = find(d1);

min = max(d);
for z = 1:size(n,2)
    if (min>d(n(z)))
    min = d(n(z));
    plo= n(z);
    end
end

maxi =0;
for z = 1:size(n,2)
    if (maxi<d(n(z)))
    maxi = d(n(z));
    phi= n(z);
    end
end

for z=1:4
    if(d1(z)~=maxi && d1(z)~=min && d1(z)~=0 )
        second = z;
    end
end




u(1) = (uc(find(~d)));
v(1) = (vc(find(~d)));
u(2)= (uc(second));
v(2)= (vc(second));
u(3)= (uc(phi));
v(3)= (vc(phi));
u(4)= (uc(plo));
v(4)= (vc(plo));
U = [u(1) u(2) u(3) u(4)];
V = [v(1) v(2) v(3) v(4)];
end