%{
  Aproximacion del cero de la funcion func utilizando el metodo
  de la Biseccion.
  @param a, b = intervalo [a,b] donde se busca el cero
  @param func = funcion a la que se le aproxima el cero
  @param tol = tolerancia de aproximacion
  @param iterMax = iteraciones maximas a realizar
  @return xk = aproximacion del cero
  @return error = error del metodo dado por |func(xk)|
  @return k = iteraciones realizadas 
  %}
function [xk,error,k]=biseccion(a,b,func,tol,iterMax)
  % Texto a Numerico
  f=str2func(['@(x)' func]);

  if f(a)*f(b)<0
    for k=1:iterMax
      xk=(a+b)/2;
      if f(a)*f(xk)<0
        b=xk;
      else
        a=xk;
      end
      error=abs(f(xk));
      if error<tol
        break
      end
    end
  else
    xk='N/A';
    error='N/A';
    k='N/A'
    display('No se cumple la condicion de Bolzano con los datos dados')
  end


end

