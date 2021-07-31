
function [ m ] = inpainting_main(img )
%img =imread('E:\JOY\JUCSE_Misc\BOOKS\MATLAB\Images\H-DIBCO 2016 Dataset\DIPCO2016_dataset\3.bmp');
imggray = rgb2gray(img);
mask = DilatedNiblackBinarization(imggray);
%imshow(mask);
inpainted_img = impainting(imggray,mask);
%figure,imshow(inpainted_img),title('Impainted Image');

%{
[r,c] = size(imggray);
f = double((double(imggray) + 1)./(double(inpainted_img)+1));
%figure,imshow(f),title('Impainted Image');
f_min = min(min(f));
f_max = max(max(f));
i_min = double(min(min(imggray)));
i_max = double(max(max(imggray)));
normalised = (i_max-i_min)*((f-double(ones(r,c))*f_min));
normalised1 = normalised/(f_max-f_min);
normalised2 = normalised1 + i_min;
normalised3 = uint8(normalised2);
%figure,imshow(normalised3),title('Impainted Image');
%}
[r,c] = size(imggray);

for i=1:r
    for j=1:c
        n(i,j) = inpainted_img(i,j) - imggray(i,j);
    end
end

%figure,imshow(n);

n = imcomplement(n);
m = uint8(n);
%figure,imshow(n);
end