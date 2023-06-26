function [x, err, k] = pseudeo_inverse(A, b, tol=1e-9, max_iter=2500)
    alpha = norm(A, 'fro');
    pInvA = 1 / (alpha^2) * A';
    row_num = size(A, 1);
    Im_2 = 2*eye(row_num);

    for k = 1:max_iter
        pInvA = pInvA*(Im_2 -  A * pInvA);
        err = norm(A*pInvA*A - A, 'fro');
        if err < tol
            break;
        end
    end

    fprintf("pseudo inverse A is: \n");
    display(pInvA);

    x = pInvA * b;

    err = norm(A*x - b, 'fro');

end