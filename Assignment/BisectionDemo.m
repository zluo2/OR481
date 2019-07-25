
a=0;b=1;
tol = 0.5e-6; %%% 6 digit accuracy, .5e-6 is short for .5*10^(-6)

f = @(x) x^3+x-1;

r = BisectionMethod(f,a,b,tol)

CheckingError = abs(f(r))