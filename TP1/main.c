#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>

#define DIVISOR 'd'
#define MULTIPLO 'm'
#define OUTPUT 'o'
#define VERSION 'v'
#define AYUDA 'h'
#define MAX_NOMBRE_ARCHIVO 256
#define MODO_ESCRITURA "w"


typedef struct configuracion{
  bool pidioOtraOpcion;
  bool soloMultiplo;
  bool soloDivisor;
  int primerNumero;
  int segundoNumero;
}configuracion_t;

void mostrarAyuda(){
  printf("Uso: \n");
  printf(" tp -h\n");
  printf(" tp -v\n");
  printf(" tp [opciones] primerNumero segundoNumero\n");
  printf("Opciones: \n");
  printf(" -v, --version    Imprime la version y termina el programa.\n");
  printf(" -h, --help       Imprime esta informacion.\n");
  printf(" -o, --output     Indica que le sigue la direccion al archivo de salida.\n");
  printf(" -m, --multiple   Entrega solo el multiplo.\n");
  printf(" -d, --divisor    Entrega solo el divisor.\n");
  printf("Ejemplos: \n");
  printf("	tp -o archivoSalida 256 192");
  printf("	tp 256 192");
  printf("	tp -m 256 192");
  printf("	tp -d 256 192");
}

void mostrarVersion(){
	 printf("Version 1.0.0\n");
}

configuracion_t manejarParametros(int cantidadArgumentos, char* argumentos[],char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  static struct option opcionesLargas[] = {
     {"multiple", required_argument, 0, 'm'},
     {"divisor", no_argument, 0, 'd'},
     {"help", no_argument, 0, 'h'},
     {"output", required_argument, 0, 'o'},
     {"version", no_argument, 0, 'v'},
     {0, 0, 0, 0}
  };
  configuracion_t configuracion = {false,false,false,0,0};
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

  if(optind < cantidadArgumentos){
      fprintf( stderr, "No son opciones validas las siguientes:\n");
      while (optind < cantidadArgumentos){
          fprintf( stderr, "%s\n", argumentos[optind++]);
      }
  }

  return configuracion;
}


int main(int cantidadArgumentos, char* argumentos[]){
  int estado = 0;
  bool pidioOtraOpcion = false, soloMultiplo = false, soloDivisor = false;
  char archivoOutput[MAX_NOMBRE_ARCHIVO] = "";

  configuracion_t configuracion = manejarParametros(cantidadArgumentos,argumentos,archivoOutput);

  return estado;
}
