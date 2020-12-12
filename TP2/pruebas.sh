espacios() {
    echo
    echo
}
newline=$'\n'

echo Comienza la ejecucion de las pruebas

espacios

	echo -e "\e[1m PRUEBA 1 - Configuracion 1 \e[0m"  
	echo

	./tp -c 4 -w 4 -b 32 prueba1.mem

	echo -e "\e[1m PRUEBA 1 - Configuracion 2 \e[0m" 
	echo

	./tp -c 16 -w 1 -b 128 prueba1.mem
	
    	echo -e "\e[1m PRUEBA 2 - Configuracion 1 \e[0m"  
	echo

	./tp -c 4 -w 4 -b 32 prueba2.mem
	

	echo -e "\e[1m PRUEBA 2 - Configuracion 2 \e[0m" 
	echo

	./tp -c 16 -w 1 -b 128 prueba2.mem
	
    	echo -e "\e[1m PRUEBA 3 - Configuracion 1 \e[0m"  
	echo

	./tp -c 4 -w 4 -b 32 prueba3.mem
	

	echo -e "\e[1m PRUEBA 3 - Configuracion 2 \e[0m" 
	echo

	./tp -c 16 -w 1 -b 128 prueba3.mem
	echo
	
    	echo -e "\e[1m PRUEBA 4 - Configuracion 1 \e[0m"  
	echo

	./tp -c 4 -w 4 -b 32 prueba4.mem

	echo -e "\e[1m PRUEBA 4 - Configuracion 2 \e[0m" 
	echo

	./tp -c 16 -w 1 -b 128 prueba4.mem 
	
   	echo -e "\e[1m PRUEBA 5 - Configuracion 1 \e[0m"  
	echo

	./tp -c 4 -w 4 -b 32 prueba5.mem 
	
	echo -e "\e[1m PRUEBA 5 - Configuracion 2 \e[0m" 
	echo

	./tp -c 16 -w 1 -b 128 prueba5.mem 
	
