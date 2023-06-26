function ejemplo_gauss()
  clc; clear;
  f=@(x) exp(-x.^2);
  a=-2;
  b=2;
  n=4;
  y=cuadratura_gauss(f,a,b,n)
end


function [x,w]=pesos_x_gauss(n)

  switch (n)
  case 2
    x=[-0.5773502691896257 0.5773502691896257];
    w=[1 1];
  case 3
    x=[0  -0.7745966692414834 0.7745966692414834];
    w=[0.8888888888888888 0.5555555555555556 0.5555555555555556]
  case 4
    x=[-0.3399810435848563 0.3399810435848563 -0.8611363115940526 0.8611363115940526];
    w=[0.6521451548625461 0.6521451548625461 0.3478548451374538 0.3478548451374538];
  endswitch

end

function   y=cuadratura_gauss(f,a,b,n)

  g=@(x) ((b-a)/2)*f((b-a)/2*x+(b+a)/2);
  [x,w]=pesos_x_gauss(n);
  y=0;
  for i=1:n
    y=y+w(i)*g(x(i));
  end

  % y=sum(w.*g(x));

end

