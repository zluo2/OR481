function [ x] = newton( f, fp, x0, tol, nmax )

r= 1.000000; %or r = 1.00000000
x(1)=x0;
n = 2;
nfinal = nmax + 1; 
% Store final iteration if tol is reached before N iterations
while (n <= nmax + 1)
    fe = f(x(n - 1));
    fpe = fp(x(n - 1));
    x(n) = x(n - 1) - fe/fpe;
    if (abs(fe) <= tol)
        nfinal = n; % Store final iteration
        break;
    end
    n = n + 1;
end

e = abs(x - r)
end