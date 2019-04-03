%% 1D Gabor filter
clear

% Generate a signal s at increasing frequency
% s_w contains the ground-truth frequencies
[s,s_w] = incrFreqWave(1000);

% Filter period (in '1d pixels')
T_f = 20
% Generate the filter
[g1, g2] = gaborFilter1D(T_f, T_f, 3*T_f);

% Compute the output
% Your code goes here %%%%%%%%%%%%%%%%%%%%
r1 = 
r2 = 
energy = 
% End of your code %%%%%%%%%%%%%%%%%%%%%%%

figure(1)
subplot(3,1,1)
plot(s)
axis tight
title('Original signal');

subplot(3,1,2)
plot(energy)
axis tight
title(['Response energy for 1D Gabor filter, T_f=' num2str(T_f)]);

subplot(3,1,3)
w_f = 2*pi/T_f;
plot(double(s_w>w_f*0.99 & s_w<w_f*1.01));
title(['Ground truth: interval where s_{\omega} \approx \omega_f']);

