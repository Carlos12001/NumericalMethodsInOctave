function [x, err, k] = gradient_method(f, grad_f, x0, tol=eps, iterMax=2500)
    x = x0;
    g = grad_f(x);
    d = -g;
    for k = 1:iterMax
        alpha = Wolfe_Condition(f, grad_f, x, d);
        x = x + alpha*d;
        g_old = g;
        g = grad_f(x);
        beta = (norm(g))^2 / (norm(g_old))^2; 
        d = -g + beta*d;
        err = norm(g);
        if err < tol
            break
        end
    end
    
end

function alpha = Wolfe_Condition(f, grad_f, x, d)
    iterMax2 = 100;
    g = grad_f(x);
    for j = 1:iterMax2
        c = 0.5^j;
        if f(x + c*d) - f(x) < 0.5*c*(g')*d
            alpha = c;
            break;
        end
    end
end
