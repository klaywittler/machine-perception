function [E, bestInliers] = estimateEmatrixRANSAC(X1,X2)
% Estimate E matrix given a set of 
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2
%
% E: robustly estimated E matrix
% bestInliers: indices of the rows of X1 (and X2) that where in the
% largest consensus set

nIterations = 500;
sampleSize = 8;

%fractionInliers = 0.6;
%nInliers = floor((size(X1,1) - sampleSize) * fractionInliers);
%bestError = Inf;
eps = 10^(-4);
bestNInliers = 0;

for i=1:nIterations
    indices = randperm(size(X1,1));
    sampleInd = indices(1:sampleSize);
    testInd =  indices(sampleSize+1:length(indices));
    
    % Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    E_sample = 
    
    residuals =             % Vector of residuals, same length as testInd.
                            % Can be vectorized code (extra-credit) 
                            % or a for loop on testInd
    
    curInliers =            % don't forget to include the sampleInd

    % End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    curNInliers = length(curInliers);

    if curNInliers > bestNInliers
        bestNInliers = curNInliers;
        bestInliers = curInliers;
        E = E_sample;
    end
end

disp(['Best number of inliers: ' bestNInliers '/' size(X1,1)]; 
