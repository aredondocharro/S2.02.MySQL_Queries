-- 1) Lista el nombre de todos los productos que hay en la mesa producto.
SELECT nombre FROM producto;

-- 2) Lista los nombres y los precios de todos los productos de la mesa producto.
SELECT nombre, precio FROM producto;

-- 3) Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

-- 4) Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT nombre, precio, precio * 1.08 AS precio_usd FROM producto;

-- 5) Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD) con alias.
SELECT nombre AS 'nombre de producto', precio AS euros, precio * 1.08 AS dolares FROM producto;

-- 6) Lista los nombres y los precios, con nombres en mayúscula.
SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7) Lista los nombres y los precios, con nombres en minúscula.
SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8) Nombre de fabricantes y dos primeras letras en mayúscula.
SELECT nombre, UPPER(LEFT(nombre, 2)) AS inicials FROM fabricante;

-- 9) Nombres y precios redondeados.
SELECT nombre, ROUND(precio) AS precio FROM producto;

-- 10) Nombres y precios truncados (sin decimales).
SELECT nombre, TRUNCATE(precio, 0) AS precio FROM producto;

-- 11) Códigos de fabricantes con productos.
SELECT codigo_fabricante FROM producto;

-- 12) Códigos únicos de fabricantes con productos.
SELECT DISTINCT codigo_fabricante FROM producto;

-- 13) Nombres de fabricantes ordenados ascendentemente.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14) Nombres de fabricantes ordenados descendentemente.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15) Nombres de productos ordenados por el nombre (asc) y precio (desc).
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16) Las 5 primeras filas de fabricante.
SELECT * FROM fabricante LIMIT 5;

-- 17) 2 filas a partir de la cuarta (incluida).
SELECT * FROM fabricante LIMIT 3, 2;

-- 18) Producto más barato (ORDER BY + LIMIT).
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19) Producto más caro (ORDER BY + LIMIT).
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20) Producto más barato (ORDER BY + LIMIT) con nombre de fabricante.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

-- 21) Nombre del producto, precio y fabricante.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 22) Como anterior, ordenado por fabricante.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY fabricante.nombre;

-- 23) Código y nombre de producto y fabricante.
SELECT producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo;

-- 24) Producto más barato con nombre de fabricante.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio ASC LIMIT 1;

-- 25) Producto más caro con nombre de fabricante.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo ORDER BY producto.precio DESC LIMIT 1;

-- 26) Todos los productos del fabricante Lenovo.
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Lenovo';

-- 27) Productos de Crucial con precio > 200.
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Crucial' AND producto.precio > 200;

-- 28) Productos de Asus, Hewlett-Packard y Seagate (sin IN).
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus' OR fabricante.nombre = 'Hewlett-Packard' OR fabricante.nombre = 'Seagate';

-- 29) Igual, pero utilizando IN.
SELECT producto.* FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 30) Productos con fabricantes que terminan en 'e'.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%e';

-- 31) Productos con fabricantes que contienen 'w'.
SELECT producto.nombre, producto.precio FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre LIKE '%w%';

-- 32) Productos con precio ≥ 180, ordenado por precio desc y nombre asc.
SELECT producto.nombre, producto.precio, fabricante.nombre AS nombre_fabricante FROM producto JOIN fabricante ON producto.codigo_fabricante = fabricante.codigo WHERE producto.precio >= 180 ORDER BY producto.precio DESC, producto.nombre ASC;

-- 33) Productos con precio entre 100 y 200, ordenado por precio asc.
SELECT DISTINCT fabricante.codigo, fabricante.nombre FROM fabricante JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- 34) Códigos y nombres de fabricantes con productos.
SELECT fabricante.nombre AS nombre_fabricante, producto.nombre AS nombre_producto FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante;

-- -- 35) Solo fabricantes sin ningún producto.
SELECT fabricante.* FROM fabricante LEFT JOIN producto ON fabricante.codigo = producto.codigo_fabricante WHERE producto.codigo IS NULL;

-- -- 36) Productos de Lenovo (sin INNER JOIN).
SELECT producto.* FROM producto, fabricante WHERE producto.codigo_fabricante = fabricante.codigo AND fabricante.nombre = 'Lenovo';

