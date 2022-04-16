%obtenenr los autovalores de la matriz de evolucion

%dado el sistema escribo la matriz de evolucion

A=[0 1; -1 -100];
auto=eig(A);
pasomin=2/99.99;

%obtenidos los autovalores con una simple ecuacion podemos determinar cual
%es el paso que tenemos que elegir para que aplicando el metodo de euler el
%resultado sea bueno.
R=100;
L=1;
C=1;

%simulacion con ode45
tic
sim('eje3_3_2_modelo');
figure
subplot(211), plot(out.tout,out.Ii,'r',out.tout,out.Uc,'b')
legend('Corriente bobina','Tension capacitor')
title('DB-ode45')
stepsize = diff([0; out.tout]);
subplot(212),plot(out.tout, stepsize)
title('Pasos')
grid on

%simulacion con ode15s
tic
sim('eje3_3_3_modelo');
figure
subplot(211), plot(out.tout,out.Ii,'r',out.tout,out.Uc,'b')
legend('Corriente bobina','Tension capacitor')
title('DB-ode15s')
stepsize = diff([0; out.tout]);
subplot(212),plot(out.tout, stepsize)
title('Pasos')
grid on