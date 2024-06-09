CREATE DATABASE  IF NOT EXISTS `proyecto_final` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto_final`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_final
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calificacion` (
  `ID_CALIFICACION` int NOT NULL AUTO_INCREMENT,
  `ID_CLIENTE` int DEFAULT NULL,
  `ID_PRODUCTO` int DEFAULT NULL,
  `PUNTUACION` decimal(3,1) DEFAULT NULL,
  `COMENTARIO` text,
  PRIMARY KEY (`ID_CALIFICACION`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE RESTRICT,
  CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calificacion`
--

LOCK TABLES `calificacion` WRITE;
/*!40000 ALTER TABLE `calificacion` DISABLE KEYS */;
INSERT INTO `calificacion` VALUES (1,1,1,10.0,'EXCELENTE CALIDAD, EL DISEÑO NUNCA SE BORRO LUEGO DE VARIOS LAVADOS'),(2,2,1,9.5,'HEY HO, LET`S GO'),(3,3,1,10.0,'CALIDAD SUPERIOR, MEJOR QUE LAS DE LA BOND STREET'),(4,1,2,8.0,'LA DE LOS RAMONES ME PARECIO MEJOR CALIDAD, ES ACEPTABLE'),(5,4,4,7.0,'UN POCO CALUROSO, PERO ACEPTABLE'),(6,4,15,6.0,'NO ES ORIGINAL, PERO LO PARECE'),(7,8,4,5.5,'NO ME RESULTO COMODO, SE ESTIRA CON EL USO'),(8,8,14,3.0,'PESIMA CALIDAD, NO DEBERIA PERMITIRSE VENDER ESTE PRODUCTO, ES UNA IMITACION'),(9,8,15,4.0,'MUY MALA IMITACION'),(10,8,9,10.0,'EXCELENTE GAMULAN, MUY COMODO Y CALUROSO PARA ESTE INVIERNO'),(11,15,13,10.0,'ES LA ORIGINAL, ADEMAS PERMITEN IMPRIMIR EN LA PARTE TRASERA UN NOMBRE'),(12,15,6,3.0,'LA IMAGEN DE SE BORRO EN EL PRIMER LAVADO'),(16,1,6,6.0,'SE BORRA LA IMAGEN, PERO QUEDA LISA Y EL AMARILLO ES DIVINO'),(17,7,5,6.0,'BOB ESPONJA NI SE PARECE AL DE LA FOTO ORIGINAL'),(18,7,10,10.0,'EXCELENTE CALIDAD, LE DOY UN 10/10');
/*!40000 ALTER TABLE `calificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `ID_CARRITO` int NOT NULL AUTO_INCREMENT,
  `TOTAL` double DEFAULT NULL,
  PRIMARY KEY (`ID_CARRITO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrito_producto`
--

DROP TABLE IF EXISTS `carrito_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito_producto` (
  `ID_CARRITO` int DEFAULT NULL,
  `ID_PRODUCTO` int DEFAULT NULL,
  `CANTIDAD` int NOT NULL,
  KEY `ID_CARRITO` (`ID_CARRITO`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  CONSTRAINT `carrito_producto_ibfk_1` FOREIGN KEY (`ID_CARRITO`) REFERENCES `carrito` (`ID_CARRITO`) ON DELETE RESTRICT,
  CONSTRAINT `carrito_producto_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito_producto`
--

LOCK TABLES `carrito_producto` WRITE;
/*!40000 ALTER TABLE `carrito_producto` DISABLE KEYS */;
INSERT INTO `carrito_producto` VALUES (1,2,3),(1,4,1),(1,15,8),(2,10,1),(2,15,8),(3,7,3),(3,12,1),(4,15,2),(4,14,1),(4,6,1),(5,6,3),(5,12,1),(5,13,1),(6,13,1),(6,14,1);
/*!40000 ALTER TABLE `carrito_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_CLIENTE` int NOT NULL AUTO_INCREMENT,
  `NOMBRES` varchar(80) NOT NULL,
  `APELLIDOS` varchar(80) NOT NULL,
  `TIPO_DOCUMENTO` varchar(15) NOT NULL,
  `NUMERO_DOCUMENTO` int NOT NULL,
  `TELEFONO` varchar(18) NOT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PASS_WORD` varchar(100) NOT NULL,
  `ID_DIRECCION` int DEFAULT NULL,
  `ID_CARRITO` int DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  KEY `ID_DIRECCION` (`ID_DIRECCION`),
  KEY `ID_CARRITO` (`ID_CARRITO`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_DIRECCION`) REFERENCES `direccion` (`ID_DIRECCION`) ON DELETE RESTRICT,
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`ID_CARRITO`) REFERENCES `carrito` (`ID_CARRITO`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'IGNACIO','COLETTA','DNI',26583164,'+5491123456789','1978-04-18','IGNACIOCOLETTA@GMAIL.COM','123456',1,1),(2,'JUAN','PEREZ','DNI',12345678,'+5491131314142','1954-03-23','JUANPEREZ@HOTMAIL.COM','ABC1234',2,2),(3,'LUCAS','VILLA','PASAPORTE',92235453,'+13054525668','2001-01-21','LUCASVILLA@GMAIL.COM','JSC4332DFA',3,3),(4,'WALTER','YSUORGANO','LE',4964441,'+54341306698','1975-09-09','WALTER@YSUORGANO.COM','WALTERCAPU',4,4),(5,'JUAN CARLOS','PELO','DNI',6176211,'+5212332144','1952-08-18','JUANCA@PELOT.COM','TUDOJUANCAPE',5,5),(6,'LIONEL ANDRES','MESSI','PASAPORTE',225661723,'+12456879654','2000-04-04','LIOMESSI@QATAR22.COM','VANGALLTA',6,6),(7,'JUAN','LOPEZ','DNI',123456788,'+54280446632','1955-05-13','JUANLOPEZ@LIVE.COM','JUANCHO123LOPEZ',7,7),(8,'MARCELO RAMON','LOPEZ','DNI',44325322,'+5491135352222','1945-01-01','MARCELORA@GMAIL.COM','MARCEPIPO',8,8),(9,'PATRICIA','TERMIDOR','DNI',12222333,'+5491185851212','1976-02-28','PATO@TERMIDOR.COM','MOSCATOPIZZAYFAINA',9,9),(10,'SANTIAGO','PELA','PASAPORTE',36252331,'+13053331243','1940-05-05','PELACUNEO@GMAIL.COM','PELAVIOPELA',10,10),(11,'NORMA','PLA','LC',1234521,'+54911353512','1925-05-05','NORMA@PLA.COM','80MOVILPARATODOS',11,11),(12,'ANA','GOMEZ','DNI',98765432,'+5491188888888','1986-12-15','ANAGOMEZ@OUTLOOK.COM','ANITA123',12,12),(13,'CARLOS','RODRIGUEZ','DNI',45678901,'+541123456789','1970-09-20','CARLOSRODRIGUEZ@YAHOO.COM','CARLOS456',13,13),(14,'MARIA','SANCHEZ','PASAPORTE',123456789,'+13051234567','1995-03-10','MARIASANCHEZ@GMAIL.COM','MARIAPASS',14,14),(15,'JORGE','PEREZ','DNI',23456789,'+5491112345678','1980-07-07','JORGEPEREZ@HOTMAIL.COM','PEREZ123',15,15);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle`
--

DROP TABLE IF EXISTS `detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle` (
  `ID_DETALLE` int NOT NULL AUTO_INCREMENT,
  `CANTIDAD` int NOT NULL,
  `PRECIO` double NOT NULL,
  `ID_PRODUCTO` int DEFAULT NULL,
  `ID_FACTURA` int DEFAULT NULL,
  PRIMARY KEY (`ID_DETALLE`),
  KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  KEY `ID_FACTURA` (`ID_FACTURA`),
  CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`) ON DELETE RESTRICT,
  CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle`
--

LOCK TABLES `detalle` WRITE;
/*!40000 ALTER TABLE `detalle` DISABLE KEYS */;
INSERT INTO `detalle` VALUES (1,1,30000,1,1),(2,3,23000,2,1),(3,2,28000,4,1),(4,7,20000,6,2),(5,5,17000,2,2),(6,12,17000,4,3),(7,1,30000,1,4),(8,1,28300,2,4),(9,3,17500,3,4),(10,2,230000,4,4),(11,7,12000,1,5),(12,2,195300,12,5),(13,1,22300,10,5),(14,1,163000,6,6),(15,1,30000,1,5);
/*!40000 ALTER TABLE `detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `ID_DIRECCION` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_CALLE` varchar(100) NOT NULL,
  `NUMERO` int DEFAULT NULL,
  `PISO` int DEFAULT NULL,
  `DEPARTAMENTO` varchar(5) DEFAULT NULL,
  `CIUDAD` varchar(50) NOT NULL,
  `CODIGO_POSTAL` varchar(10) NOT NULL,
  `ID_PAIS` int DEFAULT NULL,
  PRIMARY KEY (`ID_DIRECCION`),
  KEY `ID_PAIS` (`ID_PAIS`),
  CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`ID_PAIS`) REFERENCES `pais` (`ID_PAIS`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'AVENIDA ROCA',866,NULL,NULL,'PUERTO MADRYN','9120',13),(2,'APELEG',275,NULL,NULL,'PUERTO MADRYN','9120',13),(3,'RIGLOS',217,0,'C','CABA','1424',13),(4,'ANGEL GIMENEZ',60,1,'C','CABA','1424',13),(5,'MONSEÑOR PIAGGIO',55,4,NULL,'AVELLANEDA','1870',13),(6,'BOULVEARD BROWN',675,6,'B','PUERTO MADRYN','9120',13),(7,'SAN MARTIN',350,3,'C','LANUS','1824',13),(8,'LIBERTAD',123,2,'B','BOGOTÁ','110231',52),(9,'JUAN DOMINGO PERON',1955,NULL,NULL,'ROSARIO','2000',13),(10,'SAN MARTIN',250,NULL,NULL,'RENCA','8640000',46),(11,'BOLIVAR',385,3,'A','RIO DE JANEIRO','05407-002',33),(12,'PROGRESO',2001,4,NULL,'RIO DE JANEIRO','05407-002',33),(13,'JUAN CARLOS CARDENAS',1967,NULL,NULL,'AVELLANEDA','1870',13),(14,'VALLE',822,NULL,'3','CABA','1424',13),(15,'SUCRE',1525,NULL,NULL,'LA PAZ','00591',29);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `ID_FACTURA` int NOT NULL AUTO_INCREMENT,
  `FECHA_FACTURA` datetime NOT NULL,
  `SUBTOTAL` double DEFAULT NULL,
  `IVA` double DEFAULT NULL,
  `TOTAL` double DEFAULT NULL,
  `ID_CLIENTE` int DEFAULT NULL,
  PRIMARY KEY (`ID_FACTURA`),
  KEY `ID_CLIENTE` (`ID_CLIENTE`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'2023-05-05 08:00:00',300000,60000,360000,1),(2,'2023-05-05 09:00:00',150000,31500,181500,1),(3,'2023-05-05 10:00:00',75000,15750,90750,2),(4,'2023-05-05 11:00:00',235000,49350,284350,1),(5,'2023-05-05 12:00:00',80235,16849.5,97084.35,3),(6,'2023-05-05 13:00:00',135025,28355.25,163380.25,6),(7,'2023-05-05 13:05:21',19300,4053,23353,5),(8,'2023-05-06 09:05:22',27800,5838,33638,5),(9,'2023-07-12 14:30:25',123200,25872,149072,4),(10,'2023-07-12 15:25:30',150233,31548.93,181781.93,10),(11,'2024-02-02 17:30:00',200000,42000,242000,1),(12,'2024-02-10 16:20:00',175300,36813,212113,2),(13,'2024-02-10 17:35:32',200000,42000,242000,1),(14,'2024-03-12 14:20:23',10000,2100,12100,4),(15,'2024-05-04 10:03:21',27350,5743.5,33093.5,12);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden`
--

DROP TABLE IF EXISTS `orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden` (
  `ID_ORDEN` int NOT NULL AUTO_INCREMENT,
  `FECHA_ORDEN` datetime DEFAULT NULL,
  `ESTADO_ORDEN` enum('PENDIENTE','ENVIADA','CANCELADA','ENTREGADA') DEFAULT NULL,
  `ID_FACTURA` int DEFAULT NULL,
  PRIMARY KEY (`ID_ORDEN`),
  KEY `ID_FACTURA` (`ID_FACTURA`),
  CONSTRAINT `orden_ibfk_1` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden`
--

LOCK TABLES `orden` WRITE;
/*!40000 ALTER TABLE `orden` DISABLE KEYS */;
INSERT INTO `orden` VALUES (1,'2023-05-05 08:00:00','ENVIADA',1),(2,'2023-05-05 09:00:00','ENVIADA',2),(3,'2023-05-05 10:00:00','ENVIADA',3),(4,'2023-05-05 11:00:00','PENDIENTE',4),(5,'2023-05-05 12:00:00','ENVIADA',5),(6,'2023-05-05 13:00:00','CANCELADA',6),(7,'2023-05-05 13:05:21','CANCELADA',7),(8,'2023-05-06 09:05:22','ENTREGADA',8),(9,'2023-07-12 14:30:25','PENDIENTE',9),(10,'2023-07-12 15:25:30','ENVIADA',10),(11,'2024-02-02 17:30:00','CANCELADA',11),(12,'2024-02-10 16:20:00','PENDIENTE',12),(13,'2024-02-10 17:35:32','ENVIADA',13),(14,'2024-03-12 14:20:23','PENDIENTE',14),(15,'2024-05-04 10:03:21','ENTREGADA',15);
/*!40000 ALTER TABLE `orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `ID_PAGO` int NOT NULL AUTO_INCREMENT,
  `FECHA_PAGO` datetime NOT NULL,
  `ID_FACTURA` int DEFAULT NULL,
  PRIMARY KEY (`ID_PAGO`),
  KEY `ID_FACTURA` (`ID_FACTURA`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`ID_FACTURA`) REFERENCES `factura` (`ID_FACTURA`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'2023-05-05 08:00:00',1),(2,'2023-05-05 09:00:00',2),(3,'2023-05-05 10:00:00',3),(4,'2023-05-05 11:00:00',4),(5,'2023-05-05 12:00:00',5),(6,'2023-05-05 13:00:00',6),(7,'2023-05-05 13:05:21',7),(8,'2023-05-06 09:05:22',8),(9,'2023-07-12 14:30:25',9),(10,'2023-07-12 15:25:30',10),(11,'2024-02-02 17:30:00',11),(12,'2024-02-10 16:20:00',12),(13,'2024-02-10 17:35:32',13),(14,'2024-03-12 14:20:23',14),(15,'2024-05-04 10:03:21',15);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pais`
--

DROP TABLE IF EXISTS `pais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pais` (
  `ID_PAIS` int NOT NULL,
  `PAIS` varchar(80) NOT NULL,
  PRIMARY KEY (`ID_PAIS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pais`
--

LOCK TABLES `pais` WRITE;
/*!40000 ALTER TABLE `pais` DISABLE KEYS */;
INSERT INTO `pais` VALUES (1,'Afganistán'),(2,'Islas Gland'),(3,'Albania'),(4,'Alemania'),(5,'Andorra'),(6,'Angola'),(7,'Anguilla'),(8,'Antártida'),(9,'Antigua y Barbuda'),(10,'Antillas Holandesas'),(11,'Arabia Saudí'),(12,'Argelia'),(13,'Argentina'),(14,'Armenia'),(15,'Aruba'),(16,'Australia'),(17,'Austria'),(18,'Azerbaiyán'),(19,'Bahamas'),(20,'Bahréin'),(21,'Bangladesh'),(22,'Barbados'),(23,'Bielorrusia'),(24,'Bélgica'),(25,'Belice'),(26,'Benin'),(27,'Bermudas'),(28,'Bhután'),(29,'Bolivia'),(30,'Bosnia y Herzegovina'),(31,'Botsuana'),(32,'Isla Bouvet'),(33,'Brasil'),(34,'Brunéi'),(35,'Bulgaria'),(36,'Burkina Faso'),(37,'Burundi'),(38,'Cabo Verde'),(39,'Islas Caimán'),(40,'Camboya'),(41,'Camerún'),(42,'Canadá'),(43,'República Centroafricana'),(44,'Chad'),(45,'República Checa'),(46,'Chile'),(47,'China'),(48,'Chipre'),(49,'Isla de Navidad'),(50,'Ciudad del Vaticano'),(51,'Islas Cocos'),(52,'Colombia'),(53,'Comoras'),(54,'República Democrática del Congo'),(55,'Congo'),(56,'Islas Cook'),(57,'Corea del Norte'),(58,'Corea del Sur'),(59,'Costa de Marfil'),(60,'Costa Rica'),(61,'Croacia'),(62,'Cuba'),(63,'Dinamarca'),(64,'Dominica'),(65,'República Dominicana'),(66,'Ecuador'),(67,'Egipto'),(68,'El Salvador'),(69,'Emiratos Árabes Unidos'),(70,'Eritrea'),(71,'Eslovaquia'),(72,'Eslovenia'),(73,'España'),(74,'Islas ultramarinas de Estados Unidos'),(75,'Estados Unidos'),(76,'Estonia'),(77,'Etiopía'),(78,'Islas Feroe'),(79,'Filipinas'),(80,'Finlandia'),(81,'Fiyi'),(82,'Francia'),(83,'Gabón'),(84,'Gambia'),(85,'Georgia'),(86,'Islas Georgias del Sur y Sandwich del Sur'),(87,'Ghana'),(88,'Gibraltar'),(89,'Granada'),(90,'Grecia'),(91,'Groenlandia'),(92,'Guadalupe'),(93,'Guam'),(94,'Guatemala'),(95,'Guayana Francesa'),(96,'Guinea'),(97,'Guinea Ecuatorial'),(98,'Guinea-Bissau'),(99,'Guyana'),(100,'Haití'),(101,'Islas Heard y McDonald'),(102,'Honduras'),(103,'Hong Kong'),(104,'Hungría'),(105,'India'),(106,'Indonesia'),(107,'Irán'),(108,'Iraq'),(109,'Irlanda'),(110,'Islandia'),(111,'Israel'),(112,'Italia'),(113,'Jamaica'),(114,'Japón'),(115,'Jordania'),(116,'Kazajstán'),(117,'Kenia'),(118,'Kirguistán'),(119,'Kiribati'),(120,'Kuwait'),(121,'Laos'),(122,'Lesotho'),(123,'Letonia'),(124,'Líbano'),(125,'Liberia'),(126,'Libia'),(127,'Liechtenstein'),(128,'Lituania'),(129,'Luxemburgo'),(130,'Macao'),(131,'ARY Macedonia'),(132,'Madagascar'),(133,'Malasia'),(134,'Malawi'),(135,'Maldivas'),(136,'Malí'),(137,'Malta'),(138,'Islas Malvinas'),(139,'Islas Marianas del Norte'),(140,'Marruecos'),(141,'Islas Marshall'),(142,'Martinica'),(143,'Mauricio'),(144,'Mauritania'),(145,'Mayotte'),(146,'México'),(147,'Micronesia'),(148,'Moldavia'),(149,'Mónaco'),(150,'Mongolia'),(151,'Montserrat'),(152,'Mozambique'),(153,'Myanmar'),(154,'Namibia'),(155,'Nauru'),(156,'Nepal'),(157,'Nicaragua'),(158,'Níger'),(159,'Nigeria'),(160,'Niue'),(161,'Isla Norfolk'),(162,'Noruega'),(163,'Nueva Caledonia'),(164,'Nueva Zelanda'),(165,'Omán'),(166,'Países Bajos'),(167,'Pakistán'),(168,'Palau'),(169,'Palestina'),(170,'Panamá'),(171,'Papúa Nueva Guinea'),(172,'Paraguay'),(173,'Perú'),(174,'Islas Pitcairn'),(175,'Polinesia Francesa'),(176,'Polonia'),(177,'Portugal'),(178,'Puerto Rico'),(179,'Qatar'),(180,'Reino Unido'),(181,'Reunión'),(182,'Ruanda'),(183,'Rumania'),(184,'Rusia'),(185,'Sahara Occidental'),(186,'Islas Salomón'),(187,'Samoa'),(188,'Samoa Americana'),(189,'San Cristóbal y Nevis'),(190,'San Marino'),(191,'San Pedro y Miquelón'),(192,'San Vicente y las Granadinas'),(193,'Santa Helena'),(194,'Santa Lucía'),(195,'Santo Tomé y Príncipe'),(196,'Senegal'),(197,'Serbia y Montenegro'),(198,'Seychelles'),(199,'Sierra Leona'),(200,'Singapur'),(201,'Siria'),(202,'Somalia'),(203,'Sri Lanka'),(204,'Suazilandia'),(205,'Sudáfrica'),(206,'Sudán'),(207,'Suecia'),(208,'Suiza'),(209,'Surinam'),(210,'Svalbard y Jan Mayen'),(211,'Tailandia'),(212,'Taiwán'),(213,'Tanzania'),(214,'Tayikistán'),(215,'Territorio Británico del Océano Índico'),(216,'Territorios Australes Franceses'),(217,'Timor Oriental'),(218,'Togo'),(219,'Tokelau'),(220,'Tonga'),(221,'Trinidad y Tobago'),(222,'Túnez'),(223,'Islas Turcas y Caicos'),(224,'Turkmenistán'),(225,'Turquía'),(226,'Tuvalu'),(227,'Ucrania'),(228,'Uganda'),(229,'Uruguay'),(230,'Uzbekistán'),(231,'Vanuatu'),(232,'Venezuela'),(233,'Vietnam'),(234,'Islas Vírgenes Británicas'),(235,'Islas Vírgenes de los Estados Unidos'),(236,'Wallis y Futuna'),(237,'Yemen'),(238,'Yibuti'),(239,'Zambia'),(240,'Zimbabue');
/*!40000 ALTER TABLE `pais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(80) NOT NULL,
  `STOCK` int NOT NULL,
  `PRECIO` double DEFAULT NULL,
  `ID_TIPO_PRODUCTO` int DEFAULT NULL,
  `ID_TALLE` int DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  KEY `ID_TIPO_PRODUCTO` (`ID_TIPO_PRODUCTO`),
  KEY `ID_TALLE` (`ID_TALLE`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`ID_TIPO_PRODUCTO`) REFERENCES `tipo_producto` (`ID_TIPO_PRODUCTO`) ON DELETE RESTRICT,
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`ID_TALLE`) REFERENCES `talle` (`ID_TALLE`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'REMERA ESCUDO RAMONES',25,15000,1,5),(2,'REMERA NIRVANA',12,17000,1,5),(3,'REMERA FOO FIGHTERS 2024',10,22000,1,6),(4,'JOGGING FRIZA VERDE',30,35000,10,6),(5,'CANGURO CERVEZA CORONA',10,28000,11,2),(6,'CANGURO BOB ESPONJA',8,30000,11,3),(7,'SWEATER LACOSTE',10,80000,6,5),(8,'SWEATER TOMMY HILFIGER',12,75000,6,6),(9,'GAMULAN DE ABRIGO NEGRO',8,120000,12,5),(10,'CAMPERA DE CUERO MARRON',14,250000,14,7),(11,'CAMPERA DE JEAN AZUL',12,125000,14,6),(12,'PESCADOR NEGRO ADIDAS',7,45000,15,8),(13,'CAMISETA SELECCION ARGENTINA',20,135000,13,5),(14,'CHOMBA EN V',12,25000,4,5),(15,'SUDADERA ADIDAS',30,35000,7,5);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `talle`
--

DROP TABLE IF EXISTS `talle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `talle` (
  `ID_TALLE` int NOT NULL AUTO_INCREMENT,
  `MEDIDA` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_TALLE`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `talle`
--

LOCK TABLES `talle` WRITE;
/*!40000 ALTER TABLE `talle` DISABLE KEYS */;
INSERT INTO `talle` VALUES (1,'XXS'),(2,'XS'),(3,'S'),(4,'M'),(5,'L'),(6,'XL'),(7,'2XL'),(8,'3XL'),(9,'4XL'),(10,'5XL'),(11,'6XL'),(12,'7XL'),(13,'8XL'),(14,'9XL');
/*!40000 ALTER TABLE `talle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_producto`
--

DROP TABLE IF EXISTS `tipo_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_producto` (
  `ID_TIPO_PRODUCTO` int NOT NULL AUTO_INCREMENT,
  `NOMBRE_TIPO_PRENDA` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_TIPO_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_producto`
--

LOCK TABLES `tipo_producto` WRITE;
/*!40000 ALTER TABLE `tipo_producto` DISABLE KEYS */;
INSERT INTO `tipo_producto` VALUES (1,'REMERA'),(2,'CAMISA'),(3,'SHORT DE BAÑO'),(4,'CHOMBA POLO'),(5,'BUZO'),(6,'SWEATER'),(7,'SUDADERA'),(8,'MUSCULOSA'),(9,'JEAN'),(10,'JOGGING'),(11,'CANGURO'),(12,'GAMULAN'),(13,'CAMISETA'),(14,'CAMPERA'),(15,'PESCADOR');
/*!40000 ALTER TABLE `tipo_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes_por_paises`
--

DROP TABLE IF EXISTS `vw_clientes_por_paises`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_por_paises`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_por_paises` AS SELECT 
 1 AS `PAIS`,
 1 AS `CANTIDAD_CLIENTES`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ordenes`
--

DROP TABLE IF EXISTS `vw_ordenes`;
/*!50001 DROP VIEW IF EXISTS `vw_ordenes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ordenes` AS SELECT 
 1 AS `NOMBRES`,
 1 AS `APELLIDOS`,
 1 AS `TELEFONO`,
 1 AS `EMAIL`,
 1 AS `NOMBRE_CALLE`,
 1 AS `NUMERO`,
 1 AS `COALESCE(DIRECCION.PISO, 'N/A')`,
 1 AS `COALESCE(DIRECCION.DEPARTAMENTO, 'N/A')`,
 1 AS `CIUDAD`,
 1 AS `PAIS`,
 1 AS `FECHA_FACTURA`,
 1 AS `TOTAL`,
 1 AS `FECHA_ORDEN`,
 1 AS `ESTADO_ORDEN`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_mas_vendidos`
--

DROP TABLE IF EXISTS `vw_productos_mas_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_mas_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_mas_vendidos` AS SELECT 
 1 AS `NOMBRE_TIPO_PRENDA`,
 1 AS `DESCRIPCION`,
 1 AS `CANTIDAD_TOTAL_VENDIDA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_mejores_puntuados`
--

DROP TABLE IF EXISTS `vw_productos_mejores_puntuados`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_mejores_puntuados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_mejores_puntuados` AS SELECT 
 1 AS `NOMBRE_TIPO_PRENDA`,
 1 AS `DESCRIPCION`,
 1 AS `PROMEDIO_NOTA`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_menos_vendidos`
--

DROP TABLE IF EXISTS `vw_productos_menos_vendidos`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_menos_vendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_menos_vendidos` AS SELECT 
 1 AS `PRODUCTO`,
 1 AS `DESCRIPCION`,
 1 AS `CANTIDAD_VENDIDA`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_clientes_por_paises`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_por_paises`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_por_paises` AS select `pais`.`PAIS` AS `PAIS`,count(`pais`.`PAIS`) AS `CANTIDAD_CLIENTES` from ((`cliente` join `direccion` on((`cliente`.`ID_DIRECCION` = `direccion`.`ID_DIRECCION`))) join `pais` on((`pais`.`ID_PAIS` = `direccion`.`ID_PAIS`))) group by `pais`.`PAIS` order by `CANTIDAD_CLIENTES` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ordenes`
--

/*!50001 DROP VIEW IF EXISTS `vw_ordenes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ordenes` AS select `cliente`.`NOMBRES` AS `NOMBRES`,`cliente`.`APELLIDOS` AS `APELLIDOS`,`cliente`.`TELEFONO` AS `TELEFONO`,`cliente`.`EMAIL` AS `EMAIL`,`direccion`.`NOMBRE_CALLE` AS `NOMBRE_CALLE`,`direccion`.`NUMERO` AS `NUMERO`,coalesce(`direccion`.`PISO`,'N/A') AS `COALESCE(DIRECCION.PISO, 'N/A')`,coalesce(`direccion`.`DEPARTAMENTO`,'N/A') AS `COALESCE(DIRECCION.DEPARTAMENTO, 'N/A')`,`direccion`.`CIUDAD` AS `CIUDAD`,`pais`.`PAIS` AS `PAIS`,`factura`.`FECHA_FACTURA` AS `FECHA_FACTURA`,`factura`.`TOTAL` AS `TOTAL`,`orden`.`FECHA_ORDEN` AS `FECHA_ORDEN`,`orden`.`ESTADO_ORDEN` AS `ESTADO_ORDEN` from ((((`cliente` join `direccion` on((`cliente`.`ID_DIRECCION` = `direccion`.`ID_DIRECCION`))) join `pais` on((`direccion`.`ID_PAIS` = `pais`.`ID_PAIS`))) join `factura` on((`cliente`.`ID_CLIENTE` = `factura`.`ID_CLIENTE`))) join `orden` on((`factura`.`ID_FACTURA` = `orden`.`ID_FACTURA`))) order by `orden`.`FECHA_ORDEN` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_mas_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_mas_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_mas_vendidos` AS select `tipo_producto`.`NOMBRE_TIPO_PRENDA` AS `NOMBRE_TIPO_PRENDA`,`producto`.`DESCRIPCION` AS `DESCRIPCION`,sum(`detalle`.`CANTIDAD`) AS `CANTIDAD_TOTAL_VENDIDA` from ((`detalle` join `producto` on((`detalle`.`ID_PRODUCTO` = `producto`.`ID_PRODUCTO`))) join `tipo_producto` on((`producto`.`ID_TIPO_PRODUCTO` = `tipo_producto`.`ID_TIPO_PRODUCTO`))) group by `tipo_producto`.`NOMBRE_TIPO_PRENDA`,`producto`.`DESCRIPCION` order by `CANTIDAD_TOTAL_VENDIDA` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_mejores_puntuados`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_mejores_puntuados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_mejores_puntuados` AS select `tipo_producto`.`NOMBRE_TIPO_PRENDA` AS `NOMBRE_TIPO_PRENDA`,`producto`.`DESCRIPCION` AS `DESCRIPCION`,round(avg(`calificacion`.`PUNTUACION`),2) AS `PROMEDIO_NOTA` from ((`tipo_producto` join `producto` on((`tipo_producto`.`ID_TIPO_PRODUCTO` = `producto`.`ID_TIPO_PRODUCTO`))) join `calificacion` on((`calificacion`.`ID_PRODUCTO` = `producto`.`ID_PRODUCTO`))) group by `tipo_producto`.`NOMBRE_TIPO_PRENDA`,`producto`.`DESCRIPCION` order by avg(`calificacion`.`PUNTUACION`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_menos_vendidos`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_menos_vendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_menos_vendidos` AS select `producto`.`ID_PRODUCTO` AS `PRODUCTO`,`producto`.`DESCRIPCION` AS `DESCRIPCION`,sum(coalesce(`detalle`.`CANTIDAD`,0)) AS `CANTIDAD_VENDIDA` from (`producto` join `detalle` on((`producto`.`ID_PRODUCTO` = `detalle`.`ID_PRODUCTO`))) group by `producto`.`ID_PRODUCTO` union select `producto`.`ID_PRODUCTO` AS `PRODUCTO`,`producto`.`DESCRIPCION` AS `DESCRIPCION`,0 AS `CANTIDAD_VENDIDA` from (`producto` left join `detalle` on((`producto`.`ID_PRODUCTO` = `detalle`.`ID_PRODUCTO`))) where (`detalle`.`ID_PRODUCTO` is null) order by `CANTIDAD_VENDIDA` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-08 23:11:37
