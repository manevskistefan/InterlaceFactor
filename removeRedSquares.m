function [ I ] = removeRedSquares( path, threshold )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
I = imread(path);
for i=1:size(I,1)
    for j = 1:size(I,2)
        if I(i,j,1) > threshold
            I(i,j,1) = 255;
            I(i,j,2) = 255;
            I(i,j,3) = 255;
        end
    end
end


end

