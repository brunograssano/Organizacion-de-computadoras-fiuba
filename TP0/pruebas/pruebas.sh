#!/bin/bash
espacios() {
    echo
    echo
}
echo Comienza la ejecucion de las pruebas

espacios

	echo -e "\e[1m PRUEBA 1 \e[0m" - Se codifica un archivo vacio llamado "archivoVacio.txt"
	echo
	echo RESULTADO ESPERADO:
	echo El archivo esta vacio, no hay nada para codificar.
	echo RESULTADO:
	./tp -i archivoVacio.txt -o codificado.txt 2>&1
	if ["El archivo esta vacio, no hay nada para codificar." ==  ./tp -i archivoVacio.txt -o codificado.txt]
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi


espacios

	echo -e "\e[1m PRUEBA 2 \e[0m" - Se manda el siguiente archivo que no esta en base 64 llamado "noEstoyEn64.txt":
	echo
	echo El archivo "noEstoyEn64.txt":
	cat noEstoyEn64.txt
	echo
	echo RESULTADO ESPERADO:
	echo El archivo enviado no esta en base 64.
	echo RESULTADO:
	./tp -d -i noEstoyEn64.txt -o decodificado.txt 2>&1

espacios

	echo -e "\e[1m PRUEBA 3 \e[0m" - Codificamos y decodificamos el archivo "quijote.txt" y esperamos obtener lo mismo:
	echo
	echo Archivo "quijote.txt" inicalmente:
	cat quijote.txt
	echo
	./tp -i quijote.txt -o quijoteCodificado.txt
	echo Codificacion del archivo:
	cat quijoteCodificado.txt
	echo
	echo RESULTADO ESPERADO:
	echo En un lugar de la Mancha de cuyo nombre no quiero acordarme
	resultadoObtenido =$(./tp -d -i quijoteCodificado.txt)
	echo RESULTADO:
	echo $resultadoObtenido
	if ["En un lugar de la Mancha de cuyo nombre no quiero acordarme" ==  resultadoObtenido]
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 4 \e[0m" - No mandamos ningun argumento al tp
	echo
	echo RESULTADO ESPERADO:
	echo "Debe mandar mas argumentos, o mandar por entrada estandar. Puede ver ayuda enviando el parametro -h"
	echo RESULTADO:
	resultadoObtenido =$(./tp)
  echo $resultadoObtenido
  if ["Debe mandar mas argumentos, o mandar por entrada estandar. Puede ver ayuda enviando el parametro -h" ==  resultadoObtenido]
  then
      echo -e "\e[32m PRUEBA SUPERADA \e[0m"
  else
      echo -e "\e[31m PRUEBA FALLADA \e[0m"
  fi

espacios

	echo -e "\e[1m PRUEBA 5 \e[0m" - Mandamos un archivo inexistente por terminal
	echo
	echo RESULTADO ESPERADO:
	echo El archivo ingresado por terminal no existe o esta vacio.
	echo RESULTADO:
	cat archivoInexistente | ./tp 2>&1

espacios

	echo -e "\e[1m PRUEBA 6 \e[0m"- Al usar /dev/null no se muestran errores por stderr
	echo RESULTADO ESPERADO:
	echo
	echo Ejecutamos lo siguiente: ./tp 2> /dev/null
	echo RESULTADO:
	./tp 2> /dev/null

espacios

	echo -e "\e[1m PRUEBA 7 \e[0m" - Codificafamos un archivo con solo ceros
	echo El archivo a codificar contiene: "'\x00\x00\x00'"
	echo RESULTADO ESPERADO:
	esperado="$(printf '\x00\x00\x00' | base64)"
  echo $esperado
	echo RESULTADO:
	obtenido="$(printf '\x00\x00\x00' | ./tp)"
  echo $obtenido
  if [esperado = obtenido];
  then
      echo -e "\e[32m PRUEBA SUPERADA \e[0m"
  else
      echo -e "\e[31m PRUEBA FALLADA \e[0m"
  fi

espacios

	echo -e "\e[1m PRUEBA 8 \e[0m" - Mandamos un archivo vacio por terminal y el error no se muestra al mandarlo a /dev/null
	echo Ejecutamos lo siguiente: "echo -n "" |./tp"
	echo Y luego: "echo -n "" | ./tp 2> /dev/null"
	echo RESULTADO ESPERADO:
	echo
	echo RESULTADO:
	echo -n "" | ./tp 2> /dev/null

espacios

	echo -e "\e[1m PRUEBA 9 \e[0m" - Mandamos un archivo vacio por terminal y se devuelve distinto de 0
	echo Ejecutamos lo siguiente: "echo -n "" |./tp"
	echo Y luego: "echo $ ?"
	echo RESULTADO ESPERADO:
	echo -1
	echo RESULTADO:
	echo -n "" | ./tp
	echo $?

espacios
