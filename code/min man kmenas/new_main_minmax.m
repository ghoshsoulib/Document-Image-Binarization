function [ imgclus ] = new_main_minmax( img )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%img = rgb2gray(img);
img = double(img);
%img = img(270:470,270:470);
[r,c] = size(img);
%figure,imshow(img);


dataset = [];
dataset = double(dataset);

dataset = img(:);



%disp(dataset);
numofclusters = 2;
pmax = 0.9;
pstep = 0.01;
beta = 0.5;
maxnumofiterations = 200;
epsilon = 0.0000005;
centers = [10 220];
disp(centers);

[result,centers,numofiterations,diff,varr]  = minmax(dataset, centers, numofclusters, pmax, pstep, beta, epsilon, maxnumofiterations);
%disp(dataset);
%disp(result);
%disp(numofiterations);
%disp(diff);

result = result - 1;
%disp(result(570));

imgclus = reshape(result,r,c);

varr = uint32(varr);
varr

centers

%imshow(imgclus);
%disp(centers);
end

