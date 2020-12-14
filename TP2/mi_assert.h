#ifndef __MI_ASSERT_H__
#define __MI_ASSERT_H__
#include <stdio.h>
#include <stdbool.h>
#define assert(resultado,mensaje,contador) mi_assert(resultado,mensaje,&contador,__FILE__, __LINE__)

/* Muestra el resultado general de la prueba
 */
void mostrar_resultado(bool estado,int* pruebas_pasadas);

/* Comprueba si se cumple la expresion booleana recibida, muestra el mensaje por pantalla.
 */
void mi_assert(bool resultado,char* mensaje,int *contador,char* file,int line);

/* Comprueba si paso las pruebas.
 * Para ello, recibe una cantidad que indica las que paso, y otro que indica las esperadas.
 * Imprime por pantalla el resultado.
 */
void verificar_si_paso_las_pruebas(int contador_pruebas_pasadas,int pruebas_a_pasar);


#endif /* __MI_ASSERT_H__ */
