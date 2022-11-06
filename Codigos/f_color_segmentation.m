%% Funções auxiliares
function mascara = f_color_segmentation(imagem, cor, limiar)
    
    imagem = im2double(imagem);
    cor = double(cor)/255;

    % converte para o espaço de cor Lab
    ILab = rgb2lab(imagem);

    IL = ILab(:,:,1);
    Ia = ILab(:,:,2);
    Ib = ILab(:,:,3);

    cor = rgb2lab(cor);
    
    % Imagem de distância
    D = sqrt((IL - cor(1)).^2 + (Ia - cor(2)).^2 + (Ib-cor(3)).^2);

    mascara = (D < limiar);
end