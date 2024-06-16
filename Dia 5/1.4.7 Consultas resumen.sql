-- #############################
-- ########## Dia # 5 ##########
-- ######### Consultas #########
-- ####### 1.4.7 resumen #######
-- #############################

-- usar base de datos
use dia5;

-- 1 ¿Cuántos empleados hay en la compañía?
	select count(distinct codigo_empleado) as total_empleados
	from empleado;

-- 2 ¿Cuántos clientes tiene cada país?
	SELECT pais, COUNT(codigo_cliente) AS cantidad_clientes
	FROM cliente
	GROUP BY pais;

-- 3 ¿Cuál fue el pago medio en 2009?
	SELECT AVG(total) AS pago_medio
	FROM pago
	WHERE YEAR(fecha_pago) = 2009;

-- 4 ¿Cuántos pedidos hay en cada estado? Ordena el resultado
-- de forma descendente por el número de pedidos.
	SELECT estado, COUNT(codigo_pedido) AS cantidad_pedidos
	FROM pedido
	GROUP BY estado
	ORDER BY cantidad_pedidos DESC;

-- 5. Calcula el precio de venta del producto más caro y más
-- barato en una misma consulta.
	SELECT MAX(precio_venta) AS precio_mas_caro,
		   MIN(precio_venta) AS precio_mas_barato
	FROM producto;

-- 6. Calcula el número de clientes que tiene la empresa.
	select count(codigo_cliente) as cantidad_clientes
	from cliente;

-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de
-- Madrid?
	select count(codigo_cliente) as Clientes_en_madrid
	from cliente
	where ciudad = 'madrid';

-- 8. ¿Calcula cuántos clientes tiene cada una de las ciudades
-- que empiezan por M?
	SELECT ciudad, COUNT(codigo_cliente) AS cantidad_clientes
	FROM cliente
	WHERE ciudad LIKE 'M%'
	GROUP BY ciudad;

-- 9. Devuelve el nombre de los representantes de ventas y el
-- número de clientes al que atiende cada uno.
	SELECT CONCAT(e.nombre, ' ', e.apellido1, ' ', e.apellido2) AS nombre_representante,
		  COUNT(c.codigo_cliente) AS cantidad_clientes
	FROM empleado e
	INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
	GROUP BY e.codigo_empleado, e.nombre, e.apellido1, e.apellido2;

-- 10. Calcula el número de clientes que no tiene asignado
-- representante de ventas.
	select count(codigo_cliente) as clientes
	from cliente
	where codigo_empleado_rep_ventas is null;

-- 11. Calcula la fecha del primer y último pago realizado por
-- cada uno de los clientes. El listado deberá mostrar el
-- nombre y los apellidos de cada cliente.
	SELECT c.nombre_cliente,MIN(p.fecha_pago) AS primer_pago,
							MAX(p.fecha_pago) AS ultimo_pago
	FROM cliente c
	INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente
	GROUP BY c.codigo_cliente, c.nombre_contacto, c.apellido_contacto;

-- 12. Calcula el número de productos diferentes que hay en cada
-- uno de los pedidos.
	SELECT codigo_pedido, COUNT(DISTINCT codigo_producto) AS cantidad_productos_diferentes
	FROM detalle_pedido
	GROUP BY codigo_pedido;
    
-- 13. Calcula la suma de la cantidad total de todos los productos
-- que aparecen en cada uno de los pedidos.
SELECT codigo_pedido, SUM(cantidad) AS cantidad_total_productos
FROM detalle_pedido
GROUP BY codigo_pedido;

-- 14. Devuelve un listado de los 20 productos más vendidos y el
-- número total de unidades que se han vendido de cada uno.
-- El listado deberá estar ordenado por el número total de
-- unidades vendidas.
	SELECT dp.codigo_producto, p.nombre, SUM(dp.cantidad) AS total_unidades_vendidas
	FROM detalle_pedido dp
	JOIN producto p ON dp.codigo_producto = p.codigo_producto
	GROUP BY codigo_producto, p.nombre
	ORDER BY total_unidades_vendidas DESC LIMIT 20;

-- 15 La facturación que ha tenido la empresa en toda la historia,
-- indicando la base imponible, el IVA y el total facturado. La
-- base imponible se calcula sumando el coste del producto
-- por el número de unidades vendidas de la
-- tabla detalle_pedido. El IVA es el 21 % de la base
-- imponible, y el total la suma de los dos campos anteriores.
	SELECT SUM(dp.cantidad * p.precio_venta) AS base_imponible,
			SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva,
			SUM(dp.cantidad * p.precio_venta) + (SUM(dp.cantidad * p.precio_venta) * 0.21) AS total_facturado
	FROM detalle_pedido dp
	JOIN producto p ON dp.codigo_producto = p.codigo_producto;

-- 16.La misma información que en la pregunta anterior, pero
-- agrupada por código de producto.
	SELECT dp.codigo_producto, 
			SUM(dp.cantidad * p.precio_venta) AS base_imponible,
			SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva,
			SUM(dp.cantidad * p.precio_venta) + (SUM(dp.cantidad * p.precio_venta) * 0.21) AS total_facturado
	FROM detalle_pedido dp
	JOIN producto p ON dp.codigo_producto = p.codigo_producto
	GROUP BY dp.codigo_producto;
    
    
-- 17. La misma información que en la pregunta anterior, pero
-- agrupada por código de producto filtrada por los códigos
-- que empiecen por OR.
	SELECT dp.codigo_producto, 
			SUM(dp.cantidad * p.precio_venta) AS base_imponible,
			SUM(dp.cantidad * p.precio_venta) * 0.21 AS iva,
			SUM(dp.cantidad * p.precio_venta) + (SUM(dp.cantidad * p.precio_venta) * 0.21) AS total_facturado
	FROM detalle_pedido dp
	JOIN producto p ON dp.codigo_producto = p.codigo_producto
	WHERE dp.codigo_producto LIKE 'OR%'
	GROUP BY dp.codigo_producto;

-- 18 Lista las ventas totales de los productos que hayan
-- facturado más de 3000 euros. Se mostrará el nombre,
-- unidades vendidas, total facturado y total facturado con
-- impuestos (21% IVA).
SELECT p.nombre, 
		SUM(dp.cantidad) AS unidades_vendidas,
		SUM(dp.cantidad * p.precio_venta) AS total_facturado_sin_iva,
		SUM(dp.cantidad * p.precio_venta) * 1.21 AS total_facturado_con_iva
FROM detalle_pedido dp
JOIN producto p ON dp.codigo_producto = p.codigo_producto
GROUP BY p.nombre
HAVING total_facturado_sin_iva > 3000;

-- 19. Muestre la suma total de todos los pagos que se realizaron
-- para cada uno de los años que aparecen en la tabla pagos.
SELECT YEAR(fecha_pago) AS año_pago,
		SUM(total) AS suma_total_pagos
FROM pago
GROUP BY YEAR(fecha_pago);

-- Desarrollado por: Eduar Damian Chanaga Gonzalez / ID: 1095581647