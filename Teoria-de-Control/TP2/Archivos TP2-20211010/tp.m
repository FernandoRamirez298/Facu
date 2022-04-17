%% Cálculo FT
num=[0.20824*10.668 0.20824];
den1=[97.426 1];
den2=[22.81 1];
sup=[-15.425 0];

g3=exp(tf(sup,1));
g1=tf(num,den1);
g2=tf(1,den2);
Gpa=g1*g2*g3

%% La de JUANI
s = tf('s');
num = exp(-15.425*s)*(0.20824)*(1+10.668*s);
den = (1+97.426*s)*(1+22.81*s);
Gpa = tf(num/den)

%% Polos y ceros
pole(Gpa)
zero(Gpa)

%% GPA a LC
gpalc=Gpa/(1+Gpa)

%% Aplico SISOTOOL
c

%% Calculo Marg de ganancia a la Wn
wn=0.07312;
[mag,phase]=bode(Gpa,wn);

fim=45.6-(180+phase);
a=(1+sin(fim*(pi/180)))/(1-sin(fim*(pi/180)));
tao=1/(wn*sqrt(a));

zpd=-1/(a*tao);
ppd=-1/tao;

%% Defino FT controlador

numJ=[a*tao 1];
denJ=[tao 1];
J=tf(numJ,denJ);

%% Polos y ceros de J
pole(J);
zero(J);

%% Ganancia de J en Wn

[mag,phase]=bode(J,wn);

%% Definicion Gpd
K=28.5306;
numGpd=K*[a*tao 1];
denGpd=[tao 1];
Gpd=tf(numGpd,denGpd);

%% Bode Gpd*Gpa

margin(Gpd*Gpa);

%% Sisotool GPD*GPA

sisotool(Gpd*Gpa);

%% Definicion de Jpi

numJpi=[136.9863 1];
denJpi=[136.9863 0];
Jpi=tf(numJpi,denJpi);

%% Ganancia de Jpi en Wn

[mag,phase]=bode(Jpi,0.07312);

%% Definición GPI

K=1;
numGpi=K*[136.7614 1];
denGpi=[136.7614 0];
Gpi=tf(numGpi,denGpi);

%% Controlador final

Cont=Gpi*Gpd;

%% Margin del sist completo

margin(Gpi*Gpd*Gpa);

%% Escalon del sit comp

sisotool(Gpa,Gpi*Gpd);

%% Ajuste parámetros

numGpi2=[105 1];                %Ajsuté el Tao a 105 (porque varía Zpi) para dism el tiempo de resp. al variar K
denGpi2=[105 0];                  %en el paso de abajo y que no se me corra el Margen de Fase
Gpi2=tf(numGpi2,denGpi2);

Jcont=Gpi2*Gpd;                  %Armo el nuevo Controlador. La ganancia es: K_Jcont=28.5306
   
Jajust=21/28.5306*Jcont;             %Corrijo la ganancia al 73% de la orishinal

%margin(Jajust*Gpa)

sisotool(Jajust*Gpa);

%% pto 4 Grafica Lazo abierto con y sin controlador

subplot(2,1,1);
margin(Gpa);
subplot(2,1,2);
margin(Jajust*Gpa);

%% Respuestas step con controlador unitario y con controlador diseñado

subplot(2,1,1);
step(Gpa/(1+Gpa));
subplot(2,1,2);
step(Jajust*Gpa/(1+Jajust*Gpa));

%% Obtencion graficas comprativas de variable controlada y salida

sisotool(Gpa,Jajust);
%% Verificacion de parametros
%cargar data.mat primero


sim('CSTR_TP2_2021');
plot(t,C_E)
hold on;
plot(t,SP_CE)
title('Respuesta al escalón de "Sistema Real"')
legend('C_E', 'SP C_E');
xlabel('tiempo(segundos)');
ylabel('Amplitud');
grid on;

