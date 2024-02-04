#!/bin/bash

# Realitza un script que comprovi si el nombre de valors (o paràmetres) introduït és igual a 3. En el cas que no sigui així, ha de mostrar per pantalla un missatge d'error.

# Utiliza un bucle until para comprobar si el número de parámetros es igual a 3
until [ "$#" -eq 3 ]; do
    echo "Error: Se esperaven 3 paràmetres. Proporciona exactament 3 valors."
    read -p "Introdueix 3 valors: " valores
    set -- $valores
done

# Si se han proporcionado tres parámetros, mostrarlos
echo "Els paràmetres són: $valor1, $valor2, $valor3"
