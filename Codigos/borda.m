function [u,v] = borda(I)
I2 = I;
[u1,v1]=find(I2);

umin = min(u1);
vmin = min(v1);
aux = I2(umin,vmin);
while(aux ~= 1)
   vmin = vmin +1;
   aux = I2(umin,vmin);
end

u = umin;
v = vmin;
vaux = 0;
r1 = u;
uaux = 0;
r2 = v;
e = 1;

a1 = I(umin,vmin-1);
a2 = I(umin-1,vmin-1);
a3 = I(umin-1,vmin);
a4 = I(umin-1,vmin+1);
a5 = I(umin,vmin+1);
a6 = I(umin+1,vmin+1);
a7 = I(umin+1,vmin);
a8 = I(umin+1,vmin-1);
b = [a1 a2 a3 a4 a5 a6 a7 a8 a1 a2 a3 a4 a5 a6 a7 a8];

i = 1;
 while(true) 
     if i == 0
         i = 1;
     end

e = e + 1;

while(b(i)~=1)
    i = i + 1;
    if (i > (size(b,2)))
    i = 1;
    end
end

switch i
    case (1 )
      i = i-1;
      uaux = umin;
      vaux = vmin-1;
    case (2 )
        
        i = i-1;
        uaux = umin-1;
        vaux = vmin-1;
    case (3)
        i = i-1;
       uaux = umin-1;
       vaux = vmin;
    case (4)
        i = i-1;
        uaux = umin-1;
        vaux = vmin+1;
    case (5)
        i = i-1;
        uaux = umin;
        vaux = vmin+1;
    case (6 )
        i = i-1;
       uaux = umin+1;
       vaux = vmin+1;
    case (7)
        i=i-1;
        uaux = umin+1;
        vaux = vmin;
    case (8)
        i=i-1;
        uaux = umin+1;
        vaux = vmin-1;
        
    case (9 )
         i = i-1;
      uaux = umin;
      vaux = vmin-1;
    case (10)
        
        i = i-1;
        uaux = umin-1;
        vaux = vmin-1;
    case (11)
        i = i-1;
       uaux = umin-1;
       vaux = vmin;
    case (12)
        i = i-1;
        uaux = umin-1;
        vaux = vmin+1;
    case (13)
        i = i-1;
        uaux = umin;
        vaux = vmin+1;
    case (14 )
        i = i-1;
       uaux = umin+1;
       vaux = vmin+1;
    case (15)
        i=i-1;
        uaux = umin+1;
        vaux = vmin;
    case (16)
        i=i-1;
        uaux = umin+1;
        vaux = vmin-1;
end
u(e)=uaux; 
v(e)=vaux;
umin=uaux;
vmin=vaux;

a1 = I(umin,vmin-1);
a2 = I(umin-1,vmin-1);
a3 = I(umin-1,vmin);
a4 = I(umin-1,vmin+1);
a5 = I(umin,vmin+1);
a6 = I(umin+1,vmin+1);
a7 = I(umin+1,vmin);
a8 = I(umin+1,vmin-1);

b = [a1 a2 a3 a4 a5 a6 a7 a8 a1 a2 a3 a4 a5 a6 a7 a8];
    if(u(e) == r1 && v(e) == r2)
        break;
    end
 end
u1 = v;
v = u;
u = u1;
end
