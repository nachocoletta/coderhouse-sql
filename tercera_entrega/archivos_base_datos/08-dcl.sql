
-- SE CREA EL USUARIO solo_lectura Y LUEGO SE LE ASIGNAN LOS PERMISOS DE CONSULTA SOBRE LAS TABLAS UNICAMENTE EN EL ESQUEMA PROYECTO_FINAL
DROP USER IF EXISTS 'solo_lectura'@'localhost';
-- SE CREA EL USUARIO solo_lectura  CON CLAVE DE ACCESO '123456'
CREATE USER IF NOT EXISTS 'solo_lectura'@'localhost' IDENTIFIED BY '123456';

-- AL USUARIO solo_lectura SE LE ASIGNAN PRIVILEGIOS DE SOLO LECTURA PARA TODAS LAS TABLAS DE LA BASE DE DATOS PROYECTO_FINAL
GRANT SELECT ON proyecto_final.* TO 'solo_lectura'@'localhost';

--
DROP USER IF EXISTS 'super_usuario'@'localhost';
-- SE CREA EL USUARIO super_usuario CON CLAVE DE ACCESO '123456'
CREATE USER IF NOT EXISTS 'super_usuario'@'localhost' IDENTIFIED BY '123456';
-- AL USUARIO super_usuario SE LE ASIGNAN PRIVILEGIOS DE LECTURA, INSERCION Y MODIFICACION TODAS LAS TABLAS DE LA BASE DE DATOS PROYECTO_FINAL
GRANT SELECT, INSERT, UPDATE ON proyecto_final.* TO 'super_usuario'@'localhost';