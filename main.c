#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <getopt.h>

#include "base64.h"

#define DECODE 'd'
#define INPUT 'i'
#define OUTPUT 'o'
#define VERSION 'v'
#define AYUDA 'h'
#define MAX_NOMBRE_ARCHIVO 256
#define MODO_LECTURA "r"
#define MODO_ESCRITURA "w"

const int LARGO_MAXIMO_ARCHIVO_POR_TERMINAL = 1000;
const int TERMINO = -1, VACIO = 0, ERROR = -1;;

////--------------OTROS----------------////

void imprimirAyuda(){
  	printf("Uso: \n");
  	printf(" tp -h\n");
  	printf(" tp -v\n");
  	printf(" tp [opciones]\n");
  	printf("Opciones: \n");
  	printf(" -v, --version    Imprime la version y termina el programa.\n");
  	printf(" -h, --help       Imprime esta informacion.\n");
  	printf(" -o, --output     Indica que le sigue la direccion al archivo de salida.\n");
  	printf(" -i, --input      Indica que le sigue la direccion al archivo de entrada.\n");
  	printf(" -d, --decode     Decodifica un archivo codificado en base 64 .\n");
  	printf("Ejemplos: \n");
  	printf("	tp -i input.txt -o output.txt\n");
  	printf("	tp -d -i inputInBase64.txt -o outputInText.txt\n");
  	printf("	cat input.txt | ./tp\n");
    printf("	cat input.txt | ./tp -d\n");
}

void mostrarVersion(){
	 printf("Version 1.0.1\n");
}

void manejarParametros(int cantidadArgumentos,char* argumentos[],char archivoInput[MAX_NOMBRE_ARCHIVO],char archivoOutput[MAX_NOMBRE_ARCHIVO],bool* pidioDecode,bool* pidioOtraOpcion){
    static struct option opcionesLargas[] = {
       {"input", required_argument, 0, 'i'},
       {"decode", no_argument, 0, 'd'},
       {"help", no_argument, 0, 'h'},
       {"output", required_argument, 0, 'o'},
       {"version", no_argument, 0, 'v'},
       {0, 0, 0, 0}
    };
    int argumento;
    int indiceOpcion = 0;
    bool pidioAyuda = false, pidioVersion = false;

    while((argumento = getopt_long(cantidadArgumentos, argumentos, "i:dho:v",opcionesLargas, &indiceOpcion))!=TERMINO){
        switch (argumento) {
            case DECODE:
                (*pidioDecode) = true;
                break;
            case INPUT:
                strcpy(archivoInput,optarg);
                break;
            case OUTPUT:
                strcpy(archivoOutput,optarg);
                break;
            case VERSION:
                if(!pidioVersion){
                    (*pidioOtraOpcion) = true;
                    pidioVersion = true;
                    mostrarVersion();
                }
                break;
            case AYUDA:
                if(!pidioAyuda){
                    (*pidioOtraOpcion) = true;
                    pidioAyuda = true;
                    imprimirAyuda();
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
}


////--------------DECODIFICACION----------------////

int decodificacion(FILE* entrada, FILE* salida){
    int estado = 0;
    while(!feof(entrada) && estado != ERROR){
        estado = decodificar(entrada,salida);
    }
    printf("\n");
    return estado;
}

int manejarDecodificacionArchivos(char archivoInput[MAX_NOMBRE_ARCHIVO],char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  int estado;
  FILE* inputFile = fopen(archivoInput, MODO_LECTURA);
  if(inputFile == NULL){
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoInput);
    return ERROR;
  }

  FILE* outputFile = fopen(archivoOutput, MODO_ESCRITURA);
  if(outputFile == NULL){
    fclose(inputFile);
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoOutput);
    return ERROR;
  }

  estado = decodificacion(inputFile,outputFile);

  fclose(inputFile);
  fclose(outputFile);
  return estado;
}

int manejarDecodificacionEntradaArchivoSalidaEstandar(char archivoInput[MAX_NOMBRE_ARCHIVO]){
  int estado = 0;
  FILE* inputFile = fopen(archivoInput, MODO_LECTURA);
  if(inputFile == NULL){
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoInput);
    return ERROR;
  }

  estado = decodificacion(inputFile,stdout);

  fclose(inputFile);
  return estado;
}

int manejarDecodificacionEntradaEstandarSalidaArchivo(char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  int estado = 0;
  FILE* outputFile = fopen(archivoOutput, MODO_ESCRITURA);
  if(outputFile == NULL){
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoOutput);
    return ERROR;
  }

  estado = decodificacion(stdin,outputFile);

  fclose(outputFile);
  return estado;
}

