/*
 * Aseguradora.cpp
 *
 *  Created on: 4/6/2018
 *      Author: gusta
 */

#include "Aseguradora.h"
#include <iostream>
Aseguradora::Aseguradora(int cant, int num, double cste) {
	// TODO Auto-generated constructor stub
	canPol= cant;
	i=num;
	cste=costo;

}

bool hayPoliza(){
	if (cont == 0){
		return 0; /* no se ingresaron polizas*/
	}
	else{
		return 1; /*ya se ingresaron polizas*/
	};
}



bool estaLlena(){
	if (cont < canPol){
		return 0; /*hay lugar*/
	}
	else{
		return 1; /*esta llena*/
	};
}

bool existePoliza(int numero,Aseguradora* p){
	for(i==0;i< p->canPol;i++){
		if (numero == p->seguros[i]->numeroPoliza){
			return 2; /*el numero ya existe*/
		}
		else{
			return 0;
		};


//	0 o 2


};
}

int insertar(){



};

/*calcula el costo de todas las polizas escolares*/
double costoPolizasEscolares(Aseguradora* p){

	for (i==0;i<p->canPol;i++){
		cste = cstp + PolizaInmuebleEscolar::costoPoliza/*escolar*/;
		};

};


double costoTotal(){
	for (i==0;i<cantPol;i++){
	cstt=
	}
};

void Aseguradora::eliminar(int nropoliza, PolizaInmueble& p){

	for (i==0;i< p->canPol;i++){
		if(nropoliza == seguros[i]->){ /*creo que deberia ser seguros[i]->getnumeroPoliza*/
										//porque numeroPoliza es un miembro privado de PolizaInmueble.
			p->seguros[i]=NULL;

		}
	}

}




Aseguradora::~Aseguradora() {
	// TODO Auto-generated destructor stub
}

