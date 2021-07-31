img =imread('1.bmp');
imggray = rgb2gray(img);
mask = DilatedNiblackBinarization(imggray);
%figure,imshow(mask),title('mask');
inpainted_img = impainting(imggray,mask);
%figure,imshow(inpainted_img),title('Impainted Image only');

[r,c] = size(imggray);

%{
f = double((double(imggray) + 1)./(double(inpainted_img)+1));
figure,imshow(f),title('Impainted Image division');
f_min = min(min(f));
f_max = max(max(f));
i_min = double(min(min(imggray)));
i_max = double(max(max(imggray)));
normalised = (i_max-i_min)*((f-double(ones(r,c))*f_min));
normalised1 = normalised/(f_max-f_min);
normalised2 = normalised1 + i_min;
normalised3 = uint8(normalised2);
figure,imshow(normalised3),title('Impainted Image final normalised');
%}

for i=1:r
    for j=1:c
        n(i,j) = inpainted_img(i,j) - imggray(i,j);
    end
end

figure,imshow(n);

n = imcomplement(n);
figure,imshow(n);
        