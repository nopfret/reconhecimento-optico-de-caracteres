function [binary] = convert2binary(I) 
     [x, y, z]=size(I);
  
    if z==3
         I=rgb2gray(I);
    end
  
    I=double(I);
    
    sum=0;
    for i=1:x
         for j=1:y
        sum=sum+I(i, j);
     end
     end
   
    
    threshold=sum/(x*y);
    
   
    binary=zeros(x, y);
   
    for i=1:x
     for j=1:y
        if I(i, j) >= threshold
                binary(i, j) = 0;
        else
            binary(i, j)=1;
        end
     end
    end
end