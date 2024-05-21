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
    CODIGO_POSTAL VARCHAR(10) NOT NULL,
    ID_PAIS INT,
    PRIMARY KEY (ID_DIRECCION),
    FOREIGN KEY (ID_PAIS) REFERENCES PAIS (ID_PAIS) ON DELETE RESTRICT
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
    FOREIGN KEY (ID_DIRECCION) REFERENCES DIRECCION (ID_DIRECCION) ON DELETE RESTRICT, 
    FOREIGN KEY (ID_CARRITO) REFERENCES CARRITO (ID_CARRITO) ON DELETE RESTRICT
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
    FOREIGN KEY (ID_TIPO_PRODUCTO) REFERENCES TIPO_PRODUCTO (ID_TIPO_PRODUCTO) ON DELETE RESTRICT,
    FOREIGN KEY (ID_TALLE) REFERENCES TALLE (ID_TALLE) ON DELETE RESTRICT
);


CREATE TABLE IF NOT EXISTS CARRITO_PRODUCTO (
	ID_CARRITO INT,
    ID_PRODUCTO INT,
    CANTIDAD INT NOT NULL,
    FOREIGN KEY (ID_CARRITO) REFERENCES CARRITO (ID_CARRITO) ON DELETE RESTRICT,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS FACTURA (
	ID_FACTURA INT AUTO_INCREMENT,
    FECHA_FACTURA DATETIME NOT NULL,
    SUBTOTAL DOUBLE,
    IVA DOUBLE,
    TOTAL DOUBLE,
    ID_CLIENTE INT,
    PRIMARY KEY (ID_FACTURA),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS DETALLE (
	ID_DETALLE INT AUTO_INCREMENT,
    CANTIDAD INT NOT NULL,
    PRECIO DOUBLE NOT NULL,
    ID_PRODUCTO INT,
    ID_FACTURA INT,
    PRIMARY KEY (ID_DETALLE),
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO) ON DELETE RESTRICT,
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURA (ID_FACTURA) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS ORDEN (
	ID_ORDEN INT AUTO_INCREMENT,
    FECHA_ORDEN DATETIME,
    ESTADO_ORDEN ENUM ("PENDIENTE", "ENVIADA", "CANCELADA", "ENTREGADA"),
  --  MONTO_TOTAL DOUBLE,
    ID_FACTURA INT,
    PRIMARY KEY (ID_ORDEN),
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURA (ID_FACTURA) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS PAGO (
	ID_PAGO INT AUTO_INCREMENT,
    FECHA_PAGO DATETIME NOT NULL,
    ID_FACTURA INT,
    PRIMARY KEY (ID_PAGO),
    FOREIGN KEY (ID_FACTURA) REFERENCES FACTURA (ID_FACTURA) ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS CALIFICACION (
	ID_CALIFICACION INT AUTO_INCREMENT,
    ID_CLIENTE INT,
    ID_PRODUCTO INT,
    PUNTUACION DECIMAL(3,1),
    COMENTARIO TEXT,
    PRIMARY KEY (ID_CALIFICACION),
    FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE) ON DELETE RESTRICT,
    FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTO (ID_PRODUCTO) ON DELETE RESTRICT
);

INSERT INTO `pais` (`id_pais`, `pais`) VALUES 
  (1, 'Afganistán'),
  (3, 'Albania'),
  (4, 'Alemania'),
  (5, 'Andorra'),
  (6, 'Angola'),
  (7, 'Anguilla'),
  (8, 'Antártida'),
  (9, 'Antigua y Barbuda'),
  (10, 'Antillas Holandesas'),
  (11, 'Arabia Saudí'),
  (12, 'Argelia'),
  (13, 'Argentina'),
  (14, 'Armenia'),
  (15, 'Aruba'),
  (131, 'ARY Macedonia'),
  (16, 'Australia'),
  (17, 'Austria'),
  (18, 'Azerbaiyán'),
  (19, 'Bahamas'),
  (20, 'Bahréin'),
  (21, 'Bangladesh'),
  (22, 'Barbados'),
  (24, 'Bélgica'),
  (25, 'Belice'),
  (26, 'Benin'),
  (27, 'Bermudas'),
  (28, 'Bhután'),
  (23, 'Bielorrusia'),
  (29, 'Bolivia'),
  (30, 'Bosnia y Herzegovina'),
  (31, 'Botsuana'),
  (33, 'Brasil'),
  (34, 'Brunéi'),
  (35, 'Bulgaria'),
  (36, 'Burkina Faso'),
  (37, 'Burundi'),
  (38, 'Cabo Verde'),
  (40, 'Camboya'),
  (41, 'Camerún'),
  (42, 'Canadá'),
  (44, 'Chad'),
  (46, 'Chile'),
  (47, 'China'),
  (48, 'Chipre'),
  (50, 'Ciudad del Vaticano'),
  (52, 'Colombia'),
  (53, 'Comoras'),
  (55, 'Congo'),
  (57, 'Corea del Norte'),
  (58, 'Corea del Sur'),
  (59, 'Costa de Marfil'),
  (60, 'Costa Rica'),
  (61, 'Croacia'),
  (62, 'Cuba'),
  (63, 'Dinamarca'),
  (64, 'Dominica'),
  (66, 'Ecuador'),
  (67, 'Egipto'),
  (68, 'El Salvador'),
  (69, 'Emiratos Árabes Unidos'),
  (70, 'Eritrea'),
  (71, 'Eslovaquia'),
  (72, 'Eslovenia'),
  (73, 'España'),
  (75, 'Estados Unidos'),
  (76, 'Estonia'),
  (77, 'Etiopía'),
  (79, 'Filipinas'),
  (80, 'Finlandia'),
  (81, 'Fiyi'),
  (82, 'Francia'),
  (83, 'Gabón'),
  (84, 'Gambia'),
  (85, 'Georgia'),
  (87, 'Ghana'),
  (88, 'Gibraltar'),
  (89, 'Granada'),
  (90, 'Grecia'),
  (91, 'Groenlandia'),
  (92, 'Guadalupe'),
  (93, 'Guam'),
  (94, 'Guatemala'),
  (95, 'Guayana Francesa'),
  (96, 'Guinea'),
  (97, 'Guinea Ecuatorial'),
  (98, 'Guinea-Bissau'),
  (99, 'Guyana'),
  (100, 'Haití'),
  (102, 'Honduras'),
  (103, 'Hong Kong'),
  (104, 'Hungría'),
  (105, 'India'),
  (106, 'Indonesia'),
  (107, 'Irán'),
  (108, 'Iraq'),
  (109, 'Irlanda'),
  (32, 'Isla Bouvet'),
  (49, 'Isla de Navidad'),
  (161, 'Isla Norfolk'),
  (110, 'Islandia'),
  (39, 'Islas Caimán'),
  (51, 'Islas Cocos'),
  (56, 'Islas Cook'),
  (78, 'Islas Feroe'),
  (86, 'Islas Georgias del Sur y Sandwich del Sur'),
  (2, 'Islas Gland'),
  (101, 'Islas Heard y McDonald'),
  (138, 'Islas Malvinas'),
  (139, 'Islas Marianas del Norte'),
  (141, 'Islas Marshall'),
  (174, 'Islas Pitcairn'),
  (186, 'Islas Salomón'),
  (223, 'Islas Turcas y Caicos'),
  (74, 'Islas ultramarinas de Estados Unidos'),
  (234, 'Islas Vírgenes Británicas'),
  (235, 'Islas Vírgenes de los Estados Unidos'),
  (111, 'Israel'),
  (112, 'Italia'),
  (113, 'Jamaica'),
  (114, 'Japón'),
  (115, 'Jordania'),
  (116, 'Kazajstán'),
  (117, 'Kenia'),
  (118, 'Kirguistán'),
  (119, 'Kiribati'),
  (120, 'Kuwait'),
  (121, 'Laos'),
  (122, 'Lesotho'),
  (123, 'Letonia'),
  (124, 'Líbano'),
  (125, 'Liberia'),
  (126, 'Libia'),
  (127, 'Liechtenstein'),
  (128, 'Lituania'),
  (129, 'Luxemburgo'),
  (130, 'Macao'),
  (132, 'Madagascar'),
  (133, 'Malasia'),
  (134, 'Malawi'),
  (135, 'Maldivas'),
  (136, 'Malí'),
  (137, 'Malta'),
  (140, 'Marruecos'),
  (142, 'Martinica'),
  (143, 'Mauricio'),
  (144, 'Mauritania'),
  (145, 'Mayotte'),
  (146, 'México'),
  (147, 'Micronesia'),
  (148, 'Moldavia'),
  (149, 'Mónaco'),
  (150, 'Mongolia'),
  (151, 'Montserrat'),
  (152, 'Mozambique'),
  (153, 'Myanmar'),
  (154, 'Namibia'),
  (155, 'Nauru'),
  (156, 'Nepal'),
  (157, 'Nicaragua'),
  (158, 'Níger'),
  (159, 'Nigeria'),
  (160, 'Niue'),
  (162, 'Noruega'),
  (163, 'Nueva Caledonia'),
  (164, 'Nueva Zelanda'),
  (165, 'Omán'),
  (166, 'Países Bajos'),
  (167, 'Pakistán'),
  (168, 'Palau'),
  (169, 'Palestina'),
  (170, 'Panamá'),
  (171, 'Papúa Nueva Guinea'),
  (172, 'Paraguay'),
  (173, 'Perú'),
  (175, 'Polinesia Francesa'),
  (176, 'Polonia'),
  (177, 'Portugal'),
  (178, 'Puerto Rico'),
  (179, 'Qatar'),
  (180, 'Reino Unido'),
  (43, 'República Centroafricana'),
  (45, 'República Checa'),
  (54, 'República Democrática del Congo'),
  (65, 'República Dominicana'),
  (181, 'Reunión'),
  (182, 'Ruanda'),
  (183, 'Rumania'),
  (184, 'Rusia'),
  (185, 'Sahara Occidental'),
  (187, 'Samoa'),
  (188, 'Samoa Americana'),
  (189, 'San Cristóbal y Nevis'),
  (190, 'San Marino'),
  (191, 'San Pedro y Miquelón'),
  (192, 'San Vicente y las Granadinas'),
  (193, 'Santa Helena'),
  (194, 'Santa Lucía'),
  (195, 'Santo Tomé y Príncipe'),
  (196, 'Senegal'),
  (197, 'Serbia y Montenegro'),
  (198, 'Seychelles'),
  (199, 'Sierra Leona'),
  (200, 'Singapur'),
  (201, 'Siria'),
  (202, 'Somalia'),
  (203, 'Sri Lanka'),
  (204, 'Suazilandia'),
  (205, 'Sudáfrica'),
  (206, 'Sudán'),
  (207, 'Suecia'),
  (208, 'Suiza'),
  (209, 'Surinam'),
  (210, 'Svalbard y Jan Mayen'),
  (211, 'Tailandia'),
  (212, 'Taiwán'),
  (213, 'Tanzania'),
  (214, 'Tayikistán'),
  (215, 'Territorio Británico del Océano Índico'),
  (216, 'Territorios Australes Franceses'),
  (217, 'Timor Oriental'),
  (218, 'Togo'),
  (219, 'Tokelau'),
  (220, 'Tonga'),
  (221, 'Trinidad y Tobago'),
  (222, 'Túnez'),
  (224, 'Turkmenistán'),
  (225, 'Turquía'),
  (226, 'Tuvalu'),
  (227, 'Ucrania'),
  (228, 'Uganda'),
  (229, 'Uruguay'),
  (230, 'Uzbekistán'),
  (231, 'Vanuatu'),
  (232, 'Venezuela'),
  (233, 'Vietnam'),
  (236, 'Wallis y Futuna'),
  (237, 'Yemen'),
  (238, 'Yibuti'),
  (239, 'Zambia'),
  (240, 'Zimbabue');
  
  INSERT INTO DIRECCION (NOMBRE_CALLE, NUMERO, PISO, DEPARTAMENTO, CIUDAD, CODIGO_POSTAL, ID_PAIS) VALUES 
  ('AVENIDA ROCA', 866,  NULL, NULL, 'PUERTO MADRYN', '9120', 13), -- 1
  ('APELEG', 275,  NULL, NULL, 'PUERTO MADRYN', '9120',13), -- 2
  ('RIGLOS', 217, 0, 'C', 'CABA', '1424', 13), -- 3 
  ('ANGEL GIMENEZ', 60, 1, 'C', 'CABA', '1424', 13), -- 4
  ('MONSEÑOR PIAGGIO', 55, 4, NULL, 'AVELLANEDA', '1870', 13), -- 5
  ('BOULVEARD BROWN', 675, 6, 'B', 'PUERTO MADRYN', '9120', 13), -- 6
  ('SAN MARTIN', 350, 3, 'C', 'LANUS', '1824', 13), -- 7
  ('LIBERTAD', 123, 2, 'B', 'BOGOTÁ', '110231', 52), -- 8
  ('JUAN DOMINGO PERON', 1955, NULL, NULL, 'ROSARIO', '2000', 13), -- 9
  ('SAN MARTIN', 250, NULL, NULL, 'RENCA', '8640000',  46), -- 10
  ('BOLIVAR', 385, 3, 'A', 'RIO DE JANEIRO', '05407-002', 33), -- 11
  ('PROGRESO', 2001, 4, NULL, 'RIO DE JANEIRO', '05407-002', 33), -- 12
  ('JUAN CARLOS CARDENAS', 1967, NULL, NULL, 'AVELLANEDA', '1870', 13), -- 13
  ('VALLE', 822, NULL, '3', 'CABA', '1424', 13), -- 14
  ('SUCRE', 1525, NULL, NULL, 'LA PAZ', '00591', 29); -- 15
  
  INSERT INTO CARRITO (TOTAL) VALUES 
  (0), (0), (0),(0), (0), (0),(0), (0), (0),(0), (0), (0),(0), (0), (0);
  
  INSERT INTO CLIENTE (NOMBRES, APELLIDOS, TIPO_DOCUMENTO, NUMERO_DOCUMENTO, TELEFONO, FECHA_NACIMIENTO, EMAIL, PASS_WORD, ID_DIRECCION, ID_CARRITO) VALUES
  ('IGNACIO', 'COLETTA', 'DNI', 26583164, "+5491123456789", '1978-04-18', 'IGNACIOCOLETTA@GMAIL.COM', '123456', 1, 1 ),
  ('JUAN', 'PEREZ', 'DNI', 12345678, "+5491131314142", '1954-03-23', 'JUANPEREZ@HOTMAIL.COM', 'ABC1234', 2, 2),
  ('LUCAS', 'VILLA', 'PASAPORTE', 92235453, '+13054525668', '2001-01-21', 'LUCASVILLA@GMAIL.COM', 'JSC4332DFA', 3, 3),
  ('WALTER', 'YSUORGANO', 'LE', 4964441, '+54341306698', '1975-09-09', 'WALTER@YSUORGANO.COM', 'WALTERCAPU', 4, 4),
  ('JUAN CARLOS', 'PELO', 'DNI', 6176211, '+5212332144', '1952-08-18', 'JUANCA@PELOT.COM', 'TUDOJUANCAPE', 5, 5),
  ('LIONEL ANDRES', 'MESSI', 'PASAPORTE', 225661723, '+12456879654', '2000-04-04', 'LIOMESSI@QATAR22.COM', 'VANGALLTA', 6, 6),
  ('JUAN', 'LOPEZ', 'DNI', 123456788, '+54280446632', '1955-05-13', 'JUANLOPEZ@LIVE.COM', 'JUANCHO123LOPEZ', 7, 7),
  ('MARCELO RAMON', 'LOPEZ', 'DNI', 44325322, '+5491135352222', '1945-01-01', 'MARCELORA@GMAIL.COM', 'MARCEPIPO', 8, 8),
  ('PATRICIA', 'TERMIDOR', 'DNI', 12222333, '+5491185851212', '1976-02-28', 'PATO@TERMIDOR.COM', 'MOSCATOPIZZAYFAINA', 9, 9),
  ('SANTIAGO', 'PELA', 'PASAPORTE', 36252331, '+13053331243', '1940-05-05', 'PELACUNEO@GMAIL.COM', 'PELAVIOPELA', 10, 10),
  ('NORMA', 'PLA', 'LC', 1234521, '+54911353512', '1925-05-05', 'NORMA@PLA.COM', '80MOVILPARATODOS', 11, 11),
  ('ANA', 'GOMEZ', 'DNI', 98765432, '+5491188888888', '1986-12-15', 'ANAGOMEZ@OUTLOOK.COM', 'ANITA123', 12, 12),
  ('CARLOS', 'RODRIGUEZ', 'DNI', 45678901, '+541123456789', '1970-09-20', 'CARLOSRODRIGUEZ@YAHOO.COM', 'CARLOS456', 13, 13),
  ('MARIA', 'SANCHEZ', 'PASAPORTE', 123456789, '+13051234567', '1995-03-10', 'MARIASANCHEZ@GMAIL.COM', 'MARIAPASS', 14, 14),
  ('JORGE', 'PEREZ', 'DNI', 23456789, '+5491112345678', '1980-07-07', 'JORGEPEREZ@HOTMAIL.COM', 'PEREZ123', 15, 15);
  
  
  INSERT INTO TALLE (MEDIDA) VALUES
  ('XXS'), ('XS'), ('S'), ('M'), ('L'), 
  ('XL'), ('2XL'), ('3XL'), ('4XL'), ('5XL');
  
  INSERT INTO TIPO_PRODUCTO (NOMBRE_TIPO_PRENDA) VALUES
  ('REMERA'), ('CAMISA'), ('SHORT DE BAÑO'), ('CHOMBA POLO'), ('BUZO'), 
  ('SWEATER'), ('SUDADERA'), ('MUSCULOSA'), ('JEAN'), ('JOGGING'),
  ('CANGURO'), ('GAMULAN'), ('CAMISETA'), ('CAMPERA'), ('PESCADOR');
  
  INSERT INTO PRODUCTO (DESCRIPCION, STOCK, PRECIO, ID_TIPO_PRODUCTO, ID_TALLE) VALUES
  ('REMERA ESCUDO RAMONES', 25, 15000, 1, 5),  -- 1
  ('REMERA NIRVANA', 12, 17000, 1, 5), -- 2
  ('REMERA FOO FIGHTERS 2024', 10, 22000, 1, 6), -- 3
  ('JOGGING FRIZA VERDE', 30, 35000, 10, 6), -- 4 
  ('CANGURO CERVEZA CORONA', 10, 28000, 11, 2), -- 5
  ('CANGURO BOB ESPONJA', 8, 30000, 11, 3), -- 6
  ('SWEATER LACOSTE', 10, 80000, 6, 5), -- 7
  ('SWEATER TOMMY HILFIGER', 12, 75000, 6, 6), -- 8
  ('GAMULAN DE ABRIGO NEGRO', 8, 120000, 12, 5), -- 9
  ('CAMPERA DE CUERO MARRON', 14, 250000, 14, 7), -- 10
  ('CAMPERA DE JEAN AZUL', 12, 125000, 14, 6), -- 11
  ('PESCADOR NEGRO ADIDAS', 7, 45000, 15, 8), -- 12
  ('CAMISETA SELECCION ARGENTINA', 20, 135000, 13, 5), -- 13
  ('CHOMBA EN V', 12, 25000, 4, 5), -- 14
  ('SUDADERA ADIDAS', 30, 35000, 7, 5); -- 15
  
  INSERT INTO CARRITO_PRODUCTO (ID_CARRITO, ID_PRODUCTO, CANTIDAD) VALUES 
  (1, 2, 3), (1, 4, 1), (1, 15, 8), -- 3
  (2, 10, 1), (2, 15, 8), -- 5
  (3, 7, 3), (3,  12, 1), -- 7
  (4, 15, 2), (4, 14, 1), (4, 6, 1), -- 10
  (5, 6, 3), (5, 12, 1), (5, 13, 1), -- 13
  (6, 13, 1), (6, 14, 1); -- 15
  
  INSERT INTO CALIFICACION (ID_CLIENTE, ID_PRODUCTO, PUNTUACION, COMENTARIO) VALUES
  (1, 1, 10, 'EXCELENTE CALIDAD, EL DISEÑO NUNCA SE BORRO LUEGO DE VARIOS LAVADOS'), -- 1
  (2, 1, 9.5, 'HEY HO, LET`S GO'), -- 2
  (3, 1, 10, 'CALIDAD SUPERIOR, MEJOR QUE LAS DE LA BOND STREET'), -- 3
  (1, 2, 8, 'LA DE LOS RAMONES ME PARECIO MEJOR CALIDAD, ES ACEPTABLE'), -- 4
  (4, 4, 7, 'UN POCO CALUROSO, PERO ACEPTABLE'), -- 5
  (4, 15, 6, 'NO ES ORIGINAL, PERO LO PARECE'), -- 6
  (8, 4, 5.5, 'NO ME RESULTO COMODO, SE ESTIRA CON EL USO'), -- 7
  (8, 14, 3, 'PESIMA CALIDAD, NO DEBERIA PERMITIRSE VENDER ESTE PRODUCTO, ES UNA IMITACION'), -- 8
  (8, 15, 4, 'MUY MALA IMITACION'), -- 9
  (8, 9, 10, 'EXCELENTE GAMULAN, MUY COMODO Y CALUROSO PARA ESTE INVIERNO'),  -- 10
  (15, 13, 10, 'ES LA ORIGINAL, ADEMAS PERMITEN IMPRIMIR EN LA PARTE TRASERA UN NOMBRE'), -- 11
  (15, 6, 3, 'LA IMAGEN DE SE BORRO EN EL PRIMER LAVADO'), -- 12
  (1, 6, 6, 'SE BORRA LA IMAGEN, PERO QUEDA LISA Y EL AMARILLO ES DIVINO'), -- 13
  (7, 5, 6, 'BOB ESPONJA NI SE PARECE AL DE LA FOTO ORIGINAL'), -- 14
  (7, 10, 10, 'EXCELENTE CALIDAD, LE DOY UN 10/10'); -- 15
  
INSERT INTO FACTURA (FECHA_FACTURA, SUBTOTAL, IVA, TOTAL, ID_CLIENTE) VALUES
  ('2023-05-05 08:00:00', 300000, 60000, 360000, 1), -- 1
  ('2023-05-05 09:00:00', 150000, 31500, 181500, 1), -- 2
  ('2023-05-05 10:00:00', 75000, 15750, 90750, 2),   -- 3
  ('2023-05-05 11:00:00', 235000, 49350, 284350, 1), -- 4
  ('2023-05-05 12:00:00', 80235, 16849.5, 97084.35, 3),-- 5
  ('2023-05-05 13:00:00', 135025, 28355.25, 163380.25, 6), -- 6
  ('2023-05-05 13:05:21', 19300, 4053, 23353, 5), -- 7
  ('2023-05-06 09:05:22', 27800, 5838, 33638, 5), -- 8
  ('2023-07-12 14:30:25', 123200, 25872, 149072, 4), -- 9
  ('2023-07-12 15:25:30', 150233, 31548.93, 181781.93, 10), -- 10
  ('2024-02-02 17:30:00', 200000, 42000, 242000, 1), -- 11
  ('2024-02-10 16:20:00', 175300, 36813, 212113, 2), -- 12
  ('2024-02-10 17:35:32', 200000, 42000, 242000, 1), -- 13
  ('2024-03-12 14:20:23', 10000, 2100, 12100, 4), -- 14
  ('2024-05-04 10:03:21', 27350, 5743.50, 33093.50, 12); -- 15

INSERT INTO DETALLE (CANTIDAD, PRECIO, ID_PRODUCTO, ID_FACTURA) VALUES 
(1, 30000, 1, 1), (3, 23000, 2, 1), (2, 28000, 4, 1), (7, 20000, 6, 2), (5, 17000, 2,2), -- 1, 2, 3, 4, 5
(12, 17000, 4, 3), (1, 30000, 1, 4), (1, 28300, 2, 4), (3, 17500, 3, 4), (2, 230000, 4, 4), -- 6, 7, 8, 9, 10
(7, 12000, 1, 5), (2, 195300, 12, 5), (1, 22300, 10, 5), (1, 163000, 6, 6), (1, 30000, 1, 5); -- 11, 12, 13, 14, 15

-- ("PENDIENTE", "ENVIADA", "CANCELADA", "ENTREGADA"), ME FALTO ENREGADA
  INSERT INTO ORDEN (FECHA_ORDEN, ESTADO_ORDEN, ID_FACTURA) VALUES 
  ('2023-05-05 08:00:00', 'ENVIADA', 1), -- 1
  ('2023-05-05 09:00:00', 'ENVIADA', 2), -- 2
  ('2023-05-05 10:00:00', 'ENVIADA', 3),   -- 3
  ('2023-05-05 11:00:00', 'PENDIENTE', 4), -- 4
  ('2023-05-05 12:00:00', 'ENVIADA', 5),-- 5
  ('2023-05-05 13:00:00', 'CANCELADA', 6), -- 6
  ('2023-05-05 13:05:21', 'CANCELADA', 7), -- 7
  ('2023-05-06 09:05:22', 'ENTREGADA', 8), -- 8
  ('2023-07-12 14:30:25', 'PENDIENTE', 9), -- 9
  ('2023-07-12 15:25:30', 'ENVIADA', 10), -- 10
  ('2024-02-02 17:30:00', 'CANCELADA', 11), -- 11
  ('2024-02-10 16:20:00', 'PENDIENTE', 12), -- 12
  ('2024-02-10 17:35:32', 'ENVIADA', 13), -- 13
  ('2024-03-12 14:20:23', 'PENDIENTE', 14), -- 14
  ('2024-05-04 10:03:21', 'ENTREGADA', 15); -- 15
  
  INSERT INTO PAGO (FECHA_PAGO, ID_FACTURA) VALUES
   ('2023-05-05 08:00:00', 1), -- 1
  ('2023-05-05 09:00:00', 2), -- 2
  ('2023-05-05 10:00:00', 3),   -- 3
  ('2023-05-05 11:00:00', 4), -- 4
  ('2023-05-05 12:00:00', 5),-- 5
  ('2023-05-05 13:00:00', 6), -- 6
  ('2023-05-05 13:05:21', 7), -- 7
  ('2023-05-06 09:05:22', 8), -- 8
  ('2023-07-12 14:30:25', 9), -- 9
  ('2023-07-12 15:25:30', 10), -- 10
  ('2024-02-02 17:30:00', 11), -- 11
  ('2024-02-10 16:20:00', 12), -- 12
  ('2024-02-10 17:35:32', 13), -- 13
  ('2024-03-12 14:20:23', 14), -- 14
  ('2024-05-04 10:03:21', 15); -- 15
  
-- ESTA VISTA TRAE TODAS LAS ORDENES Y SUS ESTADOS, CON LOS DATOS DE LOS CLIENTES
    CREATE OR REPLACE VIEW VW_ORDENES AS
	SELECT CLIENTE.NOMBRES, CLIENTE.APELLIDOS, CLIENTE.TELEFONO, CLIENTE.EMAIL,
		DIRECCION.NOMBRE_CALLE, DIRECCION.NUMERO, COALESCE(DIRECCION.PISO, 'N/A'), COALESCE(DIRECCION.DEPARTAMENTO, 'N/A'), DIRECCION.CIUDAD, 
        PAIS.PAIS,
        FACTURA.FECHA_FACTURA, FACTURA.TOTAL,
        ORDEN.FECHA_ORDEN, ORDEN.ESTADO_ORDEN
	FROM CLIENTE 
    INNER JOIN DIRECCION
    ON CLIENTE.ID_DIRECCION = DIRECCION.ID_DIRECCION
    INNER JOIN PAIS
    ON DIRECCION.ID_PAIS = PAIS.ID_PAIS
    INNER JOIN FACTURA
    ON CLIENTE.ID_CLIENTE = FACTURA.ID_CLIENTE
    INNER JOIN ORDEN
    ON FACTURA.ID_FACTURA = ORDEN.ID_FACTURA
    ORDER BY ORDEN.FECHA_ORDEN ASC;
    
-- SELECT * FROM VW_ORDENES;

-- PRODUCTOS MEJORES PUNTUADOS DE MEJOR A PEOR
CREATE OR REPLACE VIEW VW_PRODUCTOS_MEJORES_PUNTUADOS AS
	SELECT TIPO_PRODUCTO.NOMBRE_TIPO_PRENDA,
			PRODUCTO.DESCRIPCION,
            ROUND(AVG(CALIFICACION.PUNTUACION), 2) AS PROMEDIO_NOTA
	FROM TIPO_PRODUCTO
    INNER JOIN PRODUCTO
    ON TIPO_PRODUCTO.ID_TIPO_PRODUCTO = PRODUCTO.ID_TIPO_PRODUCTO
    INNER JOIN CALIFICACION
    ON CALIFICACION.ID_PRODUCTO = PRODUCTO.ID_PRODUCTO
    GROUP BY TIPO_PRODUCTO.NOMBRE_TIPO_PRENDA, PRODUCTO.DESCRIPCION
    ORDER BY  AVG(CALIFICACION.PUNTUACION) DESC;
    
--    SELECT * FROM VW_PRODUCTOS_MEJORES_PUNTUADOS;

CREATE OR REPLACE VIEW VW_PRODUCTOS_MAS_VENDIDOS AS
	SELECT TIPO_PRODUCTO.NOMBRE_TIPO_PRENDA,
		   PRODUCTO.DESCRIPCION,
		   SUM(DETALLE.CANTIDAD) AS CANTIDAD_TOTAL_VENDIDA
	FROM DETALLE
	INNER JOIN PRODUCTO
	ON DETALLE.ID_PRODUCTO = PRODUCTO.ID_PRODUCTO
	INNER JOIN TIPO_PRODUCTO
	ON PRODUCTO.ID_TIPO_PRODUCTO = TIPO_PRODUCTO.ID_TIPO_PRODUCTO
	GROUP BY TIPO_PRODUCTO.NOMBRE_TIPO_PRENDA, PRODUCTO.DESCRIPCION
	ORDER BY CANTIDAD_TOTAL_VENDIDA DESC;
    
-- SELECT * FROM VW_PRODUCTOS_MAS_VENDIDOS;



CREATE OR REPLACE VIEW VW_PRODUCTOS_MENOS_VENDIDOS AS
   SELECT PRODUCTO.ID_PRODUCTO AS PRODUCTO, PRODUCTO.DESCRIPCION, SUM(coalesce(DETALLE.CANTIDAD, 0)) AS CANTIDAD_VENDIDA
   FROM PRODUCTO
   INNER JOIN DETALLE
   ON PRODUCTO.ID_PRODUCTO = DETALLE.ID_PRODUCTO
   GROUP BY PRODUCTO.ID_PRODUCTO
 --  ORDER BY 2 DESC;
   UNION
    -- TODOS LOS PRODUCTOS QUE NO SE VENDIERON
   SELECT PRODUCTO.ID_PRODUCTO AS PRODUCTO,  PRODUCTO.DESCRIPCION, 0  AS CANTIDAD_VENDIDA
   FROM PRODUCTO
   LEFT JOIN DETALLE
   ON PRODUCTO.ID_PRODUCTO = DETALLE.ID_PRODUCTO
   WHERE DETALLE.ID_PRODUCTO IS NULL
  ORDER BY CANTIDAD_VENDIDA ASC;

-- SELECT * FROM VW_PRODUCTOS_MENOS_VENDIDOS;

CREATE OR REPLACE VIEW VW_CLIENTES_POR_PAISES AS
	SELECT PAIS.PAIS, COUNT(PAIS.PAIS) AS CANTIDAD_CLIENTES
    FROM CLIENTE
    INNER JOIN DIRECCION
    ON CLIENTE.ID_DIRECCION = DIRECCION.ID_DIRECCION
    INNER JOIN PAIS
    ON PAIS.ID_PAIS = DIRECCION.ID_PAIS
    GROUP BY PAIS.PAIS
    ORDER BY CANTIDAD_CLIENTES DESC;
    

-- SELECT * FROM VW_CLIENTES_POR_PAISES;


DROP FUNCTION IF EXISTS F_ES_BICIESTO;

DELIMITER $$
CREATE FUNCTION F_ES_BICIESTO(P_ANIO INT)
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    RETURN (P_ANIO % 4 = 0 AND P_ANIO % 100 != 0) OR (P_ANIO % 400 = 0);
END $$
DELIMITER ;

-- SELECT F_ES_BICIESTO(2025);

DROP FUNCTION IF EXISTS FN_VENTAS_DEL_MES;
DELIMITER $$

DROP FUNCTION IF EXISTS FN_VENTAS_DEL_MES;
DELIMITER $$
CREATE FUNCTION FN_VENTAS_DEL_MES(P_MES VARCHAR(2), P_ANIO VARCHAR(4))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE V_FECHA_FIN_MES DATE;
    DECLARE V_FECHA_INICIO_MES DATE;
    DECLARE V_TOTAL_VENTAS INT;
    
    SET V_FECHA_INICIO_MES = STR_TO_DATE(CONCAT(P_ANIO, '-', P_MES, '-01'), '%Y-%m-%d'); 
    IF P_MES = 2 THEN
		IF F_ES_BICIESTO(P_ANIO) THEN 
			SET V_FECHA_FIN_MES = STR_TO_DATE(CONCAT(P_ANIO, '-', P_MES, '-29'), '%Y-%m-%d'); 
		ELSE
			SET V_FECHA_FIN_MES = STR_TO_DATE(CONCAT(P_ANIO, '-', P_MES, '-28'), '%Y-%m-%d');
		END IF;
    ELSE
		CASE 
			WHEN P_MES = '04' OR P_MES = '06' OR P_MES = '09' OR P_MES = '11' THEN
				SET V_FECHA_FIN_MES = STR_TO_DATE(CONCAT(P_ANIO, '-', P_MES, '-30'), '%Y-%m-%d');
			WHEN P_MES = '01' OR P_MES = '03' OR P_MES = '05' OR P_MES = '07' OR P_MES = '08' OR P_MES = '10' THEN
				SET V_FECHA_FIN_MES = STR_TO_DATE(CONCAT(P_ANIO, '-', P_MES, '-31'), '%Y-%m-%d');
			ELSE
				SET V_FECHA_FIN_MES = NULL;
		END CASE;
	END IF;
    
    SELECT COUNT(*)
    INTO V_TOTAL_VENTAS
    FROM FACTURA
    WHERE FACTURA.FECHA_FACTURA >= V_FECHA_INICIO_MES AND FACTURA.FECHA_FACTURA <= V_FECHA_FIN_MES;
    
    RETURN V_TOTAL_VENTAS;
END $$
DELIMITER ;


DROP PROCEDURE IF EXISTS SP_DETALLE_VENTAS;
DELIMITER $$
CREATE PROCEDURE SP_DETALLE_VENTAS(INOUT V_FECHA_INICIO_PERIODO DATE, INOUT V_FECHA_FIN_PERIODO DATE, OUT P_CANTIDAD_VENTAS INT, OUT P_PROMEDIO_VENTAS FLOAT)
BEGIN
	SELECT COUNT(*)
    INTO P_CANTIDAD_VENTAS
    FROM FACTURA
    WHERE FACTURA.FECHA_FACTURA BETWEEN V_FECHA_INICIO_PERIODO AND V_FECHA_FIN_PERIODO;
    
    SELECT AVG(FACTURA.TOTAL)
    INTO P_PROMEDIO_VENTAS
    FROM FACTURA 
	WHERE FACTURA.FECHA_FACTURA BETWEEN V_FECHA_INICIO_PERIODO AND V_FECHA_FIN_PERIODO;
   
    
 END $$
 DELIMITER ;

SET @CANTIDAD = 0;
SET @PROMEDIO = 0;
SET @FECHA_INICIO = '2023-01-01';
SET @FECHA_FIN = '2024-05-10';


CALL SP_DETALLE_VENTAS(@FECHA_INICIO , @FECHA_FIN, @CANTIDAD, @PROMEDIO );


DROP PROCEDURE IF EXISTS SP_PROMEDIO_DE_CALIFICACION_DE_PRODUCTO;

DELIMITER $$
CREATE PROCEDURE SP_PROMEDIO_DE_CALIFICACION_DE_PRODUCTO (IN P_ID_PRODUCTO_IN INT, OUT P_PROMEDIO DECIMAL(3,1), OUT P_NOMBRE_PRODUCTO VARCHAR(80))
BEGIN
	DECLARE V_CANTIDAD INT;
    
    SELECT DESCRIPCION INTO P_NOMBRE_PRODUCTO
    FROM PRODUCTO
    WHERE ID_PRODUCTO = P_ID_PRODUCTO_IN;
    
    SELECT AVG(PUNTUACION)
    INTO P_PROMEDIO
    FROM PRODUCTO
    INNER JOIN CALIFICACION
    ON PRODUCTO.ID_PRODUCTO = CALIFICACION.ID_PRODUCTO
    WHERE PRODUCTO.ID_PRODUCTO = P_ID_PRODUCTO_IN;
    
END $$
DELIMITER ;

-- SET @ID_PRODUCTO_IN = 1;
-- SET @NOMBRE_PRODUCTO = '';
-- CALL SP_PROMEDIO_DE_CALIFICACION_DE_PRODUCTO(@ID_PRODUCTO_IN, @PROMEDIO, @NOMBRE_PRODUCTO);

-- SELECT CONCAT('CALIFICACION DE PRODUCTO ', @NOMBRE_PRODUCTO, ' ES ', @PROMEDIO);

DELIMITER $$

CREATE TRIGGER TR_ACTUALIZAR_STOCK
AFTER INSERT ON DETALLE
FOR EACH ROW
BEGIN
	DECLARE CANTIDAD_PRODUCTO_DETALLE INT;
    DECLARE ID_PRODUCTO_DETALLE INT;
    
    SELECT NEW.CANTIDAD, NEW.ID_PRODUCTO 
    INTO CANTIDAD_PRODUCTO_DETALLE, ID_PRODUCTO_DETALLE;
    
	UPDATE PRODUCTO
    SET STOCK = STOCK - CANTIDAD_PRODUCTO
    WHERE ID_PRODUCTO = ID_PRODUCTO_DETALLE;
END; $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER TR_VERIFICAR_STOCK_PRE_INSERCION
BEFORE INSERT ON DETALLE
FOR EACH ROW
BEGIN
	DECLARE STOCK_DISPONIBLE INT;
    
    SELECT STOCK 
    INTO STOCK_DISPONIBLE
    FROM PRODUCTO
    WHERE ID_PRODUCTO = NEW.ID_PRODUCTO;
    
    IF NEW.CANTIDAD > STOCK_DISPONIBLE THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'STOCK INSUFICIENTE';
    END IF;
END; $$

DELIMITER ;