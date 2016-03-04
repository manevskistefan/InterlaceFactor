function [ theta, J_history] = RegularizedPolynomialRegression( X, y )
% Gradi model za regularizirana nelinearna multivariate regresija
% (ili polinomijalna - isto e).

	% Inicijalizacija na koeficientite theta
    theta = zeros(size(X,2), 1);
    
    
    % Cekor za Gradient Descent
    alpha = 0.00003;
	% Iteracii za Gradient Descent
    num_iters = 10000;
	
    fprintf('Se izvrsuva Gradient Descent so alpha = %f i iteracii = %f\n', alpha, num_iters);
	% Minimizacija na cenata za cinenje so Gradient Descent
	% Na izlez se dobiva modelot (vektorot od koeficienti theta)
    [theta, J_history] = GradientDescent(X, y, theta, alpha, num_iters);
    fprintf('Gradient Descent zavrsi.\n');
end

