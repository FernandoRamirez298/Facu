/*
 * FECHA.h
 *
 *  Created on: 16/6/2018
 *      Author: gusta
 */

#ifndef FECHA_H_
#define FECHA_H_

class FECHA {
private:
	int Dia;
	int Mes;
	int Anio;
	int DiaActual, MesActual,AnioActual;

public:
	void setDia();
	void setMes();
	void setAnio();
	int getDia() const;
	int getMes() const;
	int getAnio() const;
	FECHA(int d, int m, int a);
	virtual ~FECHA();
};

#endif /* FECHA_H_ */
