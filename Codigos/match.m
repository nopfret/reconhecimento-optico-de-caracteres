function [u v] = match(im1,im2)
im1 = b{45};
im2 = a{2};

    base=im1;
    Template=im2;

[r1,c1]=size(base);
[r2,c2]=size(Template);
aux = 9999999999;
M=[];
for i=1:r1-r2
    for j=1:c1-c2
        cerr(i,j) = sum(sum(base([i:i+r2-1],[j:j+c2-1])-Template));
        if cerr(i,j) < aux
            aux = cerr(i,j);
            u = i;
            v = j;
        end
    end
end

end
