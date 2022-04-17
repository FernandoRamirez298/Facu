%% Carga de parametros inciales
clear all;
clc;
TP1;
%% Ejecucion de modelo de la planta y obtencion de los parametros de la FT de la planta

sim('Ejemplo_usar_primera_parte');
Cohen_Coon

%% Armado de la funcion transferencia y validacion del modelo
den=[141.1551 1];
num=[0.2081];
sim('Verificacion_planta');
plot(t,C_E,'r'),hold on,grid on
plot(tout,Salida_ver,'b'), grid on

%% ajuste del modelo

num=[0.2081];
den=[102.56 1];   % modificar retardo a 21,3 en el archivo de simulacion
sim('Verificacion_planta');
plot(t,C_E,'r'),hold on,grid on
plot(tout,Salida_ver,'b'), grid on
legend('planta real','modelo Coen Coon');
xlabel('T');
ylabel('Concentracion de biodisel');

%% Calculo de los controladores
%Metodo Coen Coon

CC_Controladores;

%% Ejecucion del controlador Coen Coon P

k=KcP;
taoi=0;
taod=0;
sim('Ejemplo_usar_primera_parte'); % simular conectando el sumador al que llega el PID a la planta
C_Eprop=C_E;    %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeCCp= IAE(end,1);

%% Ejecucion del controlador Coen Coon PI
k=KcPI;
taoi=(KcPI)/TaoiPI;
taod=0;
sim('Ejemplo_usar_primera_parte');% simular conectando el sumador al que llega el PID a la planta
C_Epi=C_E;    %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeCCpi= IAE(end,1);

%% Ejecucion del controlador Coen Coon PID
k=KcPID;
taoi=(KcPID)/TaoiPID;
taod=(KcPID)*TaodPID;
sim('Ejemplo_usar_primera_parte'); % simular conectando el sumador al que llega el PID a la planta
C_Epid=C_E;     %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeCCpid= IAE(end,1);


%% Calculo de los controladores
%Metodo Ziegler Nichols


%%sim('Modelo_GuPu'); %valor encontrado de ganancia critica 39.3, perioto T=79seg
ZN_Controladores;

%% Ejecucion del controlador Ziegler nichols P

k=KcP;
taoi=0;
taod=0;
sim('Ejemplo_usar_primera_parte'); % simular conectando el sumador al que llega el PID a la planta
C_EpropZN=C_E;    %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeZNp= IAE(end,1);

%% Ejecucion del controlador Ziegler nichols PI
k=KcPI;
taoi=KcPI/TaoiPI;
taod=0;
sim('Ejemplo_usar_primera_parte');% simular conectando el sumador al que llega el PID a la planta
C_EpiZN=C_E;    %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeZNpi= IAE(end,1);

%% Ejecucion del controlador Ziegler nichols PID
k=KcPID;
taoi=KcPID/TaoiPID;
taod=KcPID*TaodPID;
sim('Ejemplo_usar_primera_parte'); % simular conectando el sumador al que llega el PID a la planta
C_EpidZN=C_E;     %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeZNpid= IAE(end,1);

%% Calculo de los controladores
%Metodo IMC

IMC_Controladores;

%% Ejecucion del controlador IMC PI
%KcPI=23.4686
%TaoiPI=102.56
k=23.4686;
taoi=KcPI/102.56;
taod=0;
sim('Ejemplo_usar_primera_parte'); % simular conectando el sumador al que llega el PID a la planta
C_EpiIMC=C_E;    %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_EpiIMC,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeIMCpi= IAE(end,1);

%% Ejecucion del controlador IMC PIM
k=KcPI_M;
taoi=KcPI_M/TaoiPI_M;
taod=0;
sim('Ejemplo_usar_primera_parte');% simular conectando el sumador al que llega el PID a la planta
C_EpimIMC=C_E;    %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeIMCpim= IAE(end,1);

