function [t,x]=heun2(f,x0,tf,h)
%resuelve dx/dt=f(t,x)
%entre t=0 y t=tf para x(0)=x0
%utilizando el m´etodo de Heun
x=x0;
t=0;
N=tf/h;
for k=1:N
t(k+1)=t(k)+h;
k1=f(t(k),x(:,k));
k2=f(t(k),x(:,k)+h*k1);
x(:,k+1)=x(:,k)+h/2*(k1+k2);
end
end
