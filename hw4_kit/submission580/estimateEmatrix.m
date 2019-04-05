function E = estimateEmatrix(X1,X2)
% Estimate E matrix given a set of 
% pairs of matching *calibrated* points
% X1,X2: Nx2 matrices of calibrated points
%   i^th row of X1 matches i^th row of X2

% Kronecker products
% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X1 = [X1, ones(numel(X1(:,1)),1)];
X2 = [X2, ones(numel(X2(:,1)),1)];
A = [X1(:,1).*X2 , X1(:,2).*X2, X1(:,3).*X2];

[~,~,Vstar] = svd(A);
Estar = Vstar(:,9);

Ep = reshape(Estar,[3,3]);
% Project E on the space of essential matrices
[U,~,V] = svd(Ep);
E = U*diag([1,1,0])*V';

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
