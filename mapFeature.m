function out = mapFeature(X1, X2, X3, X4, X5, X6, X7,X8)
% Konsturira polinom od stepen "degree" preku kombiniranje
% na parovi od vleznite promenlivi na soodvetni stepeni a i b.
%
% Podetalen opis ima vo dokumentacijata

    X = [X1 X2 X3 X4 X5 X6 X7 X8];
    degree=6;
    out = ones(size(X1(:,1)));
    for i=1:8
       for j = i+1:8
     
                for a = 0:degree 
                    for b = 0:degree
                  
                            out(:, end+1) = X(:,i).^a .*  X(:,j).^b;
          
                    end
                end
     
       end
    end

end