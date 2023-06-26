function [max] = my_max_func(func, a, b)
    f = str2func(["@(x)" func]);
    f_interv = @(x) -f(x);
    max = fminbnd(f_interv, a, b);
end