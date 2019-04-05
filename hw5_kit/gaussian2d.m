function g = gaussian2d(Sigma, len)
% GAUSSIAN2D - make discrete normalized centered 2D Gaussian
%
% Syntax: g = gaussian2d(Sigma, len);
%
% Output is symmetric with unit sampling period.
% (0,0) is sampled only when len is odd.
%
% Inputs:
%   Sigma: 2x2 covariance matrix
%   len: output is len x len.
%

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%

[x,y] = meshgrid(-len/2 + 0.5:1:len/2 - 0.5);
z = (x.^2)/Sigma(1,1) + (y.^2)/Sigma(2,2);
g = (1/(sqrt(2*pi*Sigma(1,1)*Sigma(2,2))))*exp(-0.5*z);

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%