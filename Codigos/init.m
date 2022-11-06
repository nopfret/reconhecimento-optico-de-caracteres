function out = init()
cd ..
cd banco_de_imagens
list=dir('*.png');
image_data=cell(1,length(list));
for j=1:length(list)
image_file=imread(list(j).name);
image_data{j}=image_file;
end
cd ..
cd Codigos\
out = image_data;
end