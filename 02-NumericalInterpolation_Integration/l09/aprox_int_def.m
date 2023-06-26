function I=aprox_int_def(f,a,b, tol=1e-16,iterMax=1e10)
  for k=1000:iterMax
    Inew=simpson_compuesto(f,a,b,k);
    if k>1000
      er=abs(Inew-I);
      if er<tol
        I=Inew;
        break;
      end
    end
    I=Inew;
  end
end

