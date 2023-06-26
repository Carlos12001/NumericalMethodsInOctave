function f_d_str =  derivada(func)
    pkg load symbolic;
    f_sym = sym(func);
    fd_sym = diff(f_sym);

    f = matlabFunction(f_sym);
    fd = matlabFunction(fd_sym);

    f_d_str = func2str(fd);
end