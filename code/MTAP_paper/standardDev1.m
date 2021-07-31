function deviation = standardDev1(image1, mean)
    meanSquare = averagefilter3(image1.^2);
    deviation = (meanSquare - mean.^2).^0.5;

end
