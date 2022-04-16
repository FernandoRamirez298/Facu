/*
 * PolizaInmuebleEscolar.cpp
 *
 *  Created on: 4/6/2018
 *      Author: gusta
 */
#include <iostream>
#include "PolizaInmuebleEscolar.h"

PolizaInmuebleEscolar::PolizaInmuebleEscolar(int alu, int doc, double num1, double num2) {
	// TODO Auto-generated constructor stub
	cantAlumnos= alu;
	cantDocentes= doc;
	a=num1;
	d=num2;
}
	double PolizaInmuebleEscolar::costoPoliza(){
		return(a*cantAlumnos + d*cantDocentes) + PolizaInmueble::costoPoliza;
		}





PolizaInmuebleEscolar::~PolizaInmuebleEscolar() {
	// TODO Auto-generated destructor stub
}

