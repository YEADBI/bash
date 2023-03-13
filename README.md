# Github
## Configuracion Global 

```bash
# Configuración global 
    git config --global user.email "Adesjor@hotmail.com"
    git config --global user.name "Andrés"
    git config --global core.autocrlf false 
```

```
# Ayuda
    # Forma de ejecutar la bash >>>> ./gitbash [comentario]  [rama]
    # Ejemplo   >>>>> ./gitbash "Script"  "Scripting"
```

_**Ejecución:**_

```bash
# Ejecución
    Ubuntu:~$ ./gitbash "Documentación"  "Scripting"
```
_**Observación**_ gitbash requiere parámetros para su ejecución, al omitir estos datos, se le reporta al usuario la siguiente advertencia:

```sh
 ------------------------------------------------------------------------------------
 >>> Requiere parametros para ejecutar gitbash.sh. Se recomienda usar la ayuda  >>>>           
 >>> [ ./orquestador.sh -h ] >>>>                          
 ------------------------------------------------------------------------------------
```
## Configuración de llaves SSH

```sh
# Crear llave SSH: ssh-keygen
    Ubuntu:~$ ssh-keygen

    /home/ubuntu/.ssh/id_rsa
    Your identification has been saved in /home/ubuntu/.ssh/id_rsa
    Your public key has been saved in /home/ubuntu/.ssh/id_rsa.pub

    Ubuntu:~$ cat ~/.ssh/id_rsa.pub

AASDAB3NzaC1yc2EAAAADAQABAAABgQDCxtlKq4Lbe+4GM/NyB39h3hIaZay3NJE5d/pkO7xdBpcEmqgj1MItuhExKwjrYJ7UGhLckh3Kdst3u8F1DV47OQZbjAAr7+1Cp1dmBwvnKsjiHO5A9lBm8O3bJX5kNxaxWoqqLBRG4cQHUGSKQLJYWp5cxV14HDKAHTY5546HFDGKtaSdt6zB/KDMfHtKFNu4umVMb/QGeF8BMHkk4/V+mMTIDkQmX5ownOO0YQi8TjDOIAPt0adqoACvJZABhFz7wvjTHDiQRqy4T4MEeHkrvavFL1CRaM8gTsqGsVkQYxFUt67BNF3KDYXsirBe/NAuRK1u6EvI5QLXrKf3+dgHqPGPzci+kGHLuh8yDONZHwTrIxvdZGQaY8bVpWejcejHOj4olNuI9MshnNJDMnuaWsrXfAtGdjZb4oMDuhl268OQmWHJMbd0ML1Ng/4JqS/eAoAVnxsJYkLWQSALRAp0MuvfVS4BQIJzslGshtfnFvtTcuHc= ubuntu
```
Adicione llave a github settings > SSH and GPG keys > Authentication Keys > New SSH key > tittle > key > add key
