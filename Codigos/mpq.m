function out = mpq(I,p,q)

if (p == 0 && q == 0)
    out00 = 0;
   [u,v]=size(I);
for i = 1:u;
    for j = 1:v
   if I(i,j) == 1
       out00 = out00 +1;
   end
    end
end
out = out00;
end

if (p == 0 && q == 1)
    out01 = 0;
   [u,v]=size(I);
for i = 1:u;
    for j = 1:v
   if I(i,j) == 1
     out01 = out01 + i*I(i,j);
   end
    end
end
out = out01;
end

if (p == 1 && q == 0)
    out10 = 0;
   [u,v]=size(I);
for i = 1:u;
    for j = 1:v
   if I(i,j) == 1
     out10 = out10 + j*I(i,j);
   end
    end
end
out = out10;
end

end
