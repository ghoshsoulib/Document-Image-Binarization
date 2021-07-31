function [normalised3 ] = main_function_normalized(img_addr)
img = imread(img_addr);
[~,~,w] = size(img);
if w == 3
    
    imggray = rgb2gray(img);
    
else
    imggray = img;
end

mask = DilatedNiblackBinarization(imggray);
%figure,imshow(mask),title('Mask Image');
inpainted_img = impainting(imggray,mask);
%figure,imshow(inpainted_img),title('Impainted Image');
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
%figure,imshow(normalised3),title('normalized image');

%output_file = strcat(img_addr, 'output.bmp');
%imwrite(fin_img, output_file);
end