%% TP 1 Teor�a de Control (TDC) 2021

% Datos del reactor
clear all;
load data

%% Entradas del sistema en el punto de equilibrio

Ci0=1.1367;   % [mol/m3] Concentraci�n de componente entrante
Ti0=298;  % [�K] Temperatura de componente entrante
Fi0=1; % [m3/seg] Flujo de componente entrante
Th0=473;      %[�K] Temperatura del refrigerante entrante

% Variables manipuladas del sistema en el punto de equilibrio
Fh0=0.8946; %[m3/seg] Caudal del refrigerante
Ce0=0.543; % [mol/m3] Concentraci�n de componente saliente
Ap0=49.978; % Porcentaje de apertura 

% Salida con el sistema en el punto de equilibrio
TJ0= 176.800605; % [�K] Temperatura de la camisa

% Perturbaciones
DFh=Fh0*0.01; %[ m3/seg] Caudal de perturbaci�n

%Ganancia del controlador P
K=24.7340;

%% Cargo el sistema de inferencia leyendo el archivo .fis

%Es necesario cargarla sino el modelo no va a responder
CF = readfis('ControladorFuzzy.fis');

%% Grafica del Controlador P

%Permutar los bloques del controlador con la llave manual del modelo
sim('Modelo.mdl')
plot(tout,C_E,tout,C_E_SetPoint,'--'), 
legend('C_E-P','C_E-SP')
title('Servo-comportamiento Control P'),xlabel('Tiempo'),ylabel('C_E'),grid

CE_P=C_E; %Guardo la variable controlada con CP para la comparaci�n con el CFuzzy

%% Mido y grafico el error

%Permutar los bloques del controlador con la llave manual del modelo
sim('Modelo.mdl')

plot(tout,Er,tout,F_h-Fh0), grid on;
legend('e','Fh')
title('Entrada y Salida en Servo-comportamiento con Control P'),xlabel('Tiempo'),ylabel('Error - Fh');

%% Graficia del Controlador Fuzzy vs Controlador P

%Permutar los bloques del controlador con la llave manual del modelo
sim('Modelo.mdl')

plot(tout,C_E,tout,CE_P,tout,C_E_SetPoint,'--'), 
legend('C_E-Fuzzy','C_E-P','C_E-SP'),
title('Comparativa Servo-comportamiento Control P vs Control Difuso'),xlabel('Tiempo'),ylabel('C_E'),grid