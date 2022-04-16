/*
Trabajo Práctica N03
Alumnos: Ramirez Fernando, Raposo Ezequiel
Enunciado 3
*/
#include <stdio.h>
#include "board.h"
#include "peripherals.h"
#include "pin_mux.h"
#include "clock_config.h"
#include "MKL46Z4.h"
#include "fsl_debug_console.h"
/* TODO: insert other include files here. */
#include "IO.h"
#include "CAD.h"
#include "TPM.h"
#include "SYSTICK.h"
/* TODO: insert other definitions and declarations here. */
double lectura_temp_grados=0;
int temp_actual=0, luz_actual=0;
static int8_t E1=1,E2=0,E3=0,E4=0,E5=0,E6=0,E7=0,E8=0,E9=0,E10=0;	//Lugares y marcado inicial
int8_t Ent1,Ent2; 													//Pulsadores
int8_t T1,T2,T3,T4,T5,T6,T7,T8,T9,T10,T11,T12,T13;					//Transiciones
int8_t Ct10=0, Ft10=0, L=0; 										//Variables: L Leds, Ct y Ft del timer
void petri();
void salida();
void brillo();

int main(void) {

  	/* Init board hardware. */
    BOARD_InitBootPins();
    BOARD_InitBootClocks();
    BOARD_InitBootPeripherals();

#ifndef BOARD_INIT_DEBUG_CONSOLE_PERIPHERAL
    /* Init FSL debug console. */
    BOARD_InitDebugConsole();
#endif

    //Inicializo GPIO
    init_IO();
	//Inicializo TPM0
	init_TPM();
	//Inicializo CAD
	init_CAD();
	//Inicializo SYS TICK
	init_temporizador();
    for (;;) {
    	petri();
    	salida();
    }
	return 0 ;
}

void petri(){

	//Se adquieren las entradas
	Ent1=SW1;
	Ent2=SW2;
	/* Transiciones. */

		T1 = E1 && (Ent1 && !Ent2);
		T2 = E2 && !Ent1;
		T3 = E1 && (Ent2 && !Ent1);
		T4 = E3 && !Ent2;
		T5 = E4 && (Ent1 && !Ent2);
		T6 = E5 && !Ent1;
		T7 = E6 && Ent2;
		T8 = E7 && !Ent2;
		T9 = E4 && (Ent2 && !Ent1);
		T10 = E8 && !Ent2;
		T11 = E9 && Ent1;
		T12 = E10 && !Ent1;
		T13 = (E4||E5||E6||E7||E8||E9||E10) && Ft10;


		// Marcado y desmarcado.

			if(T1) {E1 = 0; E2 = 1;}
			if(T2) {E2 = 0; E4 = 1;}
			if(T3) {E1 = 0; E3 = 1;}
			if(T4) {E3 = 0; E4 = 1;}
			if(T5) {E4 = 0; E5 = 1;}
			if(T6) {E5 = 0; E6 = 1;}
			if(T7) {E6 = 0; E7 = 1;}
			if(T8) {E7 = 0; E1 = 1;}
			if(T9) {E4 = 0; E8 = 1;}
			if(T10) {E8 = 0; E9 = 1;}
			if(T11) {E9 = 0; E10 = 1;}
			if(T12) {E10 = 0; E1 = 1;}
			if(T13) {E1 = 1; E4 = 0; E5 = 0; E6 = 0; E7 = 0; E8 = 0; E9 = 0; E10 = 0;}

		// Salidas

     	Ct10 = E4 | E5 |E6 |E7 |E8 |E9 | E10;
     	L = E4 | E5 | E6 | E7 | E8 | E9 | E10;

}

void salida (){  																//Temporizador y mostrar LEDS

    if(Ct10==1){																//Si se llamó al temporizador

    	SysTick->CTRL  = 0x03;													//Contador habilitado, Interrupcion habilitada, Clock alterno: core-clock/16 = (32768*640)/16 = 1310720 = 1s

	}

    else {
		Ft10=0;																	//No se levanta la bandera del temporizador
		SysTick->CTRL = 0x02;													//Deshabilito para que no siga contando y desbordando (wrapping)
		SysTick->VAL=0;															//Cargo 0 en el registro Reload para limpiar el contador, esto logra evitar que retome el conteo desde el último valor grabado
	}

    if(L==1){																	//Si alguno de los lugares correspondientes a LED1 está marcado

		brillo();															//Leo temperaturas y enciendo LEDS según la lectura. Como LED2 siempre se enciende junto con LED1, puedo modificar estado dentro de la misma función

	}

    else{
    	//Apago LEDS
		TPM0->CONTROLS[5].CnV=0;												//Apago LED1
		TPM0->CONTROLS[2].CnV=0;												//Apago LED2
	}

}
void brillo(){

if(luz_actual >= 1022)TPM0->CONTROLS[2].CnV=0;
else TPM0->CONTROLS[2].CnV=1023-luz_actual;

lectura_temp_grados = 25 - (temp_actual*3.3/1024.0 - 0.651)/0.00162;
//printf("%d\n",temp_actual);
if(lectura_temp_grados<=40 && lectura_temp_grados>=20)
	{
	TPM0->CONTROLS[5].CnV= lectura_temp_grados; // escala para la temperatura//TPM0->CONTROLS[5].CnV = temp_actual;
	//printf("%1f\n",lectura_temp_grados);
	}
	if(lectura_temp_grados>40)
	{  													//Si es MAYOR, se encuentra por encima del límite superior
			TPM0->CONTROLS[5].CnV=0;												//LED ROJO encendido al MÁXIMO
	}
	else if (lectura_temp_grados<20)
	{ 												//Si es MENOR, se encuentra por debajo del límite inferior
		TPM0->CONTROLS[5].CnV=1023;
	}
}

void SysTick_Handler(){  														//Cuando se cumplen los 10 segundos

   SysTick->CTRL; 																//Borrado automático por acceso de lectura
   Ft10=1;																		//Levanto bandera de temporizador
   SysTick->CTRL = 0x02;														//Deshabilito para que no siga contando y desbordando (wrapping)

}

void ADC0_IRQHandler(){															//Se setea para ir saltando de conversión en conversión permutando los canales

   if ((ADC0->SC1[0] & 0B00011) == 0B00011){											//Si está seleccionado el canal 26
	   luz_actual = ADC0->R[0];
	   ADC0->SC1[0] = ADC_SC1_ADCH(0) | ADC_SC1_AIEN_MASK;
   }
   else if(ADC0->SC1[0] & 0x03) == 0x00){																		//Si está seleccionado el canal 0
	   temp_actual = ADC0->R[0];//Leo registro de resultado
	   //while((ADC0->SC1[0] & 0x80) == 0){}
      ADC0->SC1[0] = ADC_SC1_ADCH(3) | ADC_SC1_AIEN_MASK;						//Cambio de canal, lanzo conversión al sensor del micro (Canal 26) habilitando las interrupciones
   }

}
