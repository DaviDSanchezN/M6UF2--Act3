#!/bin/bash

url="https://agora.xtec.cat/ies-sabadell/"
navegador="firefox"  # Puedes cambiar esto por el navegador de tu elección

# Comprobar la conexión hasta que esté disponible
while ! wget -q --spider "$url"; do
    echo "No hi ha connexió a Internet. Esperant 5 segons..."
    sleep 5
done

# Abrir el navegador con la página del instituto
echo "Connexió a Internet establerta. Obrint $navegador amb la pàgina de l'Institut..."
$navegador "$url" &

# El script continuará ejecutándose hasta que se cierre el navegador
wait
