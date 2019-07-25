a=0;b=1;
tol = 0.5e-10; %%% 10 digit accuracy, .5e-10 is short for .5*10^(-10)

f = @(x) 3*cos(2*x)*cos(4*x)-2*cos(6*x)*cos(3*x)-6*cos(2*x)*(sin(2*x))^2-5*cos(3*x)+7/2;

r = BisectionMethod(f,a,b,tol)

CheckingError = abs(f(r))