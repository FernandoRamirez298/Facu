/*
 * PolizaInmuebleEscolar.h
 *
 *  Created on: 4/6/2018
 *      Author: gusta
 */

#include "PolizaInmueble.h"
#ifndef POLIZAINMUEBLEESCOLAR_H_
#define POLIZAINMUEBLEESCOLAR_H_

class PolizaInmuebleEscolar: public PolizaInmueble {
protected:
int cantAlumnos;
int cantDocentes;
double a;
double d;

public:
	PolizaInmuebleEscolar(int alu=0, int doc=0, double num1=0.0, double num2=0.0);
	double costoPoliza();

	virtual ~PolizaInmuebleEscolar();
};

#endif /* POLIZAINMUEBLEESCOLAR_H_ */
