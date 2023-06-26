function thomas_Diana()

  n=5;
  %Crear Matriz A
  A = matriz_tridiag(n);
  %Crear Vector
  d = zeros(n,1);
  d(1)=-12;
  d(n)=-12;
  for i = 2:n-1
    d(i)=-14;
  endfor
  y = linsolve(A, d)
  x = thomas(A,d)

end

function [x] = thomas(A,d)
  n = size(A,1);
  x = zeros(n,1);
  p = vector_p(A);
  q =  vector_q(A,p,d);
  x(n) = q(n);
  for i = n-1:-1:1
    x(i) = q(i)-p(i)*x(i+1);
  endfor
end

function [p] = vector_p(A)
  n = size(A,1); %cantidad de filas
  p = zeros(n-1,1); %inicializa vector p
  p(1) = A(1,2)/A(1,1);
  for i = 2:n-1
    p(i) = (A(i,i+1))/(A(i,i)-p(i-1)*A(i,i-1));
  endfor
end

function [q] = vector_q(A,p,d)
  n = size(A,1); %cantidad de filas
  q = zeros(n,1); %inicializa vector p
  q(1) = d(1)/A(1,1);
  for i = 2:n
    q(i) = (d(i)-q(i-1)*A(i,i-1))/(A(i,i)-p(i-1)*A(i,i-1));
  endfor
end



