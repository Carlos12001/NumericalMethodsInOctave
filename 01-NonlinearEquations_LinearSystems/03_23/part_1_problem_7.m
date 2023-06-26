function part_1_problem_7()
    func = "exp(x)+sin(x)-4";
    a = 1;
    b = 2;
    tol = 1e-3;

    [xk, err, k] = biseccion(func,[a, b],tol);
    fprintf("\n----Biseccion----\n")
    fprintf("sk = %.8f \n", xk);
    fprintf("er = %.2e \n", err);
    fprintf("k = %i \n\n", k);


    [xk, err, k] = mynewton(func,a,tol);
    fprintf("\n----Newton-Raphson----\n")
    fprintf("sk = %.8f \n", xk);
    fprintf("er = %.2e \n", err);
    fprintf("k = %i \n\n", k);

    [xk, err, k] = secant(func,[a, b],tol);
    fprintf("\n----Secante----\n")
    fprintf("sk = %.8f \n", xk);
    fprintf("er = %.2e \n", err);
    fprintf("k = %i \n\n", k);

    [xk, err, k] = false_position(func,[a, b],tol);
    fprintf("\n----False Position----\n")
    fprintf("sk = %.8f \n", xk);
    fprintf("er = %.2e \n", err);
    fprintf("k = %i \n\n", k);
end

