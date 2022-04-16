/*
 * PolizaInmueble.cpp
 *
 *  Created on: 4/6/2018
 *      Author: gusta
 */
#include <iostream>
#include "PolizaInmueble.h"

PolizaInmueble::PolizaInmueble(int pol,FECHA ven, double in, double ex, double ro) {
	// TODO Auto-generated constructor stub
	 numeroPoliza=pol;
	 vencimiento=ven;
	 incendio=in;
	 explosion=ex;
	 robo=ro;
}
int getnumeroPoliza(){
	return numeroPoliza;
}

double	PolizaInmueble::costoPoliza(){

	return incendio+explosion+robo;
}

PolizaInmueble::~PolizaInmueble() {
	// TODO Auto-generated destructor stub
}

