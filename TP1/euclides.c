
#include "euclides.h"


#ifndef USE_MIPS

unsigned int mcd(unsigned int m, unsigned int n){
    unsigned int maximoEncontrado;
    while(n!=0){
        maximoEncontrado = n;
        n = m % n;
        m = maximoEncontrado;
    }
    return m;
}

unsigned int mcm(unsigned int m, unsigned int n){
    return (m*n)/mcd(m,n);
}

#endif


void ordenarNumeros(configuracion_t* configuracion){
    if(configuracion->primerNumero < configuracion->segundoNumero){
        unsigned int aux = configuracion->primerNumero;
        configuracion->primerNumero = configuracion->segundoNumero;
        configuracion->segundoNumero = aux;
    }
}

int buscarNumeros(configuracion_t configuracion,FILE* salida){
    unsigned int minimoComunMultiplo;
    unsigned int maximoComunDivisor;

    ordenarNumeros(&configuracion);

    unsigned int m = configuracion.primerNumero;
    unsigned int n = configuracion.segundoNumero;

    if(configuracion.soloMultiplo){
        minimoComunMultiplo = mcm(m,n);
        fprintf(salida,"%i",minimoComunMultiplo);
    }
    else if(configuracion.soloDivisor){
        maximoComunDivisor = mcd(m,n);
        fprintf(salida,"%i",maximoComunDivisor);
    }
    else{
        minimoComunMultiplo = mcm(m,n);
        maximoComunDivisor = mcd(m,n);
        fprintf(salida,"%i\n%i",maximoComunDivisor,minimoComunMultiplo);
    }

    return 0;
}
