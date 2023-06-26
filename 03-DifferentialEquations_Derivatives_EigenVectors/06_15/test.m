clc;clear;close all;
A = [3 -1 0; -1 2 -1; 0 -1 3];
[V,D] = eig(A);
display(A);
display(V);
display(D);
x0 = [1 1 1]';

[c,x,k,err] = power_method_eigenvalue(A,x0);
printf("Power method\n");
printf("c = %f\n",c);
display(x);
printf("A*x =\n");
display(A*x);
printf("c*x =\n");
display(c*x);
printf("------------------\n");

[c,x,k,err] = inv_power_method_eigenvalue(A,x0);
printf("Inverse power method\n");
printf("c = %f\n",c);
display(x);
printf("A*x =\n");
display(A*x);
printf("c*x =\n");
display(c*x);

[V,D] = qr_method(A);   
printf("QR method\n");
display(V);
display(D);
printf("------------------\n")



