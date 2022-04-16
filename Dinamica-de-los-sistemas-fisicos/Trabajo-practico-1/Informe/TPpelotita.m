x1=importdata('yvst.txt');
t1=x1(:,1);
y1=x1(:,2);
y1=y1-0.1;

m=0.0585;
r=0.063/2;
ba=0.001;
bp=1.59;
y0=1.5;
v0y=-100;
v0x=-5;
x0=15;
sim('diagbloque3')

figure(1)
%plot(t1,y1,'b',y.time,y.signals.values,'r'),xlabel('tiempo [s]'),ylabel('posicion y[m]'),grid on,
%legend('Real','Modelo','location','northeast')
%figure(2)
plot(x.signals.values,y.signals.values),grid on,xlabel('posicion x[m]'),ylabel('posicion y[m]')