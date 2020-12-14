#include "mi_assert.h"
#define COLOR_RED     "\x1b[31m"
#define COLOR_GREEN   "\x1b[32m"
#define COLOR_RESET   "\x1b[0m"

/* Muestra el resultado general de la prueba
 */
void mostrar_resultado(bool estado,int* pruebas_pasadas){
	printf("\n------>Resultado de la prueba:%s \n",estado?COLOR_GREEN" PASSED :)"COLOR_RESET:COLOR_RED" FAILED :("COLOR_RESET);
	if(estado){
		(*pruebas_pasadas)++;
	}
}

/* Comprueba si se cumple la expresion booleana recibida, muestra el mensaje por pantalla.
 * En caso de error mostrara la linea y el archivo. Si paso la prueba aumenta el contador.
 */
void mi_assert(bool resultado,char* mensaje,int *contador,char* archivo,int linea){
	if(resultado){
		printf("-->%s:"COLOR_GREEN" OK\n"COLOR_RESET,mensaje );
		(*contador)++;
	}
	else{
		printf("-->%s:"COLOR_RED" ERROR\n" COLOR_RESET,mensaje);
		printf("----> Archivo: %s , Linea: %i\n",archivo,linea);
	}
}

/* Comprueba si paso las pruebas.
 * Para ello, recibe una cantidad que indica las que paso, y otro que indica las esperadas.
 * Imprime por pantalla el resultado.
 */
void verificar_si_paso_las_pruebas(int contador_pruebas_pasadas,int pruebas_a_pasar){
	if(contador_pruebas_pasadas==pruebas_a_pasar){
		printf("\nPaso las %i pruebas.\n",pruebas_a_pasar);
	}
	else{
		printf("\nNo paso todas las pruebas, paso solo %i de %i\n",contador_pruebas_pasadas,pruebas_a_pasar);
	}
}
