%resuelve la EDO pendulo para distintos pasos con el metodo de euler, el
%metodo de heun y compara resultados
clc,clear all, close all

%paso 0.01
[t1,x1]=euler1(@pendulo,[1;0],50,0.01);%resuelve la edo 'pendulo' por metodo de euler
[t2,x2]=heun2(@pendulo,[1;0],50,0.01);%resuelve la edo 'pendulo' por metodo de heun
figure
subplot(211), plot (t1,x1), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo Euler con h=0.01')
legend('posicion', 'velocidad')
subplot(212), plot (t2,x2), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo Heun con h=0.01')
legend('posicion', 'velocidad')

%paso 0.1

[t3,x3]=euler1(@pendulo,[1;0],50,0.1);%resuelve la edo 'pendulo' por metodo de euler
[t4,x4]=heun2(@pendulo,[1;0],50,0.1);%resuelve la edo 'pendulo' por metodo de heun
figure
subplot(211), plot (t3,x3), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo Euler con h=0.1')
legend('posicion', 'velocidad')
subplot(212), plot (t4,x4), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo Heun con h=0.1')
legend('posicion', 'velocidad')

%paso 1

[t5,x5]=euler1(@pendulo,[1;0],50,1);%resuelve la edo 'pendulo' por metodo de euler
[t6,x6]=heun2(@pendulo,[1;0],50,1);%resuelve la edo 'pendulo' por metodo de heun
figure
subplot(211), plot (t5,x5), grid on %Plotea la resolucion por el metodo de Euler
title('Resolucion metodo Euler con h=1')
legend('posicion', 'velocidad')
subplot(212), plot (t6,x6), grid on %Plotea la resolucion por el metodo de Heun
title('Resolucion metodo Heun con h=1')
legend('posicion', 'velocidad')

