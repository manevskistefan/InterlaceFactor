function [X_norm, mu, sigma] = featureNormalize(X)
	%Inicijalizacija
    X_norm = X;
    mu = zeros(1, size(X, 2));
    sigma = zeros(1, size(X, 2));
	
	%Koga e matrica, avtomatski bara za sekoja kolona oddelno
    mu = mean(X);  
	
    % Istoto vazi i za standardna devijacija
	sigma = std(X); 
   
	% Z-score standardizacija na vrednostite na sekoj atribut oddelno
    for j = 1 : size(X, 2)
        X_norm(:, j) = X(:, j) - mu(j);
        X_norm(:, j) = X_norm(:, j) / sigma(j);
    end

end
