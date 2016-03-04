function [ ] =  AppendRegressionOutputs( pathToCsv )
% Ovaa funkcija gi dodeluva presmetanite faktori na prepletka kako posleden
% atribut vo podatocnoto mnozestvo

	% Citanje na podatocnoto mnozestvo
    data = csvread(pathToCsv, 1, 0);
    
	% Razdeluvanje na instancite od sekoj klaster oddelno
    cluster1 = data(data(:,9)==1, :);
    cluster2 = data(data(:,9)==2, :);
    cluster3 = data(data(:,9)==3, :);
    
    % Generirame 3 random broevi (za sekoj klaster po eden)
    coefficients = rand(1, 3);
    mat1 = zeros(7,1);
    mat1(:) = coefficients(1);
    
    % Gi multiplicirame random broevite za direktno da
	% se izmnozat so atributite od nivniot klaster 
	% vo vektorizirana forma
    mat2 = zeros(7,1);
    mat2(:) = coefficients(2);
    
    mat3 = zeros(7,1);
    mat3(:) = coefficients(3);
    
	% Mnozenje na atributi so random broj za klaster 1
    y1 = cluster1(:,2:8) * mat1;
    cluster1 = [cluster1 y1];
     
	% Mnozenje na atributi so random broj za klaster 1
    y2 = cluster2(:,2:8) * mat2;
    cluster2 = [cluster2 y2];
    
	% Mnozenje na atributi so random broj za klaster 1	
    y3 = cluster3(:,2:8) * mat3;
    cluster3 = [cluster3 y3];
    
	% Spojuvanje na trite klasteri vo edno mnozestvo
    all = [cluster1; cluster2; cluster3];
    
	% Go zapisuvame mnozestvoto vo csv file
    csvwrite('complete_datasets_outputs.csv', all);
    
end

