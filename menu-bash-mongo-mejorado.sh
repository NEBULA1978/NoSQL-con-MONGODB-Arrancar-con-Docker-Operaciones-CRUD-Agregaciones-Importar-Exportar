#!/bin/bash

opciones=(
    "Mostrar directorio:|gnome-terminal -- bash -c 'ls; read -p \"Presione Enter para continuar...\"'"
    "Ejecutar contenedor de MongoDB:|gnome-terminal -- docker run --rm --name mongo mongo:3.6.22-xenial"
    "Acceder al shell de MongoDB:|gnome-terminal -- bash -c 'docker exec -it mongo bash; read -p \"Presione Enter para continuar...\"'"
    "Salir:|exit 0"
)

opciones_mongodb=(
    "Mostrar bases de datos:|mongo --quiet --eval 'db.runCommand({listDatabases: 1})'"
    "Crear una nueva base de datos:|mongo --quiet --eval 'use <nombre de la base de datos>'"
    "Mostrar colecciones de una base de datos:|mongo <nombre de la base de datos> --quiet --eval 'db.getCollectionNames()'"
    "Insertar un nuevo documento en una colección:|mongo <nombre de la base de datos> --quiet --eval 'db.<nombre de la colección>.insert({ <campo1>: <valor1>, <campo2>: <valor2>, ... })'"
    "Actualizar un documento en una colección:|mongo <nombre de la base de datos> --quiet --eval 'db.<nombre de la colección>.update({ <campo>: <valor> }, { $set: { <campo1>: <valor1>, <campo2>: <valor2>, ... } })'"
    "Eliminar un documento de una colección:|mongo <nombre de la base de datos> --quiet --eval 'db.<nombre de la colección>.remove({ <campo>: <valor> })'"
    "Volver al menú principal:|exit 0"
)


while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}"
    done
    read opcion

    case "$opcion" in
        0)
            ${opciones[$opcion]#*|}
            echo "Presione Enter para continuar..."
            read
            ;;
        1)
            ${opciones[$opcion]#*|}
            echo "Presione Enter para continuar..."
            read
            ;;
        2)
            clear
            echo "Ingrese el número de la opción deseada:"
            for i in "${!opciones_mongodb[@]}"; do
                echo "$i. ${opciones_mongodb[$i]%%|*}"
            done
            read opcion_mongodb

            case "$opcion_mongodb" in
                [0-5])
                    ${opciones_mongodb[$opcion_mongodb]#*|}
                    echo "Presione Enter para continuar..."
                    read
                    ;;
                *)
                    echo "Opción inválida. Presione Enter para continuar..."
                    read
                    ;;
            esac
            ;;
        3)
            exit 0
            ;;
        *)
            echo "Opción inválida. Presione Enter para continuar..."
            read
            ;;
    esac
done
