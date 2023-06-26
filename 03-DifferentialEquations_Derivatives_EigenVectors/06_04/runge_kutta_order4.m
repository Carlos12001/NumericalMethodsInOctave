function [x,y] = runge_kutta_order4(func,x0,y0,a,b,m)
    h = (b-a)/(m-1);
    x = a:h:b;
    f = str2func(["@(x,y) " func]);
    y = [y0];
    for n=1:length(x)-1
        k1 = f(x(n),y(n));
        k2 = f(x(n)+h/2,y(n)+h*k1/2);
        k3 = f(x(n)+h/2,y(n)+h*k2/2);
        k4 = f(x(n)+h,y(n)+h*k3);
        y(n+1) = y(n) + h/6*(k1+2*k2+2*k3+k4);
    end
end