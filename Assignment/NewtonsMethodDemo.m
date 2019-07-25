

f = @(x) [x(1)^2/9+x(1)*x(2)/3+x(2)^2-1; x(2)-x(1)^2+1];    %%% Function f(x)

Df = @(x) [2*x(1)/9+x(2)/3, x(1)/3+2*x(2); -2*x(1), 1];        %%% Jacobian matrix, Df(x)

x0 = [-2;2]; %%% initial guess

%%% Newton's Method:

for i=1:16
    s = Df(x0)\f(x0);
    changes(i) = norm(s);
    x0 = x0 - s;
end

%%% output to check convergence
changes

%%% output final answer (intersection point)
x0


%%%%% Plots %%%%%%

x = -sqrt(12):0.01:sqrt(12);
y1 = sqrt(1-x.^2/12)-x/6;
y2 = -sqrt(1-x.^2/12)-x/6;
plot(x,y1,'b'); %%% plot the first ellipse
hold on;
plot(x,y2,'b'); %%% plot the second ellipse

y3 = x.^2-1;
plot(x,y3,'r');