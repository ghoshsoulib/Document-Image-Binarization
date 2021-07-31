function [ f ] = all_in_one( img )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%img = rgb2gray(img);
[ro,co] = size(img);

a_k = new_main_kmeans( img );
%n = reshape(a_k,size(img));
%figure,imshow(n);

a_c =  c_means( img );
%m = reshape(a_c,size(img));
%figure,imshow(m);

a_m = new_main_minmax( img );
%l = reshape(a_m,size(img));
%figure,imshow(l);
a = [];

for i=1:ro*co
    if(a_k(i) == 1 && a_c(i) == 1) || (a_k(i) == 1 && a_m(i) == 1) || ( a_c(i) == 1 && a_m(i) == 1 )
        a(i) = 1;
    else
        a(i) = 0;
    end
end

f = reshape(a,size(img));
%figure,imshow(f);
end

