img = imread('1.bmp');
imggray = rgb2gray(img);
% p  = k_means( imggray );
imgg = double(imggray);
c2=averagefilter2(imgg);
deviation = standardDev(imgg, c2);
arr = [imgg(:) c2(:) deviation(:)];
%arr = [imgg(:)];
[r,co] = size(imgg);
c = kmeans(arr, 2, 'emptyaction', 'drop');
c = c-1;
if sum(c)<=(r*co)/2
    c = imcomplement(c);
end

%disp(c(200));
p = reshape(c, size(imgg));

%imshow(p);


%{
p = reshape(c, size(imgg));
[r,c] = size(imgg);
p=p-1;
p = double(p);
p1=p(:);
s=(p1==1);
if sum(s)<=(r*c)/2
    p = imcomplement(p);
end
%}

 %imshow(p);