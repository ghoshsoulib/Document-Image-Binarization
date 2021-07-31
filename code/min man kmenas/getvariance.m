function [ variances ] = getvariance(dataset, centers, allocation, numofclusters )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%centers1  = getupdatedcenters(dataset, allocation, numofclusters );

variances = [];




for i=1:numofclusters
    variances = [variances 0];
end


for i=1:length(dataset)
    clusterassigned = allocation(i);
    %centers(clusterassigned)
    variances( clusterassigned ) =   variances( clusterassigned ) + ((dataset(i)- centers(clusterassigned)) ^ 2);
  
    
    
     
end



end

