%resuelve el modelo del pendulo en simulink mediante metodo de euler y heun
%plotea ambas respuestas

%resuelve por metodo de eulery  plotea
%configurar y correr simulink con el metodo de Euler y un paso de h=0.1
%copiar lo siguiente en ventana de comandos y ejecutar
figure
plot(out.tout,out.x1.signals.values,'r'out.tout,out.x2.signals.values,'b')
title('Metodo Euler')
legend('Posicion','Velocidad')

%configurar simulink para resolver el sistema con metodo de Heun y mismo
%paso
%copiar y ejecutar lo que sigue en ventana de comandos
figure
plot(out.tout,out.x1.signals.values,'r',out.tout,out.x2.signals.values,'b')
title('Metodo Heun')
legend('Posicion','Velocidad')