function [p] = k_menas_testing(imgaddr)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
img = imread(imgaddr);
[~,~,w] = size(img);
if w == 3
    
    imggray = rgb2gray(img);
    
else
    imggray = img;
end

imgg = double(imggray);
c2=averagefilter2(imgg);
deviation = standardDev(imgg, c2);
arr = [imgg(:) c2(:) deviation(:)];
%arr = [imgg(:)];
[r,co] = size(imgg);
%c = kmeans(arr, 2, 'emptyaction', 'drop');
c = kmeans(imgg(:),2);
c = c-1;
if sum(c)<=(r*co)/2
    c = imcomplement(c);
end

p = reshape(c, size(imgg));

end

