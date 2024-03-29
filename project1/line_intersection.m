function [pt] = line_intersection(l1, l2)
%line_intersection - compute the intersection of two lines
% Arguments
%   l1 - first line in homogenous coordinates
%   l2 - second line in homogenous coordinates
% Returns
%   pt - intersection point in normalized homogenous coordinates
%         if it is a point at infinity don't normalize

    ptN = cross(l1,l2);
    
    if ptN(3) ~= 0
        pt = ptN./ptN(3);
    else
        pt = ptN; 
    end

end
