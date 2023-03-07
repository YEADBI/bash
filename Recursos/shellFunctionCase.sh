#!/bin/bash

while :
do    
    # Limpiar pantalla
        clear

    # Limpieaza de variables
        unset choice

    # display menu 

        echo "- --------------------------------- -"        
        echo "-  Server Name: [$(hostname)]       -"        
        echo "- --------------------------------- -"        
        echo "-  Aprovisionar el Servidor         -"        
        echo "- --------------------------------- -"        
        echo "-  1. Cambiar nombre Servidor       -"        
        echo "- --------------------------------- -"        
        echo "-  V. Volver Menu Principal         -"        
        echo "-  E. Exit                          -"        
        echo "- --------------------------------- -"    
        
    # Obtener entrada del Usuario
        read -p "Enter your choice [1-100] " choice
    
    # get input from the user         
        case $choice in        
        1)  
            echo -e "\n--------------------------------------------------------------------------------"            
            echo "   Nombre Server Actual                :[$(hostname)] "            
            
            echo -e "\n----- Fin del Script -----------------------------------------------------------"
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;
        2)

            echo -e "\n----- Fin del Script -----------------------------------------------------------"            
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;
        E)
            #break 
            exit 0
            ;;  
        *)
            echo "Error: Invalid option..."                
            read -p "Press [Enter] key to continue..." readEnterKey
            ;;
        esac
done