#include "base64.h"
#include <stdbool.h>
#define ERROR -1

#define BINARIO_63 0x3F
#define BINARIO_255 0xFF

const char caracteresBase64[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
const int valorAscii[] = { 62, -1, -1, -1, 63, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, -1, 0, 1, 2, 3, 4, 5,
                    6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, -1, 26, 27, 28,
                    29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51 };

/* Lee 3 bytes de plain, escribe 4 bytes en encoded */
int codificar(FILE* plain, FILE* encoded){
    if (plain == NULL){
        fprintf(stderr, "No se puede codificar, el metodo de entrada no existe\n");
        return ERROR;
    }

    if (encoded == NULL){
        fprintf(stderr, "No se puede codificar, el metodo de salida no existe\n");
        return ERROR;
    }

    char textoACodificar[3] = "";
    char salidaCodificada[4] = "====";
    int leido1, leido2, leido3;

    leido1 = fread ( &textoACodificar[0], 1, sizeof(char), plain );
    if(leido1<=0){
      return 0;
    }
    leido2 = fread ( &textoACodificar[1], 1, sizeof(char), plain );
    leido3 = fread ( &textoACodificar[2], 1, sizeof(char), plain );

    int caracterCodificandose = textoACodificar[0];

    caracterCodificandose = (caracterCodificandose << 8 | textoACodificar[1]);
    caracterCodificandose = (caracterCodificandose << 8 | textoACodificar[2]);

    salidaCodificada[0] = caracteresBase64[(caracterCodificandose >> 18) & BINARIO_63];
    salidaCodificada[1] = caracteresBase64[(caracterCodificandose >> 12) & BINARIO_63];

    if(leido2>0){
        salidaCodificada[2] = caracteresBase64[(caracterCodificandose >> 6) & BINARIO_63];
    }
    if(leido3>0){
        salidaCodificada[3] = caracteresBase64[caracterCodificandose & BINARIO_63];
    }

    fwrite(salidaCodificada, sizeof(char), 4, encoded);

    return 0;
}


bool esCaracterValido(char caracter){
    return ((caracter >= '0' && caracter <= '9') || (caracter >= 'A' && caracter <= 'Z') ||
            (caracter >= 'a' && caracter <= 'z') || (caracter == '+' || caracter == '/' || caracter == '='));
}

/* Lee 4 bytes de encoded, escribe 3 bytes en plain */
int decodificar(FILE* encoded, FILE* plain){
    if (encoded == NULL){
        fprintf(stderr, "No se puede decodificar, el metodo de entrada no existe\n");
        return ERROR;
    }

    if (plain == NULL){
        fprintf(stderr, "No se puede decodificar, el metodo de salida no existe\n");
        return ERROR;
    }

    char textoADecodificar[4] = "";
    char salidaDecodificada[3] = "";
    int leidos = fread(textoADecodificar, 4, sizeof(char), encoded);
    if(leidos<=0){
      return 0;
    }

    for (int i=0; i<4; i++) {
        if (!esCaracterValido(textoADecodificar[i])) {
            fprintf(stderr, "El archivo enviado no esta en base 64.\n");
            return ERROR;
        }
    }

    int caracterDecodificandose = valorAscii[textoADecodificar[0]-43];
    caracterDecodificandose = (caracterDecodificandose << 6) | valorAscii[textoADecodificar[1]-43];
    caracterDecodificandose = textoADecodificar[2]=='=' ? (caracterDecodificandose << 6) : ((caracterDecodificandose << 6) | valorAscii[textoADecodificar[2]-43]);
    caracterDecodificandose = textoADecodificar[3]=='=' ? (caracterDecodificandose << 6) : ((caracterDecodificandose << 6) | valorAscii[textoADecodificar[3]-43]);

    salidaDecodificada[0] = (caracterDecodificandose >> 16) & BINARIO_255;
    if (textoADecodificar[2] != '='){
      salidaDecodificada[1] = (caracterDecodificandose >> 8) & BINARIO_255;
    }
    if (textoADecodificar[3] != '='){
      salidaDecodificada[2] = caracterDecodificandose & BINARIO_255;
    }

    fwrite(&salidaDecodificada[0], sizeof(char), 1, plain);
    if(salidaDecodificada[1] != '\0'){
        fwrite(&salidaDecodificada[1], sizeof(char), 1, plain);
    }
    if(salidaDecodificada[2] != '\0'){
        fwrite(&salidaDecodificada[2], sizeof(char), 1, plain);
    }

    return 0;
}
