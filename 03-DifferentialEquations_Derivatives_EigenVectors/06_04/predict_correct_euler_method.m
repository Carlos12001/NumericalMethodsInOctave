function [x,y] =  predict_correct_euler_method(func,
                                    x0,y0,a,b,m)
    h = (b-a)/(m-1);
    x = a:h:b;
    f =  str2func(["@(x,y) " func]);
    y = [y0];
    z = [0];
    for n=1:length(x)-1
        z(n+1) = y(n) + h*f(x(n), y(n));
        y(n+1) = y(n) + h*(f(x(n),y(n))+f(x(n+1),z(n+1)))/2;
    end
end