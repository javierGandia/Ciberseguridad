#!/bin/bash
#Listado del descomprimido
Listado=$(7z l bandit12.gzip | grep "Name" -A 2 | tail -n 1 |awk 'NF{print $NF}')
7z x bandit12.gzip  > /dev/null 2>&1
#While loop
while true; do
#Descomprimir el archivo descomprimido
	7z l $Listado > /dev/null 2>&1
	if [ "$(echo $?)" == "0" ]; then
#Lista el Desomprimido el archivo descomprimido
		Nuevo_Listado=$(7z l $Listado | grep "Name" -A2 | tail -n 1 | awk 'NF{print $NF}')
#Ejecuta la acción de descomprimir
		7z x $Listado > /dev/null 2>&1  && Listado=$Nuevo_Listado
	else
		cat $Listado; rm data* 2>/dev/null
		exit 1
	fi
done
