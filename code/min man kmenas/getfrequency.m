function [ freqofclusters ] = getfrequency(allocation,numofclusters )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
freqofclusters = [];
for i=1:numofclusters
    freqofclusters = [ freqofclusters 0];
end
for i=1:length(allocation)
    freqofclusters(allocation(i)) =  freqofclusters(allocation(i))+1;
end

    


end

