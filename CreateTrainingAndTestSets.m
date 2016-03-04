function [ ] = CreateTrainingAndTestSets( outputDataPath )
% Ovaa funkcija vrsi podelba na celoto podtocno mnozestvo
% na treniracko mnozestvo (70% - 107 instanci) i test mnozestvo
% (30% - 46 instanci)

% Vcituvanje na celoto podatocno mnozestvo od CSV
data = csvread(outputDataPath);

% Izdeluvanje na sekoj klaster spored oznakite za klasteri
cluster1 = data(data(:,9)==1,:);
cluster2 = data(data(:,9)==2,:);
cluster3 = data(data(:,9)==3,:);

% Random pozicii od sekoj klaster od koi kje se 
% zemat instanci za vo trening mnozestvoto
perm1 = randperm(size(cluster1, 1));
perm2 = randperm(size(cluster2, 1));
perm3 = randperm(size(cluster3, 1));

% Konstrukcija na trening i test mnozestvo (70% i 30%)
trainingSet = [cluster1(perm1(1:uint32(0.7*size(cluster1,1))), :); cluster2(perm2(1:uint32(0.7*size(cluster2,1))), :); cluster3(perm3(1:uint32(0.7*size(cluster3,1))), :)];
testSet = [cluster1(perm1(uint32(0.7*size(cluster1,1))+1:end), :); cluster2(perm2(uint32(0.7*size(cluster2,1))+1:end), :); cluster3(perm3(uint32(0.7*size(cluster3,1))+1:end), :)];

% Zapisuvanje na trening mnozestvoto vo nov CSV fajl
csvwrite('training_set.csv', trainingSet);

% Zapisuvanje na test mnozestvoto vo nov CSV fajl
csvwrite('test_set.csv', testSet);

end

