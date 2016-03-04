% Skripta za izminuvanje na site sliki vo 
% segasniot direktorium vo MATLAB i konverzija
% na sekoja slika vo instanca za primena na 
% Masinsko Ucenje

% Prvo, se kreira izlezen file
fid = fopen('complete_set.csv', 'wt');

% Za sekoja slika od tekovniot folder
files = dir('*.jpg');
for image = files'
	% Kreiraj instanca so 7 atributi
    attrvec = CreateAttributeVector(image.name);
	% Zapisi redica vo fajlot (nova instanca)
    fprintf(fid, '%f,%f,%f,%f,%f,%f,%f\n', ...
        attrvec(1),...
        attrvec(2),...
        attrvec(3),...
        attrvec(4),...
        attrvec(5),...
        attrvec(6),...
        attrvec(7)...
     );
end

% Zatvori go fajlot
fclose(fid);