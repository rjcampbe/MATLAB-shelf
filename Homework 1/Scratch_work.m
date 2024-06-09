%% Riemann midpoint rule

%function handle for integrand
f=@(x) (x.*exp(-(20*x).^2));

%exact integral
I=(1-exp(-4))/800;
J = integral(f,0,0.1)
fprintf('Exact Integral = %e\n', I);
fprintf('Exact Integral = %e\n', J);

%x values for integration
x0=0; 
x1=0.1;

%number of subintervals
Nvals=2.^(5:12);

%vectors for storing errors
E_abs_mid=zeros(length(Nvals),1);
E_rel_mid=zeros(length(Nvals),1);
E_abs_trap=zeros(length(Nvals),1);
E_rel_trap=zeros(length(Nvals),1);

%loop over subinterval sizes
for k=1:length(Nvals)
    N=Nvals(k);
    dx=(x1-x0)/N;    %size of subinterval
    x=(1:N)*dx;      %right hand endpoints
    
    Sn=dx*sum(f(x));    %Riemann sum 
    
    E_abs_mid(k)=abs(Sn-I);    %absolute error
    E_rel_mid(k)= E_abs(k)/I;     %relative error
    
    %Midpoint rule section
    
    
    
    %Trapezoid rule section
    
    
end


columns={'N', 'Absolute Error', 'Relative Error'};
ErrorsT=table(Nvals', E_abs, E_rel, 'VariableNames', columns)


%% Plot refinement study for Midpoint Rule

colorp=[0.4940, 0.1840, 0.5560]; %define some colors I like to use
colorlb=[0.3010, 0.6450, 0.9930];
colorg=[0.4660, 0.6740, 0.1880];
colordb=	[0, 0.4470, 0.7410];

%make O(delta x) line 
Cplot1=0.01;
dxforplot=1./Nvals;
yforplot1=Cplot1*dxforplot.^1;

% %make O(delta x^2) line
% Cplot2=50;
% yforplot2=Cplot2*dxforplot.^2;

figure;
P1=loglog(Nvals', E_rel, 'o-', 'Color', colorlb); %plot error
hold on;
%plot and label line with slope 1
loglog(Nvals(3:5), yforplot1(3:5),'LineWidth', 2, 'Color', colorg);  
text(200, 1/50000, '\Delta x', 'Color', colorg, 'FontSize', 16);
% loglog(Nvals(3:5), yforplot2(3:5),'LineWidth', 2, 'Color', colorg);  
% text(200, 1/500, '\Delta x^2', 'Color', colorg, 'FontSize', 16);
hold off
title('Relative Error Refinement Study')
xlabel('Number of Subintervals');
ylabel('Relative Errors')
axis([20 4500 10^(-6) 10^(-1)])
set(gca, 'fontsize', 14);
set(P1, 'linewidth', 3, 'markersize', 9);

%% Riemann midpoint rule

%function handle for integrand
f=@(x) (x.*exp(-(20*x).^2));

%exact integral
I=(1-exp(-4))/800;
J = integral(f,0,0.1)
fprintf('Exact Integral = %e\n', I);
fprintf('Exact Integral = %e\n', J);

%x values for integration
x0=0; 
x1=0.1;

%number of subintervals
Nvals=2.^(5:12);

%vectors for storing errors
E_abs_mid=zeros(length(Nvals),1);
E_rel_mid=zeros(length(Nvals),1);
E_abs_trap=zeros(length(Nvals),1);
E_rel_trap=zeros(length(Nvals),1);

%loop over subinterval sizes
for k=1:length(Nvals)
    N=Nvals(k);
    dx=(x1-x0)/N;    %size of subinterval
    x=(1:N)*dx;      %right hand endpoints
    
    Sn=dx*sum(f(x));    %Riemann sum 
    
    E_abs_mid(k)=abs(Sn-I);    %absolute error
    E_rel_mid(k)= E_abs(k)/I;     %relative error
    
    %Midpoint rule section
    
    
    
    %Trapezoid rule section
    
    
end


columns={'N', 'Absolute Error', 'Relative Error'};
ErrorsT=table(Nvals', E_abs, E_rel, 'VariableNames', columns)


%% Plot refinement study for Midpoint Rule

colorp=[0.4940, 0.1840, 0.5560]; %define some colors I like to use
colorlb=[0.3010, 0.6450, 0.9930];
colorg=[0.4660, 0.6740, 0.1880];
colordb=	[0, 0.4470, 0.7410];

%make O(delta x) line 
Cplot1=0.01;
dxforplot=1./Nvals;
yforplot1=Cplot1*dxforplot.^1;

% %make O(delta x^2) line
% Cplot2=50;
% yforplot2=Cplot2*dxforplot.^2;

figure;
P1=loglog(Nvals', E_rel, 'o-', 'Color', colorlb); %plot error
hold on;
%plot and label line with slope 1
loglog(Nvals(3:5), yforplot1(3:5),'LineWidth', 2, 'Color', colorg);  
text(200, 1/50000, '\Delta x', 'Color', colorg, 'FontSize', 16);
% loglog(Nvals(3:5), yforplot2(3:5),'LineWidth', 2, 'Color', colorg);  
% text(200, 1/500, '\Delta x^2', 'Color', colorg, 'FontSize', 16);
hold off
title('Relative Error Refinement Study')
xlabel('Number of Subintervals');
ylabel('Relative Errors')
axis([20 4500 10^(-6) 10^(-1)])
set(gca, 'fontsize', 14);
set(P1, 'linewidth', 3, 'markersize', 9);