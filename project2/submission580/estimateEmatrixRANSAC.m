function [E, bestInliers] = estimateEmatrixRANSAC(X1,X2)
% Estimate E matrix given a set of 
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2
%
% E: robustly estimated E matrix
% bestInliers: indices of the rows of X1 (and X2) that where in the
% largest consensus set

nIterations = 5*500;
sampleSize = 8;

%fractionInliers = 0.6;
%nInliers = floor((size(X1,1) - sampleSize) * fractionInliers);
%bestError = Inf;
eps = 10^(-5);
bestNInliers = 0;

for i=1:nIterations
    indices = randperm(size(X1,1));
    sampleInd = indices(1:sampleSize);
    testInd =  indices(sampleSize+1:length(indices));
    
    % Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    E_sample = estimateEmatrix(X1(sampleInd,:),X2(sampleInd,:));
    
    residuals = d(X1(testInd,:),X2(testInd,:),E_sample) + d(X2(testInd,:),X1(testInd,:),E_sample'); 
                            % Vector of residuals, same length as testInd.
                            % Can be vectorized code (extra-credit) 
                            % or a for loop on testInd
    
    curInliers = [testInd(residuals < eps), sampleInd];            % don't forget to include the sampleInd

    % End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    curNInliers = length(curInliers);

    if curNInliers > bestNInliers
        bestNInliers = curNInliers;
        bestInliers = curInliers;
        E = E_sample;
%         E = estimateEmatrix(X1(curInliers,:),X2(curInliers,:));
    end
end

disp(['Best number of inliers: ', num2str(bestNInliers), '/', num2str(size(X1,1))]); 

end

function d = d(X1,X2,E)
 x1 = [X1, ones(numel(X1(:,1)),1)];
 x2 = [X2, ones(numel(X2(:,1)),1)];
 e3hat = [0,-1,0;1,0,0;0,0,0];
 d = ((sum(x2.*(E*x1')',2).^2)./vecnorm(e3hat*E*x1',2,1)'.^2)';
end

function w = veemap(R)
    n = size(R');
    if n(1) == 3
    w = [-R(2,3); R(1,3); -R(1,2)];
    else 
    w = [0 -R(3) R(2); R(3) 0 -R(1); -R(2) R(1) 0];
    end
end
