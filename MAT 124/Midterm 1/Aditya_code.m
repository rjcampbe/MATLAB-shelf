%% Parameters for Males
clear; clc;

N = 16956;
pi = 374;
delta = 1/46;
Yc = 8.8 * 10^(-5) - 4.923 * 10^(-3);
YI = 8.8 * 10^(-5) - 4.923 * 10^(-3);
alpha = 1/75;
P = 0.2;
phi = 1/9.5;
Bc = 1 * 10^(-5) - 1.5 * 10^(-3);
BI = 1 * 10^(-5) - 1.5 * 10^(-3);
c = 27.5;

% dS/dt = pi*(1-Yc-YI) + ((inv_alpha(C) - c*Bc*C*S)/N) - ((c*BI*I*S)/N) - delta*s;
% dC/dt = pi*(Yc) + ((c*Bc*C*S)/N) + ((C*BI*I*S)/N) - alpha*C - P*phi*C - delta*C;
% dI/dt = pi*YI + P*phi*C - delta*I;

function dydt = odefcn(S,C,I,N,delta,Yc,YI,alpha,P,phi,Bc,BI,c)
  dydt = zeros(3,1);
  dydt(1) = pi*(1-Yc-YI) + ((inv_alpha(C) - c*Bc*C*S)/N) - ((c*BI*I*S)/N) - delta*s;
  dydt(2) = pi*(Yc) + ((c*Bc*C*S)/N) + ((C*BI*I*S)/N) - alpha*C - P*phi*C - delta*C;
  dydt(3) = pi*YI + P*phi*C - delta*I;
end

