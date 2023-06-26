% Definir la función 
f = @(x) (x(1)-2)^4 + (x(1)-2*x(2))^2;

% Definir el gradiente de la función 
grad_f = @(x) [4*(x(1)-2)^3 + 2*(x(1) - 2*x(2)); -4*(x(1) - 2*x(2))];

% Definir el punto inicial
x0 = [0; 0];


% Llamar al método del gradiente conjugado
[x, err, k] = gradient_method(f, grad_f, x0,1e-4,100);

% Mostrar los resultados
display(x);
display(['err = ', num2str(err)]);
display(['k = ', num2str(k)]);
