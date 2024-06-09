% Natural spline coefficients
% Input: x - n by 1 vector of the nodes
% y - n by 1 vector with the corresponding function values
% Output: P - n-1 by 4 matrix
% the elements of the ith row of P give the coefficients
% of the cubic between [x(i),x(i+1)] as
% Si(x) = P(i,1) + P(i,2)*(x-x(i))
% + P(i,3)*(x-x(i))^2 + P(i,4)*(x-x(i))^3
%
function P=naturalspline(x,y);
    n = length(x);
    % force x and y to be column vectors
    %
    x = shiftdim(x); y = shiftdim(y);
    % compute the distances between the points
    %
    h = x(2:n) - x(1:n-1);
    % set up the tridiagonal linear system to solve
    %
    d0 = 2*(h(1:n-2)+h(2:n-1)); % diagonal
    dm1 = h(2:n-1); % subdiagional, note dm1(end) not used below
    d1 = h(1:n-2); % superdiagional, note d1(1) not used below
    % form the matrix and rhs
    %
    A = spdiags([dm1 d0 d1],-1:1,n-2,n-2);
    b = 3*(y(3:n)-y(2:n-1))./h(2:n-1) - 3*(y(2:n-1)-y(1:n-2))./h(1:n-2);
    % solve the linear system
    %
    z = A\b;
    % append the natural boundary conditions
    %
    z = [0; z; 0];
    % compute the coefficients
    %
    P = zeros(n-1,4);
    P(:,1) = y(1:n-1);
    P(:,2) = (y(2:n) -y(1:n-1))./h - h.*(z(2:n)+2*z(1:n-1))/3;
    P(:,3) = z(1:n-1);
    P(:,4) = (z(2:n)-z(1:n-1))./(3*h);
