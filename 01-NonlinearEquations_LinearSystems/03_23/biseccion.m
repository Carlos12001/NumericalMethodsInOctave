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
function [xk,err,k] = biseccion(func,range_n,tol=1e-9,iterMax=2500)
    xk = 0;

    a = range_n(1);
    b = range_n(2);

    f=str2func(["@(x) " func]);

    if !(f(a)*f(b) < 0)
        error('No se cumple la condicion de Bolzano con los datos dados');
    end

    for k=1:iterMax
         xk = (a+b)/2;

        if f(a)*f(xk) < 0
            b = xk;
        else
            a = xk;
        end

        err=abs(f(xk));

        if err < tol
            break
        end

    end

end

