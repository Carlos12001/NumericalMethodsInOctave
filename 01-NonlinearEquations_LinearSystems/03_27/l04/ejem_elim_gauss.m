function ejem_elim_gauss()
    A = [   1   2   -1; ...
            2   -4  1; ...
            -2  2   -3];
    b = [ -3, -7, 4]';
    A
    b
    [UT, b2] = gauss_upper_triangular(A, b);
    display(fix(UT));
    display(fix(b2));
end

function [UT, b2] = gauss_upper_triangular(A, b)
    AM = [A b]; %matriz aumentada
    m = size(A,1);
    for k = 1 : m
        for i = k+1 : 1 : m
            mk = AM(i,k)/AM(k,k);
            for j = k : 1 : m+1
                AM(i,j) = AM(i,j) - mk*AM(k,j);
            end
        end
    end
    UT = AM(:,1:m);
    b2 = AM(:,m+1);
end

