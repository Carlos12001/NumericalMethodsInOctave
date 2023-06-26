function [c,x,k,err] = power_method_eigenvalue(A,x0,
                        tol=eps,maxIter=2500)
    c=1e20;
    x=x0;
    for k=1:maxIter
        y = A*x;
        cn = norm(y,"inf");
        x = 1/cn * y;
        err = abs(c - cn);
        c = cn;
        if err<tol
            break;
        end
    end
end
