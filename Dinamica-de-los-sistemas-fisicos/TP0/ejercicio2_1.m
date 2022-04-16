%script que resuelve la edo de un circuito RL con el metodo de EULER para
%distintos pasos y plotea cada resultado.

clc, clear, close all
%paso h=0.01

figure
[t1,x1]=Euler(0.01);
xa=1-exp(-t1);
subplot(211), plot (t1,x1,'r',t1,xa,'b'), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo de Euler paso 0.01');
legend('Euler','Analitica')
subplot(212), plot(t1,abs(xa-x1)), grid on
title('Error con paso 0.01')

%paso h=0.1

figure
[t2,x2]=Euler(0.1);
xa2=1-exp(-t2);
subplot(211), plot (t2,x2,'r',t2,xa2,'b'), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo de Euler paso 0.1');
legend('Euler','Analitica')
subplot(212), plot(t2,abs(xa2-x2)), grid on
title('Error con paso 0.1')

%paso h=1

figure
[t3,x3]=Euler(1);
xa3=1-exp(-t3);
subplot(211), plot (t3,x3,'r',t3,xa3,'b'), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo de Euler paso 1');
legend('Euler','Analitica')
subplot(212), plot(t3,abs(xa3-x3)), grid on
title('Error con paso 1')

%paso h=2

figure
[t4,x4]=Euler(2);
xa4=1-exp(-t4);
subplot(211), plot (t4,x4,'r',t4,xa4,'b'), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo de Euler paso 2');
legend('Euler','Analitica')
subplot(212), plot(t4,abs(xa4-x4)), grid on
title('Error con paso 2')

%paso h=3

figure
[t5,x5]=Euler(3);
xa5=1-exp(-t5);
subplot(211), plot (t5,x5,'r',t5,xa5,'b'), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo de Euler paso 3');
legend('Euler','Analitica')
subplot(212), plot(t5,abs(xa5-x5)), grid on
title('Error con paso 3')