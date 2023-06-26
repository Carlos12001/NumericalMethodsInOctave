function [xk,err,k] = secant(func,range_n,tol=1e-9,iterMax=2500)

    xk = 0;

    a = range_n(1);
    b = range_n(2);

    f=str2func(["@(x) " func]);

    for k=1:iterMax
        xk = b - (b-a)/(f(b)-f(a)) * f(b);
        a = b;
        b = xk;

        err=abs(f(xk));
        if err < tol
            break
        end

    end

end
