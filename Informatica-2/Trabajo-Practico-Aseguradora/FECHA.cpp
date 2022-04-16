/*
 * FECHA.cpp
 *
 *  Created on: 16/6/2018
 *      Author: gusta
 */

#include "FECHA.h"

FECHA::FECHA(int d, int m, int a) {
	// TODO Auto-generated constructor stub
	Dia= d;
	Mes= m;
	Anio=a;
}
FECHA::getDia(){
	return Dia;
}
FECHA::getMes(){
	return Mes;
}
FECHA::getAnio(){
	return Anio;
}
FECHA::setDia(int d){
	Dia=d;
}
FECHA::setMes(int m){
	Mes=m;
}
FECHA::setAnio(int a){
	Anio=a;
}
FECHA::~FECHA() {
	// TODO Auto-generated destructor stub
}

