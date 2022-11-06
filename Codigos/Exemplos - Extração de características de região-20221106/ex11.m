clear;
clc;
close all;

I = imread('sharks.png');
figure; imshow(I);

info = f_analisa_regioes(I);

d1 = info{1}.curva_distancia;
d2 = info{2}.curva_distancia;
figure; plot(d1, 'k'); hold on; plot(d2);

x1 = d1 - mean(d1);
x2 = d2 - mean(d2);
figure; plot(x1, 'k'); hold on; plot(x2);

y1 = x1/sqrt(sum(x1.^2));
y2 = x2/sqrt(sum(x2.^2));
figure; plot(y1, 'k'); hold on; plot(y2);

figure; plot(y1); hold on; plot(y2, 'k');

figure('units', 'centimeters', 'position', [2 2 28 13]);
corr = zeros(1,400);
for k = 1:400
   
    y2 = circshift(y2, 1);
    
    corr(k) = sum(y1.*y2);
    
    cla;
    subplot(1,2,1); cla; plot(y1, 'color', 'b', 'linestyle', '-'); hold on;
    subplot(1,2,1); plot(y2, 'color', 'k', 'linestyle', '-');
    subplot(1,2,2); plot(corr(1:k)); ylim([-0.65, 1]); xlim([1,400]);
    
    pause(0.1);
end

max(corr)
