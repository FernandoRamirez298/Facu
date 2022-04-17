% Arboles de decision, ejer 3
% Funcion para evaluar arboles (entropia) con cross-validation, k-folds
% [input]: arbol_entrenado , nº_particiones
% [output]: e_prom_total_partcion_test, e_prom_min_partcion_test, e_cvLoss, nº_arbol_menor_error,
% [output]: particion_secc_testeo, mejor_arbol
function [E_prom, E_min, E_cvLoss, k, part_test, tr] = miCvLoss(t, kfold)

% Preparacion de datos
MaxNodos = sum(t.IsBranchNode);
datos = t.X;
etiquetas = t.Y;


% Partición

part = cvpartition(etiquetas,'kfold',kfold);

E_min =1;
Sum_error_test = 0;

for i = 1: 1 : kfold
    % Creacion arboles etropia
    tree_actual = fitctree(datos(training(part,i),:),etiquetas(training(part,i)),'SplitCriterion','deviance');%,...
        %'MinParentSize',5,'MinLeafSize',1,'MaxNumSplits',1100); % trees{i} meto el arbol dentro de la celda
        

    % Error cvLoss
    error_entr(i) = resubLoss(tree_actual);

   % Predicciones
    predicciones = predict(tree_actual,datos(test(part,i),:)); 
    respuestas   = etiquetas(test(part,i));
    if (~iscell(respuestas))
        % E_promedio c/arbol
        error_test(i) = sum(~(predicciones == respuestas))/length(respuestas); % Etiquetas tipo double
        % Sum e_prom c/arbol
        Sum_error_test = Sum_error_test + error_test(i);
        % Menor error prom
        if (error_test(i) < E_min)
                E_min = error_test(i);
                k=i;
                tr = tree_actual;
        end
            
    else % IDEM etiquetas tipo str
        error_test(i) = sum(~strcmp(predicciones,respuestas))/length(respuestas); % etiquetas tipo str
        Sum_error_test = Sum_error_test + error_test(i);
        
        if (error_test(i) < E_min)
                E_min = error_test(i);
                k=i;
                tr = tree_actual;
        end
    end        
end

E_cvLoss = error_entr(k);
E_prom = Sum_error_test / kfold;
part_test = test(part,k);


