function [V,D,k,err] = qr_method(A0,tol=eps,iterMax=2500)
    A = A0;
    U = eye(size(A));
    for k=1:iterMax
        [Q,R] = qr(A);
        A = R*Q;
        U = U*Q;
        Dn = diag(A);
        if k!=1
            err = norm(D-Dn);
            if err<tol
                break;
            end
        end
        D = Dn;
    end
    D = diag(Dn);
    V = U;
end
