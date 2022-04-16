%script que resuelve la edo de un circuito RL con el metodo de HEUN para
%distintos pasos y plotea cada resultado.

%paso h=0.01

figure
[t6,x6]=Heun(0.01);
xa6=1-exp(-t6);
subplot(211), plot (t6,x6,'r',t6,xa6,'b'), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo de Heun paso 0.01');
legend('Heun','Analitica')
subplot(212), plot(t6,abs(xa6-x6)), grid on
title('Error con paso 0.01')
figure
plot(t1,abs(xa-x1),'r',t6,abs(xa6-x6),'b')
title('Comparacion de errores Euler vs Heun con h=0.01')
legend('Error Euler','Error Heun')


%paso h=0.1

figure
[t7,x7]=Heun(0.1);
xa7=1-exp(-t7);
subplot(211), plot (t7,x7,'r',t7,xa7,'b'), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo de Heun paso 0.1');
legend('Heun','Analitica')
subplot(212), plot(t7,abs(xa7-x7)), grid on
title('Error con paso 0.1')
figure
plot(t2,abs(xa2-x2),'r',t7,abs(xa7-x7),'b')
title('Comparacion de errores Euler vs Heun con h=0.1')
legend('Error Euler','Error Heun')

%paso h=1

figure
[t8,x8]=Heun(1);
xa8=1-exp(-t8);
subplot(211), plot (t8,x8,'r',t8,xa8,'b'), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo de Heun paso 1');
legend('Heun','Analitica')
subplot(212), plot(t8,abs(xa8-x8)), grid on
title('Error con paso 1')
figure
plot(t3,abs(xa3-x3),'r',t8,abs(xa8-x8),'b')
title('Comparacion de errores Euler vs Heun con h=1')
legend('Error Euler','Error Heun')

%paso h=2

figure
[t9,x9]=Heun(2);
xa9=1-exp(-t9);
subplot(211), plot (t9,x9,'r',t9,xa9,'b'), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo de Heun paso 2');
legend('Heun','Analitica')
subplot(212), plot(t9,abs(xa9-x9)), grid on
title('Error con paso 2')
figure
plot(t4,abs(xa4-x4),'r',t9,abs(xa9-x9),'b')
title('Comparacion de errores Euler vs Heun con h=2')
legend('Error Euler','Error Heun')

%paso h=3

figure
[t10,x10]=Heun(3);
xa10=1-exp(-t10);
subplot(211), plot (t10,x10,'r',t10,xa10,'b'), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo de Heun paso 3');
legend('Heun','Analitica')
subplot(212), plot(t10,abs(xa10-x10)), grid on
title('Error con paso 3')
figure
plot(t5,abs(xa5-x5),'r',t10,abs(xa10-x10),'b')
title('Comparacion de errores Euler vs Heun con h=3')
legend('Error Euler','Error Heun')
