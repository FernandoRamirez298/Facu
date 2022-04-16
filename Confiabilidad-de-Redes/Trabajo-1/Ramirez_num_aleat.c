
//                     Generacion de Numeros Aleatorios
//   Leslie Muray - FCEIA, Universidad Nacional de Rosario, Argentina
//                           - Septiembre, 2021 -

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<time.h>
#include "mt.c"

#define U genrand_real1()
#define semilla(s) init_genrand(s)


//******************************************************************************
// ESTAS MACRO PERMITEN GENERAR SECUENCIAS INDEPENDIENTES DE NUMEROS PSEUDO-  //
// ALEATORIOS A BASADAS EN EL GENERADOR MERSENNE-TWISTER DEL ARCHIVO "mt.c".  //
// SU USO ES EL SIGUIENTE:                                                    //
//                                                                            //
// Ante cada invocacion, U devuelve un numero pseudo-aleatorio entre 0 y 1 de //
// tipo float, por ejemplo:                                                   //
//                                                                            //
// printf("Numero Aleatorio: %f",U);                                          //
//                                                                            //
// Las secuencias de numeros pseudo-aleatorios se inicializan elegiendo la    //
// semilla, lo cual se hace mediante una linea de codigo como la siguiente:   //
//                                                                            //
// semilla(87);                                                               //
//                                                                            //
// el argumento de semilla() puede ser cualquier entero.                      //
//******************************************************************************

double X80=0,X50=0,X10=0;
long int R=0;
int main(){

semilla(87);
while(1)
{
        //declaración de variables
        int resp=0;


        //Menu principal de programa
        printf("Que accion desea realizar? Ingrese el numero de la misma como respuesta \n");
        printf("1- Generar un valor de X\n");
        printf("2- Calcular y mostrar las Frecuencias Relativas y  la esperanza E(X)\n");
        printf("3- Reestablecer valores predeterminados\n");
        printf("4- Salir\n");
        scanf("%d",&resp);

        switch(resp)
        {
                    case 1:

                            valores_de_x();
                     break;

                    case 2:
                            fr();
                            break;


                    case 3:
                        X80=0;
                        X50=0;
                        X10=0;
                        R=0;
                        break;



                    case 4:
                            return 0;
                            break;
        }

}
  return 0;

}
// funcion que genera valores aleatorios de X
int valores_de_x()
{
    long int i=0,j=0,libre=0;
    float alea;
    libre=2147483646-R;
    if(R<2147483646)//evalua si no se supero el valor mmaximo que puede asumir el tipo de dato que es la variable cont
    {
                 printf("Cuantos valores desea generar? ADVERTENCIA: Cantidad Maxima = 2147483646 valores, actualmente dispone de %d valores para generar\n", libre);
                 scanf("%ld", &i);
                 for(j=R;j<R+i;j++)//Genera los valores aleatorios a partir del ultimo que genero. Inicialmente estaba pensado para que almacene en un arreglo ccada valor obtenido de la ffuncion U, sin embargo eso no era nececsario por lo que posteriormente se descarto
                 {
                                         alea=U;
                                         if(alea<0.1)
                                         {
                                                     X50++;
                                                     //printf("%f\n",X50);

                                         }else
                                         {
                                              if(alea>0.1 && alea <0.4)
                                              {
                                                          X80++;
                                                          //printf("%f\n",X80);
                                              }else
                                              {
                                                   X10++;
                                                   //printf("%f\n",X10);
                                              }
                                         }
                 }
                 R=R+i;
                 //printf("%f\n%f\n%f\n",X80,X50,X10);
                 printf("A generado exitosamente %ld valores de la variable X. Presione enter para continuar\n",i);
                 getch();
                 return;

    }else
    {
         printf("Espacio de memoria permitido lleno. Limpie la memoria seleccionando la opcion 4 del menu principal o reinicie el programa\n Presione enter para continuar\n");//una vez alcanzado el máximo de valores de cont el programa no va a dejar crear mas
         getch();
         return;
    }
}

//calculo y muestra Frecuencias relativas

int fr()
{
    double fr80=0,fr50=0,fr10=0,E=0;

    if(R<=1)//Se pide un minimo de valores generados.
    {
        printf("No existen suficientes argumentos de entrada, necesita como minimo 1 valores. Por favor genere mas valores de X\n Presione enter para continuar\n");
        getch();
        return;
    }else
    {
        printf("R= %ld,  X80= %f,  X50= %f,  X10= %f \n",R,X80,X50,X10);
        fr80=X80/R;
        fr50=X50/R;
        fr10=X10/R;
        E = 50*fr50 + 80*fr80 + 10*fr10;
        printf("Las frecuencias relativas son:\n \tFr80= %.6f\n \tFr50=%.6f\n \tFr10= %.6f\n ",fr80,fr50,fr10);
        printf("E{X} = %f \n Presione enter para continuar\n",E);
        getch();
        return;

    }

}
