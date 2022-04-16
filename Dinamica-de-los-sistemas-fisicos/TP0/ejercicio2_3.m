%script que resuelve la edo de un circuito RL con el metodo de BackwardEuler para
%distintos pasos y plotea cada resultado.

%paso h=0.01

figure
[t11,x11]=BackwardEuler(0.01);
xa11=1-exp(-t11);
subplot(211), plot (t11,x11,'r',t11,xa11,'b'), grid on %Plotea la resolucion por el metodo de BackwardEuler
title('Resolucion metodo de BackwardEuler paso 0.01');
legend('BackwardEuler','Analitica')
subplot(212), plot(t11,abs(xa11-x11)), grid on
title('Error con paso 0.01')
figure
plot(t1,abs(xa-x1),'r',t6,abs(xa6-x6),'b',t11,abs(xa11-x11),'g')
title('Comparacion de errores Euler vs Heun vs BackwardEuler con h=0.01')
legend('Error Euler','Error Heun','Error BackwardEuler')


%paso h=0.1

figure
[t12,x12]=BackwardEuler(0.1);
xa12=1-exp(-t12);
subplot(211), plot (t12,x12,'r',t12,xa12,'b'), grid on %Plotea la resolucion por el metodo de BackwardEuler
title('Resolucion metodo de BackwardEuler paso 0.1');
legend('BackwardEuler','Analitica')
subplot(212), plot(t12,abs(xa12-x12)), grid on
title('Error con paso 0.1')
figure
plot(t2,abs(xa2-x2),'r',t7,abs(xa7-x7),'b',t12,abs(xa12-x12),'g')
title('Comparacion de errores Euler vs Heun vs BackwardEuler con h=0.1')
legend('Error Euler','Error Heun','Error BackwardEuler')

%paso h=1

figure
[t13,x13]=BackwardEuler(1);
xa13=1-exp(-t13);
subplot(211), plot (t13,x13,'r',t13,xa13,'b'), grid on %Plotea la resolucion por el metodo de BackwardEuler
title('Resolucion metodo de BackwardEuler paso 1');
legend('BackwardEuler','Analitica')
subplot(212), plot(t13,abs(xa13-x13)), grid on
title('Error con paso 1')
figure
plot(t3,abs(xa3-x3),'r',t8,abs(xa8-x8),'b',t13,abs(xa13-x13),'g')
title('Comparacion de errores Euler vs Heun vs BackwardEuler con h=1')
legend('Error Euler','Error Heun','BackwardEuler')

%paso h=2

figure
[t14,x14]=BackwardEuler(2);
xa14=1-exp(-t14);
subplot(211), plot (t14,x14,'r',t14,xa14,'b'), grid on %Plotea la resolucion por el metodo de BackwardEuler
title('Resolucion metodo de BackwardEuler paso 2');
legend('BackwardEuler','Analitica')
subplot(212), plot(t14,abs(xa14-x14)), grid on
title('Error con paso 2')
figure
plot(t4,abs(xa4-x4),'r',t9,abs(xa9-x9),'b',t14,abs(xa14-x14),'g')
title('Comparacion de errores Euler vs Heun vs BackwardEuler con h=2')
legend('Error Euler','Error Heun','BackwardEuler')

%paso h=3

figure
[t14,x14]=BackwardEuler(3);
xa14=1-exp(-t14);
subplot(211), plot (t14,x14,'r',t14,xa14,'b'), grid on %Plotea la resolucion por el metodo de BackwardEuler
title('Resolucion metodo de BackwardEuler paso 3');
legend('BackwardEuler','Analitica')
subplot(212), plot(t14,abs(xa14-x14)), grid on
title('Error con paso 3')
figure
plot(t5,abs(xa5-x5),'r',t10,abs(xa10-x10),'b',t14,abs(xa14-x14),'g')
title('Comparacion de errores Euler vs Heun vs BackwardEulercon h=3')
legend('Error Euler','Error Heun','BackwardEuler')