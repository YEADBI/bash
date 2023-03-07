#!/bin/bash

#Variabales    
varUsuario1=${1}    
varUsuario2=${2}
varUsuario2=${3}

#Ayuda    
    #Forma en que se ejecuta la >>>> sh shellFunction.sh "Edisson" "Andrea"
    
function saludar () {
    echo "imprimir el resultado del Ususario: $Usuario"
}

for Usuario in ${@}; do    
    saludar 
done