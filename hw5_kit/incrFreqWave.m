function [s, s_w] = incrFreqWave(sSize, n_w, w_max)

% Create 1d wave of increasing frequency by piecing together waves
% of increasing frequency
% If we used a frequency vector with one value at each position, a
% Doppler effect would cause the perceived frequency to be higher
% than the one used to generate the wave.

x = 1:sSize;

if nargin<2
    % Number of frequencies
    n_w = 50;
    % Max frequency
    w_max = 0.6;
end

w_min = w_max / n_w;
% Frequency vector and points where frequency changes (= need to
% piece two sine waves at those points)
w = linspace(w_min,w_max,n_w);
inds = round(linspace(1,sSize,n_w+1));

% s,s_w are the signal and the frequency vector
% Note that s_w is just a piecewise constant vector
s = zeros(1,sSize);
s_w = zeros(1,sSize);
% Previous value and sign of derivative for continuity
s_prev = 1;
sgn_prev = -1;
t = linspace(0.01,0.1,n_w);
for i=1:n_w
    cur_w = w(i);
    new_s = cos(cur_w*x);

    % Look for roughly same value and same derivative sign
    % This is very approximative but it seems to work in most cases
    ind_align = find(new_s>s_prev-t(i) & ...
                     new_s<s_prev+t(i) & ...
                     sign([new_s(2:end),0]-[new_s(1:end-1),0])==sgn_prev,1);

    % Concatenate the new wave with right shift
    s(inds(i):inds(i+1)) = new_s(ind_align + (0:(inds(i+1)- ...
                                                 inds(i))));
    s_w(inds(i):inds(i+1)) = cur_w;
    s_prev = s(inds(i+1));

    sgn_prev = sign(s(inds(i+1)) - s(inds(i+1)-1));
end

%figure()
%plot(x,s);
