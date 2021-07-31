function [ binaryImage ] = DilatedNiblackBinarization( imggray )
k_threshold = -0.2;
image1 = double(imggray);
image1 = image1 / max(image1(:));
mean = averagefilter2(image1);
standardDeviation = standardDev(image1, mean);
binaryImage = image1 >=  (mean + k_threshold * standardDeviation);
end

