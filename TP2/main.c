
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "cache.h"

#define OUTPUT 'o'
#define VERSION 'v'
#define AYUDA 'h'
#define CANTIDAD_VIAS 'w'
#define CACHE_SIZE 'c'
#define BLOCK_SIZE 'b'

const int ERROR = -1, VACIO=0, TERMINO = -1;

void mostrarAyuda(){
  printf("Uso: \n");
  printf(" tp -h\n");
  printf(" tp -v\n");
  printf(" tp [opciones] archivo\n");
  printf("Opciones: \n");
  printf(" -v, --version    Imprime la version y termina el programa.\n");
  printf(" -h, --help       Imprime esta informacion.\n");
  printf(" -o, --output     Indica que le sigue la direccion al archivo de salida.\n");
  //...

  printf("Ejemplos: \n");
  //...
}

void mostrarVersion(){
	 printf("Version 1.0.0\n");
}

/*
configuracion_t manejarParametros(int cantidadArgumentos, char* argumentos[],char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  static struct option opcionesLargas[] = {
     {"multiple", no_argument, 0, 'm'},
     {"divisor", no_argument, 0, 'd'},
     {"help", no_argument, 0, 'h'},
     {"output", required_argument, 0, 'o'},
     {"version", no_argument, 0, 'v'},
     {0, 0, 0, 0}
  };
  configuracion_t configuracion = {false,false,false,false,0,0};
  int argumento;
  int indiceOpcion = 0;
  bool pidioAyuda = false, pidioVersion = false;

  while((argumento = getopt_long(cantidadArgumentos, argumentos, "o:hvdm",opcionesLargas, &indiceOpcion))!=TERMINO){
      switch (argumento) {
          case DIVISOR:
              configuracion.soloDivisor = true;
              break;
          case MULTIPLO:
              configuracion.soloMultiplo = true;
              break;
          case OUTPUT:
              strcpy(archivoOutput,optarg);
              break;
          case VERSION:
              if(!pidioVersion){
                  configuracion.pidioOtraOpcion = true;
                  pidioVersion = true;
                  mostrarVersion();
              }
              break;
          case AYUDA:
              if(!pidioAyuda){
                  configuracion.pidioOtraOpcion = true;
                  pidioAyuda = true;
                  mostrarAyuda();
              }
              break;
          default:
              fprintf(stderr, "Puede ver ayuda enviando el parametro -h \n");
      }
  }

  if(optind<cantidadArgumentos){
    errno = 0;
    unsigned long numeroCompleto = strtoul(argumentos[optind], NULL, 10);
    if(numeroCompleto>UINT_MAX || errno == ERANGE){
      configuracion.overflow = true;
    }
      configuracion.primerNumero = (unsigned int)numeroCompleto;
      optind++;
  }
  if(optind<cantidadArgumentos){
    errno = 0;
    unsigned long numeroCompleto = strtoul(argumentos[optind], NULL, 10);
    if(numeroCompleto>UINT_MAX || errno == ERANGE){
      configuracion.overflow = true;
    }
    configuracion.segundoNumero = (unsigned int)numeroCompleto;
  }
  return configuracion;
}

int main(int cantidadArgumentos, char* argumentos[]){
  int estado = 0;
  char archivoOutput[MAX_NOMBRE_ARCHIVO] = "";
  if(cantidadArgumentos == 1){
    fprintf(stderr, "No se enviaron argumentos. Puede ver ayuda mandando -h\n");
    return ERROR;
  }
  configuracion_t configuracion = manejarParametros(cantidadArgumentos,argumentos,archivoOutput);

  if(configuracion.overflow){
      fprintf(stderr, "Los numeros enviados no pueden ser mayores al limite del int. Puede ver ayuda mandando -h\n");
      return ERROR;
  }

  if(!configuracion.pidioOtraOpcion && (configuracion.primerNumero<2 || configuracion.segundoNumero<2)){
      fprintf(stderr, "Los numeros tienen que ser mayor o igual a 2. Puede ver ayuda mandando -h\n");
      return ERROR;
  }

  if(!configuracion.pidioOtraOpcion && configuracion.soloDivisor && configuracion.soloMultiplo){
      fprintf(stderr, "Uso mal las opciones, no es valido mandar -d y -m juntos. Puede ver ayuda mandando -h\n");
      return ERROR;
  }

  if(strlen(archivoOutput)>VACIO && archivoOutput[0]!='-' && !configuracion.pidioOtraOpcion){
      FILE* fileOutput = fopen(archivoOutput,MODO_ESCRITURA);
      if(fileOutput==NULL){
          fprintf(stderr, "No se pudo abrir el archivo enviado.\n");
          return ERROR;
      }
      estado = buscarNumeros(configuracion,fileOutput);
      fclose(fileOutput);
  }
  else if(!configuracion.pidioOtraOpcion){
      estado = buscarNumeros(configuracion,stdout);
  }

  return estado;
}
*/
