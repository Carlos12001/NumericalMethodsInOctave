
function [L, U] = lu_factorization(A)
    m = size(A, 1);
    L = eye(m);
    U = zeros(m);
    for k = 1:m % inicia en 1 y termina en m
        for i = k+1:m % inicia en k+1 osea la fila de abajo y termina en m osea la ultima fila
            L(i,k) =    A(i,k)/A(k,k); % genera el multiplo de la fila k para la fila i
            for j = 1:m % inicia en 1 y termina en m osea la ultima columna
                A(i,j) = A(i,j) - L(i,k)*A(k,j); % genera la nueva fila i eso quiere decir que va a ir restando el multiplo de la fila k a la fila i, ejemplo Fila 1 - 2*Fila 2
            endfor
        endfor
    endfor
    U = A;
endfunction

function x=lu_sust_atras(A,b)
  m=length(b);
  x = zeros(m,1);
  for i = m:-1:1 % inicia en m y termina en 1
    aux=0;
    for j=i+1:m % llega hasta m osea lo de la derecha de la diagonal
      aux += A(i,j) * x(j);
    endfor
    x(i)=(1/A(i,i))*(b(i)-aux);
  endfor
endfunction

function x=lu_sust_delante(A,b)
  m=length(b);
  x = zeros(m,1);
  for i = 1:m % inicia en 1 y termina en m
    aux=0;
    for j=1:i-1 %llega hasta i-1 osea lo de la izquierda de la diagonal
      aux += A(i,j) * x(j);
    endfor
    x(i)=(1/A(i,i))*(b(i)-aux);
  endfor
endfunction

function x = lu_solve(A, b)
    [L, U] = lu_factorization(A);
    y = lu_sust_delante(L, b);
    x = lu_sust_atras(U, y);
endfunction