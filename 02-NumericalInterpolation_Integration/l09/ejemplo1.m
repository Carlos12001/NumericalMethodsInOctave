%Ejemplo Numerico del Trapecio y Trapecio Compuesto
clc; clear;
f='log(asin(x))/log(x)';
a=0.1; b=0.8;
I1=trapecio(f,a,b)
m=1000;
tic;
I2=trapecio_compuesto(f,a,b,m)
t1=toc
tic
I3=aprox_int_def(f,a,b)
t2=toc
