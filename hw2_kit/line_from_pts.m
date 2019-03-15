function [l] = line_from_pts(p1, p2)
% line_from_pts - compute a line from two points
%  Arguments
%    p1 - first point in homogenous coordinates
%    p2 - second point in homogenous coordinates
% Returns
%  l - line in homogenous coordinates

l = cross(p1,p2);

end

