## Proyecto MySQL

Este proyecto incluye un conjunto de archivos SQL que se utilizan para crear y gestionar una base de datos MySQL. Los archivos están diseñados para ser ejecutados en un orden específico para asegurar que la base de datos se configure correctamente.

## Requisitos

MySQL: Se debe instalar MySQL en su sistema. Puede descargarlo e instalarlo desde MySQL Downloads (https://dev.mysql.com/downloads/mysql/).
MySQL Workbench (opcional pero recomendado): Se sugiere usar MySQL Workbench para administrar la base de datos. Puede descargarlo desde MySQL Workbench Downloads (https://dev.mysql.com/downloads/workbench/).
Instalación
Siga estos pasos para instalar y configurar la base de datos:

## Instalar MySQL:

Descargue e instale MySQL desde el enlace proporcionado.
Asegúrese de configurar un usuario y una contraseña durante la instalación.
Instalar MySQL Workbench (opcional):

Descargue e instale MySQL Workbench desde el enlace proporcionado.
Úselo para conectarse a su servidor MySQL.
Ejecutar los archivos SQL en orden:

Conéctese a su servidor MySQL usando la línea de comandos, MySQL Workbench, u otra herramienta de administración.
Asegúrese de estar en la carpeta donde están ubicados los archivos SQL.
Ejecute los siguientes archivos en el orden especificado:

## Orden de Ejecución de los Archivos SQL

01-esquema.sql: Este archivo contiene la definición del esquema de la base de datos.

02-tablas.sql: Este archivo contiene la definición de las tablas.

03-registros.sql: Este archivo contiene los registros iniciales para poblar las tablas.

04-vistas.sql: Este archivo contiene la definición de las vistas.

05-funciones.sql: Este archivo contiene la definición de las funciones.

06-stored_procedures.sql: Este archivo contiene la definición de los procedimientos almacenados.

07-triggers.sql: Este archivo contiene la definición de los triggers.

08-dcl.sql: Este archivo contiene las definiciones de control de acceso.

09-tcl.sql: Este archivo contiene las instrucciones de control de transacciones.

## Backup de la Base de Datos

El archivo 10-backup.sql se proporciona para restaurar un respaldo de la base de datos. Para restaurar el backup, ejecute el siguiente comando:

## Notas Adicionales

Asegúrese de tener los permisos adecuados para ejecutar cada archivo.
Si encuentra algún error durante la ejecución, verifique el archivo correspondiente para asegurarse de que todos los comandos SQL son correctos y compatibles con su versión de MySQL.
