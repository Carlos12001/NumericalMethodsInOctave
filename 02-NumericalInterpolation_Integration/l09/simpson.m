function I=simpson(f,a,b)
  %%%% Comentar la funcion correctamente
  fnum=str2func(['@(x)' f]);
  I=(b-a)/6*(fnum(a)+4*fnum((a+b)/2)+fnum(b));
end

