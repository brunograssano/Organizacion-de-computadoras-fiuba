#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

const int CANTIDAD_MINIMA_ARGUMENTOS = 1;
const int CANTIDAD_ARGUMENTOS_PARA_CODIFICAR = 5;
const int POS_ARCHIVO_INPUT_ENCODE = 2,POS_COMANDO_OUTPUT = 3,POS_ARCHIVO_OUTPUT_ENCODE = 4;

const int ARCHIVO_VACIO = 0;

#define MODO_LECTURA "r"
#define MODO_ESCRITURA "w"

#define DECODE "-d"
#define INPUT "-i"
#define OUTPUT "-o"
#define VERSION "-V"
#define AYUDA "-h"

#define BINARIO_63 0x3F

void imprimirAyuda(){
	printf("Uso: \n");
	printf(" tp0 -h\n");
	printf(" tp0 -V\n");
	printf(" tp0 [opciones]\n");
	printf("Opciones: \n");
	printf(" -V, --version		Imprime la version y termina el programa.\n");
	printf(" -h, --help				Imprime esta informacion.\n");
	printf(" -o, --output			Indica que le sigue la direccion al archivo de salida.\n");
	printf(" -i, --input			Indica que le sigue la direccion al archivo de entrada.\n");
	printf(" -d, --decode			Decodifica un archivo codificado en base 64 .\n");
	printf("Ejemplos: \n");
	printf("	tp0 -i input.txt -o output.txt\n");
	printf("	tp0 -d -i inputInBase64.txt -o outputInText.txt\n");
}

void mostrarVersion(){
	printf("Version 0.0.1\n");
}

bool esMultiploDeTres(long tamanioArchivoInput){
	return tamanioArchivoInput % 3 == 0;
}

long calcularTamanioArchivoSalida(long tamanioArchivoInput){
	long tamanioArchivoOutput = tamanioArchivoInput;

	if (!esMultiploDeTres(tamanioArchivoInput)){
		tamanioArchivoOutput += 3 - (tamanioArchivoInput % 3);
	}

	tamanioArchivoOutput /= 3;
	tamanioArchivoOutput *= 4;

	return tamanioArchivoOutput;
}

void adicionarCaracteresAlFinalDeLaSecuencia(const char* caracteresBase64,long caracterCodificandose,long i,long j,char* salidaCodificada,long tamanioArchivoInput){
	if (i+1 < tamanioArchivoInput) {
		salidaCodificada[j+2] = caracteresBase64[(caracterCodificandose >> 6) & BINARIO_63];
	} else {
		salidaCodificada[j+2] = '=';
	}

	if (i+2 < tamanioArchivoInput) {
		salidaCodificada[j+3] = caracteresBase64[caracterCodificandose & BINARIO_63];
	} else {
		salidaCodificada[j+3] = '=';
	}
}


char* codificarTexto(const unsigned char* textoACodificar, long tamanioArchivoInput){

	if (tamanioArchivoInput == ARCHIVO_VACIO){
		printf("El archivo esta vacio, no hay nada para codificar.\n");
		return NULL;
	}

	long tamanioArchivoOutput = calcularTamanioArchivoSalida(tamanioArchivoInput);
	char* salidaCodificada  = malloc(tamanioArchivoOutput+1);
	if(salidaCodificada == NULL){
		printf("Ha ocurrido un error durante la codificacion.\n");
		return NULL;
	}


	const char caracteresBase64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

	long  caracterCodificandose;
	salidaCodificada[tamanioArchivoOutput] = '\0';

	for (long i=0, j=0; i<tamanioArchivoInput; i+=3, j+=4) {

		caracterCodificandose = textoACodificar[i];

		caracterCodificandose = (i+1 < tamanioArchivoInput) ? (caracterCodificandose << 8 | textoACodificar[i+1]) : caracterCodificandose << 8;
		caracterCodificandose = (i+2 < tamanioArchivoInput) ? (caracterCodificandose << 8 | textoACodificar[i+2]) : caracterCodificandose << 8;

		salidaCodificada[j]   = caracteresBase64[(caracterCodificandose >> 18) & BINARIO_63];
		salidaCodificada[j+1] = caracteresBase64[(caracterCodificandose >> 12) & BINARIO_63];

		adicionarCaracteresAlFinalDeLaSecuencia(caracteresBase64,caracterCodificandose,i,j,salidaCodificada, tamanioArchivoInput);
	}

	return salidaCodificada;
}


void hacerConversionABase64(FILE* archivoInput, FILE* archivoOuput){

	fseek(archivoInput, 0, SEEK_END);
	long tamanioArchivoInput = ftell(archivoInput);
	fseek(archivoInput, 0, SEEK_SET);

	unsigned char *textoACodificar = malloc(tamanioArchivoInput + 1);
	if(textoACodificar==NULL){
		printf("Ha ocurrido un error durante la codificacion.\n");
		return;
	}

	fread(textoACodificar, 1, tamanioArchivoInput, archivoInput);

	char* salidaCodificada = codificarTexto(textoACodificar, tamanioArchivoInput);
	if(salidaCodificada==NULL){
		free(textoACodificar);
		return;
	}

	fprintf(archivoOuput, "%s\n", salidaCodificada);

	free(textoACodificar);
	free(salidaCodificada);
}


void convertirABase64(int cantidadArgumentos, char* argumentos[]){

	if( (cantidadArgumentos == CANTIDAD_ARGUMENTOS_PARA_CODIFICAR) && (strcmp(argumentos[POS_COMANDO_OUTPUT],OUTPUT) == 0) ){

		FILE* archivoInput = fopen(argumentos[POS_ARCHIVO_INPUT_ENCODE], MODO_LECTURA);
		if(archivoInput == NULL){
			printf("El archivo ingresado para codificar no existe.");
			return;
		}

		FILE* archivoOutput = fopen(argumentos[POS_ARCHIVO_OUTPUT_ENCODE], MODO_ESCRITURA);
		if(archivoOutput == NULL){
			printf("Hubo un error al crear el archivo de salida.");
			fclose(archivoInput);
			return;
		}

		hacerConversionABase64(archivoInput, archivoOutput);

		fclose(archivoInput);
		fclose(archivoOutput);


	}else{
		printf("Faltan argumentos para poder codificar.");
		imprimirAyuda();
	}

}




// tpo -d -i input -o output
// tpo -i input -o output
// tpo -h
// tpo -V

int main(int cantidadArgumentos, char* argumentos[]){

	if(cantidadArgumentos>CANTIDAD_MINIMA_ARGUMENTOS){

		if(strcmp(argumentos[1],OUTPUT) == 0){
			//errorOutput();
		}else if(strcmp(argumentos[1],DECODE) == 0){
			//decodificarATexto(argc, argv);
		}else if(strcmp(argumentos[1],AYUDA) == 0){
			imprimirAyuda();
		}else if(strcmp(argumentos[1],VERSION) == 0){
			mostrarVersion();
		}else if(strcmp(argumentos[1],INPUT) == 0){
			convertirABase64(cantidadArgumentos, argumentos);
		}else{
			printf("No es un argumento valido\n");
			imprimirAyuda();
		}

	}else{
		printf("No hubo suficientes argumentos\n");
		imprimirAyuda();
	}

	return 0;
}
