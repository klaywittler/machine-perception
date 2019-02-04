function [vanishing_pt, top_pt, bottom_pt] = compute_ref_line_segment(ref, ll, lr, ur, ul)
% compute_ref_line_segment
%
%  This function finds the end points of the line segment
%   where the ref is located on the field. The results will
%   be used to plot the virtual line onto the field.
%
%  Arguments
%   ref - point of ref on the field
%   ll - lower left point of rectangle in frame
%   lr - lower right point of rectangle in frame
%   ur - upper right point of rectangle in frame
%   ul - upper left point of rectangle in frame
%
%  Returns
%   vanishing_pt - scene vanishing point
%   top_pt - top of ref's line segment
%   bottom_pt - bottom of ref's line segment

vanishing_pt = [];
top_pt  = [];
bottom_pt = [];

end
