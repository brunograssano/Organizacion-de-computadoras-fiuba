
/*
#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

const int CANTIDAD_MINIMA_ARGUMENTOS = 1;
const int CANTIDAD_ARGUMENTOS_PARA_CODIFICAR = 5;
const int CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR = 6;
const int CANTIDAD_ARGUMENTOS_PARA_CODIFICAR_SALIDA_ESTANDAR = 3;
const int POS_ARCHIVO_INPUT_ENCODE = 2,POS_COMANDO_OUTPUT_ENCODE = 3,POS_ARCHIVO_OUTPUT_ENCODE = 4;
const int POS_ARCHIVO_INPUT_DECODE = 3,POS_COMANDO_OUTPUT_DECODE = 4,POS_ARCHIVO_OUTPUT_DECODE = 5;
const int ARCHIVO_VACIO = 0;
const int LARGO_MAXIMO_ARCHIVO_POR_TERMINAL = 1000;





#define MODO_LECTURA "r"
#define MODO_ESCRITURA "w"

#define DECODE "-d"
#define INPUT "-i"
#define OUTPUT "-o"
#define VERSION "-V"
#define AYUDA "-h"

#define BINARIO_63 0x3F
#define BINARIO_255 0xFF

///--------------AYUDA Y VERSION--------------///

void imprimirAyuda(){
	printf("Uso: \n");
	printf(" tp0 -h\n");
	printf(" tp0 -V\n");
	printf(" tp0 [opciones]\n");
	printf("Opciones: \n");
	printf(" -V, --version    Imprime la version y termina el programa.\n");
	printf(" -h, --help       Imprime esta informacion.\n");
	printf(" -o, --output     Indica que le sigue la direccion al archivo de salida.\n");
	printf(" -i, --input      Indica que le sigue la direccion al archivo de entrada.\n");
	printf(" -d, --decode     Decodifica un archivo codificado en base 64 .\n");
	printf("Ejemplos: \n");
	printf("	tp0 -i input.txt -o output.txt\n");
	printf("	tp0 -d -i inputInBase64.txt -o outputInText.txt\n");
	printf("	cat input.txt | ./tp0  (Unicamente para codificar)\n");
}

void mostrarVersion(){
	printf("Version 0.0.1\n");
}

///--------------ENCODE--------------///

	bool esMultiploDeTres(long tamanioArchivoInput){
		return tamanioArchivoInput % 3 == 0;
	}


	long calcularTamanioArchivoSalidaBase64(long tamanioArchivoInput){
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

		long tamanioArchivoOutput = calcularTamanioArchivoSalidaBase64(tamanioArchivoInput);
		char* salidaCodificada  = malloc(tamanioArchivoOutput+1);
		if(salidaCodificada == NULL){
			printf("Ha ocurrido un error durante la codificacion.\n");
			return NULL;
		}


		const char caracteresBase64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

		long  caracterCodificandose;
		salidaCodificada[tamanioArchivoOutput] = '\0';

		for (long i=0, j=0; i<tamanioArchivoInput-1; i+=3, j+=4) {

			caracterCodificandose = textoACodificar[i];

			caracterCodificandose = (i+1 < tamanioArchivoInput) ? (caracterCodificandose << 8 | textoACodificar[i+1]) : caracterCodificandose << 8;
			caracterCodificandose = (i+2 < tamanioArchivoInput) ? (caracterCodificandose << 8 | textoACodificar[i+2]) : caracterCodificandose << 8;

			salidaCodificada[j]   = caracteresBase64[(caracterCodificandose >> 18) & BINARIO_63];
			salidaCodificada[j+1] = caracteresBase64[(caracterCodificandose >> 12) & BINARIO_63];

			adicionarCaracteresAlFinalDeLaSecuencia(caracteresBase64,caracterCodificandose,i,j,salidaCodificada, tamanioArchivoInput);
		}

		return salidaCodificada;
	}


char* obtenerTextoCodificado(FILE* archivoInput){

		fseek(archivoInput, 0, SEEK_END);
		long tamanioArchivoInput = ftell(archivoInput);
		fseek(archivoInput, 0, SEEK_SET);

		unsigned char *textoACodificar = malloc(tamanioArchivoInput + 1);
		if(textoACodificar==NULL){
			printf("Ha ocurrido un error durante la codificacion.\n");
			return NULL;
		}

		fread(textoACodificar, 1, tamanioArchivoInput, archivoInput);

		char* salidaCodificada = codificarTexto(textoACodificar, tamanioArchivoInput);

		free(textoACodificar);

		return salidaCodificada;
}


	void hacerConversionABase64(FILE* archivoInput, FILE* archivoOuput){

		char* salidaCodificada = obtenerTextoCodificado(archivoInput);

		if( salidaCodificada ==  NULL){
			return;
		}

		fprintf(archivoOuput, "%s", salidaCodificada);

		free(salidaCodificada);
	}


	void convertirABase64(int cantidadArgumentos, char* argumentos[]){

		if( (cantidadArgumentos == CANTIDAD_ARGUMENTOS_PARA_CODIFICAR) && (strcmp(argumentos[POS_COMANDO_OUTPUT_ENCODE],OUTPUT) == 0) ){

			FILE* archivoInput = fopen(argumentos[POS_ARCHIVO_INPUT_ENCODE], MODO_LECTURA);
			if(archivoInput == NULL){
				printf("El archivo ingresado para codificar no existe.\n");
				return;
			}

			FILE* archivoOutput = fopen(argumentos[POS_ARCHIVO_OUTPUT_ENCODE], MODO_ESCRITURA);
			if(archivoOutput == NULL){
				printf("Hubo un error al crear el archivo de salida.\n");
				fclose(archivoInput);
				return;
			}

			hacerConversionABase64(archivoInput, archivoOutput);

			fclose(archivoInput);
			fclose(archivoOutput);


		}else if(cantidadArgumentos == CANTIDAD_ARGUMENTOS_PARA_CODIFICAR_SALIDA_ESTANDAR){
			FILE* archivoInput = fopen(argumentos[POS_ARCHIVO_INPUT_ENCODE], MODO_LECTURA);
			if(archivoInput == NULL){
				printf("El archivo ingresado para codificar no existe.\n");
				return;
			}

			char* salidaCodificada = obtenerTextoCodificado(archivoInput);

			if( salidaCodificada == NULL ){
				fclose(archivoInput);

				return;
			}

			printf("%s\n", salidaCodificada);

			fclose(archivoInput);
			free(salidaCodificada);

		}else{
			if(cantidadArgumentos < CANTIDAD_ARGUMENTOS_PARA_CODIFICAR){
				printf("Faltan argumentos para poder codificar. Se muestra ayuda.\n");
			}else{
				printf("Se mandaron argumentos de mas. Se muestra ayuda.\n");
			}
			imprimirAyuda();
		}
	}


///--------------DECODE--------------///


	long calcularTamanioArchivoSalidaDeTexto(const unsigned char* textoACodificar, long tamanioArchivoInput){

		long tamanioArchivoOutput = tamanioArchivoInput;

		tamanioArchivoOutput /= 4;
		tamanioArchivoOutput *= 3;

		int i=tamanioArchivoOutput;

		bool termino = false;
		while(i>0 && !termino){
			if (textoACodificar[i] == '='){
	            tamanioArchivoOutput--;
			}else{
      	termino = true;
      }
      i--;
		}
		return tamanioArchivoOutput;
	}


	bool esCaracterValido(char caracter){
		return ((caracter >= '0' && caracter <= '9') || (caracter >= 'A' && caracter <= 'Z') || (caracter >= 'a' && caracter <= 'z') || (caracter == '+' || caracter == '/' || caracter == '='));
	}


	char* decodificarBase64ATexto(const unsigned char* textoADecodificar, long tamanioArchivoInput){

		if (tamanioArchivoInput == ARCHIVO_VACIO){
			printf("El archivo esta vacio, no hay nada para decodificar.\n");
			return NULL;
		}

		if (tamanioArchivoInput % 4 != 0){
			printf("El archivo enviado no esta en base 64.\n");
			return NULL;
		}

		for (long i=0; i<tamanioArchivoInput; i++) {
			if (!esCaracterValido(textoADecodificar[i])) {
				printf("El archivo enviado no esta en base 64.\n");
				return NULL;
			}
		}

		long tamanioArchivoOutput = calcularTamanioArchivoSalidaDeTexto(textoADecodificar, tamanioArchivoInput);
		char* salidaDecodificada  = malloc(tamanioArchivoOutput+1);
		if(salidaDecodificada == NULL){
			printf("Ha ocurrido un error durante la decodificacion.\n");
			return NULL;
		}

		int valorAscii[] = { 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5,
	    									6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28,
	    									29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51 };

	  long caracterDecodificandose;
		for (long i=0, j=0; i<tamanioArchivoInput; i+=4, j+=3) {
			caracterDecodificandose = valorAscii[textoADecodificar[i]-43];
			caracterDecodificandose = (caracterDecodificandose << 6) | valorAscii[textoADecodificar[i+1]-43];
			caracterDecodificandose = textoADecodificar[i+2]=='=' ? (caracterDecodificandose << 6) : ((caracterDecodificandose << 6) | valorAscii[textoADecodificar[i+2]-43]);
			caracterDecodificandose = textoADecodificar[i+3]=='=' ? (caracterDecodificandose << 6) : ((caracterDecodificandose << 6) | valorAscii[textoADecodificar[i+3]-43]);

			salidaDecodificada[j] = (caracterDecodificandose >> 16) & BINARIO_255;
			if (textoADecodificar[i+2] != '='){
				salidaDecodificada[j+1] = (caracterDecodificandose >> 8) & BINARIO_255;
			}
			if (textoADecodificar[i+3] != '='){
				salidaDecodificada[j+2] = caracterDecodificandose & BINARIO_255;
			}
		}

		return salidaDecodificada;
	}


	void hacerConversionATexto(FILE* archivoInput, FILE* archivoOuput){

		fseek(archivoInput, 0, SEEK_END);
		long tamanioArchivoInput = ftell(archivoInput);
		fseek(archivoInput, 0, SEEK_SET);

		unsigned char* textoADecodificar = malloc(tamanioArchivoInput + 1);
		if(textoADecodificar==NULL){
			printf("Ha ocurrido un error durante la decodificacion.\n");
			return;
		}

		fread(textoADecodificar, 1, tamanioArchivoInput, archivoInput);

		char* salidaDecodificada = decodificarBase64ATexto(textoADecodificar, tamanioArchivoInput);
		if(salidaDecodificada==NULL){
			free(textoADecodificar);
			return;
		}

		fprintf(archivoOuput, "%s", salidaDecodificada);

		free(textoADecodificar);
		free(salidaDecodificada);
	}


	void decodificarATexto(int cantidadArgumentos, char* argumentos[]){

		if( (cantidadArgumentos == CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR) && (strcmp(argumentos[POS_COMANDO_OUTPUT_DECODE],OUTPUT) == 0) ){

			FILE* archivoInput = fopen(argumentos[POS_ARCHIVO_INPUT_DECODE], MODO_LECTURA);
			if(archivoInput == NULL){
				printf("El archivo ingresado para decodificar no existe.\n");
				return;
			}

			FILE* archivoOutput = fopen(argumentos[POS_ARCHIVO_OUTPUT_DECODE], MODO_ESCRITURA);
			if(archivoOutput == NULL){
				printf("Hubo un error al crear el archivo de salida.\n");
				fclose(archivoInput);
				return;
			}

			hacerConversionATexto(archivoInput, archivoOutput);

			fclose(archivoInput);
			fclose(archivoOutput);


		}else{
			if(cantidadArgumentos < CANTIDAD_ARGUMENTOS_PARA_DECODIFICAR){
				printf("Faltan argumentos para poder decodificar. Se muestra ayuda.\n");
			}else{
				printf("Se mandaron argumentos de mas. Se muestra ayuda.\n");
			}
			imprimirAyuda();
		}

	}

///--------------MAIN--------------///

char* leerEntradaEstandar(){
		char entrada[LARGO_MAXIMO_ARCHIVO_POR_TERMINAL];
		strcpy(entrada,"\0");
		scanf("%[^\n]", entrada);
		int tamanio = strlen(entrada);
		if(tamanio == ARCHIVO_VACIO){
			printf("El archivo ingresado por terminal no existe o esta vacio.\n");
			return NULL;
		}
		strcat(entrada,"\n");
		char* salida=codificarTexto((unsigned char*)entrada,tamanio);
		return salida;
}


void manejarEntradaEstandar(){
	if (isatty(0)){
		printf("Faltan argumentos\n");
		imprimirAyuda();
	}else{

		char* salida = leerEntradaEstandar();
		if(salida == NULL){
			return;
		}

		printf("%s\n",salida);
		free(salida);
	}
}



void manejarEntrada(int cantidadArgumentos, char* argumentos[]){

	if(cantidadArgumentos == 3){

		FILE* archivoSalida = fopen(argumentos[2] ,MODO_ESCRITURA);
		if(archivoSalida == NULL){
			printf("No se pudo abrir el archivo de salida");
			return;
		}

		char* salida = leerEntradaEstandar();

		if(salida == NULL){
			fclose(archivoSalida);
			return;
		}

		fprintf(archivoSalida, "%s\n",  salida);

		fclose(archivoSalida);
		free(salida);
	}else{

		printf("El uso de los parametros no es correcto");
	}

}


void manejarParametros(int cantidadArgumentos, char* argumentos[]){

	if(strcmp(argumentos[1],OUTPUT) == 0){
		manejarEntrada(cantidadArgumentos, argumentos);
	}else if(strcmp(argumentos[1],DECODE) == 0){
		decodificarATexto(cantidadArgumentos, argumentos);
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
}


int main(int cantidadArgumentos, char* argumentos[]){

	if(cantidadArgumentos>CANTIDAD_MINIMA_ARGUMENTOS){
		manejarParametros(cantidadArgumentos,argumentos);
	}else{
		manejarEntradaEstandar();
	}
	return 0;
}*/
