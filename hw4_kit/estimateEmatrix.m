function E = estimateEmatrix(X1,X2)
% Estimate E matrix given a set of 
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2

% Kronecker products
% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = 


[U,S,V] = svd(A);
E = 

% Project E on the space of essential matrices



% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
