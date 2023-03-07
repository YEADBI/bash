#!/bin/bash

#Variabales
    #var1=valor 
    # variable Fija    
    var1="${1}"

#Ayuda    
    #Forma en que se ejecuta la >>>> sh PrimerShell.sh "ejemplo cualqueir cosa"    
    #Forma en que se ejecuta la >>>> sh PrimerShell.sh "10*5+15"    
    #Forma en que se ejecuta la >>>> sh PrimerShell.sh 'ejemplo prueba 2'    
    #No aplica: Frma en que se ejecuta la >>>> sh PrimerShell.sh ejemplo prueba 2

#Ejecución    
    echo "$var1"    
    # Solicitar datos por teclado    
    read -p "Por favor Digitar un dato    :" var2
    echo "---------------------------------------"    
    echo resultado : "$var2"    
    echo "---------------------------------------"   
     
     ## Ejecución de tareas de SO    
     #$(pwd)     carpeta actual    
     #$(df -h)   lista     
     #$()        Estructura    
     var3=$(pwd && ls -ltr)    
     echo $var3    
     
     #Procesos Aritmeticos    
     # $(()) Estractura base
    echo "---------------------------------------"    
    echo " Proceso Arimetico                     "    
    echo "---------------------------------------"    
    val4=$(($var1)); echo $val4    
    echo "---------------------------------------"    
    
    input_file='input_file'    
    
    echo "linea 1" >$input_file    
    echo "linea 2" >>$input_file    
    echo "linea 3" >>$input_file    
    
    while IFS= read -r line
    do        
        echo "---------------------------------------"        
        echo " Ciclo interno Lectura de archivo                     "        
        echo "---------------------------------------"        
        echo "$line"    
    done < $input_file   
     
    echo "---------------------------------------"    
    echo " Externo Lectura de archivo                     "   
    echo "---------------------------------------"    
    echo "$input_file"    
    cat -b $input_file    
    
    echo ${var1##*+}    ## extraer a la derecha    
    echo ${var1%+*}     ## extraer a la izquierda

#que NO    
    # var1='Edisson Zuñiga'
    # var1="${1}"
    # echo '$var1'  >>> texto
    # echo "$var1" >>> Variabales 
    # echo " \"$var1\" 'comenatario' pruebas" 