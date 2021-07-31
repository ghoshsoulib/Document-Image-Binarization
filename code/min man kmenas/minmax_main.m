function [imgbin ] = minmax_main( img )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

img = double(img);
%img = img(70:370,70:470);
[r,c] = size(img);
%figure,imshow(img);


dataset = [];
dataset = double(dataset);

dataset = img(:);



%disp(dataset);
numofclusters = 2;
pmax = 0.9;
pstep = 0.01;
beta = 0.75;
maxnumofiterations = 200;
epsilon = 0.0005;
centers = [15 210];
disp(centers);

[result,centers]  = minmax(dataset, centers, numofclusters, pmax, pstep, beta, epsilon, maxnumofiterations);
%disp(dataset);
%disp(result);


imgclus = reshape(result,r,c);
disp(centers);

for i=1:r
    for j=1:c
        if imgclus(i,j) == 1
            imgbin(i,j) = 0;
        else
            imgbin(i,j) = 255;
        end
    end
end
%imgbin = imcomplement(imgbin);
%figure,imshow(imgbin);

imgbin = uint8(imgbin);
end

