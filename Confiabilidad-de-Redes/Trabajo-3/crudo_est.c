
//         Anticonfiabilidad sobre Modelo Fuente-Terminal (s-t)
//           Monte Carlo Crudo sobre Modelo Estatico de Redes
//   Leslie Muray - FCEIA, Universidad Nacional de Rosario, Argentina
//                            - Mayo, 2019 -

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include "mt.c"


#define U genrand_real1()
#define semilla(s) init_genrand(s)

int s;
// s: nodo fuente u origen.

int t;
// t: nodo terminal o destino.

int numnodes;
// numnodes: numero de nodos.

int numlinks;
// numlinks: numero de enlaces.

int **adj;
// Es la matriz de adyacencia de dimension [numnodes][numnodes]. Un "0" en la
// posicion [i][j] significa que no hay enlace entre los nodos "i" y "j",
// mientras que un "1" en la posicion [i][j] significa que hay enlace entre los
// nodos "i" y "j"

double **rlb;
// Lo mismo que "adj" solo que en la posición de cada "1" en la matriz "adj", la
// matriz "rlb" tiene el valor de confiabilidad del enlace correspondiente.

int **smp;
// "smp" lleva un registro actualizado de los enlaces sorteados. Es una mtatriz
// de dimension [numnodes][numnodes]. Se inicia con ceros y cada vez que se
// sortea un enlace entre los nodos (i,j), se ponene en "1" los pares (i,j) y
// (j,i).

int **adj_f;
// Lo mismo que "adj" pero luego de una falla generada por la funcion Fail().

void clean();
// Completa con ceros "smp" y "adj_f" y los deja listos para una nueva falla.

int *visited;
// Es un arreglo de dimension [numnodes]. Si visited[n]=1 significa que el nodo
// "n" ha sido visitado por DFS mientras que visited[n]=0 indica que el nodo "n"
// no ha sido visitado por DFS.

int connected;
// connected=1 indica que los nodos "s" y "t" estan conectados, connected=0
// indica que "s" y "t" no estan conectados.

void Initialize(char* filename);
// filename es el nombre del archivo que contiene la topologia de la red.
// Initialize es la función que asigna memoria para todas las estructuras de
// dimensión variable e inicializa todas la variables.

int Phi();
// Es la funcion de Estructura. Devuelve 1 si los nodos "s" y "t" estan
// conectados y 0 en caso contrario.

void DFS(int node);
// Hace un Depth First Search a partir de "nodo". Se inicia con nodo=s y al
// final fija el valor de "connected" segun el recorrido haya alcanzado el nodo
// "t", o no.


int X(int a, int b);
// Devuelve 1 si el enlace "e", entre los nodos "a" y "b", esta sano, con la
// probabilidad rlb del enlace "e". Devuelve 0 si el enlace "e" esta fallado, 
// con probabilidad 1-rlb.

void Fail();
// Genera una instancia de falla fijando valores para smp y adj_f, acorde a las
// probabilidades rlb.

int seed; 
// Guarda el valor de la semilla del generador de numeros aleatorios.


/*******************************************************************************
* El ejecutable "e", resultante de la compilacion, se ejecuta como
* ./e <archivo> <pruebas> <semilla>, donde:
*   <archivo> nombre del archivo con los datos de la red
*   <pruebas> numero de prunas de Monte Carlo
*   <semilla> semilla del generador de numeros aleatorios
/******************************************************************************/
int main(int argc, char *argv[]){
  int i,j,k,S,size;
  double X,V,Q,t;
  clock_t  ti;

  if(argc<4){
    printf("\n ¡Faltan argumentos! Ejecutar como:\n");
    printf("\n ./ejecutable <archivo> <pruebas> <semilla>\n\n");
    exit(1);
  }
  if(argc>4){
    printf("\n ¡Se han insertado argumentos de mas! Ejecutar como:\n\n");
    printf("\n ../ejecutable <archivo> <pruebas> <semilla>\n\n");
    exit(1);
  }
  if((size=atoi(argv[2]))<1){
    printf("\n ¡El numero de pruebas no puede ser < 1! Ejecutar como:\n");
    printf("\n ./ejecutable <archivo> <pruebas> <semilla>\n\n");
    exit(1);
  }

  if((seed=atoi(argv[3]))<0){
    printf("\n ¡La semilla no puede ser negativa! Ejecutar como:\n");
    printf("\n ./ejecutable <archivo> <pruebas> <semilla>\n\n");
    exit(1);
  }

  Initialize(argv[1]);

  //-------------------- EL ALGORITMO DE MONTE CARLO CRUDO ---------------------

  ti = clock();

  S=0;
  X=0.0;
  V=0.0;

  for(k=0;k<size;k++){
    Fail();
    X=(1-Phi());
    S+=X;
    V+=X*X;
  }

  Q=(double)S/size;
  V=(V/size-Q*Q)/(size-1);

  t=(double)(clock()-ti)/CLOCKS_PER_SEC;

  //---------------------------- SALIDA Y RESULTADOS ---------------------------
 
 printf("\n    MONTE CARLO CRUDO");
  printf("\n    Network: %s   Replications: %d   ExecTime=%f",argv[1],size,t);
  printf("\n\n     Q=%1.16f = %1.2e  (Unreliability)",Q,Q);
  printf("\n     V=%1.16f = %1.2e  (Variance)",V,V);
  printf("\n    SD=%1.16f = %1.2e  (Standard Deviation)",sqrt(V),sqrt(V));
  printf("\n    RE=%1.16f = %1.2f%%     (Relative Error)\n",sqrt(V)/Q,
  100*sqrt(V)/Q);
  printf("    ---------------------------------------------------------------");
  printf("\n\n");

  //----------------------------------------------------------------------------

  free(adj);
  free(adj_f);
  free(rlb);
  free(smp);
  free(visited);

  return 0;

}

