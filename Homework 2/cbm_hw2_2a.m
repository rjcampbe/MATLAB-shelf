% Christian Molina
% MAT128A - HW 2a
yi = [];
xi = (0:5)/5;
yi = [yi,cos(2*pi*xi)];

[coef,~] = divdif (xi, yi);
xd = linspace(0,5,1000);
yt = evalnewt (xd, xi, coef);

hp=plot(xd,yt,xi,yi,'o');
set(hp,'linewidth',3,'markersize',12);
set(gca,'fontsize',12);
xlabel('x');
ylabel('y');
xlim([-0.05 1.2])
ylim([-1.5 1.5])
hold on;
tp=plot(xd,cos(2*pi*xd));
set(tp,'linewidth',2,'markersize',12);
legend('interpolant','data','theoretical');