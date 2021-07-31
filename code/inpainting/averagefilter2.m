function img=averagefilter2(image1)
    meanFilter = fspecial('average',[60 60]);
    img = imfilter (image1,meanFilter);
end
