function [ w] = c_means( imggray )

imgg = double(imggray);
[r,c] = size(imgg);
%c2=averagefilter2(imgg);
%deviation = standardDev(imgg, c2);
arr = imgg(:);
%arr = [imgg(:)];
[center,U,obj_fcn] = fcm(arr,2);
v = U(2,:);
w = v<0.4;

if (sum(w(:))<=(r*c)/2)
    w = imcomplement(w);
end


%p = reshape(U(2,:), size(imgg));
%p = reshape(w,r,c);



%ss = p<0.4;

%{
[r,c] = size(imgg);
ss = p<0.4;
if (sum(ss(:))<=(r*c)/2)
    ss = imcomplement(ss);
%}


end

