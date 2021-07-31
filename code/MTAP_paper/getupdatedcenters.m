function [centers ] = getupdatedcenters(dataset,allocation, numofclusters )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

centers = [];


 freqofclusters  = getfrequency(allocation,numofclusters );
 
 for i=1:numofclusters
     centers = [centers 0];
 end
 for i=1:length(dataset)
     clusterassigned = allocation(i);
     centers(clusterassigned) = (centers(clusterassigned)) + (dataset(i));
 end
 for i=1:numofclusters
     if  freqofclusters(i) == 0
         centers(i) = [];
     else
         centers(i) =    centers(i)/  freqofclusters(i);
     end
 end
 


end

