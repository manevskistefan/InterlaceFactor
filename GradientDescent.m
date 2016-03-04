function [theta, J_history] = GradientDescent(X, y, theta, alpha, num_iters)
% Implementacija na Gradient Descent so cekor alpha
% koj se izvsuvja vo num_iters iteracii. Parametarot za 
% regularizaijca se zema da bide fiksno lambda = 0.02 

	% Inicijalizacija
	m = length(y);
	J_history = zeros(num_iters, 1);
	lambda = 0.02;

	% Gradient Descent
	for iter = 1:num_iters
	  
			fprintf('Iteration %d\n',iter);
			h = X * theta;
			
			% Azuriranje na koeficientite theta
			theta =(1-alpha*lambda/m)*theta - alpha/m*((h-y)' * X)';
			
			
			% Treba da dodademe i vo J_history
			J_history(iter) = CostFunctionRegL2(theta, X, y, lambda);


	end

end
