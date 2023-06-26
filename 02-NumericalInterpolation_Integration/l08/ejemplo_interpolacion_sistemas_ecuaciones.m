%Pares ordenados (xi,yi), i=0,1,...,n
clc; clear;
%x=[1 2 4 6]; y=[2 5 7 -2];
x=[1 2 3]; 
y=log(x);
n=length(x)-1;
A=[];
for k=n:-1:0
  A=[A (x').^k];
end
a=linsolve(A,y');

% Imprimir el polinomio resultante
poly_str = "";
for i = 1:length(a)
    coef = a(i);
    degree = length(a) - i;
    if coef >= 0 && i > 1
        poly_str = sprintf("%s + ", poly_str);
    elseif coef < 0
        poly_str = sprintf("%s - ", poly_str);
        coef = -coef;
    end
    if degree > 0
        poly_str = sprintf("%s%.4f*x^%d", poly_str, coef, degree);
    else
        poly_str = sprintf("%s%.4f", poly_str, coef);
    end
end
disp("Polinomio resultante:")
disp(poly_str)

% Imprimir la matriz aumentada de Vandermonde
disp("Matriz aumentada de Vandermonde:")
counter = 0:1:n;
Vandermonde_augmented = [counter', A, a, y'];
header = "";
column_width = 10;
printf("%s%*s%*s", header, column_width, "n");
for i = n:-1:0
    header = sprintf("%s%*s", header, column_width, sprintf("x^%d", i));
end
header = sprintf("%s%*s%*s", header, column_width, "an", column_width, "yn");
disp(header)
for i = 1:size(Vandermonde_augmented, 1)
    row_str = "";
    for j = 1:size(Vandermonde_augmented, 2)
        row_str = sprintf("%s%*.4f", row_str, column_width, Vandermonde_augmented(i, j));
    end
    disp(row_str)
end

xv=x(1):0.001:x(n+1);
fv=log(xv);
yv=polyval(a,xv); %p(x)=a3*x^3+a2*x^2+a1*x+a0, donde a=[a3 a2 a1 a0]
hold on
plot(xv,yv,'r')
plot(xv,fv,'b')

