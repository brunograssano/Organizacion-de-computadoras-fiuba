
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include <math.h>
#include "cache.h"

#define OUTPUT 'o'
#define VERSION 'v'
#define AYUDA 'h'
#define CANTIDAD_VIAS 'w'
#define CACHE_SIZE 'c'
#define BLOCK_SIZE 'b'

#define READ_BYTE 'R'
#define WRITE_BYTE 'W'

#define MAX_NOMBRE_ARCHIVO 256

#define MODO_LECTURA "r"
#define MODO_ESCRITURA "w"

#define KILOBYTE 1024
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
  printf(" -w, --ways       Cantidad de vias.\n");
  printf(" -c, --cachesize  Tamanio del cache en kilobytes\n");
  printf(" -b, --blocksize  Tamanio del bloque en bytes\n");
  printf("Ejemplos: \n");
  printf(" tp -w 4 -c 8 -b 16 prueba1.mem \n");
  printf(" tp -w 1 -c 4 -b 128 prueba1.mem \n");
  printf(" tp -w 1 -c 4 -b 32 -o salida prueba1.mem \n");
}

void mostrarVersion(){
	 printf("Version 1.0.0\n");
}

void determinarSalida(configuracion_t* configuracion,char* argumentos[]){
  configuracion->salida = fopen(optarg,MODO_ESCRITURA);
  if(configuracion->salida == NULL){
    fprintf(stderr, "No se pudo abrir el archivo enviado para salida, el resultado se mostrara por stdout\n");
    configuracion->salida = stdout;
  }
}

bool esPotenciaDeDos(unsigned int numero){
  return numero && (!(numero & (numero-1)));
}

