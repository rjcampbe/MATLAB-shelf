clc; clear; close all;
x = linspace(-2,1,1000);
y = linspace(-1,1,1000);
N = length(x); 
M = length(y);
maxiter = 100;
i = sqrt(-1);
for j = 1:N
    for k = 1:M
        c = x(j) + i*y(k); %each point in C
        z = 0;
        iter = 0;
        while (z.^2) < 5 && iter < maxiter
            z=z.^2+c;
            iter = iter + 1;
        end
        out(j,k) = iter;
    end
end
[x,y] = meshgrid(x,y);
pcolor(x,y,out'),shading interp, colormap bone