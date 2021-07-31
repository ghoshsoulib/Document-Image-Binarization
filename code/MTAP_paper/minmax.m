function [allocation,centers,numofiterations,diff ] = minmax(dataset, centers, numofclusters, pmax, pstep, beta, epsilon, maxnumofiterations)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

result = [];
numofiterations = 0;
pinit = 0;
weights = [];

for i=1:numofclusters
    weights = [weights 1/numofclusters];
end
singletonclusterfound = 0;
p = pinit;
allocation = [];
prevweights = [];
prevallocation = [];
variances_old = [];
while numofiterations < maxnumofiterations
    if(numofiterations > 5)
        variances_old  = getvariance(dataset, centers, allocation, numofclusters );
    end
    
    
    numofiterations = numofiterations + 1;
    allocation = allocateCluster(dataset, numofclusters, weights, centers, p );
    
     freqofclusters  = getfrequency(allocation,numofclusters );
     for i=1:numofclusters
         if freqofclusters(i) == 0
             singletonclusterfound = 1;
             p = p - pstep;
             allocation = prevallocation;
             weights = prevweights;
             break;
         end
     end
     if ( p < pmax) && singletonclusterfound == 0
         p = p + pstep;
         prevweights = weights;
         prevallocation = allocation;
     end
     centers  = getupdatedcenters(dataset, allocation, numofclusters );
     variances  = getvariance(dataset, centers, allocation, numofclusters );
     weights  = getupdatedweights( weights, beta, variances, p, numofclusters );
     diff = max( variances ) - max(  variances_old);
     diff = abs(diff);
    if (  diff < epsilon)
        break;
    end
    
     
    
end



            



end

