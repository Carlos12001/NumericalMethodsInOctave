function part_1_problem_5()
    [xk, err, k] = false_position2("49/75*x*(1-exp(-135/x))-30",[40, 80],1-9, 3);
    fprintf("sk = %.8f \n", xk);
    fprintf("er = %.2e \n", err);
    fprintf("k = %i \n", k);
end



function [xk, err, n] = false_position2(func, range_n, tol = 1e-8, iterMax = 2500)
    xk = 0;

    a = range_n(1);
    b = range_n(2);

    f=str2func(["@(x) " func]);

    if !(f(a)*f(b) < 0)
        error('No se cumple la condicion de Bolzano con los datos dados')
    else
        fprintf("Cumple Bolzano ya que\n");
        fprintf("f(a=%.4f) = %.4f \nf(b=%.4f) = %.4f \n", a, f(a), b, f(b));
        fprintf("f(a)*f(b) = %.4f < 0\n", f(a)*f(b));
    end

    fprintf("\n\n----Comienza iteraciones----\n\n");

    for n=1:iterMax
        fprintf("\nk = %i\n", n);
        fprintf("f(a=%.4f) = %.4f \nf(b=%.4f) = %.4f \n", a, f(a), b, f(b));
        fprintf("f(a)*f(b) = %.4f < 0\n", f(a)*f(b));
        xk = b - (b-a)/(f(b)-f(a)) * f(b);

        if f(a)*f(xk) < 0
            b = xk;
            fprintf("b = xk = %.4f \n", xk);
        else
            fprintf("a = xk = %.4f \n", xk);
            a = xk;
        end

        err=abs(f(xk));

        if err < tol
            break
        end

    end

end


