function [c ] = new_main_kmeans( img )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

imgg = double(img);
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

%disp(c(200));
%p = reshape(c, size(imgg));


end

