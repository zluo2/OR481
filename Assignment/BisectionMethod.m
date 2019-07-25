function r = BisectionMethod(f,a,b,tol )
%BISECTIONSOLVER Summary of this function goes here
%   Detailed explanation goes here
    k=ceil(log((b-a)/tol)/log(2)-1)
    fa=f(a);
    fb=f(b);
    if (sign(fa)*sign(fb)>0)
        r=NaN;
        return;
    end
    for i = 1:k
        m = (a+b)/2;
        fm = f(m);
        if (sign(fa)*sign(fm)>0)
            a=m;
            fa=fm;
        else
            b=m;
            fb=fm;
        end
    end
    r = (a+b)/2;
end

