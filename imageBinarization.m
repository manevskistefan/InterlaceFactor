function [ I ] = imageBinarization( I, threshold )
% Gi pretvora pikselite koi se so intenzitet nad 
% dadeniot threshold vo cisto beli RGB(255,255,255).
% Ostanatite stanvuaat cisto crni, t.e RGB(0,0,0)

I = rgb2gray(I);
for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j) < threshold
            I(i,j) = 0;
        else 
            I(i,j) = 255;
        end
    end
end



end

