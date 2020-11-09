#!/bin/bash
espacios() {
    echo
    echo
}
newline=$'\n'

echo Comienza la ejecucion de las pruebas

espacios

	echo -e "\e[1m PRUEBA 1 \e[0m" - Se buscan el mcd y mcm de 5 10
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="$(printf "5\n10")"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp 5 10 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 2 \e[0m" - Se busca solo el mcd de 5 10
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="5"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -d 5 10 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 3 \e[0m" - Se busca solo el mcm de 5 10
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="10"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -m 5 10 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 4 \e[0m" - Se buscan el mcd y mcm de 256 192
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="$(printf "64\n768")"	
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp 256 192 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 5 \e[0m" - Se busca solo el mcd de 256 192
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="64"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -d 256 192 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 6 \e[0m" - Se busca solo el mcm de 256 192
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="768"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -m 256 192 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 7 \e[0m" - Se buscan el mcd y mcm de 1111 1294
	echo

	echo RESULTADO ESPERADO:	
	resultadoEsperado="$(printf "1\n1437634")"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp 1111 1294 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 8 \e[0m" - Se busca solo el mcd de 1111 1294
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="1"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -d 1111 1294 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 9 \e[0m" - Se busca solo el mcm de 1111 1294
	echo

	echo RESULTADO ESPERADO:
	resultadoEsperado="1437634"
	echo $resultadoEsperado
	echo RESULTADO OBTENIDO:
	resultadoObtenido=$(./tp -m 1111 1294 )
	echo $resultadoObtenido
	echo
	if [ "$resultadoEsperado" == "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

	echo -e "\e[1m PRUEBA 10 \e[0m" - No mandamos ningun argumento al tp y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp"
	echo "Luego: echo $ ?"
	echo " "
	./tp
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 11 \e[0m" - Le enviamos un solo numero al tp y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp 8"
	echo "Luego: echo $ ?"
	echo " "
	./tp 8
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 12 \e[0m" - Le enviamos un numero no valido al tp y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp 8 -15"
	echo "Luego: echo $ ?"
	echo " "
	./tp 8 -15
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"

	fi
espacios

	echo -e "\e[1m PRUEBA 13 \e[0m" - Le enviamos un numero no valido al tp y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp 8 1"
	echo "Luego: echo $ ?"
	echo " "
	./tp 8 1
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 14 \e[0m" - Le enviamos un numero no valido al tp y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp 8 4294967295"
	echo "Luego: echo $ ?"
	echo " "
	./tp 8 
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 15 \e[0m" - Le enviamos un numero no valido al tp y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp 8 4294967300"
	echo "Luego: echo $ ?"
	echo " "
	./tp 8 4294967300
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 16 \e[0m" - Le enviamos 2 numeros cuyo mcm da overflow y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp 2 4294967295"
	echo "Luego: echo $ ?"
	echo " "
	./tp 2 4294967295
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 17 \e[0m" - Le enviamos -m -d y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp -m -d 2 9"
	echo "Luego: echo $ ?"
	echo " "
	./tp -m -d 2 9
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 18 \e[0m" - Le enviamos -o sin parametro y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp -o"
	echo "Luego: echo $ ?"
	echo " "
	./tp -o
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 19 \e[0m" - Le enviamos -o con un solo numero y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp -o 9"
	echo "Luego: echo $ ?"
	echo " "
	./tp -o 9
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 20 \e[0m" - Le enviamos -o con dos numeros y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp -o 9 16"
	echo "Luego: echo $ ?"
	echo " "
	./tp -o 9 16
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi

espacios

	echo -e "\e[1m PRUEBA 21 \e[0m" - Le enviamos palabras en lugar de numeros y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp esto falla"
	echo "Luego: echo $ ?"
	echo " "
	./tp esto falla
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi
espacios

	echo -e "\e[1m PRUEBA 21 \e[0m" - Le enviamos caracteres especiales y devolvemos distinto de 0
	echo " "
	echo "Ejecutamos: ./tp @ !"
	echo "Luego: echo $ ?"
	echo " "
	./tp @ !
	resultadoObtenido=$(echo $?)
	echo "Ejecutamos y obtenemos:"
  	echo "RESULTADO ESPERADO:"
  	echo "Distinto de 0"
	echo "RESULTADO OBTENIDO:"
	printf "$resultadoObtenido\n"
	if [ "0" != "$resultadoObtenido" ];
	then
			echo -e "\e[32m PRUEBA SUPERADA \e[0m"
	else
			echo -e "\e[31m PRUEBA FALLADA \e[0m"
	fi