#!/bin/bash

#Realitza un script que llegeixi paraules i les guardi en un arxiu fins que s’escrigui “:>”. No oblidis que has de comprovar que hi ha un arxiu on emmagatzemar les paraules.

# Solicitar el nombre del archivo
read -p "Introdueix el nom de l'arxiu per emmagatzemar les paraules: " nom_arxiu

# Comprobar si se proporciona un nombre de archivo válido
if [ -z "$nom_arxiu" ]; then
    echo "Cal proporcionar un nom d'arxiu vàlid."
    exit 1
fi

# Crear un bucle para solicitar palabras y guardarlas en el archivo
echo "Introdueix paraules. Escriu ':>' per acabar."

while true; do
    read paraula

    if [ "$paraula" = ":>" ]; then
        echo "Fi del programa. Paraules emmagatzemades a $nom_arxiu."
        break
    fi

    echo "$paraula" >> "$nom_arxiu"
done
