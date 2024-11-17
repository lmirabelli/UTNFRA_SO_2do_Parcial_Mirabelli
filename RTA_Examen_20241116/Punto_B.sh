sudo vim /usr/local/bin/mirabelliAltaUser-Groups.sh

#!/bin/bash

USER="vagrant"
if [ $# -ne 2 ]; then
    echo "Uso: $0 USER /home/USER/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt"
    exit 1
fi

USUARIO=$1
LISTA_USUARIOS=$2

if [ ! -f "$LISTA_USUARIOS" ]; then
    echo "El archivo de lista de usuarios no existe: $LISTA_USUARIOS"
    exit 1
fi

CLAVE=$(grep "^$USUARIO:" /etc/shadow | cut -d: -f2)

if [ -z "$CLAVE" ]; then
    echo "El usuario '$USUARIO' no existe o no tiene clave asignada"
    exit 1
fi

while IFS=, read -r usuario grupo home; do
    if [ -z "$usuario" ] || [ -z "$grupo" ] || [ -z "$home" ]; then
        echo "Línea incorrecta en el archivo de lista: $usuario,$grupo,$home"
        continue
    fi

    if ! grep -q "^$grupo:" /etc/group; then
        echo "Creando grupo $grupo..."
        sudo groupadd $grupo
    fi

    if ! id -u $usuario &>/dev/null; then
        echo "Creando usuario $usuario con clave del usuario $USUARIO..."
        sudo useradd -m -g $grupo -d "$home" $usuario

        echo "$usuario:$CLAVE" | sudo chpasswd
    else
        echo "El usuario $usuario ya existe."
    fi
done < "$LISTA_USUARIOS"

echo "Proceso completado."

# Fuera del VIM

#dar permisos 

sudo chmod 755 /usr/local/bin/miraberlliAltaUser-Groups.sh

sudo /usr/local/bin/miraberlliAltaUser-Groups.sh vagrant /home/vagrant/UTN-FRA_SO_Examenes/202406/bash_script/Lista_Usuarios.txt
