%{
  % Aproximacion del cero de la funcion func utilizando el metodo de la Newton
  %
  % Estructura: [xk,error,k]=newton(x0,func,tol,iterMax)
  %
  % Parametros: x0 = valor inicial
  %             func = funcion a la que se le aproxima el cero
  %             tol = tolerancia de aproximacion
  %             iterMax = iteraciones maximas a realizar
  %             xk = aproximacion del cero
  %             error = error del metodo dado por |func(xk)|
  %             k = iteraciones realizadas
  %}
function [xk,error,k] = mynewton(func,x0,tol=1e-9,iterMax=2500)
  pkg load symbolic;

  % Texto a Simbolico
  fsym=sym(func);
  fdsym=diff(fsym);

  % Simbolico a Numerico
  f=matlabFunction(fsym);
  fd=matlabFunction(fdsym);

  xk=x0;


  for k=1:iterMax
    if fd(xk)==0
      msg = sprintf(["f\'(xk = %.2f) = " ...
                    "0"], ...
                    xk);
      error(msg);
      break
    end
    xk=xk-f(xk)/fd(xk);
    error=abs(f(xk));
    if error<tol
      break
    end
  end

end
