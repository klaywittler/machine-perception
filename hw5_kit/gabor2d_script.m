%% 2D Gabor filter
clear

% Generate an image with various frequencies and orientations
% im_w contains the ground-truth frequencies at each location
[im,im_w] = incrFreqWaveImage(1000);

% Generate a 2D Gabor filter: parameters T_f and theta
T_f = 20;
theta = 30;
[g1,g2] = gaborFilter2D(T_f, theta, 1/2*T_f^2*eye(2), 3*T_f);

% Compute the response
% Your code goes here %%%%%%%%%%%%%%%%%%%%
r1 = 
r2 = 
energy = 
% End of your code %%%%%%%%%%%%%%%%%%%%%%%

figure(2)
imagesc(im); colormap('gray')
title('Original image');

% Plot the response
figure(3)
subplot(1,3,1)
imagesc(r1); 
axis equal; axis tight; colormap('jet');
title(['Real part of the response'...
       '(T_f=' num2str(T_f) 'px, \theta=' num2str(theta) 'deg)']);

subplot(1,3,2)
imagesc(r2);
axis equal; axis tight;
title(['Imaginary part of the response'...
       '(T_f=' num2str(T_f) 'px, \theta=' num2str(theta) 'deg)']);

subplot(1,3,3)
imagesc(energy); 
title(['Response energy for 2D Gabor filter '...
       '(T_f=' num2str(T_f) 'px, \theta=' num2str(theta) 'deg)']);
axis equal; axis tight;

% Plot the maximum response superimposed with the ground truth
figure(4)
w_f = 2*pi/T_f;
imagesc(double(energy>0.95*max(energy(:))) + double(im_w>0.99*w_f & ...
                                              im_w<1.01*w_f));
colormap('gray');axis equal; axis tight;
title(['Zone where im_{\omega}\approx \omega_f, '...
       'superimposed with filter max response']);

