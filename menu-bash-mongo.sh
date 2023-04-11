#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|gnome-terminal -e 'ls'"
    "Ejecutar contenedor de MongoDB:|gnome-terminal -e 'sudo docker run --rm --name mongo mongo:3.6.22-xenial'"
    "Acceder al shell de MongoDB:|(gnome-terminal -e 'sudo docker exec -it mongo /bin/bash' &) && sleep 5"
    "Mostrar bases de datos:|mongo --quiet --eval 'db.runCommand({listDatabases: 1})'"
    "Crear una nueva base de datos:|mongo --quiet --eval 'use <nombre de la base de datos>'"
    "Mostrar colecciones de una base de datos:|mongo <nombre de la base de datos> --quiet --eval 'db.getCollectionNames()'"
    "Insertar un nuevo documento en una colección:|mongo <nombre de la base de datos> --quiet --eval 'db.<nombre de la colección>.insert({ <campo1>: <valor1>, <campo2>: <valor2>, ... })'"
    "Actualizar un documento en una colección:|mongo <nombre de la base de datos> --quiet --eval 'db.<nombre de la colección>.update({ <campo>: <valor> }, { $set: { <campo1>: <valor1>, <campo2>: <valor2>, ... } })'"
    "Eliminar un documento de una colección:|mongo <nombre de la base de datos> --quiet --eval 'db.<nombre de la colección>.remove({ <campo>: <valor> })'"
    "Salir:|exit 0"
)
while true; do
    clear
    echo "Ingrese el número de la opción deseada:"
    for i in "${!opciones[@]}"; do
        echo "$i. ${opciones[$i]%%|*}" # Imprimimos el índice de la opción y su nombre (sin el comando correspondiente).
    done
    read opcion

    case "$opcion" in
    [0-9])
        if [ "$opcion" -ge 0 ] && [ "$opcion" -lt "${#opciones[@]}" ]; then
            clear
            comando="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
            eval "$comando"                   # Ejecutamos el comando.
            echo ""
            echo "Presione Enter para continuar..."
            read
        else
            echo "Opción inválida. Presione Enter para continuar..."
            read
        fi
        ;;
    *)
        echo "Opción inválida. Presione Enter para continuar..."
        read
        ;;
    esac

done

# El script es un menú interactivo en bash que permite realizar operaciones en una instancia de MongoDB que se ejecuta en un contenedor de Docker. El menú presenta varias opciones que incluyen comandos para mostrar información del sistema de archivos, conectarse a la instancia de MongoDB, crear una base de datos, agregar valores a la base de datos, buscar registros, ordenar registros, etc.

# El script utiliza un array para almacenar las opciones del menú, donde cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente. Luego, utiliza un ciclo while para mostrar el menú en pantalla y ejecutar el comando correspondiente a la opción seleccionada por el usuario.

# El script utiliza la función eval para ejecutar los comandos, lo que significa que el usuario debe tener cuidado al seleccionar opciones y no ingresar comandos maliciosos. Además, el script asume que el contenedor de MongoDB ya está instalado y disponible en el sistema.

# Sí, se pueden implementar medidas de seguridad para evitar la inyección de comandos maliciosos. Algunas sugerencias son:

#     Utilizar una lista blanca de comandos permitidos: en lugar de permitir cualquier comando que se ingrese desde el menú, se puede crear una lista blanca de comandos permitidos y validar que el comando seleccionado por el usuario esté en la lista. De esta manera, solo se permitirían comandos específicos que se consideren seguros.

#     Sanitizar la entrada del usuario: se pueden utilizar herramientas como sed o awk para eliminar los caracteres especiales que puedan ser utilizados para inyectar comandos maliciosos. Por ejemplo, se pueden eliminar caracteres de escape, comillas y caracteres especiales como punto y coma (;) que se utilizan para separar comandos.

#     Limitar los permisos de ejecución: se pueden limitar los permisos de ejecución de los comandos que se ejecutan desde el menú, para evitar que se realicen operaciones maliciosas. Por ejemplo, se pueden limitar los permisos de escritura o lectura en archivos importantes del sistema.

#     Utilizar variables en lugar de eval: en lugar de usar eval para ejecutar los comandos, se pueden utilizar variables para almacenar los comandos y luego ejecutarlos. De esta manera, se limitaría la posibilidad de inyección de comandos maliciosos.

#     Validar la entrada del usuario: se pueden validar los datos ingresados por el usuario para asegurarse de que solo se ingresen datos válidos y seguros. Por ejemplo, se pueden utilizar expresiones regulares para validar el formato de los datos, o limitar la cantidad de caracteres que se pueden ingresar.

# Es importante tener en cuenta que ninguna medida de seguridad es completamente efectiva, por lo que es recomendable utilizar varias medidas de seguridad para reducir el riesgo de inyección de comandos maliciosos.
