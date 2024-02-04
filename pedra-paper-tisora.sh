#!/bin/bash
# Elabora un script per jugar al joc de pedra, paper o tisores contra la màquina. L’usuari ha de tenir la possibilitat de tornar a jugar tants cops com vulgui.
while true; do
    echo "Joc de pedra, paper o tisores!"
    echo "1. Pedra"
    echo "2. Paper"
    echo "3. Tisores"
    echo "4. Sortir"

    read -p "Introdueix la teva opció (1-3): " opcio

    # Salir si la opción es 4
    if [ "$opcio" -eq 4 ]; then
        echo "Fins aviat!"
        break
    fi

    # Validar la opció
    if [ "$opcio" -ge 1 ] && [ "$opcio" -le 3 ]; then
        # Generar l'elecció de la màquina
        opcio_maquina=$(( RANDOM % 3 + 1 ))

        # Definir les opcions
        opcions=("Pedra" "Paper" "Tisores")

        # Mostrar eleccions
        echo -e "\nHas triat: ${opcions[opcio-1]}"
        echo "La màquina ha triat: ${opcions[opcio_maquina-1]}"

        # Determinar el guanyador
        if [ "$opcio" -eq "$opcio_maquina" ]; then
            echo "Empat!"
        elif [ "$opcio" -eq 1 -a "$opcio_maquina" -eq 3 ] || \
             [ "$opcio" -eq 2 -a "$opcio_maquina" -eq 1 ] || \
             [ "$opcio" -eq 3 -a "$opcio_maquina" -eq 2 ]; then
            echo "Has guanyat!"
        else
            echo "Has perdut!"
        fi
    else
        echo "Opció no vàlida. Torna-ho a provar."
    fi

    read -p "Vols jugar de nou? (S/n): " jugar_de_nou
    if [ "$jugar_de_nou" != "S" ] && [ "$jugar_de_nou" != "s" ]; then
        echo "Fins aviat!"
        break
    fi

done
