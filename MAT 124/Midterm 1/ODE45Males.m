clear; clc;
% Parameters (median if range)
N = 16956;
pi = 374;
delta = 1/46;
gamma_c = 8.8 * 10^(-5) - 4.923 * 10^(-3);
YI = 8.8 * 10^(-5) - 4.923 * 10^(-3);
alpha = 1/75;
p = 0.2;
phi = 1/9.5;
Bc = 1 * 10^(-5) - 1.5 * 10^(-3);
BI = 1 * 10^(-5) - 1.5 * 10^(-3);
c = 27.5;

% ODE45
y0 = [12000 50 50]; %initial value
tspan = [1 8];     %time span
a= 0.01;
b= 0.02;
[t,y] = ode45(@(t,y) odefcn(t,y,N,delta,gamma_c,YI,alpha,p,phi,Bc,BI,c), tspan, y0);
%[t,y] = ode45(@(t,y) odefcn(t,y,a, b,0.03,0.01,0.002,0.03,0.05,0.003), tspan, y0);

plot3(y(:,1),y(:,2),y(:,3),"-o")   %plots 3 dimensional data
title('ODE45 for Male Inmates')
xlabel('Susceptible')
ylabel('Colonized')
zlabel('Infected')
function dydt = odefcn(~,y,N,delta,gamma_c,gamma_I,alpha,p,phi,beta_c,beta_I,c)
  dydt = zeros(3,1);
  dydt(1) = pi*(1-gamma_c-gamma_I) + alpha*y(2) - (c*beta_c*y(2).*y(1))./N - ((c*beta_I*y(3)*y(1))/N) - delta*y(1);
  dydt(2) = pi*(gamma_c) + ((c*beta_c*y(2).*y(1))/N) + ((c*beta_I*y(3)*y(1))/N) - alpha*y(2) - p*phi*y(2) - delta*y(2);
  dydt(3) = pi*gamma_I + p*phi*y(2) - delta*y(3);
end