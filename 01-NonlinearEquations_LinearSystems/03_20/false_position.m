function [xk, err, n] = false_position(func, range_n, tol = 1e-8, iterMax = 2500)
    xk = 0;

    a = range_n(1);
    b = range_n(2);

    f=str2func(["@(x) " func]);

    if !(f(a)*f(b) < 0)
        error('No se cumple la condicion de Bolzano con los datos dados')
    end

    for n=1:iterMax
        xk = b - (b-a)/(f(b)-f(a)) * f(b);

        if f(a)*f(xk) < 0
            b = xk;
        else
            a = xk;
        end

        err=abs(f(xk));

        if err < tol
            break
        end

    end

end
