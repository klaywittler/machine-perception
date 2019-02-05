% Written for the University of Pennsylvania's Machine Perception course

% Note: You don't have to change this script for the assignment, but you
% can if you'd like to change the images or other parameters

% Load the points that the logo corners will map onto in the main image
load data/invictus/keypoints.mat
num_ima = size(keypoints, 1);

% Set of images to test on
test_images = 1:180;
% To only test on images 1, 4 and 10, use the following line (you can edit
% it for your desired test images)
% test_images = [1,4,10];

num_test = length(test_images);

% Initialize the images
video_imgs = cell(num_test, 1);
frame_keypoints = cell(num_test, 1);
processed_imgs = cell(num_test, 1);

% Process all the images
for i=1:num_test
    i
    % Read the next video frame
    video_imgs{i} = imread(sprintf('data/invictus/images/ivh_%04d.png',test_images(i)));
    frame_keypoints{i} = squeeze(keypoints(i,:,:));
    
    referee_keypoint = squeeze(keypoints(i,1,:));
    lower_left_keypoint = squeeze(keypoints(i,2,:));
    lower_right_keypoint = squeeze(keypoints(i,3,:));
    upper_right_keypoint = squeeze(keypoints(i,4,:));
    upper_left_keypoint = squeeze(keypoints(i,5,:));
    
    [vanishing_pt, top_pt, bottom_pt] = compute_ref_line_segment(referee_keypoint,...
                                          lower_left_keypoint, lower_right_keypoint,...
					  upper_right_keypoint, upper_left_keypoint);
    
    img = draw_line( video_imgs{i}, lower_left_keypoint, lower_right_keypoint, [0;255;0] );
    img = draw_line( img, upper_left_keypoint, upper_right_keypoint, [0;255;0] );
    
    img = draw_line( img, lower_left_keypoint, upper_left_keypoint, [255;0;0] );
    img = draw_line( img, lower_right_keypoint, upper_right_keypoint, [255;0;0] );
    
    img = draw_line( img, bottom_pt, top_pt, [0;0;255] );
    
    img = draw_line( img, top_pt, vanishing_pt, [0;255;255] );
    img = draw_line( img, upper_right_keypoint, vanishing_pt, [0;255;255] );
    img = draw_line( img, upper_left_keypoint, vanishing_pt, [0;255;255] );
    
    processed_imgs{i} = img;
end
