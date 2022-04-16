/*
 * PolizaInmueble.h
 *
 *  Created on: 4/6/2018
 *      Author: gusta
 */

#ifndef POLIZAINMUEBLE_H_
#define POLIZAINMUEBLE_H_
#include "Aseguradora.h"
#include "FECHA.h"
class PolizaInmueble {
protected:
int numeroPoliza;
FECHA vencimiento;
double incendio;
double explosion;
double robo;

public:
PolizaInmueble(int pol=0,FECHA ven, double in=0.0, double ex=0.0, double ro=0.0);
int getnumeroPoliza() const;
virtual double costoPoliza();
virtual ~PolizaInmueble();
};

#endif /* POLIZAINMUEBLE_H_ */
