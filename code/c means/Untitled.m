img = imread('1.bmp');
img = rgb2gray(img);
[ ss,center,w] = c_means( img );
imshow(ss);