function escreve(I)
  %I = I2{4};

scale = 50;

% I = imread('etiqueta_1.png');
cd ..
cd banco_de_imagens
a = imread('templates_letras.png');
cd ..
cd Codigos  
a = convert2binary(a);
% I = convert2binary(I);
I = rgb2gray(I);
L = graythresh(I);
I = (I <= L+0.2);


% imshow(ima);
% imshow(I);

[L1, l1] = bwlabel(I);




[L1, l1] = bwlabel(I);
for i= 2:l1
b{i-1}=(L1==i);
end

ima = zeros(size(I));

for i= 2:l1-2
ima = ima + b{i};
end

[letras, qtas] = bwlabel(ima);

for i = 1:qtas
[v,u]=find(ima);

umax = max(u);
umin = min(u);
vmax = max(v);
vmin = min(v);
end

for i = 1:3
[v,u]=find(letras==i);

ub1max = max(u);
ub1min = min(u);
vb1max = max(v);
vb1min = min(v);

linha{i} = imcrop(I,[ub1min   vb1min   (umax-ub1min)   (vb1max-vb1min)]);
end

[Linha1, let1] = bwlabel(linha{1});

for i = 1:let1
   let{i} = (Linha1==i);
   let{i} = cut(let{i});
   let{i} = imresize(let{i}, [scale,scale]);
end
 let{7}=[];
 let{8}=[];
 for i =  7:let1-2
     let{i}= let{i+2};
 end
     
[Linha2, let2] = bwlabel(linha{2});

for i = 1:let2
   let22{i} = (Linha2==i);
   let22{i} = cut(let22{i});
   let22{i} = imresize(let22{i}, [scale,scale]);
end
let22{8}=[];
 let22{9}=[];
 for i =  8:let2-2
     let22{i}= let22{i+2};
 end

[Linha3, let3] = bwlabel(linha{3});

for i = 1:let3
   let33{i} = (Linha3==i);
   let33{i} = cut(let33{i});
   let33{i} = imresize(let33{i}, [scale,scale]);
end
let33{8}=[];
 let33{9}=[];
 for i =  8:let3-2
     let33{i}= let33{i+2};
 end



[L2, l2] = bwlabel(a);

tmp{1} = L2==1;   %A
tmp{2} = L2==5;   %B 
tmp{3} = L2==10;  %C 
tmp{4} = L2==14;  %D
tmp{5} = L2==18;  %E
tmp{6} = L2==22;  %F
tmp{7} = L2==25;  %G
tmp{8} = L2==3;   %H
tmp{9}  = L2==7;  %I
tmp{10} = L2==9;  %J
tmp{11} = L2==13; %K
tmp{12} = L2==17; %L
tmp{13} = L2==21; %M
tmp{14} = L2==24; %N
tmp{15} = L2==2;  %O
tmp{16} = L2==6;  %P
tmp{17} = L2==11; %Q
tmp{18} = L2==15; %R
tmp{19} = L2==19; %S
tmp{20} = L2==23; %T
tmp{21} = L2==4;  %U
tmp{22} = L2==8;  %V
tmp{23} = L2==12; %X
tmp{24} = L2==16; %Z
tmp{25} = L2==20; %W

for i = 1:size(tmp,2)
   tmp{i} = cut(tmp{i});
   tmp{i} = tmp{i};
   tmp{i} = imresize(tmp{i}, [scale,scale]);
end

for x = 1:let1-2
for i = 1:size(tmp,2)
cerr(i) = sum(sum((let{x}-tmp{i}).^2));
cir = max(cerr);
for z = 1:size(cerr,2)
    if (cir>cerr(z))
    cir = cerr(z);
    i= z;
    end
end
end
print(i);
if (x == 6)
    fprintf(': ');
elseif (x ==11 )
    fprintf(' ');
end
end

 fprintf('\n');
 
 for x = 1:let2-2
for i = 1:size(tmp,2)
cerr(i) = sum(sum((let22{x}-tmp{i}).^2));
cir = max(cerr);
for z = 1:size(cerr,2)
    if (cir>cerr(z))
    cir = cerr(z);
    i= z;
    end
end
end
print(i);
if (x == 7)
    fprintf(': ');
elseif (x ==12 )
    fprintf(' ');
end
 end

  fprintf('\n');
 
 for x = 1:let3-2
for i = 1:size(tmp,2)
cerr(i) = sum(sum((let33{x}-tmp{i}).^2));
cir = max(cerr);
for z = 1:size(cerr,2)
    if (cir>cerr(z))
    cir = cerr(z);
    i= z;
    end
end
end
print(i);
if (x == 7)
    fprintf(': ');
end
end

 end





