function [attributes] = CreateAttributeVector(pathToImage)
% Transformacija na dadena slika vo binarna matrica i konstrukcija na 
% instanca so 7 atributi koja se vrakja na izlez

% Prag za crveni polinja
threshold1 = 120;

% Prag za crni polinja so nijansa na siva
threshold2 = 200;

% Otstranuvanje na crvenite polinja od slikata
I = removeRedSquares(pathToImage, threshold1);

% Binarizacija na slikata za da ima potpolno beli pikseli (255)
% ili potpolno crni pikseli (0)
I = imageBinarization(I, threshold2);

% Dobivanje na binarna matrica od slikata 
% taka sto sekoe pole e pretstaveno so element 
% vo matricata (1-crno, 0-belo)
res = getMatrix(I);

% Trim na matricata da se izbrisat site redici i koloni 
% od pocetokot (kako ramka) sostaveni samo od 0-i
M = res;
x = find(any(M,2),1,'first'):find(any(M,2),1,'last');
y = find(any(M),1,'first'):find(any(M),1,'last');

res = M(x, y);
attributes = zeros(1, 7);

% Broj na redici
attributes(1) = size(res, 1);

% Broj na koloni
attributes(2) = size(res, 2);

% Broj na edinici
attributes(3) = sum(sum(res));

% Broj na promena na efekti horizontalno
suma = 0;
for i=1:size(res,1)
    promeni = 0;
    for j=2:size(res,2)
        if res(i,j-1) ~= res(i,j)
            promeni = promeni + 1;
        end
    end
    suma = suma + promeni;
end
attributes(4) = suma;

% Prosecno traenje na promena na efekt horizontalno
suma = 0;
for i=1:size(res,1)
    for j=2:size(res,2)
        if res(i,j-1) == res(i,j)
            suma = suma + 1;
        end
    end
end
attributes(5) = suma / attributes(4);

% Broj na promena na efekti vertikalno
suma = 0;
for j=1:size(res,2)
    promeni = 0;
    for i=2:size(res,1)
        if res(i-1,j) ~= res(i,j)
            promeni = promeni + 1;
        end
    end
    suma = suma + promeni;
end
attributes(6) = suma;

% Prosecno traenje na promena na efekt vertikalno
suma = 0;
for j=1:size(res,2)
    for i=2:size(res,1)
        if res(i-1,j) == res(i,j)
            suma = suma + 1;
        end
    end
end
attributes(7) = suma / attributes(6);

end

