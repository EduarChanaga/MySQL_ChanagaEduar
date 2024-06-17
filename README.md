

```markdown
# Consultas SQL con Ejemplos

En este documento se presentan ejemplos de consultas SQL utilizando palabras clave comunes.

## SELECT

La palabra clave `SELECT` se utiliza para seleccionar datos de una tabla.

```sql
SELECT nombre, apellido FROM empleados;
```

## FROM

`FROM` especifica la tabla de la que se seleccionarán los datos.

```sql
SELECT * FROM clientes;
```

## WHERE

`WHERE` filtra filas basadas en una condición.

```sql
SELECT * FROM productos WHERE precio > 50;
```

## GROUP BY

`GROUP BY` agrupa filas basadas en el valor de una columna.

```sql
SELECT ciudad, COUNT(*) AS cantidad_clientes FROM clientes GROUP BY ciudad;
```

## JOIN

`JOIN` combina filas de dos tablas basadas en una condición.

```sql
SELECT c.nombre, p.nombre_producto FROM clientes c JOIN productos p ON c.id_producto = p.id;
```

## COUNT

`COUNT` cuenta el número de filas o valores en una columna.

```sql
SELECT COUNT(*) AS cantidad_pedidos FROM pedidos;
```

## SUM

`SUM` calcula la suma de los valores en una columna.

```sql
SELECT SUM(precio) AS total_ventas FROM ventas;
```

## AVG

`AVG` calcula el promedio de los valores en una columna.

```sql
SELECT AVG(edad) AS promedio_edad FROM empleados;
```

## MAX

`MAX` encuentra el valor máximo en una columna.

```sql
SELECT MAX(salario) AS salario_maximo FROM empleados;
```

## MIN

`MIN` encuentra el valor mínimo en una columna.

```sql
SELECT MIN(salario) AS salario_minimo FROM empleados;
```

## LIKE

`LIKE` filtra filas basadas en un patrón de texto.

```sql
SELECT * FROM clientes WHERE nombre LIKE 'A%';
```

## ORDER BY

`ORDER BY` ordena los resultados de la consulta.

```sql
SELECT nombre, edad FROM empleados ORDER BY edad DESC;
```

## HAVING

`HAVING` filtra grupos de filas basados en una condición de grupo.

```sql
SELECT ciudad, COUNT(*) AS cantidad_clientes FROM clientes GROUP BY ciudad HAVING COUNT(*) > 5;
```

## DISTINCT

`DISTINCT` elimina filas duplicadas de los resultados.

```sql
SELECT DISTINCT ciudad FROM clientes;
```

Estos ejemplos ilustran cómo utilizar las palabras clave más comunes en consultas SQL para obtener información específica de una base de datos.
```

Este formato te permite explicar cada palabra clave con ejemplos claros y organizados en un archivo README.md para una rápida referencia y comprensión.
