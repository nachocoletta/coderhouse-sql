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