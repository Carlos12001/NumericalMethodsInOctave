%%% Ejemplo del método de Thomas

clc; clear;

%% Paso 1: Crear matriz A y vector d

n=100;

A=matriz_tridiag(n);
d=[-12 -14*ones(1,n-2) -12]';

%% Paso 2: Obtener diagonales de la matriz A

a=[0; diag(A,-1)];
b=diag(A,0);
c=diag(A,1);

%Paso 3: Calcular vectores p y q

p=zeros(n-1,1);
q=zeros(n,1);

p(1)=c(1)/b(1);
q(1)=d(1)/b(1);

for i=2:n-1
  p(i)=c(i)/(b(i)-p(i-1)*a(i));
  q(i)=(d(i)-q(i-1)*a(i))/(b(i)-p(i-1)*a(i));
end

q(n)=(d(n)-q(n-1)*a(n))/(b(n)-p(n-1)*a(n));

%Paso 4: Calcular vector solución x

x=zeros(n,1);

x(n)=q(n);

for i=n-1:-1:1
  x(i)=q(i)-p(i)*x(i+1);
end

x

