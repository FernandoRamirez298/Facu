%% Carga y preparación de datos de datos
clc
clear all
close all

load letras.mat
load frase_2021.mat

y = zeros(size(targetsLetras));
for i=1:1:length(targetsLetras)
    y(i) = double(targetsLetras{i})-64;
end

%% Adaline
net_1 = linearlayer;                                  %Creación de la red
[net_1]= train(net_1,datosLetras',y');       %Entrenamiento
Predic_Ad = net_1(frase');                            %Predicción
char(round(Predic_Ad)+64)                             %Muestro resultado

%% Backpropagation

net_ff = feedforwardnet(100);                         %Creación de la red
net_ff= train(net_ff,datosLetras',y');       %Entrenamiento
Predic_FF = net_ff(frase');                           %Predicción
char(round(Predic_FF)+64)                             %Muestro resultado


%% Reacondicionamiento de datos

% Se convierten las letras en patrones, de modo que cada columna representa
% una letra, se usa Full() para convertir la matriz dispersa porque genera
% error

y = full(ind2vec(double(cell2mat(targetsLetras())-64)'));

%% Patternet

net_pr = patternnet(10);                                  %Creación de la red                       
net_pr = train(net_pr,datosLetras',y);           %Entrenamiento
Predic_PR = net_pr(frase')                                %Predicción
frase = char(vec2ind(Predic_PR)+64)                       %Muestro resultado


