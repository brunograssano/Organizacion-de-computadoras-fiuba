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
	resultadoEsperado="$(printf 5 \n 10)"
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
	resultadoEsperado="64 $newline 768"
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
	resultadoEsperado="1 $newline 1437634"
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




