function E = estimateEmatrix(X1,X2)
% Estimate E matrix given a set of 
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2

% Kronecker products
% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A = [X1(:,1).*X2 , X1(:,2).*X2, X1(:,3).*X2];


[U,S,V] = svd(A);
E = V(:,rank(A));

% Project E on the space of essential matrices
[U,S,V] = svd(E);
E = U*diag([1,1,0])*V';


% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
