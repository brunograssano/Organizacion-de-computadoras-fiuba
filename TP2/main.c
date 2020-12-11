
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

#define READ_BYTE 'R'
#define WRITE_BYTE 'W'

#define MAX_NOMBRE_ARCHIVO 256

#define MODO_LECTURA "r"
#define MODO_ESCRITURA "w"

#define KILOBYTE 1024
const int ERROR = -1, VACIO=0, TERMINO = -1;

typedef struct configuracion{
  bool pidioOtraOpcion;
  int vias;
  int tamanioCache;
  int tamanioBloque;
  FILE* salida;
}configuracion_t;

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
  printf(" tp2 -w 4 -c 8 -b 16 prueba1.mem \n");
}

void mostrarVersion(){
	 printf("Version 1.0.0\n");
}

void determinarSalida(configuracion_t* configuracion,char* argumentos[]){
  configuracion->salida = fopen(argumentos[optind],MODO_ESCRITURA);
  if(configuracion->salida == NULL){
    fprintf(stderr, "No se pudo abrir el archivo enviado para salida, el resultado se mostrara por stdout\n");
    configuracion->salida = stdout;
  }
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

int parsearArchivo(FILE* fileInput,FILE* fileOutput){
  const char delimitadorEspacio[2] = " ";
  const char delimitadorComa[3] = ", ";
  char buffer[MAX_NOMBRE_ARCHIVO] = "";
  unsigned int direccionALeer = 0,caracter = 0;
  init();   //<-------------------------MENCIONAR EL SUPUESTO
  int leidos = fscanf(fileInput,"%[^\n]\n",buffer);
  while(0<leidos){
    if(strcmp(buffer,"init")==0){
      init();
    }
    else if(buffer[0] == READ_BYTE || buffer[0] == WRITE_BYTE){
      char* instruccion = strtok(buffer,delimitadorEspacio);
      char* primerNumero = strtok(NULL,delimitadorComa);
      direccionALeer = atoi(primerNumero);
      if(buffer[0] == READ_BYTE){
        unsigned char valor = read_byte(direccionALeer);
        fprintf(fileOutput, "El valor obtenido fue: %c (%d)\n", valor,valor);
      }
      else{
        char* valor = strtok(NULL,delimitadorComa);
        caracter = atoi(valor);
        write_byte(direccionALeer,caracter);
      }
      fprintf(fileOutput, "El resultado de la operacion fue: %s\n", cache.was_hit?"HIT":"MISS");
    }
    else if(strcmp(buffer,"MR")==0){
      int missRate = get_miss_rate();
      fprintf(fileOutput, "El miss rate es de: %i %% \n", missRate);
    }
    strcpy(buffer,"");
    leidos = fscanf(fileInput,"%[^\n]\n",buffer);
  }
  return 0;
}

int inicializarCache(configuracion_t configuracion){
  cache.cachesize = configuracion.tamanioCache * KILOBYTE;
  cache.blocksize = configuracion.tamanioBloque;
  cache.ways = configuracion.vias;
  cache.sets = cache.cachesize/(cache.ways*cache.blocksize);

  cache.blocks = calloc(cache.sets,sizeof(block_t*));
  if(cache.blocks == NULL){
    fprintf(stderr, "Ocurrio un error al alocar la memoria.\n");
    return ERROR;
  }
  for(int i=0;i<cache.sets;i++){
    cache.blocks[i] = calloc(cache.ways,sizeof(block_t));
    if(cache.blocks[i] == NULL){
      fprintf(stderr, "Ocurrio un error al alocar la memoria.\n");
      return ERROR;
    }
  }

  for(int i=0;i<cache.sets;i++){
    for(int j=0;j<cache.ways;j++){
      cache.blocks[i][j].data = calloc(cache.blocksize,sizeof(char));
      if(cache.blocks[i][j].data == NULL){
        fprintf(stderr, "Ocurrio un error al alocar la memoria.\n");
        return ERROR;
      }
    }
  }
  return 0;
}

void destruirCache(){
  for(int i=0;i<cache.sets;i++){
    for(int j=0;j<cache.ways;j++){
      free(cache.blocks[i][j].data);
    }
  }

  for(int i=0;i<cache.sets;i++){
    free(cache.blocks[i]);
  }
  free(cache.blocks);
}


int main(int cantidadArgumentos, char* argumentos[]){
  int estado = 0;
  char archivoInput[MAX_NOMBRE_ARCHIVO] = "";
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

  FILE* fileInput = fopen(archivoInput,MODO_LECTURA);
  if(fileInput==NULL){
      fprintf(stderr, "No se pudo abrir el archivo de entrada.\n");
      return ERROR;
  }

  //REVISAR QUE SEAN VALORES VALIDOS

  estado = inicializarCache(configuracion);
  if(estado == ERROR){
    return estado;
  }

  estado = parsearArchivo(fileInput,configuracion.salida);

  destruirCache();

  fclose(fileInput);
  if(configuracion.salida!=stdout){
    fclose(configuracion.salida);
  }

  return estado;
}
