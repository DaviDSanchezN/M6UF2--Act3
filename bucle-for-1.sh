#!/bin/bash

# Realitza un script que tregui els comentaris (aquells que comencen per # i arriben fins al final de la línia) de l’arxiu. Un cop els comentaris ja estiguin eliminats, 
# demana si una paraula existeix dins d’un arxiu. I un cop feta aquesta comprovació, demana que s’afegeixi una frase al final de l’arxiu (és obligatori que s’introdueixi).

#!/bin/bash

# Función para eliminar comentarios del archivo
eliminar_comentarios() {
    sed '/^#/d' "$1"
}

# Pedir el nombre del archivo
read -p "Introduce el nombre del archivo: " archivo

# Verificar si el archivo existe
if [ -f "$archivo" ]; then
    # Crear un nuevo archivo temporal sin comentarios
    archivo_sin_comentarios=$(mktemp)

    # Eliminar comentarios del archivo y guardar en el archivo temporal
    eliminar_comentarios "$archivo" > "$archivo_sin_comentarios"

    # Mostrar contenido sin comentarios
    echo -e "\nContenido sin comentarios:"
    cat "$archivo_sin_comentarios"

    # Pedir palabra a verificar
    read -p "Introduce una palabra para verificar su existencia: " palabra

    # Verificar si la palabra existe en el archivo
    if grep -q "\<$palabra\>" "$archivo_sin_comentarios"; then
        echo "La palabra '$palabra' existe en el archivo."
    else
        echo "La palabra '$palabra' no existe en el archivo."
    fi

    # Pedir frase para agregar al final del archivo
    read -p "Introduce una frase para agregar al final del archivo: " frase

    # Agregar frase al final del archivo original
    echo "$frase" >> "$archivo"

    echo "Frase agregada al final del archivo."

    # Eliminar archivo temporal sin comentarios
    rm "$archivo_sin_comentarios"
else
    echo "Error: El archivo $archivo no existe."
fi
