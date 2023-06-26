function part_1_problem_8()
    func = "log(2 * x + 1)";
    range_n = [1, 2];
    fprintf("fixed_point_method(log(2 * x + 1), [1, 2], 1e-2)\n");
    [xk, err, k] = fixed_point_method18(func, range_n, 1e-2);
    fprintf("\n\n---- Fixed point method ----\n");
    fprintf("xk = %.3f\n", xk);
    fprintf("err = %.2e\n", err);
    fprintf("k = %i\n", k);
end



function [xk, err, k] = fixed_point_method18(func, range_n, tol=1e-9,...
                                             maxIter=2500)  
    if !uniqueness_fixed_point18(func, range_n)
        error("The function does not satisfy the uniqueness of fixed points");
   end

   
    a = range_n(1);

    f = str2func(["@(x) " func]);
    xk = a;
    for k = 1:maxIter
        p_xk = xk;
        xk = f(p_xk);
        err = abs(xk - p_xk);
        fprintf("k=%i: xk = log(2 * %.3f + 1)\n",k, p_xk);
        fprintf("err = %.3f\n", err);
        if err < tol
            break;
        end
    end
end

function check = brouwer_fixed_point18(func, range_n)
    a = range_n(1);
    b = range_n(2);

    check_vector = [find_critical_points18(func, range_n), a, b];

    f = str2func(["@(x) " func]);
    
    images = arrayfun(f, check_vector);

    min_value = min(images);
    max_value = max(images);
    

    check = a <= min_value & min_value <= b & ...
            a <= max_value & max_value <= b;
end


function check = uniqueness_fixed_point18(func, range_n)
    if !brouwer_fixed_point18(func, range_n)
        fprintf(["The function does not satisfy the Brouwer\'s " ... 
            " fixed point theorem\n"]);
        check = false;
        return;
    end
    

    a = range_n(1);
    b = range_n(2);

    f = str2func(["@(x) " func]);

    pkg load symbolic;
    syms x;
    fsym = sym(func);
    fdsym = diff(fsym);

    fd_str = char(fdsym);
    fd = matlabFunction(fdsym);

    check_vector = [a, b, find_critical_points18(fd_str, range_n)];

    images = arrayfun(fd, check_vector);

    min_value = min(images);
    max_value = max(images);

    check = -1 < min_value & min_value < 1 & ...
            -1 < max_value & max_value < 1;

    
end


function critical_points = find_critical_points18(func, range_n)
    a = range_n(1);
    b = range_n(2);
    try
        pkg load symbolic;
        syms x;
        fsym = sym(func);
        fdsym = diff(fsym);
        critical_points = (double(solve(fdsym, x)))';
        critical_points = critical_points(a<=critical_points & ...
                        critical_points<=b);
    catch err
        critical_points = [];
    end
end