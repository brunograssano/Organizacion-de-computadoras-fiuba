#ifndef __EUCLIDES_H__
#define __EUCLIDES_H__

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>

typedef struct configuracion{
  bool pidioOtraOpcion;
  bool soloMultiplo;
  bool soloDivisor;
  bool overflow;
  unsigned int primerNumero;
  unsigned int segundoNumero;
}configuracion_t;

unsigned int mcd(unsigned int m, unsigned int n);

unsigned int mcm(unsigned int m, unsigned int n);

int buscarNumeros(configuracion_t configuracion,FILE* salida);

#endif /* __EUCLIDES_H__ */
