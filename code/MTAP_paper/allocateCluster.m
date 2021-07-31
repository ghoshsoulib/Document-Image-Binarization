function [allocation ] = allocateCluster(dataset, numofclusters, weights, centers, p )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

allocation = [];
for i=1:length(dataset)
    clusterassigned = 1;
    mindistance = (weights(1) ^ p) * ((dataset(i) - centers(1)) ^ 2);
    for j=1:numofclusters
        dist = (weights(j)^p) * ((dataset(i)- centers(j)) ^ 2);
        if dist < mindistance
            mindistance = dist;
             clusterassigned = j;
        end
    end
    allocation = [allocation clusterassigned];
end

