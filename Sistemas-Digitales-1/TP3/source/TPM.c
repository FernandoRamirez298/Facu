/*
 * TPM.c
 *
 *  Created on: 4 mar. 2021
 *      Author: Renzo
 */


#include "TPM.h"

void init_TPM(){

	//Inicializacion TPM0 - ver diagrama pag 124

	SIM->SCGC6|=(1<<24);							//Habilito el clock al modulo TMP0 - pag 132 y pag 218
	MCG->C1|=0x02; 									//Habilito el MCGIRCLK - pag 384
	MCG->C2|=0x01; 									//Asigno reloj "fast" de 4MHz para el MCGIRCLK: IRCS MCG_C2 - pag 386
	//MCG->SC &= 0x00; 								//Selecciono divisor por 4 para obtener 1 MHz - pag 394
	MCG->SC |= 0x04;
	SIM->SOPT2|=(0x03<<24); 						//Asigno el MCGIRCLK para el modulo TPM: SIM_SOPT2 - pag 206


	//TPM LED ROJO
	SIM->SCGC5|=(1<<13);							//Habilito el clock al Puerto E (LED Rojo, canal de conversión del Sensor Externo LMT87)
	PORTE->PCR[29] |= PORT_PCR_MUX(3); 				//Asigno funcionalidad TPM channel 2 -  pag 172
	TPM0->CONTROLS[2].CnSC |= 0x24;					//Modo PWM Edge Aligned, up counting, Low-true pulses (se carga la salida cuando llega a la cuenta, se limpia cuando se recarga) - pag 569
	TPM0->MOD=1023; 								//Valor del MODULO (opero con conversión CAD de 10 bits)
	TPM0->CONTROLS[2].CnV=0; 						//Duty Cycle inicial del 0%


	//TPM LED VERDE
	SIM->SCGC5|=(1<<12);							//Habilito el clock al Puerto D (LED Verde)
	PORTD->PCR[5] |= PORT_PCR_MUX(4);				//Asigno funcionalidad TPM channel 5 -  pag 175
	TPM0->CONTROLS[5].CnSC |= 0x24;  				//Modo PWM Edge Aligned, up counting, Low-true pulses (se carga la salida cuando llega a la cuenta, se limpia cuando se recarga) - pag 569
	TPM0->MOD=1023;  								//Valor del MODULO (opero con conversión CAD de 10 bits)
	TPM0->CONTROLS[5].CnV=0;						//Duty Cycle inicial del 0%
	TPM0->SC|=0x08; 								//Reloj habilitado - pag 567

}
