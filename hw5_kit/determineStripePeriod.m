function [T_y] = determineStripePeriod(im_red, im_original)
% Determines the period of stripes in a grayscale (2D) Waldo image,
% with the following method:
% - the user chooses a small patch in the image that contains only
% stripes, by clicking twice (upper-left and bottom-right corner of
% desired bounding box)
% - the user clicks on a peak of the fft of the patch
% - T_y is automatically computed from the user's click
%
% ARGUMENTS
% - im_red: grayscale version (2d matrix) of a Waldo image, where
% stripes appear black and white
% - im_original: original version for better visualization
%
% OUTPUT
% - T_y: estimated spatial period of the stripes in the patch (in
% *pixels*)


% User chooses a patch in the image
figure()
imshow(im_original); axis equal; axis tight;
title(['Please choose a patch containing only horizontal stripes by ' ...
      'clicking twice in the image (upper-left and bottom-right corner)']);
[bbx,bby] = ginput(2);


% User clicks on fft peak
stripe_patch = im_red(bby(1):bby(2),bbx(1):bbx(2));
stripe_patch = stripe_patch - mean(stripe_patch(:));
figure()
subplot(1,2,1)
imagesc(stripe_patch); colormap(gray);
subplot(1,2,2)
fft_mag = abs(fftshift(fft2(stripe_patch)));
imagesc(fft_mag+flipud(fft_mag));
title(['Please click on a peak of the fft']);
w = ginput(1);

% Spatial period T_y is computed
% Your code goes here %%%%%%%%%%%%%%%%%%%%%%



% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%
