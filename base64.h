#ifndef __BASE_64_H__
#define __BASE_64_H__

#include <stdlib.h>
#include <stdio.h>

/* Lee 3 bytes de plain, escribe 4 bytes en encoded */
int codificar(FILE* plain, FILE* encoded);

/* Lee 4 bytes de encoded, escribe 3 bytes en plain */
int decodificar(FILE* encoded, FILE* plain);

#endif /* __BASE_64_H__ */
