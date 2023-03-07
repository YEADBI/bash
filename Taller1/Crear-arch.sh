#!/bin/bash

# Variable
#paht=/mnt/c/Users/yesid/Downloads/devOps/entrada.in
#paht1=/mnt/c/Users/yesid/Downloads/devOps/Taller1/file_salida
paht="${1}"
paht1="${2}"

#Ayuda     
    # Forma de ejecutar la bash >>>> ./Crear-arch.sh  [Rurta/archivo.in]  [Rurta(destino)]  
    # Ejemplo   >>>>> ./Crear-arch.sh /mnt/c/DevOps/Taller/entrada.in /mnt/c/DevOps/Taller/file_salida 

# Ejecución

while IFS= read -r line
do
    $(cd $paht1 ; touch "$line") 
done < $paht

cd $paht1 ; ls Archivo* > salida_out.txt ; cat -b salida_out.txt 