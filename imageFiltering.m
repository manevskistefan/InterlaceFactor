 
I = imread('c:/users/nino/desktop/sl_62_rgb.jpg');

for i=1:size(I,1)
    for j = 1:size(I,2)
        if I(i,j,1) > 100
            I(i,j,1) = 255;
            I(i,j,2) = 255;
            I(i,j,3) = 255;
        end
    end
end


I = rgb2gray(I);
(size(I,1)-92)/20
(size(I,2)-92)/20
res = zeros(floor((size(I,1)-92)/20), floor((size(I,2)-92)/20) );
size(res)
ri =1;
rj = 1;
flag = 0;
flag2 = 0;
i = 56;
j = 56;
while i < size(I,1)-50
    while j < size(I,2)-50
        if I(i,j) == 255
            res(ri,rj) = 0;
        else 
            res(ri,rj) = 1;
        end
        if flag == 0
            j = j + 20;
            flag = 1;
        else 
            j = j + 20;
            flag = 0;
        end
        rj = rj + 1;
    end
    if flag2 == 0
        i = i + 20;
        flag2 = 1;
    else 
        i = i + 20;
        flag2 = 0;
    end
    ri = ri+1;
end

res

        


 