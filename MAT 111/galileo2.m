clc; clear; close all;

v0= 900; %initial velocity
for theta = 0.05:0.05:1.5; %initial projectile launch angle
g = 9.8; %gravity constant
c = v0*sin(theta);
a = v0*cos(theta);
N = 100;
t = linspace(0,2*c/g,N); %(left endpoint, right endpoint, grid points - uniformly spaced)
x = a.*t;
y = -g.*t.^2/2+c.*t;
plot(x,y,'r.-')
xlabel('Distance (meters)'),ylabel('Height (meters)'),title('Projectile Motion in Vacuum')
hold on
end
grid on

theta = pi/4;
g = 9.8; %gravity constant
c = v0*sin(theta);
a = v0*cos(theta);
N = 100;
t = linspace(0,2*c/g,N); %(left endpoint, right endpoint, grid points - uniformly spaced)
x = a.*t;
y = -g.*t.^2/2+c.*t;
plot(x,y,'b.-')
xlabel('Distance (meters)'),ylabel('Height (meters)'),title('Projectile Motion in Vacuum')