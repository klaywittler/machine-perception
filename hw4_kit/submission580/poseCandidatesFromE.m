function [transfoCandidates] = poseCandidatesFromE(E)
% Return the 4 possible transformations for an input matrix E
% transfoCandidates(i).T is the 3x1 translation
% transfoCandidates(i).R is the 3x3 rotation

transfoCandidates = repmat(struct('T',[],'R',[]),[4 1]);
% Fill in the twisted pair for E and the twisted pair for -E
% The order does not matter.

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rpz = [0, -1, 0; 1, 0, 0; 0, 0, 1];

[U,~,V] = svd(E);

T = U(:,3)/norm(U(:,3));
R1 = U*Rpz'*V';
R2 = rodrigues(T,pi)*R1;

transfoCandidates(1).T = T;
transfoCandidates(1).R = R1;
transfoCandidates(2).T = -T;
transfoCandidates(2).R = R2;
transfoCandidates(3).T = T;
transfoCandidates(3).R = -R1;
transfoCandidates(4).T = -T;
transfoCandidates(4).R = -R2;

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

function w = veemap(R)
    n = size(R');
    if n(1) == 3
    w = [-R(2,3); R(1,3); -R(1,2)];
    else 
    w = [0 -R(3) R(2); R(3) 0 -R(1); -R(2) R(1) 0];
    end
end

function R = rodrigues(u,theta)
    R = eye(3)*cos(theta) + u*u'*(1-cos(theta))+ veemap(u)*sin(theta);
end