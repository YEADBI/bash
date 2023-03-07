#!/bin/bash

# Variable
#paht=/mnt/c/Users/yesid/Downloads/devOps/entrada.in
#paht1=${2}/mnt/c/Users/yesid/Downloads/devOps/Taller1/file_salida
paht="${1}"
paht1=${2}

#Ayuda     
    # Forma de ejecutar la bash >>>> ./Rename-arch  [Rurta/salida_out.txt]  [Rurta(destino)]  
    # Ejemplo   >>>>> ./Rename-arch /mnt/c/DevOps/Taller/file_salida/salida_out.txt  /mnt/c/DevOps/Taller/file_salida

# Ejecución

while IFS= read -r line
do
    #v="${line%.*}-mv.txt"
    $(cd $paht1 ; mv $line "${line%.*}-mv.txt") 
done < $paht 

cd $paht1 ; ls Archivo* > salida_out.txt ; cat -b salida_out.txt