-- #############################
-- ########## Dia # 5 ##########
-- ######### Consultas #########
-- #############################

-- Usar base de datos
Use dia5;

-- Devuelve un listado que muestre solamente los clientes
-- que no han realizado ningún pago.
	select c.nombre_cliente
	from cliente c
	inner join pago p on c.codigo_cliente = p.codigo_cliente
	where p.codigo_cliente is null;
    
    
-- Devuelve un listado que muestre solamente los clientes
-- que no han realizado ningún pedido.
	select c.nombre_cliente
	from cliente c
	inner join pedido p on c.codigo_cliente = p.codigo_cliente
	where p.codigo_cliente is null;


-- Devuelve un listado que muestre los clientes que no han
-- realizado ningún pago y los que no han realizado ningún
-- pedido.
	SELECT c.nombre_cliente,c.codigo_cliente
	FROM cliente c
	LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
	LEFT JOIN pedido pd ON c.codigo_cliente = pd.codigo_cliente
	WHERE p.codigo_cliente IS NULL AND pd.codigo_pedido IS NULL;
    
    
-- Devuelve un listado que muestre solamente los empleados
-- que no tienen una oficina asociada.
	SELECT e.nombre, e.codigo_empleado
	FROM empleado e
	WHERE e.codigo_oficina IS NULL;
    
    
-- Devuelve un listado que muestre solamente los empleados
-- que no tienen un cliente asociado.
	SELECT e.codigo_empleado, e.nombre, e.apellido1, e.apellido2,  e.puesto 
	FROM empleado e
	LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
	WHERE c.codigo_empleado_rep_ventas IS NULL;

-- Devuelve un listado que muestre solamente los empleados
-- que no tienen un cliente asociado junto con los datos de la
-- oficina donde trabajan.
	SELECT 
		e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, e.codigo_oficina, 
		o.ciudad,o.pais,o.region,o.codigo_postal,o.telefono,o.linea_direccion1,o.linea_direccion2
	FROM empleado e
	LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
	INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
	WHERE c.codigo_empleado_rep_ventas IS NULL;
    
-- Devuelve un listado que muestre los empleados que no
-- tienen una oficina asociada y los que no tienen un cliente
-- asociado.

	SELECT e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, e.codigo_oficina, e.puesto,'No tiene oficina asociada' AS motivo
	FROM empleado e
	LEFT JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
	WHERE o.codigo_oficina IS NULL

	UNION

	SELECT e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, e.codigo_oficina,  e.puesto,'No tiene cliente asociado' AS motivo
	FROM empleado e
	LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
	WHERE c.codigo_empleado_rep_ventas IS NULL;

-- Devuelve un listado de los productos que nunca han
-- aparecido en un pedido.
	SELECT p.codigo_producto, p.nombre, p.gama, p.dimensiones, p.proveedor, p.descripcion
	FROM producto p
	LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
	WHERE dp.codigo_producto IS NULL;

-- Devuelve un listado de los productos que nunca han
-- aparecido en un pedido. El resultado debe mostrar el
-- nombre, la descripción y la imagen del producto.
	SELECT p.nombre, p.descripcion
	FROM producto p
	LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto
	WHERE dp.codigo_producto IS NULL;
    
-- Devuelve las oficinas donde no trabajan ninguno de los
-- empleados que hayan sido los representantes de ventas de
-- algún cliente que haya realizado la compra de algún
-- producto de la gama Frutales.
SELECT o.codigo_oficina, o.ciudad, o.pais, o.region, o.codigo_postal, o.telefono, o.linea_direccion1, o.linea_direccion2
FROM oficina o
LEFT JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
LEFT JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
WHERE pr.gama = 'Frutales' AND c.codigo_cliente IS NOT NULL;

-- Devuelve un listado con los clientes que han realizado
-- algún pedido pero no han realizado ningún pago.
SELECT c.codigo_cliente, c.nombre_cliente,  c.codigo_empleado_rep_ventas

FROM cliente c
INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
LEFT JOIN pago pg ON c.codigo_cliente = pg.codigo_cliente
WHERE pg.codigo_cliente IS NULL;

-- Devuelve un listado con los datos de los empleados que no
-- tienen clientes asociados y el nombre de su jefe asociado.
SELECT e.codigo_empleado, e.nombre, e.apellido1, e.apellido2, e.codigo_jefe, e.puesto,CONCAT(j.nombre, ' ', j.apellido1, ' ', j.apellido2) AS nombre_jefe
FROM empleado e
LEFT JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
LEFT JOIN empleado j ON e.codigo_jefe = j.codigo_empleado
WHERE c.codigo_empleado_rep_ventas IS NULL;



-- Desarrollado por: Eduar Damian Chanaga Gonzalez / ID: 1095581647