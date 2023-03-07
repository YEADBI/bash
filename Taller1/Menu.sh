#!/bin/bash
clear
# set an infinite loop
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
	echo "-  1. Cambiar nombre del Servidor   -"
	echo "- --------------------------------- -"
    echo "-  2. Cambiar Partición Discos      -"
	echo "- --------------------------------- -"
    echo "-  3. Cambiar IP Servidor           -"
    echo "- --------------------------------- -"
    echo "-  4. Editar tabla Host             -"
	echo "- --------------------------------- -"
    echo "-  5. Agregar Permisos de Firewall  -"
    echo "- --------------------------------- -"
    echo "-  6. Editar DNS Server             -"
    echo "- --------------------------------- -"
    echo "-  7. Configurar proxy              -"
	echo "- --------------------------------- -"
    echo "-  8. Instalar Docker               -"
	echo "- --------------------------------- -"
    echo "-  E. Exit                          -"
    echo "- --------------------------------- -"
	# get input from the user 
	read -p "Enter your choice [1-8] " choice

	case $choice in
	1) 	
        echo -e "\n----------------------------------------------------------------------------------------"
        echo "   Nombre del Server Actual                :[$(hostname)] "
        read -p ">> Digite el NUEVO nombre del Servidor : " NameHost
        echo -e "\n----------------------------------------------------------------------------------------"
        
        sudo hostname "$NameHost" #sudo hostnamectl set-hostname $NameHost
        echo "Verifique la variable [ preserve_hostname:  true ] en el archivo /etc/cloud/cloud.cfg"
        
        echo "--------------------------------------------------------------------------------------"
        preser=$(grep preserve_hostname /etc/cloud/cloud.cfg)
        echo ">> Resultado /etc/cloud/cloud.cfg: [ >> $preser << ]"
        echo ">> Nombre del Server Actual: [$(hostname)] "

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        ;;
    2)  
        echo "--------------------------------------------------------------------------------------"
        echo " Particionar el Discon. Instale >> [ apt install gparted ] "
        echo -e "\n Paso 1: ejecutar y modificar [ gparted ]"
        echo " Paso 2: fdisk -l"
        echo " Paso 3: mkdir /Data"
        echo " Paso 4: Agregar Disco al Inicio nano /etc/fstab /dev/sda9     /Data ext4 defaults 0       0"
        echo " Paso 5: reboot"
        echo "--------------------------------------------------------------------------------------"
        
        read -p "Paso 1: Desea Particionar el Disco (y/n)? " answer

            if [[ $answer =~ ^[Yy]$ ]]
                then
                    sudo gparted
                fi

            echo "Paso 2: Listado de particiones del servidor"
            echo "---------------------------------------------------------------------------------------"
            df -h
            echo "---------------------------------------------------------------------------------------"
            sudo fdisk -l
            
            echo -e "\n----------------------------------------------------------------------------------------"
            echo " Paso 3: Digite Nombre de Carpeta Ejemplo :[ /Data ] "
            read -p ">> Crear la Carpeta  : " NameDir
            
            sudo mkdir -p $NameDir
            sudo chown -R $user:$user $NameDir
            ls -ltr $NameDir

            echo -e "\n----------------------------------------------------------------------------------------"
            
            echo -e "\n-Paso 4: Agregar Particion al Inicio del servidor en la ultima linea del archivo."
            echo "Estructura Ejemplo: [ /dev/sda9     $NameDir ext4 defaults 0       0 ]"
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey

            sudo nano /etc/fstab
        read -p "Paso 5: Deseas Reiniciar el servidor (y/n)? " fsta
            if [[ $fsta =~ ^[Yy]$ ]]
                then
                    sudo reboot
                fi

        echo -e "\n----- Fin del Script -----------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        ;;
    3) 
        sudo apt install net-tools -y
        clear
        echo "---------------------------------------------------------------------------------------------------"
        echo -e "\nPara modificarla IP del Servidor con el editor nano tenga en cuenta:"
        echo -e "\n\t1) Para guardar  los cambios use la combinación de teclas [Ctrl + O] y luego [Enter]
        2) Para salir del editor nano use la combinación de teclas [Ctrl + X]"
        echo -e "\n---------------------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        echo -e "\n---------------------------------------------------------------------------------------------------"
        echo " Ejemplo de /etc/netplan/50-cloud-init.yaml"
        echo " network: "
        echo "     ethernets:"
        echo "         enp0s3:"
        echo "             addresses: [192.168.137.3/22]"
        echo "            gateway4: 192.168.137.100"
        echo "             nameservers:"
        echo "                 addresses:"
        echo "                 - 192.168.137.100"
        echo "                 - 8.8.8.8"
        echo "     version: 2"
        echo -e "\n----------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey

        sudo nano /etc/netplan/50-cloud-init.yaml

        read -p "Al aplicar este cambio conectese con la NUEVA IP Presione [Enter] para continuar..." readEnterKey
        sudo sudo netplan apply

        echo -e "\n----- Fin del Script -------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        ;;
    4)
        echo -e "\n---------------------------------------------------------------------------------------------------"
        echo "Sugerencia: No modifique la configuración por defecto "   
        echo "Ejemplo:"
        echo -e "\n# Agregue configuración Adicional"
        echo -e "\n92.168.56.101  www.DevOps.dev"
        echo "27.0.0.1  DV.example.com"
        echo "---------------------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey

        echo "---------------------------------------------------------------------------------------------------"
        echo -e "\nPara modificar la Tabla Host con el editor nano tenga en cuenta:"
        echo -e "\n\t1) Para guardar  los cambios use la combinación de teclas [Ctrl + O] y luego [Enter]
        2) Para salir del editor nano use la combinación de teclas [Ctrl + X]"
        echo -e "\n---------------------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        sudo nano /etc/hosts

        echo -e "\n----------------------------- Fin del Script ------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        ;;
    5)  
        sudo apt update 
        sudo apt install vsftpd
        clear
        # sudo service vsftpd status
        echo '- ------------------------------------ -'
        echo '- 1. Habilitar el Firewall             -'
        echo '- ------------------------------------ -'
        echo '- 2. Ver estado del Firewall           -'
        echo '- ------------------------------------ -'
        echo '- 3. Habilitar puerto TCP              -'
        echo '- ------------------------------------ -'
        echo '- 4. Habilitar puerto UDP              -'
        echo '- ------------------------------------ -'
        echo '- 5. Habilitar rango puerto TCP        -'
        echo '- ------------------------------------ -'
        echo '- 6. Habilitar rango puerto UDP        -'
        echo '- ------------------------------------ -'
        echo '- 7. Probar [netstat]                  -'
        echo '- ------------------------------------ -'
        echo '- 8. Probar con [curl]                 -'
        echo '- ------------------------------------ -'
        read -p 'Ingrese su elección [1-8] ' F

        if [[ $F -eq 1 ]]; then
            sudo ufw enable
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 2 ]]; then
            sudo ufw status
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 3 ]]; then
            read -p "Ingrese el puerto TCP E/J: [22] " PTCP
            sudo ufw allow $PTCP/tcp
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 4 ]]; then
            read -p "Ingrese el puerto UDP E/J: [22] " PUDP
            sudo ufw allow $PUDP/udp
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 5 ]]; then
            read -p "Ingrese el rango de puertos TCP E/J: [30000 32767] " PTCP1 PTCP2
            sudo ufw allow $PTCP1:$PTCP2/tcp
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 6 ]]; then
            read -p "Ingrese el rango de puertos UDP E/J: [30000 32767] " PUDP1 PUDP2
            sudo ufw allow $PUDP1:$PUDP2/udp
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 7 ]]; then
            read -p "Ingrese el puerto E/J: [22] " P2
            netstat -an | grep $P2
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 8 ]]; then
            read -p "Ingrese la IP y el puerto E/J: [127.168.24.3 22] " IP1 P3
            curl -v telnet://$IP1:$P3
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F != [1-8] ]]; then
            echo "Error opción invalida"
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        ;;
    6)  
        #Ins=$(sudo apt install resolvconf)
        clear
        echo '- ------------------------------------ -'
        echo '- 1. Habilitar servicio DNS            -'
        echo '- ------------------------------------ -'
        echo '- 2. Deshabilitar servicio DNS         -'
        echo '- ------------------------------------ -'
        echo '- 3. Estado del servicio DNS           -'
        echo '- ------------------------------------ -'
        echo '- 4. Reiniciar servicio DNS            -'
        echo '- ------------------------------------ -'
        echo '- 5. Editar servicio DNS               -'
        echo '- ------------------------------------ -'
        read -p 'Ingrese su elección [1-5] ' D

        if [[ $D -eq 1 ]]; then
            sudo service resolvconf start
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $D -eq 2 ]]; then
            sudo service resolvconf stop
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $F -eq 3 ]]; then
            Sta=$(sudo service resolvconf status)
            echo $Sta
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $D -eq 4 ]]; then
            sudo service resolvconf restart
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $D -eq 5 ]]; then
            echo -e "\n    ---------------------------------------------------------------------------------------------------"
            echo -e "\n\tEditar DNS E/j: [nameserver 8.8.4.4] 
            \n\t1) Para guardar  los cambios use la combinación de teclas [Ctrl + O] y luego [Enter]
        2) Para salir del editor nano use la combinación de teclas [Ctrl + X]"
            echo -e "\n    ---------------------------------------------------------------------------------------------------"
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
            sudo nano /etc/resolv.conf
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        if [[ $D != [1-5] ]]; then
            echo "Error opción invalida"
            read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        fi
        ;;
    7)  
        echo -e "\n    ---------------------------------------------------------------------------------------------------"
        echo -e "\n\tPodrá modificar el proxy, al editar el archivo entorno de ejecución inicial [.bashrc].
        Esta opción le permite crear y editar las variables de entorno para la configuración de proxi 
        en el perfil del usuario."
        echo -e "\n    ---------------------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        echo -e "\n\tUbiquese en la parte inferior del archivo [.bashrc] y agregue la sección para  
        configurar el Proxy, si esta sección ya existe solo edite los parámetros:"
        echo -e "\n    ---------------------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        echo -e "\n\tEjemplo:                                    "
        echo -e "\t####################### CONFIGURACION DE PROXY ######################"
        echo -e '\tHTTP_PROXY="10..236.50.83:8080"        '    
        echo -e '\tHTTPS_PROXY="10..236.50.83:8080"       '              
        echo -e '\tFTP_PROXY=" 10..236.50.83:8080 "       '               
        echo -e '\tNO_PROXY="localhost, 127.0.0.1 "       '               
        echo -e "\n    ---------------------------------------------------------------------------------------------------"
        echo -e "\n\t1) Para guardar  los cambios use la combinación de teclas [Ctrl + O] y luego [Enter]
        2) Para salir del editor nano use la combinación de teclas [Ctrl + X]"
        echo -e "\n    ---------------------------------------------------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey

        cd /home/ubuntu/ ; sudo nano .bashrc
        echo -e "\n----------------------------- Fin del Script --------------------------------------------------------"
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        ;;
    8)  
        echo "-----------------------------------------------------------------------------"
        echo "Instalar docker-compose"
        echo "-----------------------------------------------------------------------------"
        sudo apt-get update
        sudo apt-get install curl
        sudo apt-get install gnupg
        sudo apt-get install ca-certificates
        sudo apt-get install lsb-release
        sudo apt-get install docker-compose-plugin
        sudo docker compose --version
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        
        sudo apt-get update
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        sudo apt-get install docker.io
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        
        sudo mkdir -p /etc/apt/keyrings 
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
        
        echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs)         stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        
        echo "-----------------------------------------------------------------------------"
        echo "Instalar docker ce"
        echo "-----------------------------------------------------------------------------"
        sudo apt-get install docker-ce  
        sudo apt-get install docker-ce-cli
        sudo apt-get install containerd.io
        sudo apt-get install docker-compose
        #sudo apt-get install docker-compose-plugin
        echo "-----------------------------------------------------------------------------"
        echo "Verificar Version"
        echo "-----------------------------------------------------------------------------"
        docker --version
        echo "-----------------------------------------------------------------------------"
        echo "Iniciar docker con el sistema"
        echo "-----------------------------------------------------------------------------"
        sudo systemctl enable docker
        sudo systemctl start docker
        user=$(whoami)
        sudo usermod -G docker $user
        grep $user /etc/group
        echo "-----------------------------------------------------------------------------"
        echo "folder docker"
        echo "-----------------------------------------------------------------------------"
        folder=/Images
        sudo mkdir -p $folder/$user
        sudo mkdir -p $folder/$user/Data
        sudo chown -R $user:$user $folder/$user
        sudo chown -R $user:$user $folder/$user/Data
        ;;
    100)  
        ;;
  	E)
        echo "Gracias!"
        exit 0
        ;;
    *)
        echo "Error: Invalid option..."	
        read -p "Presione la tecla [Enter] para continuar..." readEnterKey
        ;;
		esac
	done