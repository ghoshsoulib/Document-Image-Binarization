function [ p] = c_means( img )
%imggray = rgb2gray(imggray);
imgg = double(img);
[r,c] = size(imgg);
%c2=averagefilter2(imgg);
%deviation = standardDev(imgg, c2);
arr = imgg(:);
%arr = [imgg(:)];
[center,U,obj_fcn] = fcm(arr,2);
v = U(2,:);
w = v<0.15;

center

if (sum(w(:))<=(r*c)/2)
    w = imcomplement(w);
end


%p = reshape(U(2,:), size(imgg));
p = reshape(w,size(imggray));





end

