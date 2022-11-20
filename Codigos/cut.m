function Iout = cut(I)
[v,u]=find(I);

umax = max(u);
umin = min(u);
vmax = max(v);
vmin = min(v);

Iout = imcrop(I,[umin   vmin   (umax-umin)   (vmax-vmin)]);
end