%% Ejecucion del controlador IMC PID
k=KcPID;
taoi=KcPID/TaoiPID;
taod=KcPID*TaodPID;
sim('Ejemplo_usar_primera_parte'); % simular conectando el sumador al que llega el PID a la planta
C_EpidIMC=C_E;     %para graficar el conjunto de todos los controladore desp
plot(tout,SP,'--',tout,C_E,'r'),grid on
legend ('Setpoint','Variable controlada');
xlabel('tiempo');
ylabel('Concentracion de Biodisel');
IaeIMCpid= IAE(end,1);

%% Grafica de la comparacion de los controladores

% Comparativa de controladores Coen-coon
%Se realiza una reduccion preventiva de la ganancia del 20% Para lo cual se
%deve correr de nuevo los algoritmos que identifican los parametros de los
%controladores y luego afectar todas las ganancias con un factor de 0.8
figure(1)
plot(tout,C_Eprop,tout,C_Epi,tout,C_Epid,tout,SP,'--'),grid on
legend('C_E P','C_E PI','C_E PID','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparativa del comportamiento de los controladores P,PI y PID')

%Comparativa de controladores Ziegler-Nichols

figure(2)

plot(tout,C_EpropZN,tout,C_EpiZN,tout,C_EpidZN,tout,SP,'--'),grid on
legend('C_E P','C_E PI','C_E PID','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparativa del comportamiento de los controladores P,PI y PID')

%Comparativa de controladores IMC
figure (3)


plot(tout,C_EpiIMC,tout,C_EpimIMC,tout,C_EpidIMC,tout,SP,'--'),grid on
legend('C_E PI','C_E PIM','C_E PID','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparativa del comportamiento de los controladores PI,PIM y PID')

%% Liempieza de workspace

clear all;
clc;
TP1;
sim('Ejemplo_usar_segunda_parte'); %desconectar el controlador, sacar el salto en el set point y agregar un salto del 4% en Fi

%% Parte 2 Controlador feedforward
Cohen_Coon;
% Parametros obtenidos tpo=9.9953  tau=70.7064  ganancia= -0.6106 estan
% correctos

%Comparativa entre FF y FF+FB %para este punto colocar una perturbacion en
%fi del 1% y, primero, desconectar el feedforward correr la simulacion y
%luego conectarlo y volver a correr la simulacion, en ambos casos registrar
%la salida,y el Fh.

%% Desconectar el feedforward
sim('Ejemplo_usar_segunda_parte');
CE_F=C_E_2;
F_hF=F_h;
IaeF=IAE(end,1);

%% Conectar el feedforward 
sim('Ejemplo_usar_segunda_parte');
CE_FF=C_E_2;
F_hFF=F_h;
IaeFF= IAE(end,1);

figure(4)
plot(tout,CE_F,tout,CE_FF,tout,SP,'--'),grid on
legend('Sin Feedforward','Con FB + Feedforward','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparacion controlador Feedback VS Feedback + Feedforward')


figure(5)

plot(tout,F_hF,tout,F_hFF),grid on
legend('Sin Feedforward','Con FB + Feedforward')
xlabel('T')
ylabel('Flujo de liquido de Calentamiento')
title('Comparacion controlador Feedback VS Feedback + Feedforward')

%% Parte 3 Predictor smith

IMC_Controladores;

%% Calculo del controlador PI por metodo IMC
%KcPI=23.4235
%TaoiPI=102.56
Kpsmith=23.425*2.7;
Taoismith=Kpsmith/102.56;
sim('Ejemplo_usar_tercera_parte');
Iaepredict=IAE(end,1);
k=23.425*2.7;
taoi=KcPI/102.56;
taod=0;
sim('Ejemplo_usar_primera_parte');
Iaesnpredict=IAE(end,1);

figure(6)
plot(tout,C_E_3,tout,C_E,tout,SP,'--'),grid on
legend('Con predictor','Sin predictor','Set point')
xlabel('T')
ylabel('Concentracion de biodisel')
title('Comparativa de controladores PI y PI con predictor smith')

%% Controladores en Cascada

sim('Ejemplo_usar_cuarta_parte');
Cohen_Coon;
%% Parametros Obtenidos de Cohen Coon

