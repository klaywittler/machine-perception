function [im, im_w] = incrFreqWaveImage(sSize,n_w,w_max)

% Create 1d wave of increasing frequency by piecing together waves
% of increasing frequency
if nargin<2
    n_w = 50;
    w_max = 0.6;
end
[s, s_w] = incrFreqWave(sSize,n_w,w_max);

% Now create a rotationally symmetric image from s
% length of image diagonal contains twice the length of s
imSize = floor(length(s)*2/sqrt(2));
% Round to multiple of 100
imSize = 100* floor(imSize/100);
[x,y] = meshgrid(-imSize/2:imSize/2);

im_w = s_w(1+round(sqrt(x.^2+y.^2)));
im = s(1+round(sqrt(x.^2+y.^2)));

