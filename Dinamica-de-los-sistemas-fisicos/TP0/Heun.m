function [t,x]=Heun(h)
%resuelve dx/dt=1-x
%entre t=0 y t=10 para x0=0
%utilizando el m´etodo de Heun
x=0;
t=0;
N=10/h;
for k=1:N
t(k+1)=t(k)+h;
k1=1-x(k);
k2=1-(x(k)+h*k1);
x(k+1)=x(k)+h/2*(k1+k2);
end
end