% 2% Ap

tita=24.4588;
tau=143.4582;
kap=0.0038;

%% Validacion del modelo
% salto del 2% en AP
den=[143.4582 1];
num=[0.0038];
sim('Verificacion_valvreator');
figure(7)
plot(t,Salida_ver,t,C_E_4), grid on
legend('Modelo','Planta Real')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparacion planta real vs modelo')


%% ajuste del modelo

num=[0.0038];
den=[102.56 1];   %no se modifica el retardo en el archivo de simulacion
sim('Verificacion_valvreator');
figure(8)
plot(t,Salida_ver,t,C_E_4), grid on
legend('Modelo','Planta Real')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparacion planta real vs modelo')

%% Disenio de controlador mediante el metodo Coen Coon e IMC
CC_Controladores;

%parametros PID Coen coon
kpid=1537;
taoipid=54.8489;
taodpid=8.5245;

% Metodo IMC

IMC_Controladores;

%parametros PID IMC

kpidIMC=664.5080;
taopidIMC=114.7894;
taodpidIMC=10.9265;
%% comprobacion para un salto al escalon del set point del 2%
%colocar los valores de coen coon en el bloque PID
AP=50
Kpid=kpid;
IPID=kpid/taoipid;
DPID=kpid*taodpid;
sim('Ejemplo_usar_cuarta_parte');
CE_CC=C_E_4;
IaeCC=IAE(end,1);
Kpid=kpidIMC;
IPID=kpidIMC/taopidIMC;
DPID=kpidIMC*taodpidIMC;
sim('Ejemplo_usar_cuarta_parte');
CE_IMC=C_E_4;
IaeIMC=IAE(end,1);
figure(9)
plot(tout,CE_CC,tout,CE_IMC,tout,SP,'--'),grid on
legend('Controlador Coen Coon','Controlador IMC','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparacion controlador PID Coen Coon e IMC')
%% Rechazo a perturbacion en D_Fh
AP=50;
Kpid=kpid;
IPID=kpid/taoipid;
DPID=kpid*taodpid;
sim('Ejemplo_usar_cuarta_parte');
CE_CC2=C_E_4;
IaeCC2=IAE(end,1);
Kpid=kpidIMC;
IPID=kpidIMC/taopidIMC;
DPID=kpidIMC*taodpidIMC;
sim('Ejemplo_usar_cuarta_parte');
CE_IMC2=C_E_4;
IaeIMC2=IAE(end,1);
figure(10)
plot(tout,CE_CC2,tout,CE_IMC2,tout,SP,'--'),grid on
legend('Controlador Coen Coon','Controlador IMC','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparacion controlador PID Coen Coon e IMC')

%% Disño de controlador en cascada
% Dejar la planta a lazo abierto

sim('Ejemplo_usar_cuarta_parte');
plot(tout,F_h,tout,AP,'--'),grid on
legend('F_h','Set Point AP')
xlabel('T')
ylabel('Flujo de reactivo entrante')
title('Respuesta Valvula LA a un cambio en AP del 4%')
% la escala es desproporcianada si bien el grafico es correcto, se utiliza la subrutina Cohen coon para determinar la ft

%% Determinacion de la FT

Cohen_Coon;

%parametros obtenidos del cohen coon

tita=0.9990;
tau=5.5157;
ganancia=0.0179;

%% Armado de la Ft 
den=[5.5157 1];
num=[0.0179];
sim('Verificacion_valvreator');
figure(11)
plot(t,Salida_ver,t,F_h), grid on
legend('Modelo','Valvula Real')
xlabel('T')
ylabel('Flujo de reactivo entrante')
title('Comparacion Valvula real vs modelo') %no requirio 
%% Calculo del controlador PI por el metodo de IMC

IMC_Controladores;

%% parametros obtenidos

Kpi=110.0698;     %Mejora de rendimiento con K=110.0698
TaoiPi=5.5157;

% parametros del controlador

