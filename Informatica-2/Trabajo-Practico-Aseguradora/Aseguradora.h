/*
 * Aseguradora.h
 *
 *  Created on: 4/6/2018
 *      Author: gusta
 */

#ifndef ASEGURADORA_H_
#define ASEGURADORA_H_

class Aseguradora {


private:
		int canPol,i;
		PolizaInmueble** seguros; // tengo que asignarle memoria dinamica
		double cste;


public:
		/*preguntar por el constructor arreglo seguros*/
	Aseguradora(int cant=0, int num=0, double costo=0.0){};
	int insertar(PolizaInmueble*);
	void eliminar(int nropoliza, PolizaInmueble& p);
	void eliminarVencidas();
	//funciones miembros de solo lectura
	bool existePoliza(PolizaInmueble&);
	bool estaLlena();
	bool hayPoliza();
	///
	double costoTotal();
	double costoPolizasEscolares();


	virtual ~Aseguradora();
};

#endif /* ASEGURADORA_H_ */