/******************************************************************************/

void Initialize(char* filename){

  FILE* fp;
  int i,j,node1,node2,num;
  double reliability;


  // Se abre el archivo con la informacion sobre la red y se lo recorre para
  // leer los datos uno tas otro
  if((fp=fopen(filename,"r"))==NULL){
   printf("\n Fail attempting to open a disk file...\n");
    exit(1);
  }
  fscanf(fp,"%d",&s);
  fscanf(fp,"%d",&t);
  fscanf(fp,"%d",&numnodes);
  fscanf(fp,"%d",&numlinks);


  // Se asigna la matriz adj de [numnodes][numnodes]
  adj=(int**)calloc(numnodes,sizeof(int*));
  for(i=0;i<numnodes;i++)
    adj[i]=(int*)calloc(numnodes,sizeof(int));

  // Se inicializa a cero la matriz adj
  for(i=0;i<numnodes;i++)
    for(j=0;j<numnodes;j++){
      adj[i][j]=0;
    }


  // Se asigna la matriz adj_f de [numnodes][numnodes]
  adj_f=(int**)calloc(numnodes,sizeof(int*));
  for(i=0;i<numnodes;i++)
    adj_f[i]=(int*)calloc(numnodes,sizeof(int));

  // Se inicializa a cero la matriz adj_f
  for(i=0;i<numnodes;i++)
    for(j=0;j<numnodes;j++){
      adj_f[i][j]=0;
    }


  // Se asigna la matriz rlb de [numnodes][numnodes]
  rlb=(double**)calloc(numnodes,sizeof(double*));
  for(i=0;i<numnodes;i++)
    rlb[i]=(double*)calloc(numnodes,sizeof(double));

  // Se inicializa a cero la matriz rlb
  for(i=0;i<numnodes;i++)
    for(j=0;j<numnodes;j++){
      rlb[i][j]=0.0;
    }


  // Se asigna la matriz smp de [numnodes][numnodes]
  smp=(int**)calloc(numnodes,sizeof(int*));
  for(i=0;i<numnodes;i++)
    smp[i]=(int*)calloc(numnodes,sizeof(int));

  // Se inicializa a cero la matriz smp
  for(i=0;i<numnodes;i++)
    for(j=0;j<numnodes;j++){
      smp[i][j]=0;
    }


  // Se recorre cada una de las lineas siguientes del archivo con la informacion
  // sobre la red y se van colocando los valores leidos en las variables
  // correspondientes
  for(i=0;i<numnodes;i++){
    fscanf(fp, "%d%d", &node1, &num);

    for(j=0;j<num;j++){
      fscanf(fp, "%d%lf", &node2, &reliability);

      adj[node1][node2]=1;
      rlb[node1][node2]=reliability;

      adj[node2][node1]=1;
      rlb[node2][node1]=reliability;
    }
  }

  fclose(fp);

  // Se inicializa el generador de numeros aleatorios con la semilla elegida
  semilla(seed);

  // Se asigna el arreglo visited
  visited=(int*)calloc(numnodes,sizeof(int));

  // Se inicializa el arreglo visited con ceros
  for(i=0;i<numnodes;i++)
    visited[i]=0;

  connected=0;

  return;

}

/******************************************************************************/

void Fail(){

  int i,j;

  clean();

  // Se recorre la mitad superior de las matrices adj y smp (dado que son
  // simetricas no vale la pena recorrerlas completas).
  for(i=0;i<numnodes;i++){

    for(j=i+1;j<numnodes;j++){

      if(adj[i][j] && !smp[i][j]){

        if(X(i,j)){

          adj_f[i][j]=1;
          adj_f[j][i]=1;

        }

        smp[i][j]=1;
        smp[j][i]=1;

      }
    }
  }

  return;

}

/******************************************************************************/

int Phi(){

  int k;

  // Se resetean "connected" y "visited" antes de ejecutar DFS
  connected=0;

  for(k=0;k<numnodes;k++)
    visited[k]=0;


  DFS(s);

  return connected;
}

/******************************************************************************/

void DFS(int node){

  int i,j,k;

  if(connected)
    return;

  if(node == t){
    connected=1;
    return;
  }

  visited[node]=1;

  for(i=0;i<numnodes;i++){
    if(!visited[i] && adj_f[node][i]){
      DFS(i);
    }
  }

  return;
}

/******************************************************************************/

int X(int a, int b){

  if(U < rlb[a][b])
    return 1;
  else
    return 0;

}

/******************************************************************************/

void clean(){

  int i,j;

  for(i=0;i<numnodes;i++){
    for(j=0;j<numnodes;j++){
      smp[i][j]=0;
      adj_f[i][j]=0;
    }
  }

  return;

}



