function deviation = standardDev(image1, mean)
    meanSquare = averagefilter2(image1.^2);
    deviation = (meanSquare - mean.^2).^0.5;

end
