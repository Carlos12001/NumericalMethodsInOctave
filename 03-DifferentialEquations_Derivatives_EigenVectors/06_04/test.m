function test
    clc; close all; clear;
    x0 = 0;
    y0 = 0.5;
    a = 0;
    b = 2;
    m = 6;
    func = "y - x^2 + 1";
    [x, y] = euler_method(func,x0,y0,a,b,m);

    [x_pc, y_pc] = predict_correct_euler_method(func,x0,y0,a,b,m);

    [x_rk4, y_rk4] = runge_kutta_order4(func,x0,y0,a,b,m);

    % Obtiene los coeficientes de los polinomios de interpolacion
    poly_euler = polyfit(x, y, m-1);
    poly_euler_pc = polyfit(x_pc, y_pc, m-1);
    poly_rk4 = polyfit(x_rk4, y_rk4, m-1);

    % Imprime los coeficientes de los polinomios de interpolacion
    disp('Polinomio de interpolacion para el método de Euler: ');
    disp(poly_euler);
    disp('Polinomio de interpolacion para el método de Euler de predicción-corrección: ');
    disp(poly_euler_pc);
    disp('Polinomio de interpolacion para el método de Runge-Kutta de orden 4: ');
    disp(poly_rk4);


    % Solucion Analitica del Problema
    % y =  (x+1)^2 - 0.5*exp(x)
    xv=0:0.000001:2;
    yv=(xv+1).^2-0.5*exp(xv);

    % Grafico
    figure;
    grid on;
    hold on;
    set(gca,"FontSize",24);
    title("Solution to y' = y - x^2 + 1 (\\alpha)", "interpreter", 
    "tex");

    xlabel("x","FontSize",36);
    ylabel("y","FontSize",36);


    stem(x,y,"r","DisplayName","Euler Method Points","filled");
    plot(x,y,"r","HandleVisibility","off");  
    % "HandleVisibility" off para evitar que se repita en la leyenda

    h = stem(x_pc,y_pc,"Color", [0.2824, 0.6706, 0.2157],"DisplayName",
        "Predict-Correct Euler Method Points","filled");
    set(h, 'MarkerFaceColor', [0.2824, 0.6706, 0.2157]);
    plot(x_pc,y_pc,"Color", [0.2824, 0.6706, 0.2157],"HandleVisibility","off");

    h = stem(x_rk4,y_rk4,"Color", [0.9294, 0.6941, 0.1255],"DisplayName",
        "Runge-Kutta 4 Method Points","filled");
    set(h, 'MarkerFaceColor', [0.9294, 0.6941, 0.1255]);
    plot(x_rk4,y_rk4,"Color", [0.9294, 0.6941, 0.1255],"HandleVisibility","off");

    
    plot(xv,yv,"b","DisplayName","Analytical Solution");

    legend show;
    legend("Location","northwest");

end
