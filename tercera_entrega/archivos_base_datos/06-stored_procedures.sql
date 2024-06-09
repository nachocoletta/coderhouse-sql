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

-- SET @CANTIDAD = 0;
-- SET @PROMEDIO = 0;
-- SET @FECHA_INICIO = '2023-01-01';
-- SET @FECHA_FIN = '2024-05-10';


-- CALL SP_DETALLE_VENTAS(@FECHA_INICIO , @FECHA_FIN, @CANTIDAD, @PROMEDIO );


DROP PROCEDURE IF EXISTS SP_PROMEDIO_CALIF_PRODUCTO;

DELIMITER $$
CREATE PROCEDURE SP_PROMEDIO_CALIF_PRODUCTO (IN P_ID_PRODUCTO_IN INT, OUT P_PROMEDIO DECIMAL(3,1), OUT P_NOMBRE_PRODUCTO VARCHAR(80))
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
-- CALL SP_PROMEDIO_CALIF_PRODUCTO(@ID_PRODUCTO_IN, @PROMEDIO, @NOMBRE_PRODUCTO);

-- SELECT CONCAT('CALIFICACION DE PRODUCTO ', @NOMBRE_PRODUCTO, ' ES ', @PROMEDIO);
