DROP SCHEMA IF EXISTS PROYECTO_FINAL;

CREATE SCHEMA IF NOT EXISTS PROYECTO_FINAL;

USE PROYECTO_FINAL;

CREATE TABLE IF NOT EXISTS PAIS (
	ID_PAIS INT NOT NULL,
    PAIS VARCHAR(80) NOT NULL,
    PRIMARY KEY (ID_PAIS)
);

CREATE TABLE IF NOT EXISTS DIRECCION (
	ID_DIRECCION INT AUTO_INCREMENT,
	NOMBRE_CALLE VARCHAR(100) NOT NULL,
    NUMERO INT,
    PISO INT,
    DEPARTAMENTO VARCHAR(5),
    CIUDAD VARCHAR(50) NOT NULL,
    CODIGO_POSTAL VARCHAR(10),
    ID_PAIS INT,
    PRIMARY KEY (ID_DIRECCION),
    FOREIGN KEY (ID_PAIS) REFERENCES PAIS (ID_PAIS)
);

CREATE TABLE IF NOT EXISTS CARRITO (
	ID_CARRITO INT AUTO_INCREMENT,
    TOTAL DOUBLE,
    PRIMARY KEY(ID_CARRITO)
); 

CREATE TABLE IF NOT EXISTS CLIENTE (
	ID_CLIENTE INT AUTO_INCREMENT,
    NOMBRES VARCHAR(80) NOT NULL,
    APELLIDOS VARCHAR(80) NOT NULL,
    TIPO_DOCUMENTO VARCHAR(15) NOT NULL,
    NUMERO_DOCUMENTO INT NOT NULL,
    TELEFONO VARCHAR(18) NOT NULL,
    FECHA_NACIMIENTO DATE,
    EMAIL VARCHAR(50) NOT NULL,
    PASS_WORD VARCHAR(100) NOT NULL,
    ID_DIRECCION INT,
    ID_CARRITO INT,
    PRIMARY KEY (ID_CLIENTE),
    FOREIGN KEY (ID_DIRECCION) REFERENCES DIRECCION (ID_DIRECCION),
    FOREIGN KEY (ID_CARRITO) REFERENCES CARRITO (ID_CARRITO)
);

CREATE TABLE IF NOT EXISTS TIPO_PRODUCTO (
	ID_TIPO_PRODUCTO INT AUTO_INCREMENT,
    NOMBRE_TIPO_PRENDA VARCHAR(60) NOT NULL,
	PRIMARY KEY (ID_TIPO_PRODUCTO)
);

CREATE TABLE IF NOT EXISTS TALLE (
	ID_TALLE INT AUTO_INCREMENT,
    MEDIDA VARCHAR(20) NOT NULL,
    PRIMARY KEY (ID_TALLE)
);

CREATE TABLE IF NOT EXISTS PRODUCTO (
	ID_PRODUCTO INT AUTO_INCREMENT,
    DESCRIPCION VARCHAR(80) NOT NULL,
    STOCK INT NOT NULL,
    PRECIO DOUBLE,
    ID_TIPO_PRODUCTO INT,
    ID_TALLE INT,
    PRIMARY KEY (ID_PRODUCTO),
    FOREIGN KEY (ID_TIPO_PRODUCTO) REFERENCES TIPO_PRODUCTO (ID_TIPO_PRODUCTO),
    FOREIGN KEY (ID_TALLE) REFERENCES TALLE (ID_TALLE)
);


CREATE TABLE IF NOT EXISTS CARRITO_PRODUCTO (
	ID_CARRITO INT,
    ID_PRODUCTO INT,
    CANTIDAD INT NOT NULL,
    FOREIGN KEY (ID_CARRITO) REFERENCES CARRITO (ID_CARRITO),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO)
);

CREATE TABLE IF NOT EXISTS FACTURA (
	ID_FACTURA INT AUTO_INCREMENT,
    FECHA_FACTURA DATETIME,
    SUBTOTAL DOUBLE,
    IVA DOUBLE,
    TOTAL DOUBLE,
    ID_CLIENTE INT,
    PRIMARY KEY (ID_FACTURA),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);

CREATE TABLE IF NOT EXISTS ORDEN (
	ID_ORDEN INT AUTO_INCREMENT,
    FECHA_ORDEN DATETIME,
    ESTADO_ORDEN ENUM ("PENDIENTE", "ENVIDADA", "CANCELADA"),
    MONTO_TOTAL DOUBLE,
    ID_FACTURA INT,
    PRIMARY KEY (ID_ORDEN),
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURA (ID_FACTURA)
);

CREATE TABLE IF NOT EXISTS PAGO (
	ID_PAGO INT AUTO_INCREMENT,
    FECHA_PAGO DATETIME NOT NULL,
    ID_FACTURA INT,
    PRIMARY KEY (ID_PAGO),
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURA (ID_FACTURA)
);

CREATE TABLE IF NOT EXISTS CALIFICACION (
	ID_CALIFICACION INT AUTO_INCREMENT,
    ID_CLIENTE INT,
    ID_PRODUCTO INT,
    PUNTUACION DECIMAL(1,0),
    COMENTARIO TEXT,
    PRIMARY KEY (ID_CALIFICACION),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO)
);



