#!/bin/bash
# Verificar que se ingrese la dirección IP del objetivo
if [ -z "$1" ]
    then
        echo "El uso correcto es ./recon.sh <IP_OBJETIVO>"
        exit
    else
        echo "IP Objetivo: $1"
        echo "Ejecutando Nmap..."
    # Ejecutar escaneo al objetivo y guardar los resultados en un archivo
    nmap -sV $1 > res_escaneo.txt
    echo "Escaneo completado -- resultados escritos en res_escaneo.txt"
fi
# Si se encuentra el puerto 445 y está abierto, ejecutar enum4linux
if grep 445 res_escaneo.txt | grep -iq open
    then
        enum4linux -U -S $1 >> res_escaneo.txt
        echo "Samba encontrado. Enumeración completada."
        echo "Resultados añadidos a res_escaneo.txt"
        echo "Para ver los resultados, ejecute cat seguido del nombre del archivo."
    else
        echo "No se encontraron puertos SMB abiertos"
fi