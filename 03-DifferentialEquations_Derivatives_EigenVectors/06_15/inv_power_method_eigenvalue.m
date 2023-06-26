function [c,x,k,err] = inv_power_method_eigenvalue(A,x0,
                        tol=eps,maxIter=2500)
    x = x0;
    c = 1e20;
    for k=1:maxIter
        y = linsolve(A,x);;
        cn = norm(y,"inf");
        x = y./cn;
        err = norm(cn-c);
        c = cn;
        if err < tol
            break
        end
    end
end