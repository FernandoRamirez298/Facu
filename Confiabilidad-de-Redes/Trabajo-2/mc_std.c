
//                          Monte Carlo Estandar
//   Leslie Muray - FCEIA, Universidad Nacional de Rosario, Argentina
//                            - Mayo, 2019 -

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include "mt.c"

#define U genrand_real1()
#define semilla(s) init_genrand(s)


#define Expo(lmbd) (-log(U)/lmbd)
// Generador de numeros aleatorios con distribucion exponencial de tasa "lmbd"



/******************************************************************************/

int main(){

  int i,j,k,size;
  double C,X,V,S,Q,t;
  clock_t  ti;


//---------------------------- -- INICIALIZACION -------------------------------

  // VARIABLES PROPUESTAS

  X=0.0;			// la variable aleatoria
  S=0.0;			// la suma de las replicaciones
  V=0.0;			// la varianza

  size = 10000000;	// el numero de pruebas de Monte Carlo

  semilla(123);

  //-------------------- EL ALGORITMO DE MONTE CARLO CRUDO ---------------------

  ti = clock();


  //------------------------------------

  for(k=0;k<size;k++){

    C=U;
    if (C<=0.1){X=50;}
    if (C>0.1 && C<=0.4){X=80;}
    if (C>0.4 && C<=1){X=10;}
    //Expo(4.0);		// elijo lambda=4
    S+=X;
    V+=X*X;
  }

  Q=S/size;
  V=(V/size-Q*Q)/(size-1);

  //------------------------------------


  t=(double)(clock()-ti)/CLOCKS_PER_SEC;

  //---------------------------- SALIDA Y RESULTADOS ---------------------------

 printf("\n    MONTE CARLO ESTANDAR");
  printf("\n    Replicaciones: %d   Tiempo de Ejecucion=%f",size,t);
  printf("\n\n     Q=%1.16f = %1.2e  (Media)",Q,Q);
  printf("\n     V=%1.16f = %1.2e  (Varianza)",V,V);
  printf("\n    SD=%1.16f = %1.2e  (Desviacion Estandar)",sqrt(V),sqrt(V));
  printf("\n    RE=%1.16f = %1.2f%%     (Error Relativo)\n",sqrt(V)/Q,
  100*sqrt(V)/Q);
  printf("    ---------------------------------------------------------------");
  printf("\n\n");

  //----------------------------------------------------------------------------

  return 0;

}

/******************************************************************************/


