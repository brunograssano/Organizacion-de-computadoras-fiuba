#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void imprimirAyuda(){
	printf("-");
}

void mostrarVersion(){
	printf("Version 0.0.1");
}


size_t b64_encoded_size(size_t inlen)
{
	size_t ret;

	ret = inlen;
	if (inlen % 3 != 0)
		ret += 3 - (inlen % 3);
	ret /= 3;
	ret *= 4;

	return ret;
}

char *b64_encode(const unsigned char* in, size_t len){

	const char b64chars[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

	char   *out;
	size_t  elen;
	size_t  i;
	size_t  j; 
	size_t  v;

	if (in == NULL || len == 0)
		return NULL;

	elen = b64_encoded_size(len);
	out  = malloc(elen+1);
	out[elen] = '\0';

	for (i=0, j=0; i<len; i+=3 /*BITS*/, j+=4 /*BITS*/) {

		v = in[i];

		v = i+1 < len ? v << 8 | in[i+1] : v << 8;
		v = i+2 < len ? v << 8 | in[i+2] : v << 8;

		out[j]   = b64chars[(v >> 18) & 0x3F];
		out[j+1] = b64chars[(v >> 12) & 0x3F];

		if (i+1 < len) {
			out[j+2] = b64chars[(v >> 6) & 0x3F];
		} else {
			out[j+2] = '=';
		}

		if (i+2 < len) {
			out[j+3] = b64chars[v & 0x3F];
		} else {
			out[j+3] = '=';
		}
	}

	return out;
}


void hacerConversionABase64(FILE* archivoInput, FILE* archivoOuput){
	
	int leidos = fgetc(archivoInput);

	fseek(archivoInput, 0, SEEK_END);
	long fsize = ftell(archivoInput);

	fseek(archivoInput, 0, SEEK_SET);

	unsigned char *string = malloc(fsize + 1);
	fread(string, 1, fsize, archivoInput);

	//string[fsize] = 0;

	char* salida = b64_encode(string, fsize);

	printf("%s",salida);

	free(salida);
	free(string);
}

void convertirABase64(int argc, char* argv[]){

	if( (argc == 5) && (strcmp(argv[3],"-o") == 0) ){

		FILE* archivoInput = fopen(argv[2], "r"); 
		
		if(archivoInput == NULL){
			printf("El archivo no existe");
			return;
		}

		FILE* archivoOutput = fopen(argv[4], "w");						
		if(archivoOutput == NULL){
			printf("Hubo un error al crear el archivo de salida");
			fclose(archivoInput);
			return;
		}

		hacerConversionABase64(archivoInput, archivoOutput);

		fclose(archivoInput);
		fclose(archivoOutput);
		

	}else{
		printf("Faltan argumentos");
		imprimirAyuda();
	}

}


/*Básicamente se tiene
una tabla de conversión de combinaciones de 6 bits a caracteres ASCII,
se ‘corta’ el archivo en secuencias de 6 bits y se transmiten los caracteres
correspondientes a esas secuencias. Cada tres bytes de la secuencia original
se generan cuatro caracteres base64; cuando la cantidad de bytes original no
es múltiplo de tres, se adicionan caracteres ‘=’ al final en cantidad necesaria.*/

// tpo -d -i input -o output
// tpo -i input -o output
// tpo -h
// tpo -V

int main(int argc, char* argv[]){

	if(argc>1){
		


		if(strcmp(argv[1],"-o") == 0){
			//errorOutput();
		}else if(strcmp(argv[1],"-d") == 0){
			//decodificarATexto(argc, argv); 
		}else if(strcmp(argv[1],"-h") == 0){
			imprimirAyuda();
		}else if(strcmp(argv[1],"-V") == 0){
			mostrarVersion();
		}else if(strcmp(argv[1],"-i") == 0){
			convertirABase64(argc, argv);
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


