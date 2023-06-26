# Formulas para Octave

## 1. Introducción

| Funcion    | Comando |
| ---      | ---       |
|funcion numerica | ` f = @(x) x^2` |
|de string a funcion numerica |` f = str2func(["@(x) " func])`|
| de funcion numerica a string | `func = func2str(f)` |
| minimo funcion | `fminbnd(@(x) x^2, 1, 2)`|
| | |
| cargar simbolico | ` pkg load symbolic;` |
| variable simbolica | `syms x` |
| de string a funcion simbolica    | `fsym=sym(func)` |
| derivar simbolico | `fd_sym=diff(fsym)` |
| de simbolico a numerico | `fd = matlabFunction(fd_sym)` |
| | |
| tamano vector | `n = length(v)` |
| tamano matriz | `[n,m] = size(A)` |
|vector de uno | `v = ones(n,1)` |
|vector de ceros | `v = zeros(n,1)` |
| vector a hasta b con incrementos h | `v = a:h:b` |
| matriz identidad | `I = eye(n)` |
| matriz de ceros | `A = zeros(n,m)` |
| matriz de unos | `A = ones(n,m)` |
| matriz transpuesta | `A = A'` |
| hacer una matriz diagnoal de apartir de un vector | `A = diag(v,0)` |
| obtener diagonal de una matriz | `v = diag(A)` |
| resolver sistema de ecuaciones | `x = linsolve(A,b);` |
| | |
| grafica 2D |    ` figure; plot(x_vector, y_vector);` |

## Método de Thomas en Octave

El código también define dos funciones auxiliares, vector_p(A) y vector_q(A, p, d), que calculan vectores intermedios necesarios para el algoritmo.

### 0. Matriz TriDiagonal

```matlab
d = 5*ones(n, 1); % Vector de la diagonal principal
a_sub = 2*ones(n-1, 1); % Vector de la subdiagonal
a_super = 10*ones(n-1, 1); % Vector de la superdiagonal
T = diag(d, 0) + diag(a_sub, -1) + diag(a_super, 1);

```

### 1. Descomposición LU

Primero, el algoritmo realiza una descomposición LU de la matriz A, pero debido a que A es tridiagonal, los factores L y U son muy simples y se pueden representar mediante los vectores p y q.

#### El vector p

```matlab
n = size(A,1); %cantidad de filas
p = zeros(n-1,1); %inicializa vector p
p(1) = A(1,2)/A(1,1);
for i = 2:n-1
  p(i) = (A(i,i+1))/(A(i,i)-p(i-1)*A(i,i-1));
endfor
```

#### El vector q

```matlab
n = size(A,1); %cantidad de filas
q = zeros(n,1); %inicializa vector p
q(1) = d(1)/A(1,1);
for i = 2:n
  q(i) = (d(i)-q(i-1)*A(i,i-1))/(A(i,i)-p(i-1)*A(i,i-1));
endfor
```

### 2. Sustitución hacia atrás

Después de obtener los vectores p y q, el algoritmo realiza una sustitución hacia atrás para resolver el sistema Ux = y y obtener la solución x:

```matlab
x(n) = q(n);
for i = n-1:-1:1
  x(i) = q(i)-p(i)*x(i+1);
endfor
```

El resultado final es el vector x, que es la solución del sistema de ecuaciones lineales tridiagonal.