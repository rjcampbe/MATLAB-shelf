%
% given data at points (xi,yi), construct and evaluate the Newton
% interpolating polynomial at the points x.
%
function y = newton_interp(x,xi,yi)
  
  [coef,~] = divdif (xi, yi);
  y = evalnewt (x, xi, coef);
  
end