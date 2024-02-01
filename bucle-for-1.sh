#!/bin/bash

# Realitza un script que tregui els comentaris (aquells que comencen per # i arriben fins al final de la línia) de l’arxiu. Un cop els comentaris ja estiguin eliminats, 
# demana si una paraula existeix dins d’un arxiu. I un cop feta aquesta comprovació, demana que s’afegeixi una frase al final de l’arxiu (és obligatori que s’introdueixi).

# Comprova si s'ha proporcionat un argument d'arxiu
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <nom_arxiu>"
    exit 1
fi

arxiu="$1"

# Comprova si l'arxiu existeix
if [ ! -f "$arxiu" ]; then
    echo "L'arxiu no existeix."
    exit 1
fi

# Crear un nou arxiu sense comentaris
nou_arxiu="nou_$arxiu"

# Utilitza un bucle for per llegir línia per línia i processar l'arxiu
for linia in $(cat "$arxiu"); do
    # Elimina els comentaris de cada línia
    linia_sense_comentaris=$(echo "$linia" | sed 's/#.*//')
    
    # Afegix la línia sense comentaris al nou arxiu
    echo "$linia_sense_comentaris" >> "$nou_arxiu"
done

# Mostra el contingut del nou arxiu
echo -e "\nContingut de l'arxiu sense comentaris:"
cat "$nou_arxiu"

# Demana la paraula a buscar
read -p "Introdueix la paraula a buscar a l'arxiu: " paraula

# Comprova si la paraula existeix al nou arxiu
if grep -q "\<$paraula\>" "$nou_arxiu"; then
    echo "La paraula '$paraula' existeix a l'arxiu."
else
    echo "La paraula '$paraula' no existeix a l'arxiu."
fi

# Demana la frase a afegir
read -p "Introdueix una frase per afegir a l'arxiu: " frase

# Afegix la frase al final del nou arxiu
echo "$frase" >> "$nou_arxiu"

echo "Frase afegida al nou arxiu."

# Mostra el contingut final del nou arxiu
echo -e "\nContingut final de l'arxiu sense comentaris i amb la frase afegida:"
cat "$nou_arxiu"
