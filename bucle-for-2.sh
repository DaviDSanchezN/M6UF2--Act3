#!/bin/bash

#Realitza un script que rebi una cadena de nombres enters per teclat i compti quants són zero.

# Solicitar una cadena de nombres enteros por teclado
read -p "Introdueix una cadena de nombres enters separats per espais: " cadena_nombres

# Convertir la cadena en un array
nombres=($cadena_nombres)

# Inicializar el contador de ceros
contador_ceros=0

# Recorrer el array y contar cuántos son cero
for nombre in "${nombres[@]}"; do
    if [ "$nombre" -eq 0 ]; then
        ((contador_ceros++))
    fi
done

# Mostrar el resultado
echo "Hi ha $contador_ceros nombres que són zero en la cadena proporcionada."
