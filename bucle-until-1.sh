#!/bin/bash

# Utiliza un bucle until para comprobar si el número de parámetros es igual a 3
until [ "$#" -eq 3 ]; do
    echo "Error: S'esperaven 3 paràmetres. Proporciona exactament 3 valors."
    read -p "Introdueix 3 valors: " valor1 valor2 valor3
done

# Si se han proporcionado tres parámetros, mostrarlos
echo "Els paràmetres són: $valor1, $valor2, $valor3"
