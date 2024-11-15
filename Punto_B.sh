#!/bin/bash

sudo vim /usr/local/bin/mirabelliAltaUser-Groups.sh


if [ $# -ne 2 ]; then
  echo "Uso: $0 <Usuario_Base_Clave> <Ruta_Lista_Usuarios>"
  exit 1
fi


usuario_clave=$1
archivo_lista=$2


if ! id "$usuario_clave" >/dev/null 2>&1; then
  echo "Error: El usuario base '$usuario_clave' no existe."
  exit 2
fi


if [ ! -f "$archivo_lista" ]; then
  echo "Error: El archivo '$archivo_lista' no existe."
  exit 3
fi


clave_usuario=$(getent shadow "$usuario_clave" | cut -d: -f2)
if [ -z "$clave_usuario" ]; then
  echo "Error: No se pudo obtener la clave del usuario base '$usuario_clave'."
  exit 4
fi


while IFS=',' read -r usuario grupo directorio; do

  if ! getent group "$grupo" >/dev/null; then
    groupadd "$grupo"
    echo "Grupo '$grupo' creado."
  else
    echo "Grupo '$grupo' ya existe."
  fi


  if ! id "$usuario" >/dev/null 2>&1; then
    useradd -m -d "$directorio" -g "$grupo" -p "$clave_usuario" "$usuario"
    echo "Usuario '$usuario' creado y asignado al grupo '$grupo'."
  else
    echo "Usuario '$usuario' ya existe."
  fi
done < "$archivo_lista"

echo "Proceso completado."

sudo chmod +x /usr/local/bin/mirabelliAltaUser-Groups.sh
