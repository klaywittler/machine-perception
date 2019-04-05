function [filter_cos,filter_sin] = gaborFilter2D(T_f, theta, Sigma, len)
% This function returns two 2D Gabor quadrature filters
% (square matrices).
%
% ARGUMENTS
% - T_f: spatial period in pixels
% - theta: carrier orientation in degrees (0 corresponds
% to oscillation along x-axis only)
% - Sigma: covariance of Gaussian envelope
% - len: output is len x len.
%
% OUTPUT
% filter_cos, filter_sin: two 2d matrices containing the real part
% and the imaginary part of the filter

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%
% use gaussian2d.m
g = gaussian2d(Sigma,len);

[x,y] = meshgrid(-len/2 + 0.5:1:len/2 - 0.5);
x_theta = x*cos(theta) + y*sin(theta);
y_theta = -x*sin(theta) + y*cos(theta);

filter_cos = g.*cos((2*pi/T_f)*x + theta);
filter_sin = g.*sin((2*pi/T_f)*y + theta);




% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%

