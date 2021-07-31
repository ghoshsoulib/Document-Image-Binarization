function [ binaryImage ] = DilatedNiblackBinarization( imggray )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
k_threshold = -0.2;

%convert to double
image1 = double(imggray);

% normalise to [0,1] range
image1 = image1 / max(image1(:));

%mean filtering
mean = averagefilter3(image1);

%standard deviation
standardDeviation = standardDev1(image1, mean);

%calculate binary image
binaryImage = image1 >=  (mean + k_threshold * standardDeviation);
%dilated_img = imdilate(binaryImage,ones(3,3));


%display image
%display = displayImage(binaryImage, image1);

end

