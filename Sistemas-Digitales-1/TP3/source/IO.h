/*
 * IO.h
 *
 *  Created on: 4 mar. 2021
 *      Author: Renzo
 */

#ifndef IO_H_
#define IO_H_

#include "MKL46Z4.h"
#define SW1 (PTC->PDIR & (1 << 3))?0:1;
#define SW2 (PTC->PDIR & (1 << 12))?0:1;
#define LED_ROJO_ON			PTE->PCOR|=(1<<29)
#define LED_ROJO_OFF		PTE->PSOR|=(1<<29)
#define LED_ROJO_TOGGLE		PTE->PTOR|=(1<<29)
#define LED_VERDE_ON		PTD->PCOR|=(1<<5)
#define LED_VERDE_OFF		PTD->PSOR|=(1<<5)
#define LED_VERDE_TOGGLE	PTD->PTOR|=(1<<5)

void init_IO();

#endif /* IO_H_ */
