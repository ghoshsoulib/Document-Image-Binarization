function img=averagefilter2(image1)
    meanFilter = fspecial('average',[80 80]);
    img = imfilter (image1,meanFilter );
end

