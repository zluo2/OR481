
f = @(x) tan(sin(x.^3));

n = 3;
%xs = (3*(0:(n-1))/(n-1))';
xs = (3/2+3/2*cos((1:2:2*n-1)*pi/(2*n)))';
ys = f(xs);


as = polyinterp(xs,ys);

xplot = 0:.01:3;
yplot = polyeval(as,xplot);

E = yplot - f(xplot);
max(abs(E))
    
figure;
semilogy(xplot, abs(E));


figure;plot(xplot,yplot,'r--');
hold on;
plot(xplot,f(xplot),'k');
plot(xs,ys,'or');ylim([-5 5]);


