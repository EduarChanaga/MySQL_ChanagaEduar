-- #############################
-- ########## Dia # 3 ##########
-- ######### Consultas #########
-- ######## multitabla  ########
-- #############################
use dia3;

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente;

-- 3. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad
FROM cliente c
INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
INNER JOIN pago p ON c.codigo_cliente = p.codigo_cliente;

-- 4. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT DISTINCT o.linea_direccion1, o.linea_direccion2, o.ciudad
FROM oficina o
INNER JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.ciudad = 'Fuenlabrada';

-- 5. Devuelve el nombre de los clientes que hayan hecho pagos y el nombre de sus representantes junto con la ciudad
-- de la oficina a la que pertenece el representante.Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

select distinct c.nombre_cliente, e.nombre, o.ciudad
from cliente c
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o on e.codigo_oficina = o.codigo_oficina
inner join pago p on c.codigo_cliente = p.codigo_cliente;


-- 6. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select c.nombre_cliente, e.nombre, o.ciudad
from cliente c
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o on e.codigo_oficina = o.codigo_oficina;


-- Selecciona el nombre del empleado, el nombre de su jefe directo y el nombre del jefe del jefe directo, si existe.
SELECT empleado.nombre AS NombreEmpleado,  -- Alias para el nombre del empleado
	   jefe.nombre AS NombreJefe,          -- Alias para el nombre del jefe directo
       jefe2.nombre AS NombreJefe2         -- Alias para el nombre del jefe del jefe directo
FROM  empleado  -- Tabla principal de empleados
INNER JOIN empleado jefe ON empleado.codigo_jefe = jefe.codigo_empleado  
    -- Une la tabla de empleados consigo misma para encontrar el jefe directo de cada empleado

INNER JOIN empleado jefe2 ON jefe.codigo_jefe = jefe2.codigo_empleado;
    -- Une la tabla de empleados nuevamente para encontrar el jefe del jefe directo (si existe)






-- *. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT DISTINCT c.nombre_cliente, gp.gama
FROM cliente c
INNER JOIN pedido pd ON c.codigo_cliente = pd.codigo_cliente
INNER JOIN detalle_pedido dp ON pd.codigo_pedido = dp.codigo_pedido
INNER JOIN producto p ON dp.codigo_producto = p.codigo_producto
INNER JOIN gama_producto gp ON p.gama = gp.gama;


select * from empleado;


-- Desarrollado por: Eduar Damian Chanaga Gonzalez ID: 1095581647