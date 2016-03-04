function [ r c ] = getDimensions( I )
% So otsekuvanje na desetta redica i desetta kolona
% se istencuvaat liniite se se odreduva brojot na 
% redici i koloni vo pletkata od slikata

	% Zemi ja desetata redica pikseli
	red = I(10, 10:size(I,2));

	% Zemi ja desetata kolona pikseli
	kolona = I(10:(size(I,1)), 10);

	r = 0;
	c = 0;

	% Istenci gi liniite da bidat siroki 1 px
	i=1;
	while i <= size(red,2)
		if red(i) == 0
			i = i + 1;
			while i <= size(red,2) & red(i) == 0
				red(i) = 255;
				i = i+1;
			end
		else
			i = i+1;
		end
	end

	% Izbori gi redicite
	for i=1:size(red,2)
		if red(i)==0
			c = c+1;
		end
	end

	% Istenci gi liniite da bidat siroki 1 px
	i=1;
	kolona = kolona';
	size(kolona)
	while i <= size(kolona,2)
		if kolona(i) == 0
			i = i + 1;
			while  i <= size(kolona,2) & kolona(i) == 0
				kolona(i) = 255;
				i = i+1;
			end
		else
			i = i+1;
		end
	end

	% Izbori gi kolonite
	for i=1:size(kolona,2)
		if kolona(i)==0
			r = r+1;
		end
	end

end

