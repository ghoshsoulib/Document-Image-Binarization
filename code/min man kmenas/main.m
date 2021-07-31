
img = imread('1.bmp');
img = rgb2gray(img);
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
centers = [20 200];
disp(centers);

[result,centers,numofiterations,diff]  = minmax(dataset, centers, numofclusters, pmax, pstep, beta, epsilon, maxnumofiterations);
%disp(dataset);
%disp(result);
%disp(numofiterations);
%disp(diff);

result = result - 1;
%disp(result(570));

imgclus = reshape(result,r,c);
%imshow(imgclus);
%disp(centers);
%{
for i=1:r
    for j=1:c
        if imgclus(i,j) == 0
            imgbin(i,j) = 0;
        else
            imgbin(i,j) = 255;
        end
    end
end
%imgbin = imcomplement(imgbin);
%figure,imshow(imgbin);
%}





