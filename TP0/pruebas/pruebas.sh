#!/bin/bash
espacios() {
    echo
    echo
}
newline=$'\n'

echo Comienza la ejecucion de las pruebas

espacios

	echo -e "\e[1m PRUEBA 1 \e[0m" - Se codifica un archivo vacio llamado "archivoVacio.txt"
	echo

	echo RESULTADO ESPERADO: 
	resultadoEsperado="El archivo esta vacio, no hay nada para codificar."
	echo El archivo esta vacio, no hay nada para codificar.
	echo RESULTADO OBTENIDO: 
	resultadoObtenido=$(./tp -i archivoVacio.txt -o codificado.txt 2>&1)
	
	if [ resultadoEsperado == resultadoObtenido ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi


espacios

	echo -e "\e[1m PRUEBA 2 \e[0m" - Se manda a decodificar el archivo que no esta en base 64 llamado "noEstoyEn64.txt":
	echo
	echo El archivo "noEstoyEn64.txt":
	cat noEstoyEn64.txt
	echo
	echo RESULTADO ESPERADO:
	resultadoEsperado=$(printf "El archivo enviado no esta en base 64.\n")
	echo "$resultadoEsperado"
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -d -i noEstoyEn64.txt -o decodificado.txt 2>&1)
	echo "$resultadoObtenido"
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi


espacios

	echo -e "\e[1m PRUEBA 3 \e[0m" - Codificamos y decodificamos el archivo "quijote.txt" y esperamos obtener lo mismo:
	echo
	echo Archivo "quijote.txt" inicalmente:
	cat quijote.txt
	echo
	./tp -i quijote.txt -o quijoteCodificado.txt
	echo Codificacion del archivo:
	cat quijoteCodificado.txt
	echo " "
	echo RESULTADO ESPERADO:
	resultadoEsperado="En un lugar de La Mancha de cuyo nombre no quiero acordarme"
	echo "$resultadoEsperado"
	./tp -d -i quijoteCodificado.txt -o quijoteDecodificado.txt
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(cat quijoteDecodificado.txt)
	echo "$resultadoObtenido"
	
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi
	

espacios

	echo -e "\e[1m PRUEBA 4 \e[0m" - No mandamos ningun argumento al tp
	echo " "
	echo "Ejecutamos: ./tp"
	echo " "
	echo RESULTADO ESPERADO:
	resultadoEsperado=$(printf"Debe mandar mas argumentos, o mandar por entrada estandar. Puede ver ayuda enviando el parametro -h" \n)
	echo "$resultadoEsperado"
	echo RESULTADO OBTENIDO:
	resultadoObtenido="$(./tp)"
	echo "$resultadoObtenido"	
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi
	

espacios

	echo -e "\e[1m PRUEBA 5 \e[0m" - Mandamos un archivo inexistente por terminal
	echo
	echo RESULTADO ESPERADO:
	resultadoEsperado=$(printf "El archivo ingresado por terminal no existe o esta vacio.")
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$( cat archivoInexistente.txt | ./tp 2>&1 )
	echo $resultadoObtenido
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 6 \e[0m"- Al usar /dev/null no se muestran errores por stderr
	echo RESULTADO ESPERADO:
	resultadoEsperado=""
	echo $resultadoEsperado
	echo Ejecutamos lo siguiente: ./tp 2> /dev/null
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp 2> /dev/null)
	echo $resultadoObtenido
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

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
