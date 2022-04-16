/*
 * CAD.c
 *
 *  Created on: 4 mar. 2021
 *      Author: Renzo
 */


#include "CAD.h"

void init_CAD(){

	SIM->SCGC6|=(1<<27);																							//Habilita el clock del ADC0
	//SIM->SCGC6|=SIM_SCGC6_ADC0_MASK;
	PORTE->PCR[22] = PORT_PCR_MUX(0); 																				//Asigna funcionalidad ADC0_DP0/ADC0_SE0 a PTE20 donde voy a conectar el LM35 - pag 194 y 172
	PORTE->PCR[20] = PORT_PCR_MUX(0);
	ADC0->CFG1 = ADC_CFG1_ADIV(0B11) | ADC_CFG1_ADLSMP_MASK | ADC_CFG1_MODE(0B10) | ADC_CFG1_ADICLK(0B01);			//(Input clock)/8, Tiempo de conv. largo, Resolución de 12-bit, (Bus clock)/2 - Pag 480
	ADC0->SC2 |= ADC_SC2_REFSEL(0);
	NVIC_SetPriority(ADC0_IRQn, 0); 																				//Prioridad de la IRQ15 (valor por defecto)
	NVIC_EnableIRQ(ADC0_IRQn);																						//Habilito interrupciones en la NVIC
	ADC0->SC1[0] = ADC_SC1_ADCH(26) | ADC_SC1_AIEN_MASK; 															//Lanzo una primera conversión por Canal 26 (temperatura) habilitando las interrupciones

	/*ADC0->CFG1 = ADC_CFG1_ADIV(0B11) | ADC_CFG1_ADLSMP_MASK | ADC_CFG1_MODE(0B10) | ADC_CFG1_ADICLK(0B01);
	NVIC_EnableIRQ(ADC0_IRQn);
	PORTE->PCR[20] = PORT_PCR_MUX(2);
	ADC0->SC1[0] = ADC_SC1_ADCH(0B00000) | ADC_SC1_AIEN_MASK;
	PORTE->PCR[22] = PORT_PCR_MUX(2);*/
}

