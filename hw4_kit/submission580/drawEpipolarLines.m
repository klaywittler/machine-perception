function drawEpipolarLines(im1,im2,U1,U2,E,K)
% Show both images, and matching points and 
% epipolars. A given point should be very
% close to (if not right on) the epipolar corresponding
% to its matching point in the other image.

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F = K'\E/K;                        % 3 x 3 fundamental matrix

U1p = [U1, ones(numel(U1(:,1)),1)]';
U2p = [U2, ones(numel(U2(:,1)),1)]';
epiLines1 = F'*U2p;               % 3 x number of points, 
                           % each column contains the normal to 
                           % epi(U2) in image 1

epiLines2 = F*U1p;               


% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure()
subplot(1,2,1)
imshow(im1)
drawLines(epiLines1,size(im1,1),size(im1,2));
plot(U1(:,1),U1(:,2),'bs');

subplot(1,2,2)
imshow(im2)
drawLines(epiLines2,size(im2,1),size(im2,2));
plot(U2(:,1),U2(:,2),'bs');

