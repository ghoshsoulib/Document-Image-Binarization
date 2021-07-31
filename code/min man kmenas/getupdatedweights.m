function [updatedweights ] = getupdatedweights( weights, beta, variances, p, numofclusters )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

updatedvariances = [];

sumofupdatedvariances = 0;


 for i=1:numofclusters
    updatedvariances = [updatedvariances  variances(i)^(1/(1-p))];
    sumofupdatedvariances =  sumofupdatedvariances + (updatedvariances(i));
 end
 %updatedvariances = updatedvariances./sumofupdatedvariances;
 
 for i=1:numofclusters
     updatedvariances(i) =  updatedvariances(i)/sumofupdatedvariances;
 end
 
 
updatedweights = [];
%updatedweights = (updatedweights);

 for i=1:numofclusters
    updatedweight = (beta * weights(i)) + ((1-beta) * updatedvariances(i));
    updatedweights = [updatedweights updatedweight];
 end
 
 


end

