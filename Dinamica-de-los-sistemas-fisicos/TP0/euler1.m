function [t,x]=euler1(f,x0,tf,h)
%resuelve dx/dt=f(t,x)
%entre t=0 y t=tf para x(0)=x0
%utilizando el m´etodo de Euler
x=x0;
t=0;
N=tf/h;
for k=1:N
t(k+1)=t(k)+h;
x(:,k+1)=x(:,k)+h*f(t(k),x(:,k));
end
end