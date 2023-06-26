clc; clear
close all
tiempo1=[]; tiempo2=[]; tiempo3=[]; tiempo4=[];
tamano=100:100:500;
for m=tamano
   display(['Ejecuntando dimension m = ' num2str(m)])
   A=matriz_tridiag(m); b=[6 7*ones(1,m-2) 6]'; %Ax=b
   %Método de la Pseudoinversa
   tic; m1=sol_pseudoinversa(A,b,10^-10); t1=toc;
   tiempo1=[tiempo1 t1];
   %Método de Eliminación Gaussiana
   tic; m2=sol_elim_gauss(A,b); t2=toc;
   tiempo2=[tiempo2 t2];
   %Método de Factorización LU
   tic; m3=sol_LU(A,b); t3=toc;
   tiempo3=[tiempo3 t3];
   %Comando de Octave
   tic; m4=mldivide(A,b); t4=toc;
   tiempo4=[tiempo4 t4];
end

%Gráfica de Tiempo
hold on
plot(tamano,tiempo1,'r') %Pseudoinversa
plot(tamano,tiempo2,'b') %Elim Guass
plot(tamano,tiempo3,'g') %LU
plot(tamano,tiempo4,'k') %Octave
legend('Pseudoinversa','Elim. Gauss.', 'LU','Octave')
