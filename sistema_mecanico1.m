%modelo matemático de un sistema masa resorte amortiguador:
%m * d2x + c * dx + kx = F
clear
clc

syms x(t) m c k F

Dx = diff(x,t);
D2x = diff(Dx,t);

ED = m*D2x + c*Dx + k*x == F
pretty(ED)

Sol_gral = dsolve(ED) %esto es la solución general

% Asignamos valores físicos a los parámetros constantes
m = 1;  % mass [kg]
c = 0.5; % damping coefficient
k = 2;  % spring constant
F = 1;  % external force [N]

%evaluemos con condiciones iniciales del sistema para obtener una solución
%particular
cond1 = x(0) == 0; %parte del reposo
cond2 = Dx(0) == 0 ; %consecuencia del reposo

% Sustituir los valores en la solución general
sol_particular = dsolve(ED,[cond1,cond2])

sol_particular_eval = subs(sol_particular)

t = linspace(0, 50, 100);  % Vector de tiempo de 0 a 10 segundos
x_t = subs(sol_particular_eval, t);    % Evaluación de la solución en el vector de tiempo
plot(t, x_t);             % Graficar x(t) vs t
xlabel('Tiempo (t)');
ylabel('x(t)');
title('Solución de la ecuación diferencial');