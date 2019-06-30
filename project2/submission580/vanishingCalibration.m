function [K] = vanishingCalibration(im)
% Calibrate camera from three vanishing points
% Assumption: no pixel distortion, just: 
% - focal length f
% - camera center projection: 3x1 homogeneous vector c = [u0;v0;1]

% Click on points and intersect lines to locate vanishing points
nPoints = 4; % number of points to estimate a line
nLines = 2;  % numer of lines to estimate a vanishing point

v = zeros(3,3); % three vanishing points vi = v(:,i)

L = {};
for v_num = 1:3               % loop through vanishing pts to estimate
    L{v_num} = zeros(3,nLines);
    for line_num = 1:nLines   % loop through lines intersecting at
                              % a given vanishing point
        disp(['Line ' num2str(line_num) ' going through v' num2str(v_num)]);
        L{v_num}(:,line_num) = fitLine(im,nPoints);
    end
    v(:,v_num) = findIntersection(L{v_num});
end


% Focal length estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% We want to solve a linear system for s = 1/f^2

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


f = 1 / sqrt(s);
% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Projection center estimation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute [u0;v0;1] as the  orthocenter of v1,v2,v3
% Use orthogonality equations to define a least-square problem and
% solve it

% Your code goes here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


c =  ; % Vector [u0;v0;1]

% End of your code %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

K = [f 0 c(1); 
     0 f c(2); 
     0 0 1];