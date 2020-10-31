#!/bin/bash
espacios() {
    echo 
    echo
    echo
    echo
}
echo Comienza la ejecucion de las pruebas

espacios

	echo PRUEBA 1 - Se codifica un archivo vacio llamado "archivoVacio.txt"
	echo
	echo RESULTADO:
		./tp -i archivoVacio.txt -o codificado.txt

espacios

	echo PRUEBA 2 - Se manda el siguiente archivo que no esta en base 64 llamado "noEstoyEn64.txt":
	echo
	echo El archivo "noEstoyEn64.txt":
	cat noEstoyEn64.txt
	echo
	echo RESULTADO:
	./tp -d -i noEstoyEn64.txt -o decodificado.txt

espacios

	echo PRUEBA 3 - Codificamos y decodificamos el archivo "quijote.txt" y esperamos obtener lo mismo:
	echo
	echo Archivo "quijote.txt" inicalmente:
	cat quijote.txt
	echo
	./tp -i quijote.txt -o quijoteCodificado.txt
	echo Codificacion del archivo:
	cat quijoteCodificado.txt
	echo
	echo Decodificamos lo anterior y obtenemos el siguiente resultado
	./tp -d -i quijoteCodificado.txt -o quijoteDecodificado.txt
	echo RESULTADO:
	cat quijoteDecodificado.txt

espacios

	echo PRUEBA 4 - No mandamos ningun argumento al tp
	echo
	echo RESULTADO:
	./tp

espacios

	echo PRUEBA 5 - Mandamos un archivo inexistente por terminal
	echo
	echo RESULTADO:
	cat archivoInexistente | ./tp

espacios

	echo PRUEBA 6 - Al usar /dev/null no se muestran errores por stderr
	echo RESULTADO:
	echo Ejecutamos lo siguiente: ./tp 2> /dev/null
	./tp 2> /dev/null

espacios

	echo PRUEBA 7 - Codificafamos un archivo con solo ceros
	echo El archivo a codificar contiene: "'\x00\x00\x00'"
	echo RESULTADO:
	printf '\x00\x00\x00' | ./tp

espacios

	echo PRUEBA 8 - Mandamos un archivo vacio por terminal y el error no se muestra al mandarlo a /dev/null
	echo Ejecutamos lo siguiente: "echo -n "" |./tp"
	echo Y luego: "echo -n "" | ./tp 2> /dev/null"
	echo RESULTADO:
	echo -n "" | ./tp 2> /dev/null

espacios

	echo PRUEBA 9 - Mandamos un archivo vacio por terminal y se devuelve distinto de 0
	echo Ejecutamos lo siguiente: "echo -n "" |./tp"
	echo Y luego: "echo $ ?"
	echo RESULTADO:
	echo -n "" | ./tp
	echo $?

espacios


