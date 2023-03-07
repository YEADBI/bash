#!/bin/bash

# Variable
#paht=/mnt/c/Users/yesid/Downloads/devOps/entrada.in
#paht1=${2}/mnt/c/Users/yesid/Downloads/devOps/Taller1/file_salida
paht="${1}"
paht1=${2}

#Ayuda     
    # Forma de ejecutar la bash >>>> ./Delete-arch  [Rurta/archivo.in]  [Rurta(destino)]  
    # Ejemplo   >>>>> ./Delete-arch /mnt/c/DevOps/Taller/entrada.in /mnt/c/DevOps/Taller/file_salida  

# Ejecución
while IFS= read -r line
do
    if [[ "$line" =~ [_] ]]
    then
        $(cd $paht1 ; rm "$line")
    fi     
done < $paht 

cd $paht1 ; ls Archivo* > salida_out.txt ; cat -b salida_out.txt