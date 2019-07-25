
xs = [-1;1;2;3];
ys = [3;1;3;7];

as = polyinterp(xs,ys);

xplot = -2:.01:4;
yplot = polyeval(as,xplot);

figure;plot(xplot,yplot);
hold on;
plot(xs,ys,'or');
