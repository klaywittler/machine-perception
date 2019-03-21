function [transfoCandidates] = poseCandidatesFromE(E)
% Return the 4 possible transformations for an input matrix E
% transfoCandidates(i).T is the 3x1 translation
% transfoCandidates(i).R is the 3x3 rotation

transfoCandidates = repmat(struct('T',[],'R',[]),[4 1]);
% Fill in the twisted pair for E and the twisted pair for -E
% The order does not matter.

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rpz = [0 -1 0; 1 0 0; 0 0 1];
Rnz = [0 1 0; -1 0 0; 0 0 1];

[U,S,V] = svd(E);

T1hat = U*Rpz*S*U';
T1 = veemap(T1hat);
R1 = U*Rpz'*V';

transfoCandidates(1).T = T1;
transfoCandidates(1).R = R1;

T2hat = U*Rnz*S*U';
T2 = veemap(T2hat);
R2 = U*Rnz'*V';

transfoCandidates(2).T = T2;
transfoCandidates(2).R = R2;

[U,S,V] = svd(-E);

T1hat = U*Rpz*S*U';
T1 = veemap(T1hat);
R1 = U*Rpz'*V';

transfoCandidates(3).T = T1;
transfoCandidates(3).R = R1;

T2hat = U*Rnz*S*U';
T2 = veemap(T2hat);
R2 = U*Rnz'*V';

transfoCandidates(4).T = T2;
transfoCandidates(4).R = R2;

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