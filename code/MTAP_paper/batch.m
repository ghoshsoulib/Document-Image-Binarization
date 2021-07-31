
data_path = 'E:\collage_research_work\DATA\binarization dataset\dibco\Dataset_19\Dataset\';
gt_path = 'E:\collage_research_work\DATA\binarization dataset\dibco\Dataset_19\GT\';

% finalmetric = [];
% finalmetric_extra = [];
time = [];

for i = 1:20
    
    i
    imgin = strcat(num2str(i), '.bmp');
    imgin = strcat(data_path, imgin);
    
    tic;

    imgout = main_function(imgin);
    
    time_now = toc;
    time = [time time_now];
    %imgout = k_menas_testing(imgin);
    %imgout = niblack_bin(rgb2gray(imread(imgin)), [70 70]);
    
%     gt = strcat(num2str(i), '_gt.bmp');
%     gt = strcat(gt_path, gt);
%     
%     imggt = imread(gt);
%     imggt = im2bw(imggt);
%     a = objective_evaluation_core(imgout, imggt);
%     
%     metric_extra = [a.TP a.FP a.TN a.FN];
%     metric = [a.Precision a.Recall a.Fmeasure a.P_Precision a.P_Recall a.P_Fmeasure a.PSNR a.DRD];
%     
%     finalmetric = [finalmetric; metric];
%     finalmetric_extra = [finalmetric_extra; metric_extra];
    
end

% meann = mean(finalmetric);
% finalmetric = [finalmetric; meann];
% 
% meann_extra = mean(finalmetric_extra);
% finalmetric_extra = [finalmetric_extra; meann_extra];

sum(time)

    