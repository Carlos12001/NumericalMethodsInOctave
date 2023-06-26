%Encontrar maximo de una funcion en [a,b]
%usando el comando fminbnd
clc; clear; close all

f=@(x) abs(cos(x).*x+1./x);
%f=@(x) abs(log(cos(x)));
a=14; b=16;
x_interv=a:0.01:b;
f_interv=f(x_interv);
figure
plot(x_interv,f_interv)
grid on

faux=@(x) -f(x);
faux_interv=faux(x_interv);
figure
plot(x_interv,faux_interv)
grid on


x=fminbnd(faux,a,b)
f(x)

% Explicacion en Python
% https://docs.scipy.org/doc/scipy/reference/generated/scipy.optimize.fminbound.html


