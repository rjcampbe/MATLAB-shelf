%
% temperature data from Ascher and Grief table 10.5 interpolated with
%   global interpolant
%

% data from the table
day  = [3 6 9 12 15 18 21 24 27];
temp = [31.2 32.0 35.3 34.1 35.0 35.5 34.1 35.1 36.0];

% get the coeffients of Newton interpolating polynomial
[coef,~] = divdif (day, temp);

% evaluate the interpolating polynomial 
xd = linspace(1,31,1000);            % whole month
%xd = linspace(day(1),day(end),1000); % only between data points
yt = evalnewt (xd, day, coef);

% plot the results, and plot the data
%
hp=plot(xd,yt,day,temp,'o');
set(hp,'linewidth',3,'markersize',12);
set(gca,'fontsize',16);
xlabel('day');
ylabel('temperature');
legend('interpolant','data','location','south');