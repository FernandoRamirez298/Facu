length(out.tout);%obtengo la longitud del vector tiempo
%ploteo la salida sin decimacion
figure
plot(out.tout,out.x1.signals.values,'r',out.tout,out.x2.signals.values,'b')
title('Metodo ode45s')
legend('Posicion', 'Velocidad')

%cambiar en el simulink el metodo para ploetear, luego correr y copiar
%esto en ventana de comando
figure
plot(out.tout,out.x1.signals.values,'r',out.tout,out.x2.signals.values,'b')
title('Metodo ode15s')
legend('Posicion', 'Velocidad')

%ploteo de la salida con decimacion de 10
figure
plot(out.x1.time,out.x1.signals.values,'r',out.x2.time,out.x2.signals.values,'b')