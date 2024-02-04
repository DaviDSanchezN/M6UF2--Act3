#!/bin/bash

# Escriu un script que demani la ruta d’un directori per teclat i ens digui quins permisos té, quants arxius i 
# quantes carpetes hi ha a dins i quins són els noms dels arxius i de les carpetes.

# Utilizar un bucle until para solicitar la ruta de un directorio válida
until [ -d "$directori" ]; do
    read -p "Introdueix la ruta d'un directori vàlid: " directori
done

# Obtener información sobre el directorio
permisos=$(ls -ld "$directori" | cut -d " " -f 1)
num_arxius=$(find "$directori" -maxdepth 1 -type f | wc -l)
num_carpetes=$(find "$directori" -maxdepth 1 -type d | wc -l)
noms_arxius=$(find "$directori" -maxdepth 1 -type f -exec basename {} \;)
noms_carpetes=$(find "$directori" -maxdepth 1 -type d -exec basename {} \;)

# Mostrar información sobre el directorio
echo -e "\nInformació sobre el directori $directori:"
echo "Permisos: $permisos"
echo "Quantitat d'arxius: $num_arxius"
echo "Quantitat de carpetes: $num_carpetes"
echo -e "Noms dels arxius:\n$noms_arxius"
echo -e "Noms de les carpetes:\n$noms_carpetes"
