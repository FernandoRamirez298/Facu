/*
 * SYSTICK.c
 *
 *  Created on: 4 mar. 2021
 *      Author: Renzo
 */

#include "SYSTICK.h"

void init_temporizador(){

	 //Inicialización  SysTick - pag 275 manual ARM

	 SysTick->LOAD  = 10*1310720;		//Carga el valor del registro Reload (multiplica por 10 para obtener 10 segundos)
	 SysTick->VAL  = 0;					//Limpio el contador

}
