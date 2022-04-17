%% Carga y preparaci�n de datos de datos
clc
clear all
close all

load('letras.mat')
load('frase_2021.mat')
x = datosLetras;
y = zeros(size(targetsLetras));

% Guardo 'targetsLetras' (cell) como 'y' (double)
for i=1:1:length(targetsLetras)     
    y(i) = double(targetsLetras{i})-64;
end

%% Arbol sin optimizaci�n

Arbol=fitctree(x,y);
view(Arbol,'mode','graph');

%% Obtenci�n de datos para validaci�n cruzada
kfold = 10;

% Obtengo los �ndices para entrenamiento y validaci�n
particiones = cvpartition(y,'kfold',kfold);
a = training(particiones,1)';
ind_entren =  find(a);                      %find(a) devuelve los �ndices donde 'a' es distinto de cero
b = test(particiones,1)';
ind_test = find(b);  


% Obtengo matrices de datos y objetivos, para entrenamiento y validaci�n del arbol
datos_entren = x(ind_entren,:);             %almaceno las filas (instancias de datos) de x donde 'a' valga 1
datos_prueba = x(ind_test,:);     
objetivos_entren = y(ind_entren,:);
objetivos_prueba = y(ind_test,:);

%% Optimizaci�n default

ArbolVC = fitctree(datos_entren, objetivos_entren);

%% Optimizaci�n mediante relga de Twoing

ArbolVC = fitctree(datos_entren, objetivos_entren,'SplitCriterion','twoing');

%% Optimizaci�n mediante Entrop�a

ArbolVC = fitctree(datos_entren, objetivos_entren,'SplitCriterion','deviance');

%% Regla de parada

ArbolVC = fitctree(datos_entren,objetivos_entren,'SplitCriterion','deviance','MinParentSize',5,'MinLeafSize',1,'MaxNumSplits',1000);

%% Entrenamiento del arbol sin poda

aux=0;
pred = predict(ArbolVC, datos_prueba); %realizo predicci�n
for i=1:1:length(objetivos_prueba)   
    if pred(i) ~= objetivos_prueba(i)
        aux=aux+1;        
    end
end

proporcion_error_arbol = aux/length(datos_prueba) % Error de entrenamiento
ErrorResubst = resubLoss(ArbolVC) %Error de resubstituci�n


%% Nivel de Poda

[~,~,~,bestlevel] = cvLoss(ArbolVC,'SubTrees','All','TreeSize','min')

%% Poda

Arbol_podado = prune(ArbolVC,'level',30);
Podado_ma = max(Arbol_podado.PruneList)

%% Entrenamiento del arbol podado

aux=0;
pred = predict(Arbol_podado, datos_prueba); %realizo predicci�n
for i=1:1:length(objetivos_prueba)   
    if pred(i) ~= objetivos_prueba(i)
        aux=aux+1;        
    end
end

proporcion_error_arbol = aux/length(datos_prueba) % Error de entrenamiento
ErrorResubst = resubLoss(Arbol_podado) %Error de resubstituci�n

%% Predicci�n de frase

predic_frase2021_arbol = char(predict(Arbol_podado, frase)+64)'