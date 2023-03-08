#!/bin/bash
clear

# echo "Ramas del Repositorio :"
#     git branch -r

# read -p ">> Digite su comentario:  " comment
# read -p ">> Digite el nombre de la rama:  " rama

# Variables
    comment=$1
    rama=$2
    
 # Ayuda
    # Forma de ejecutar la bash >>>> ./gitbash [comentario]  [rama]
    # Ejemplo   >>>>> ./gitbash "Script"  "Scripting"

if [[ -z $comment ]] || [[ -z $rama ]]; then  # Si no se envia los patametros
    source  orquestador.sh
fi

read -p "Press [Enter] key to continue..." readEnterKey

# Configuración global 
    git config --global user.email "yesidizq@hotmail.com"
    git config --global user.name "Yesid Briceño"
    git config --global core.autocrlf false 

# Ejecucion
    echo -e "\n- -------------------------------------------------------- -"
    echo -e "\nDesea clonar el repositorio ?" 
    echo "*) Presione la tecla [Y]."
    read -p "*) Para omitir esta operación digite una tecla diferente: " clone
    if [[ $clone =~ ^[Yy]$ ]]; then
        read -p ">> Ingrese la ruta del repositorio a clonar : " Ruta
        cd $Ruta ; git clone git@github.com:YEADBI/scripting.git   
    fi    
    echo -e "\n###########################################################"
    echo -e "\ncomment ["$comment"] | rama ["$rama"]"
    echo "inicia carga en git"
    echo -e "\n################# inicia carga en Git #####################"

    git checkout $rama
    read -p "Press [Enter] key to continue..." readEnterKey   
    git status

    git add .
    read -p "Press [Enter] key to continue..." readEnterKey

    echo -e "\n######################  commit  ###########################"
    git commit -m "$comment"   
    read -p "Presione la tecla [Enter] para continuar..." readEnterKey

    echo -e "\n##################### push origin #########################"
    git push origin $rama    
    echo -e "\n----- Fin del Script -----------------------------------------------------------"    
    read -p "Presione la tecla [Enter] para continuar..." readEnterKey