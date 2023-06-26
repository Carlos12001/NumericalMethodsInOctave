function [T] = tri_diagonal(n)
    d = 5*ones(n, 1); % Vector de la diagonal principal
    a_sub = 2*ones(n-1, 1); % Vector de la subdiagonal
    a_super = 10*ones(n-1, 1); % Vector de la superdiagonal
    T = diag(d, 0) + diag(a_sub, -1) + diag(a_super, 1);
end 