KPI=Kpi;
TaoiPIIMC=Kpi/TaoiPi;
%% para para un salto del 2% en SP
sim('Ejemplo_usar_cuarta_parte');

figure(12)
plot(t,SP2,'--',t,F_h), grid on
legend('Set point','F_h')
xlabel('T')
ylabel('Flujo de reactivo entrante')
title('Rechazo de pertu')
%% prueba de rechazo a perturbaciones
sim('Ejemplo_usar_cuarta_parte');

figure(12)
plot(t,DFH,'--',t,F_h), grid on
legend('DF_h','F_h')
xlabel('T')
ylabel('Flujo de reactivo entrante')
title('Evolucion de F_h frente a un cambio del 1% de F_h en DF_h')

%% Integrando el lazo interno al modelo. Averiguamos relacion entre SP(Fh) y C_E

Cohen_Coon;
figure(3)
plot(t,C_E_4,t,SP1), grid on
legend('C_E_4','SP1')
%% Parametros obtenidos
tita=21.4672;
tau=103.5038;
k=0.2081;
%% Comparativa y ajuste del modelo obtenido con Cohen Coon

den=[tau 1];
num=[k];
sim('Verificacion_valvreator');
figure(11)
plot(t,Salida_ver,t,C_E_4), grid on
legend('Modelo','sistema interno + planta Real')
xlabel('T')
ylabel('Concentracion de Biodicel')
title('Comparacion modelo vs sistema interno y reactor real')

%% Obtencion del PID del lazo externo con el metodo IMC

IMC_Controladores;

%% Parametros obtenidos

KcPID=12.6292;
TaoiPID=114.2374;
TaodPID=9.7251;
%% Conformacion del PID y ensayo

AP=50;
Kpid=KcPID;
IPID=KcPID/TaoiPID;
DPID=KcPID*TaodPID;
Kpi=110.0698;     
TaoiPi=5.5157;
KPI=Kpi;
TaoiPIIMC=Kpi/TaoiPi;
sim('Ejemplo_usar_cuarta_parte');
CE_IMCFull=C_E_4;
IaeCC2=IAE(end,1);
figure(10)
plot(tout,CE_IMCFull,tout,SP,'--'),grid on
legend('Controlador Cascada','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Controlador Cascada Salto del 2% SP')
%% Prueba de rechazo a perturbaciones

sim('Ejemplo_usar_cuarta_parte');
CE_IMCFull=C_E_4;
IaeIMC2=IAE(end,1);
figure(10)
plot(tout,CE_IMCFull,tout,SP,'--'),grid on
legend('Controlador Cascada','Set Point')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Controlador Cascada rechazo a perturbaciones')

%% Comparativa entre controlador cascada y Feedback
% cargo los valores del controlador feedback nuevamente y simulo 
kpidIMC=664.5080;
taopidIMC=114.7894;
taodpidIMC=10.9265;

AP=50;
Kpid=kpidIMC;
IPID=kpidIMC/taopidIMC;
DPID=kpidIMC*taodpidIMC;
sim('Ejemplo_usar_cuarta_parte');
CE_IMCFeedback=C_E_4;
IaeIMCFeedback=IAE(end,1);
%% Cargo los parametros del controlador cascada nuevamente y ploteo 
KcPID=12.6292;
TaoiPID=114.2374;
TaodPID=9.7251;

AP=50;
Kpid=KcPID;
IPID=KcPID/TaoiPID;
DPID=KcPID*TaodPID;
Kpi=110.0698;     
TaoiPi=5.5157;
KPI=Kpi;
TaoiPIIMC=Kpi/TaoiPi;
sim('Ejemplo_usar_cuarta_parte');
CE_IMCCascada=C_E_4;
IaeCascada=IAE(end,1);

figure()
%plot(tout,CE_IMCFeedback,tout,CE_IMCCascada),grid on
plot(tout,CE_IMCCascada),grid on
legend('Controlador Feedback','Controlador Cascada')
xlabel('T')
ylabel('Concentracion de Biodisel')
title('Comparacion controlador Cascada vs Feedback rechazo perturbaciones')
