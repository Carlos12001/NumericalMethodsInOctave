% La funcion exp_t aproxima el valor de e^a
% Sintaxis de la funcion: [sk,error,n]=exp_t(a,iterMax,tol)
% Par metros de entrada:
%         a = n mero real
%         iterMax = n mero entero positivo, que representa la cantidad
%% de iteraciones m ximas del m todo
%         tol =  n mero real positivo, que es el criterio de parada del error,
%%  donde |S_(k+1)-S_(k)|<tol
% Par metros de salida:
%         sk = aproximaci n del valor e^a
%         er = error dado por la formula |S_(k+1)-S_(k)|
%         k = cantidad de iteraciones realizadas

function [sk, er, n] = exp_t(a, iterMax, tol)

  sk=0;

  for n=1:iterMax
    sk_n=sk+a^n/factorial(n);
    if abs(sk_n-sk)<tol
      er=abs(sk_n-sk);
      sk=sk_n;
      break
    end
    er=abs(sk_n-sk);
    sk=sk_n;
  end

end



