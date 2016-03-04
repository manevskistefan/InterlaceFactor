function [ J ] = CostFunctionRegL2( theta, X, y, lambda )
	
	% Broj na trening primeroci
	m = length(y); 
	
	% Presmetka na cenata na cinenje so regularizacija 
	h = X * theta;
	J = 1/(2*m) *sum((h - y).^2) + lambda/(2*m) *( sum(theta(2:end).^2));
    


end

