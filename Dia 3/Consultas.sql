-- #############################
-- ########## Dia # 3 ##########
-- ######### Consultas #########
-- #############################

-- Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina,ciudad 
FROM oficina;

-- Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT pais,ciudad, telefono 
FROM oficina
WHERE pais = 'España';

-- Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
SELECT nombre,apellido1,apellido2,email,codigo_jefe
FROM empleado
WHERE codigo_jefe = 7;

-- Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT puesto,nombre,apellido1,apellido2,email,codigo_jefe
FROM empleado;

-- Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.
SELECT nombre,apellido1,apellido2,puesto
FROM empleado
WHERE puesto != 'Representante Ventas';

-- Devuelve un listado con el nombre de todos los clientes españoles.
SELECT nombre_cliente,pais
FROM cliente
WHERE pais = 'Spain';
-- Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT estado
FROM pedido
WHERE estado != '';

-- Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. 
-- Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
-- Utilizando la función YEAR de MySQL.
-- Utilizando la función DATE_FORMAT de MySQL.
-- Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT codigo_cliente, fecha_pedido
FROM pedido
WHERE YEAR(fecha_pedido) = 2008;

-- Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.
SELECT DISTINCT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
FROM pedido
WHERE (fecha_esperada) != (fecha_entrega);

-- Desarrollado por: Eduar Damian Chanaga Gonzalez ID: 1095581647