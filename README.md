Proyecto CRM con MongoDB

Este proyecto consiste en un pequeño sistema CRM que utiliza una base de datos MongoDB para almacenar los datos de los clientes.
Instalación

Para ejecutar este proyecto, es necesario tener instalado Docker y ejecutar el siguiente comando:

sudo docker run --rm --name mongo mongo:3.6.22-xenial

Luego, en una nueva consola, ejecutar:

sudo docker exec -it mongo /bin/bash


Por último, ejecutar el comando mongo para acceder a la consola de MongoDB.
Uso

Una vez dentro de la consola de MongoDB, se pueden ejecutar los siguientes comandos:

    use crm: cambia a la base de datos crm.
    db.clientes.insert({ ... }): inserta un nuevo cliente en la colección clientes.
    db.clientes.find(): muestra todos los clientes en la colección clientes.
    db.clientes.find().sort({ campo: 1 }): ordena los clientes por el campo especificado (1: ascendente, -1: descendente).
    db.clientes.find({ campo: "valor" }): busca los clientes que coincidan con el campo y valor especificados.
    db.clientes.update({ ... }): actualiza el registro con los valores especificados.
    db.clientes.remove({ campo: "valor" }): elimina los registros que coincidan con el campo y valor especificados.
    db.clientes.aggregate([...]): realiza una operación de agregación en la colección clientes.

También es posible exportar e importar datos utilizando los comandos mongoexport y mongoimport.