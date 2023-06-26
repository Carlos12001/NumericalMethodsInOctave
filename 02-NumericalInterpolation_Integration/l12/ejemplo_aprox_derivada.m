function ejemplo_aprox_derivada()
  clc; clear;
  f=@(x)log(asin(x))./log(x);
  a=0.5;
  aprox=aprox_derivada(f,a)
end

function aprox=aprox_derivada(f,a)

  iterMax=1000;
  tol=1e-5;
  h=1e-1;
  aprox=(f(a+h)-f(a))/h;
  %aprox=(f(a+h)-f(a-h))/(2*h);

  for k=2:iterMax
    h=10^(-k);
    aproxNew=(f(a+h)-f(a))/h;
    %aproxNew=(f(a+h)-f(a-h))/(2*h);
    er=abs(aproxNew-aprox)
    if er<tol
      break
    end
    aprox=aproxNew;
  end

end



