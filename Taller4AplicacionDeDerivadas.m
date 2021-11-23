% Taller 4 - Aplicaciones de las derivadas
% Juan Lucas Garcia

% Borramos posibles variables de programas anteriores
clear all

% Definimos la funcion f(x)
syms f(x)
f(x) = exp(x) - x*sin(x);

syms fprima(x)
fprima(x) = diff(f(x));

% Punto inicial de la sucesion
x0 = input("Ingrese el punto inicial de la sucesion: ");
xk = x0;

% Numero de iteraciones
N = input("Ingrese el numero de iteraciones: ");

tablaValores = zeros(N,5);

% Metodo de Newton-Raphson
for k = 1:N
    fEnK = double(f(xk));
    fPrimaEnK = double(fprima(xk));
    
    xk_1 = xk - (fEnK/fPrimaEnK);
    
    tablaValores(k,:) = [k xk fEnK fPrimaEnK xk_1];
    xk = xk_1;
end

% Graficas de las primeras 10 iteraciones
t = -2:0.001:1;

% Grafica de la funcion f(xk)
plot(t, f(t), 'LineWidth',2)
hold on

% Grafica de los puntos Pk = (xk, f(xk))
plot(tablaValores(1:10,2), tablaValores(1:10,3), 'or','MarkerSize',4)


% Grafica de rectas tangentes Lk

b = tablaValores(1:10,3) - tablaValores(1:10,4).*tablaValores(1:10,2);

for recta=1:10
   y = tablaValores(recta,4)*t + b(recta);
   plot(t, y, 'g')
end

legend("f(x)")

tablaConEncabezados = ["k" "x_k" "f(x_k)" "f'(x_k)" "x_k+1"];
tablaConEncabezados = [tablaConEncabezados; tablaValores];

writematrix(tablaConEncabezados, 'tabla_de_salida.csv')


