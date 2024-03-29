function [ warped_pts ] = warp_pts( video_pts, logo_pts, sample_pts)
% warp_pts computes the homography that warps the points inside
% video_pts to those inside logo_pts. It then uses this
% homography to warp the points in sample_pts to points in the logo
% image
% Inputs:
%     video_pts: a 2x4 matrix of (x,y) coordinates of corners in the
%         video frame
%     logo_pts: a 2x4 matrix of (x,y) coordinates of corners in
%         the logo image
%     sample_pts: a 2xn matrix of (x,y) coordinates of points in the video
%         video that need to be warped to corresponding points in the
%         logo image
% Outputs:
%     warped_pts: a 2xn matrix of (x,y) coordinates of points obtained
%         after warping the sample_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% Complete est_homography first!
[ H ] = est_homography(video_pts, logo_pts);

% YOUR CODE HERE
xp = H*[sample_pts;ones(1,numel(sample_pts(1,:)))];

warped_pts = xp(1:2,:)./xp(3,:);
end

