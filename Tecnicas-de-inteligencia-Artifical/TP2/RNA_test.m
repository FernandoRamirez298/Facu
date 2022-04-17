%% Carga y preparaci�n de datos de datos
clc
clear all
close all

load letras.mat
load frase_2021.mat

tgtsLetras = zeros(size(targetsLetras));
for i=1:1:length(targetsLetras)
    tgtsLetras(i) = double(targetsLetras{i})-64;
end

%% Adaline
net_1 = linearlayer;                                  %Creaci�n de la red
[net_1]= train(net_1,datosLetras',tgtsLetras');       %Entrenamiento
Predic_Ad = net_1(frase');                            %Predicci�n
char(round(Predic_Ad)+64)                             %Muestro resultado

%% Backpropagation

net_ff = feedforwardnet(130);                         %Creaci�n de la red
net_ff= train(net_ff,datosLetras',tgtsLetras');       %Entrenamiento
Predic_FF = net_ff(frase');                           %Predicci�n
char(round(Predic_FF)+64)                             %Muestro resultado


%% Reacondicionamiento de datos

% Se convierten las letras en patrones, de modo que cada columna representa
% una letra, se usa Full() para convertir la matriz dispersa porque genera
% error

tgtsLetras = full(ind2vec(double(cell2mat(targetsLetras())-64)'));

%% Patternet

net_pr = patternnet(10);                                  %Creaci�n de la red                       
net_pr = train(net_pr,datosLetras',tgtsLetras);           %Entrenamiento
Predic_PR = net_pr(frase')                                %Predicci�n
frase = char(vec2ind(Predic_PR)+64)                       %Muestro resultado


%El mejor experto tambi�n fue un d�a aprendiz!! FIN...!!!!!