configuracion_t manejarParametros(int cantidadArgumentos, char* argumentos[],char archivoInput[MAX_NOMBRE_ARCHIVO]){
  static struct option opcionesLargas[] = {
     {"ways", required_argument, 0, 'w'},
     {"cachesize", required_argument, 0, 'c'},
     {"help", no_argument, 0, 'h'},
     {"output", required_argument, 0, 'o'},
     {"version", no_argument, 0, 'v'},
     {"blocksize", required_argument, 0, 'b'},
     {0, 0, 0, 0}
  };
  configuracion_t configuracion;
  memset(&configuracion,0,sizeof(configuracion_t));
  int argumento, indiceOpcion = 0;
  bool pidioAyuda = false, pidioVersion = false;

  while((argumento = getopt_long(cantidadArgumentos, argumentos, "w:c:ho:vb:",opcionesLargas, &indiceOpcion))!=TERMINO){
      switch (argumento) {
          case CANTIDAD_VIAS:
              configuracion.vias = atoi(optarg);
              break;
          case CACHE_SIZE:
              configuracion.tamanioCache = atoi(optarg);
              break;
          case BLOCK_SIZE:
              configuracion.tamanioBloque = atoi(optarg);
              break;
          case OUTPUT:
              determinarSalida(&configuracion,argumentos);
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
    strcpy(archivoInput,argumentos[optind]);
  }

  if(configuracion.salida == NULL){
    configuracion.salida = stdout;
  }
  return configuracion;
}

bool excedeRango(int vias,int tamanioCache,int tamanioBloque){
  unsigned short bitsOffset = ceil(log(tamanioBloque)/log(2));
  unsigned short bitsIndex = ceil(log((tamanioCache * KILOBYTE)/(vias*tamanioBloque))/log(2));
  unsigned short bitsTag = (BITS_DIRECCION - bitsOffset - bitsIndex);
  return (bitsOffset + bitsIndex + bitsTag)>BITS_DIRECCION || bitsIndex == 0;
}

int parsearArchivo(FILE* fileInput,FILE* fileOutput){
  const char delimitadorEspacio[2] = " ",delimitadorComa[3] = ", ";
  char buffer[MAX_NOMBRE_ARCHIVO] = "";
  unsigned int direccionALeer = 0,caracter = 0;
  int estado = 0;

  init();
  int leidos = fscanf(fileInput,"%[^\n]\r\n",buffer);
  while(0<leidos && estado!=ERROR){
    if(strcmp(buffer,"init")==0 || strcmp(buffer,"init\r")==0){
      init();
      fprintf(fileOutput, "Se inicializa la cache\n");
    }
    else if(buffer[0] == READ_BYTE || buffer[0] == WRITE_BYTE){
      char* instruccion = strtok(buffer,delimitadorEspacio);
      char* primerNumero = strtok(NULL,delimitadorComa);
      direccionALeer = atoi(primerNumero);
      if(direccionALeer >= TAMANIO_MEMORIA_PRINCIPAL){
        fprintf(stderr, "La direccion %i se excede del rango de la memoria\n",direccionALeer);
        estado = ERROR;
      }

      if(buffer[0] == READ_BYTE){
        unsigned char valor = read_byte(direccionALeer);
        fprintf(fileOutput, "Se lee el byte en la direccion: %i\n",direccionALeer);
        fprintf(fileOutput, "* El valor obtenido fue: %c (%d)\n", valor,valor);
      }
      else{
        char* valor = strtok(NULL,delimitadorComa);
        caracter = atoi(valor);
        write_byte(direccionALeer,caracter);
        fprintf(fileOutput, "Se escribe el caracter %d en %i\n", caracter,direccionALeer);
      }
      fprintf(fileOutput, "* El resultado de la operacion fue: %s\n", was_hit()?"HIT":"MISS");
    }
    else if(strcmp(buffer,"MR")==0 || strcmp(buffer,"MR\r")==0){
      int missRate = get_miss_rate();
      fprintf(fileOutput, "El miss rate es de: %i %% \n", missRate);
    }
    strcpy(buffer,"");
    leidos = fscanf(fileInput,"%[^\n]\n",buffer);
  }
  return estado;
}


int main(int cantidadArgumentos, char* argumentos[]){
  char archivoInput[MAX_NOMBRE_ARCHIVO] = "";
  int estado = 0;

  if(cantidadArgumentos == 1){
    fprintf(stderr, "No se enviaron argumentos. Puede ver ayuda mandando -h\n");
    return ERROR;
  }

  configuracion_t configuracion = manejarParametros(cantidadArgumentos,argumentos,archivoInput);
  if(configuracion.pidioOtraOpcion){
    return estado;
  }

  if(strlen(archivoInput)==VACIO){
    fprintf(stderr, "No se envio el archivo de entrada, se termina el programa. Puede ver ayuda mandando -h\n");
    return ERROR;
  }

  if(!(esPotenciaDeDos(configuracion.vias) &&
       esPotenciaDeDos(configuracion.tamanioCache) &&
       esPotenciaDeDos(configuracion.tamanioBloque))){
    fprintf(stderr, "No se pueden enviar por entrada valores que no sean potencias de 2.\n");
    return ERROR;
  }

  if(excedeRango(configuracion.vias,configuracion.tamanioCache,configuracion.tamanioBloque)){
    fprintf(stderr, "Los parametros enviados exceden la representacion que se tiene en la cache (16 bits)\n");
    return ERROR;
  }

  FILE* fileInput = fopen(archivoInput,MODO_LECTURA);
  if(fileInput==NULL){
      fprintf(stderr, "No se pudo abrir el archivo de entrada.\n");
      if(configuracion.salida!=stdout){
        fclose(configuracion.salida);
      }
      return ERROR;
  }

  estado = set_up_cache(configuracion);
  if(estado == ERROR){
    fclose(fileInput);
    if(configuracion.salida!=stdout){
      fclose(configuracion.salida);
    }
    return estado;
  }

  estado = parsearArchivo(fileInput,configuracion.salida);

  destroy_cache();

  fclose(fileInput);
  if(configuracion.salida!=stdout){
    fclose(configuracion.salida);
  }

  return estado;
}
