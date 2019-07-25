clear;clc;close all;

X = csvread('udata.csv');
T = (2010:1/12:2018-1/12)';

S = mean(X,2)-mean(X(:));
Y = X - repmat(S,1,8);
Y = Y(:);

m=3;  %%% fit a curve 
%%% Build Vandermonde Matrix
A = ones(size(T));
for i = 1:m-1
    A = [A (T-2010).^i];
end
%%% Normal Equations
AtA = A'*A;
Atb = A'*Y;

a = AtA\Atb;

A2 = ones(size(T));
for i = 1:m-1
    A2 = [A2 (T-2010).^i];
end
A2 = [A2 sin(pi/2*(T-2010))];
A2 = [A2 cos(pi/2*(T-2010))];
A2 = [A2 sin(pi*(T-2010))];
A2 = [A2 cos(pi*(T-2010))];
A2 = [A2 sin(2*pi*(T-2010))];
A2 = [A2 cos(2*pi*(T-2010))];
%%% Normal Equations
AtA2 = A2'*A2;
Atb2 = A2'*Y;

a2 = AtA2\Atb2;


plot(T,X(:));
hold on;
plot(T,Y);

tplot = 2010:.01:2025;
yplot = (tplot-2010).^2*a(3) + (tplot-2010)*a(2) + a(1);
plot(tplot,yplot,'r--','linewidth',2);

yplot2 = (tplot-2010).^2*a2(3) + (tplot-2010)*a2(2) + a2(1) + a2(4)*sin(pi/2*(tplot-2010)) + a2(5)*cos(pi/2*(tplot-2010)) + a2(6)*sin(pi*(tplot-2010)) + a2(7)*cos(pi*(tplot-2010)) + a2(8)*sin(2*pi*(tplot-2010)) + a2(9)*cos(2*pi*(tplot-2010));
plot(tplot,yplot2,'b--','linewidth',2);

errors = Y - A*a;
SSE = sum(errors.^2)

errors = Y - A2*a2;
SSE2 = sum(errors.^2)

