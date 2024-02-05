#!/bin/bash

# Realitza un script que tregui els comentaris (aquells que comencen per # i arriben fins al final de la línia) de l’arxiu. Un cop els comentaris ja estiguin eliminats, 
# demana si una paraula existeix dins d’un arxiu. I un cop feta aquesta comprovació, demana que s’afegeixi una frase al final de l’arxiu (és obligatori que s’introdueixi).

# Solicitar el nombre del archivo
read -p "Introdueix el nom de l'arxiu: " arxiu

# Comprobar si el archivo existe
if [ ! -f "$arxiu" ]; then
    echo "Error: L'arxiu no existeix."
    exit 1
fi

# Crear una copia del archivo original para preservar su contenido
cp "$arxiu" "$arxiu.bak"

# Inicializar una variable para almacenar el contenido sin comentarios
contingut_sense_comentaris=""

# Eliminar comentarios del archivo utilizando un bucle for
IFS=$'\n'  # Establecer el separador de campo interno para que incluya solo saltos de línea
for linia in $(cat "$arxiu.bak"); do
    # Comprobar si la línea no comienza con #
    if [[ ! $linia =~ ^\s*# ]]; then
        contingut_sense_comentaris+="$linia"$'\n'
    fi
done

# Guardar las nuevas líneas en el archivo
echo -e "$contingut_sense_comentaris" > "$arxiu"

# Mostrar el contenido actual del archivo sin comentarios
echo -e "\nContingut de l'arxiu sense comentaris:"
cat "$arxiu"

# Solicitar palabra o frase para buscar
read -p "Introdueix la paraula o frase a buscar: " paraula_frase

# Comprobar si la palabra o frase existe en el archivo
if grep -q "$paraula_frase" "$arxiu"; then
    echo "La paraula o frase '$paraula_frase' existeix a l'arxiu."
else
    echo "La paraula o frase '$paraula_frase' no existeix a l'arxiu."
fi

# Solicitar una nova frase per afegir al final de l'arxiu
read -p "Introdueix la nova frase a afegir: " nova_frase

# Afegir la nova frase al final de l'arxiu
echo "$nova_frase" >> "$arxiu"

echo "La nova frase s'ha afegit a l'arxiu."

# Mostrar el contingut final de l'arxiu
echo -e "\nContingut final de l'arxiu:"
cat "$arxiu"
