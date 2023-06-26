fprintf("e = %.8f \n", exp(1));
[sk, er, n] = exp_t(1, 1000, 1e-8);
fprintf("sk = %.8f \n", sk);
fprintf("er = %.2e \n", er);
fprintf("n = %i \n", n);
