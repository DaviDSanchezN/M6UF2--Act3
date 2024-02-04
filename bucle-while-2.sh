#!/bin/bash

# Realitza un script que, inicialment, obtingui els noms de comptes d’usuari del sistema que continguin  alguna lletra majúscula. 
# A continuació, fes que es demani un nom d’usuari. Mentre el nom introduït no sigui vàlid, mostra un missatge d’error. 
# Un cop el nom introduït sigui vàlid (existent), mostra TOTA la informació disponible  relacionada amb aquest compte d’usuari del sistema.

# Obtener nombres de cuentas de usuario con al menos una letra mayúscula
usuarios_con_mayuscula=$(grep -E '^[a-zA-Z0-9_]+:[^\*:]*[A-Z]+[^\*:]*:' /etc/passwd | cut -d: -f1)

# Mostrar los nombres de cuentas de usuario con al menos una letra mayúscula
echo "Nombres de cuentas de usuario con al menos una letra mayúscula: $usuarios_con_mayuscula"

# Solicitar un nombre de usuario
read -p "Introdueix un nom d'usuari: " nom_usuari

# Verificar si el nombre de usuario introducido es válido
while [[ ! " $usuarios_con_mayuscula " =~ " $nom_usuari " ]]; do
    echo "Error: Nom d'usuari no vàlid. Torna-ho a provar."
    read -p "Introdueix un nom d'usuari: " nom_usuari
done

# Mostrar toda la información relacionada con el cuenta de usuario
informacio_usuari=$(id "$nom_usuari" 2>&1)

if [ $? -eq 0 ]; then
    echo -e "\nInformació sobre l'usuari $nom_usuari:"
    echo "$informacio_usuari"
else
    echo "No s'ha pogut obtenir la informació de l'usuari $nom_usuari."
fi
