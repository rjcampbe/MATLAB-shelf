y0 = [0.1 1 0.5]; %initial value
tspan = [0 10];     %time span
a= 0.01;
b= 0.02;
[t,y] = ode45(@(t,y) odefcn(t,y,a, b,0.03,0.01,0.002,0.03,0.05,0.003), tspan, y0);

plot3(y(:,1),y(:,2),y(:,3))   %plots 3 dimensional data