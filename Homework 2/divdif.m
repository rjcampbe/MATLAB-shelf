function [coef,table] = divdif (xi, yi)

%
% Construct a divided difference table based on data points (xi,yi).
% Upon return, the Newton interpolation coefficients are in coef
%
% code from Ascher and Greif, A First Course in Numerical Methods, 2011


np1 = length(xi); %"n+1", total number of data points
n   = np1-1;      %degree of interpolating polynomial

% initialize the whole divided difference table
table = zeros(np1,np1); 

% make xi and yi column vectors in case they come in a row vector
%  i.e. this makes sure that xi and yi are np1 x 1 arrays
xi = shiftdim(xi); yi = shiftdim(yi);

%  construct divided difference table one column at a time
table(1:np1,1) = yi;  %0th divided differences
for k = 2:np1
  table(k:np1,k) = (table(k:np1,k-1) - table(k-1:n,k-1)) ./ ...
      (xi(k:np1) - xi(1:np1-k+1));
end

% coeffiencts of Newton polynomial are the diagionals of the table
coef = diag(table); 