int manejarDecodificacion(char archivoInput[MAX_NOMBRE_ARCHIVO],char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  int estado;
  int tamanioInput = strlen(archivoInput);
  int tamanioOutput = strlen(archivoOutput);

  if(tamanioInput > VACIO && tamanioOutput > VACIO){
      estado = manejarDecodificacionArchivos(archivoInput,archivoOutput);
  }
  else if(tamanioInput > VACIO && tamanioOutput == VACIO){
      estado = manejarDecodificacionEntradaArchivoSalidaEstandar(archivoInput);
  }
  else if(tamanioInput == VACIO && tamanioOutput > VACIO){
      estado = manejarDecodificacionEntradaEstandarSalidaArchivo(archivoOutput);
  }
  else if((tamanioInput == VACIO) && (tamanioOutput == VACIO) && !isatty(0)){
      estado = decodificacion(stdin,stdout);
  }
  else{
      fprintf(stderr, "Debe mandar mas argumentos, o mandar por entrada estandar. Puede ver ayuda enviando el parametro -h \n");
      estado = ERROR;
  }
  return estado;
}

////--------------CODIFICACION----------------////

int codificacion(FILE* entrada, FILE* salida){
    int estado = 0;
    while(!feof(entrada) && estado != ERROR){
        estado = codificar(entrada,salida);
    }
    printf("\n");
    return estado;
}

int manejarCodificacionArchivos(char archivoInput[MAX_NOMBRE_ARCHIVO],char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  int estado;
  FILE* inputFile = fopen(archivoInput, MODO_LECTURA);
  if(inputFile == NULL){
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoInput);
    return ERROR;
  }

  FILE* outputFile = fopen(archivoOutput, MODO_ESCRITURA);
  if(outputFile == NULL){
    fclose(inputFile);
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoOutput);
    return ERROR;
  }

  estado = codificacion(inputFile,outputFile);

  fclose(inputFile);
  fclose(outputFile);
  return estado;
}

int manejarCodificacionEntradaArchivoSalidaEstandar(char archivoInput[MAX_NOMBRE_ARCHIVO]){
  int estado = 0;
  FILE* inputFile = fopen(archivoInput, MODO_LECTURA);
  if(inputFile == NULL){
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoInput);
    return ERROR;
  }

  estado = codificacion(inputFile,stdout);

  fclose(inputFile);
  return estado;
}

int manejarCodificacionEntradaEstandarSalidaArchivo(char archivoOutput[MAX_NOMBRE_ARCHIVO]){
  int estado = 0;
  FILE* outputFile = fopen(archivoOutput, MODO_ESCRITURA);
  if(outputFile == NULL){
    fprintf(stderr, "Hubo un error al crear el archivo de salida en: %s",archivoOutput);
    return ERROR;
  }

  estado = codificacion(stdin,outputFile);

  fclose(outputFile);
  return estado;
}

int manejarCodificacion(char archivoInput[MAX_NOMBRE_ARCHIVO],char archivoOutput[MAX_NOMBRE_ARCHIVO]){
    int estado = 0;
    int tamanioInput = strlen(archivoInput);
    int tamanioOutput = strlen(archivoOutput);

    if(tamanioInput > VACIO && tamanioOutput > VACIO){
        estado = manejarCodificacionArchivos(archivoInput,archivoOutput);
    }
    else if(tamanioInput > VACIO && tamanioOutput == VACIO){
        estado = manejarCodificacionEntradaArchivoSalidaEstandar(archivoInput);
    }
    else if(tamanioInput == VACIO && tamanioOutput > VACIO){
        estado = manejarCodificacionEntradaEstandarSalidaArchivo(archivoOutput);
    }
    else if((tamanioInput == VACIO) && (tamanioOutput == VACIO) && !isatty(0)){
        estado = codificacion(stdin,stdout);
    }
    else{
        fprintf(stderr, "Debe mandar mas argumentos, o mandar por entrada estandar. Puede ver ayuda enviando el parametro -h \n");
        estado = ERROR;
    }
    return estado;
}

////--------------MAIN----------------////

int main(int cantidadArgumentos, char* argumentos[]){
    char archivoInput[MAX_NOMBRE_ARCHIVO] = "";
    char archivoOutput[MAX_NOMBRE_ARCHIVO] = "";
    bool pidioDecode = false, pidioOtraOpcion = false;
    int estado = 0;

    manejarParametros(cantidadArgumentos,argumentos,archivoInput,archivoOutput,&pidioDecode, &pidioOtraOpcion);

    if(pidioDecode && !pidioOtraOpcion){
        estado = manejarDecodificacion(archivoInput,archivoOutput);
    }
    else if(!pidioOtraOpcion){
        estado = manejarCodificacion(archivoInput,archivoOutput);
    }

    return estado;
}
