%Acceder a los valores de las diagonales de una matriz tridiagonal

A=[1 2 0 0 0 0;
   3 4 5 0 0 0;
   0 6 7 8 0 0;
   0 0 9 1 2 0;
   0 0 0 0 3 4];

a=diag(A)
b=diag(A,1)
c=diag(A,-1)
