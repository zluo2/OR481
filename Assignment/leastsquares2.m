clear;clc;close all;
m=3;  %%% fit a line

trueslope = 5;
trueinter = 6;
n = 100;
xs = (0:(10/(n-1)):10)';

ytrue = xs*trueslope+trueinter + 5*sin(xs);
ys = ytrue + 5*randn(size(ytrue));

%%% Build Vandermonde Matrix
A = ones(size(xs));
for i = 1:m-1
    A = [A xs.^i];
end
A = [A sin(xs)];

%%% Normal Equations
AtA = A'*A;
Atb = A'*ys;

x = AtA\Atb;

errors = ys - A*x;

figure;plot(xs,ys,'bo');
xplot = 0:.01:10;
yplot = x(3)*xplot.^2+xplot*x(2)+x(1)+x(4)*sin(xplot);
yplottrue = xplot*trueslope+trueinter+5*sin(xplot);
hold on;
plot(xplot,yplottrue,'k','linewidth',2);
plot(xplot,yplot,'r--','linewidth',2);

figure;plot(xs,errors,'o');

SSE = sum(errors.^2)




