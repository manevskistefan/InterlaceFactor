function [ res ] = getMatrix( I )
% Vrakja binarna matrica so koja e pretstavena pletkata
% na slikata I. Sekoe pole vo slikata odgovara na element
% na matricata, i toa 1 ako e crno, 0 ako e belo.
%
% Skokot povremeno se zgolemuva i namaluva poradi losiot
% kvalitet na slikite, t.e razlicnite debelini na liniite
% koi gi oddeluvaat polinjata vo pletkata.
%
% Izlezot e binarna matrica r x c

i = 11;
j = 11;
ri = 1;
rj = 1;

[r c] = getDimensions(I);
r
c
res = zeros(r,c);
skoki = 1;
skokj = 19;
bri = 0;
brj = 0;
bri2 = 0;
brj2 = 0;
brj3=0;
bri3=0;
while i <= size(I,1)
   j = 11;
    rj = 1;
   while j <= size(I,2)
        if I(i,j) == 0
            I(i:i+2,j:j+2) = 255;
            res(ri,rj) = 1;
        else
          I(i:i+2,j:j+2) = 0;
            res(ri,rj) = 0;
        end
        brj = brj + 1;
        brj2 = brj2+1;
        brj3=brj3+1;
        if brj == 4
            brj = 0;
            j = j + 1;
        end
        if brj2 == 8
            brj2 = 0;
            j = j + 1;
        end
    if brj3 == 12
        brj3 = 0;
        j = j - 1;
    end
        rj = rj+1;
        j = j + 21;
   end
    fprintf('\n')
    bri = bri+1;
    bri2 = bri2+1;
    bri3 = bri3+1;
    if bri == 4
        bri = 0;
        i = i + 1;
    end
    if bri2 == 8
        bri2 = 0;
        i = i + 1;
    end
    if bri3 == 12
        bri3 = 0;
        i = i - 1;
    end
    i = i + 21;
    ri = ri+1;
end


end

