/*
 * main.cpp
 *
 *  Created on: 2/6/2018
 *      Author: gusta
 */
#include <iostream>
#include "Aseguradora.h"
#include "PolizaInmueble.h"
#include "PolizaInmuebleEscolar.h"
#include "FECHA.h"
int CrearNueva(PolizaInmueble* p);



int main()
{	/* como hacer el constructor de aseguradora con el puntero seguros?*/
	Aseguradora Ase(5,0,0.0);


	bool salir=1;
	int  a,respuesta=0,cont=0,nroPolizaElim=0,numero=0;
	char resp;

	while(salir==1)
	{                            /* MENU */

		std::cout<<"Que accion desea realizar? Ingrese el numero correspondiente"<<std::endl;
		std::cout<<"1_ Desea ingresar una nueva poliza?"<<std::endl;
		std::cout<<"2_ Desea eliminar una poliza?"<<std::endl;
		std::cout<<"3_ Desea calcular el costo total de las polizas?"<<std::endl;
		std::cout<<"4_ Desea calcular el costo total de las polizas Escolares?"<<std::endl;
		std::cout<<"5_ Salir."<<std::end1;
		std::cin<<respuesta;
		/*elimina polizas vencidas*/
		Ase.eliminarVencidas();
		switch (respuesta)
		{
		case 1:
			/*agrega polizas*/
			CrearNueva(a);
			if(a==0){
				std::cout<<"Poliza agregada correctamente."<<std::endl;
				cont++;
			};
			if(a==1){std::cout<<" La Poliza no se pudo agregar. No hay espacio suficiente."<<std::endl;};
			if(a==2){std::cout<<"La Poliza no se pudo agregar. El numero coincide con uno existente. Intente nuevamente."<<std::endl;};
			break;

		case 2:

			std::cout<<"ingrese numero de poliza que desea eliminar: "<<std::endl;
			std::cin<<nroPolizaElim;
			std::cout<<"Esta seguro que desea eliminar la poliza nro: "<<nroPolizaElim<<"s/n"<<std::endl;
			std::cin<<resp;
			/*elimina poliza elegida*/
			if(resp=='s')Ase.eliminar(nroPolizaElim,Aseguradora* p );};
			break;

		case 3:

			std::cout<<"El costo total de las polizas es de: $"<<Ase.costoTotal()<<std::endl;
			break;

		case 4:

			std::cout<<"El costo total de las polizas Escolares es de: $"<<Ase.costoPolizasEscolares()<<std::endl;
			break;


		case 5:
			salir = 0;
			break;
		};



		};
	}


}

int CrearNueva()
{
	double incendio, explosion,robo,numeroPoliza;
	std::cout<<"indique que clase de poliza desea ingresar segun corresponda."<<std::endl;
	std::cout<<"1_ Ingresar poliza inmueble."<<std::endl;
	std::cout<<"2_ Ingresar poliza inmbueble escolar."<<std::endl;
	//std::cout<<"3_ ingresar poliza inmbueble equipado."<<std::endl;
	std::cin<<resp;
	bool l,e;
	Ase.estaLlena();
	if (l==0){
		switch (resp) {
			case 1:
				std::cout<<"Ingrese el numero de poliza inmueble"<<std::endl;
				std::cin<<numero;
				e=Ase.existePoliza(numero,Aseguradora* p);//ver
				if (e==0){
					std::cout<<"Ingrese fecha de vencimiento"<<std::endl;
					std::cin<< vencimiento;
					std::cout<<"Ingrese los montos de las coberturas. Ingrese 0 para el campo que no posea cobertura."
					std::cout<<"Ingrese monto contra incendio: "<<std::endl;
					std::cin<<incendio;
					std::cout<<"Ingrese monto contra explosion:"<<std::endl;
					std::cin<<explosion;
					std::cout<<"Ingrese monto contra robo:"<<std::endl;
					std::cin<<robo;
					p1=new PolizaInmueble(numero,vencimiento,incendio,explosion,robo);//valores reales
					return l;
  z				}else{
					return e;
				};
			break;

			case 2:
				std::cout<<"Ingrese el numero de poliza inmueble escolar"<<std::endl;
								std::cin<<numero;
								e=Ase.existePoliza();
								if (e==0){
									std::cout<<"Ingrese fecha de vencimiento"<<std::endl;
									std::cin<< vencimiento;
									std::cout<<"Ingrese los montos de las coberturas. Ingrese 0 para el campo que no posea cobertura."
									std::cout<<"Ingrese monto contra incendio: "<<std::endl;
									std::cin<<incendio;
									std::cout<<"Ingrese monto contra explosion:"<<std::endl;
									std::cin<<explosion;
									std::cout<<"Ingrese monto contra robo:"<<std::endl;
									std::cin<<robo;
									std::cout<<"Ingrese la cantidad de alumnos:"<<std::endl;
									std::cin<<cantAlumnos;
									std::cout<<"ingrese la cantidad de docentes:"<<std::endl;
									std::cin<<cantDocentes;
									return l;
								}else{
									return e;
								}
			break;


			/*case 3:
				std::cout<<"Ingrese el numero de poliza inmueble equipado"<<std::endl;
								std::cin<<numero;
								e=Ase.existePoliza();
								if (e==0){
									std::cout<<"Ingrese fecha de vencimiento"<<std::endl;
									std::cin<< vencimiento;
									std::cout<<"Ingrese los montos de las coberturas. Ingrese 0 para el campo que no posea cobertura."
									std::cout<<"Ingrese monto contra incendio: "<<std::endl;
									std::cin<<incendio;
									std::cout<<"Ingrese monto contra explosion:"<<std::endl;
									std::cin<<explosion;
									std::cout<<"Ingrese monto contra robo:"<<std::endl;
									std::cin<<robo;
									//agregar la parte escolar?
									std::cout<<"ingrese la cantidad de personas:"<<std::endl;
									std::cin<<cantPersonas;


									return l;
								}else{
									return e;
								};
			break;
					*/
	};
	}
	else
		{
			return l;
		}




};
