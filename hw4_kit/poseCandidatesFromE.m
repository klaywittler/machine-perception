function [transfoCandidates] = poseCandidatesFromE(E)
% Return the 4 possible transformations for an input matrix E
% transfoCandidates(i).T is the 3x1 translation
% transfoCandidates(i).R is the 3x3 rotation

transfoCandidates = repmat(struct('T',[],'R',[]),[4 1]);
% Fill in the twisted pair for E and the twisted pair for -E
% The order does not matter.

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%