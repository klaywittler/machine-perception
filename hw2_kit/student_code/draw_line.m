function [I] = draw_line(I, p1, p2, color)
% Draws the line onto the matrix of the image
% Written for the University of Pennsylvania's Machine Perception course

% YOU SHOULDN'T NEED TO CHANGE THIS
n = 1000;

x = repmat(uint32(linspace(p1(1), p2(1), n)), 1, 3);
y = repmat(uint32(linspace(p1(2), p2(2), n)), 1, 3);
c = repmat([1,2,3],1,n);

I(sub2ind(size(I), y,x,c)) = repmat(color,1,n);

I(sub2ind(size(I), y,x-1,c)) = repmat(color,1,n);
I(sub2ind(size(I), y,x+1,c)) = repmat(color,1,n);
I(sub2ind(size(I), y-1,x,c)) = repmat(color,1,n);
I(sub2ind(size(I), y+1,x,c)) = repmat(color,1,n);

end
