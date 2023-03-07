#!/bin/bash
# Taller 1 Ejercicio 1)
# Busque en la carpeta / los archivo *.sh 
# guarde el resultado en un archivo y en el mismo comando imprimir en consola el archivo de salida

#Variabales
ruta=$1

#Ayuda    
    # Forma de ejecutar la bash >>>> ./Buscar.sh  [Rurta]  
    # Ejemplo   >>>>> ./Buscar.sh /mnt/c/DevOps/Taller

# Ejecución
cd $ruta ; ls *.sh > salida.txt ; cat -b salida.txt
