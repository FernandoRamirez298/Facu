/*
 * IO.c
 *
 *  Created on: 4 mar. 2021
 *      Author: Renzo
 */

#include "IO.h"

void init_IO(){

	SIM->SCGC5 |= SIM_SCGC5_PORTC_MASK;   										//Habilito el clock al Puerto C de los pulsadores

	//SW1

	PORTC->PCR[3] |= PORT_PCR_MUX(1);  											//Funcionalidad gpio PTC3
	PTC->PDDR &= ~(1<<3);														//SW1
	PORTC->PCR[3] |= (1 << PORT_PCR_PE_SHIFT) | (1 << PORT_PCR_PS_SHIFT); 		//Habilito resistencia de pull up a SW1

	//SW2

	PORTC->PCR[12] |= PORT_PCR_MUX(1) | PORT_PCR_PE_MASK  | PORT_PCR_PS_MASK ; 	//Funcionalidad gpio PTC12
	PTC->PDDR &= ~(1<<12);														//SW2
	PORTC->PCR[12] |= (1 << PORT_PCR_PE_SHIFT) | (1 << PORT_PCR_PS_SHIFT);		//Habilito resistencia de pull up a SW2

	/*//LED VERDE

	SIM->SCGC5 |= (1<<12);
	PORTD->PCR[5] |= PORT_PCR_MUX(1);
	PTD->PDDR |= (1<<5);

	//LED ROJO

	SIM->SCGC5|=(1<<13);
	PORTE->PCR[29] |= PORT_PCR_MUX(1);
	PTE->PDDR|=(1<<29);*/
}
