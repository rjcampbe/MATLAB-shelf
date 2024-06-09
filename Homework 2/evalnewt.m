function p = evalnewt (x, xi, coef)

% evaluate at x the interpolating polynomial in Newton form
% based on interpolation points xi and coefficients coef
%
% code from Ascher and Greif, A First Course in Numerical Methods, 2011
%

%input x: can be array of x values
np1 = length(xi);  %"n+1", total number of interpolation points

p = coef(np1)*ones(size(x));
for j=np1-1:-1:1
  p= p.*(x - xi(j)) + coef(j);
end