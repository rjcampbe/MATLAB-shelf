% Using legendrerootsandw function to find xj and wj for Gauss Legednre
% Quadrature on [a,b]

a=-1;
b=1;

m=10;  %Number of Points for Gauss-Legednre Quadrature
tol=10^(-15);
[x,w]=legendrerootsandw(m, a,b, tol)

