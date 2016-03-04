clear all
close all
clc

%Se vcituvaat podatocite od training mnozestvoto
data = csvread('output.csv', 1,0); 
%Se vcituvaat input podatocite vo promenilvata X
X = data(:,1:8); 
%Se vcituvaat faktorite za prepletka vo promenlivata Y
y = data(:,9);

% Se pravi polinom taka shto se mnozat atributite do soodveten stepen
X = mapFeature(X(:,1), X(:,2),X(:,3), X(:,4),X(:,5), X(:,6),X(:,7),X(:,8));

%Se vrshi normalizacija na atributite
[X_norm, mu, sigma] = featureNormalize(X);

%Za site NaN vrednosti se stava 0
X_norm(isnan(X_norm)) = 0 ;

%Nelinearna regresija (Nonlinear Multivariate Regression)
[theta J_history] = RegularizedPolynomialRegression(X_norm, y);

%Crtanje grafik za cena na cinenje
    figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Број на итерации');
ylabel('Цена на чинење J');



% Accuracy za trening mnozestvo
    res = X_norm * theta;
    accuracy = mean(abs(res - y));
    fprintf('Sredno otstapuvanje za trening mnozestvoto: %f \n', accuracy);
    
    % Accuracy za test mnozestvo
    %Procesot na preprocesiranje na test mnozestovoto e slicen na treining
    %mnozestvoto da den pogore
    data = csvread('test_set.csv',1,0); 

X = data(:,2:9); 
y = data(:,10);

X = mapFeature(X(:,1), X(:,2),X(:,3), X(:,4),X(:,5), X(:,6),X(:,7),X(:,8));
[X_norm, mu, sigma] = featureNormalize(X);
X_norm(isnan(X_norm)) = 0 ;

    res = X_norm * theta;
    accuracy = mean(abs(res - y));
    fprintf('Sredno otstapuvanje za test mnozestvoto: %f \n', accuracy);
   