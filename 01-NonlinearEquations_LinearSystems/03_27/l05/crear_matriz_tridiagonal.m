%Crear Matriz Tridiagonal

clc; clear;

m=10;
a=randi([1 10],[1,m]);
b=randi([1 10],[1,m-1]);
c=randi([1 10],[1,m-1]);

%Metodo 1: Recordiendo fila por fila:

A=zeros(m,m);

%Primera Fila
A(1,1)=a(1); A(1,2)=b(1);

for i=2:m-1
  A(i,i)=a(i);
  A(i,i+1)=b(i);
  A(i,i-1)=c(i-1);
end

%Ultima Fila
A(m,m)=a(m); A(m,m-1)=c(m-1);

%Metodo 2: Usando el comando diag de Octave/MATLAB

A=diag(a,0)+diag(b,1)+diag(c,-1);

