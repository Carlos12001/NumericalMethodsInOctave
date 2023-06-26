function graficar(func, a, b)
    x_value = a:0.01:b;
    f = str2func(["@(x) " func]);
    y_value = f(x_value);

    figure
    plot(x_value, y_value);
    xlabel('x valores', 'FontSize', 24);
    ylabel('y valores', 'FontSize', 24);
    title(['Grafica de funcion ' func], 'FontSize', 36);
    set(gca, 'FontSize', 24);
    grid on;
end