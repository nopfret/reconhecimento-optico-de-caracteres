clc
clear all
close all

%% carrega imagens

Im = init();
I2 = cell(size(Im));

for i = 1:length(Im)-1
    I = Im{i};
    I2{i} = homografia(I);
end
for i = 1:length(Im)-1
   figure;imshow(I2{i})
end
for i = 1:length(Im)-1
    i
escreve(I2{i})

end


