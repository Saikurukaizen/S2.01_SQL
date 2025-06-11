/* TIENDA */

SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre AS nombre_producto, precio AS precio_euros, ROUND(precio * 1.08, 2) AS precio_dolares_usd FROM producto;
SELECT nombre AS nombre_producto, precio AS precio_euros, ROUND(precio * 1.08, 2) AS precio_dolares FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre AS nombre_fabricante, UPPER(SUBSTRING(nombre FROM 1 FOR 2)) AS iniciales FROM fabricante;
SELECT nombre AS nombre_producto, ROUND(precio) AS precio_producto FROM producto;
SELECT nombre AS nombre_producto, TRUNCATE(precio, 0) AS precio_truncado FROM producto;
SELECT codigo_fabricante FROM producto;
SELECT DISTINCT codigo_fabricante FROM producto;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 2 OFFSET 3;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM producto WHERE codigo_fabricante = 2;
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.codigo AS codigo_fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.precio AS precio_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.precio AS precio_fabricante, f.codigo AS codigo_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre AS precio_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre AS precio_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre AS nombre_producto, p.precio AS precio_producto, f.nombre AS nombre_fabricante FROM producto p LEFT JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo, f.nombre;
SELECT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante, p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.precio AS precio_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante ORDER BY f.nombre ASC, p.nombre ASC;
SELECT f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;
SELECT * FROM producto WHERE codigo_fabricante = 2;
SELECT * FROM producto WHERE precio = ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = ( SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio AS precio_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto, p.precio AS precio_producto FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;
SELECT * FROM producto WHERE precio >= ( SELECT MAX(precio) FROM producto WHERE codigo_fabricante = ( SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Asus') AND precio > ( SELECT AVG(precio) FROM producto WHERE codigo_fabricante = ( SELECT codigo FROM fabricante WHERE nombre = 'Asus'));

/* UNIVERSIDAD */

SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 DESC, nombre DESC;
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento FROM persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT a.nombre AS nombre_asignatura, ce.anyo_inicio AS inicio_curso_escolar, ce.anyo_fin AS fin_curso_escolar FROM persona p INNER JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno INNER JOIN asignatura a ON m.id_asignatura = a.id INNER JOIN curso_escolar ce ON m.id_curso_escolar = ce.id WHERE p.nif = '26902806M';
SELECT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura, g.nombre AS nombre_grado FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor LEFT JOIN grado g ON a.id_grado = g.id WHERE g.id = 4;
SELECT p.nombre AS nombre_alumno, a.nombre AS nombre_asignatura, ce.anyo_inicio AS inicio_curso_escolar, ce.anyo_fin AS fin_curso_escolar FROM persona p LEFT JOIN alumno_se_matricula_asignatura al ON p.id = al.id_alumno LEFT JOIN asignatura a ON al.id_asignatura = a.id LEFT JOIN curso_escolar ce ON al.id_curso_escolar = ce.id WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

SELECT d.nombre AS nombre_departamento, p.apellido1 AS ape1_profesor, p.apellido2 AS ape2_profesor, p.nombre AS nombre_profesor FROM persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_profesor = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT d.nombre AS nombre_departamento, p.apellido1 AS ape1_profesor, p.apellido2 AS ape2_profesor, p.nombre AS nombre_profesor FROM persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_profesor = d.id WHERE p.tipo = 'profesor' AND d.nombre IS NULL;
SELECT d.nombre AS nombre_departamento FROM departamento d LEFT JOIN profesor prof ON d.id = prof.id_departamento WHERE prof.id_departamento IS NULL ORDER BY d.nombre;
SELECT p.nombre AS nombre_profesor, p.apellido1 AS ape1_profesor, p.apellido2 AS ape2_profesor, a.nombre AS nombre_asignatura FROM persona p LEFT JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor WHERE a.id IS NULL;
SELECT a.nombre AS nombre_asignatura, prof.id_profesor AS nombre_profesor FROM asignatura a LEFT JOIN profesor prof ON a.id_profesor = prof.id_profesor WHERE prof.id_profesor IS NULL;
SELECT d.nombre AS nombre_departamento, a.nombre AS nombre_asignatura, ce.anyo_inicio AS inicio_curso_escolar FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento LEFT JOIN asignatura a ON pro.id_profesor = a.id_profesor LEFT JOIN alumno_se_matricula_asignatura al ON a.id = al.id_curso_escolar LEFT JOIN curso_escolar ce ON al.id_curso_escolar = ce.id WHERE ce.anyo_inicio IS NULL;

SELECT * FROM persona WHERE tipo = 'alumno';
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS n_profesores FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.nombre ORDER BY n_profesores DESC;
SELECT d.nombre AS nombre_departamento, COUNT(p.id) AS numero_profesores FROM departamento d LEFT JOIN profesor pro ON d.id = pro.id_departamento LEFT JOIN persona p ON pro.id_profesor = p.id AND p.tipo = 'profesor' GROUP BY d.nombre ORDER BY `numero_profesores` DESC
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre ORDER BY numero_asignaturas DESC;
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre HAVING COUNT(a.id) > 40 ORDER BY numero_asignaturas DESC;
SELECT g.nombre AS nombre_grado, a.tipo AS tipo_asignatura, SUM(a.creditos) AS suma_creditos FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre, suma_creditos DESC;
SELECT ce.anyo_inicio AS año_inicio_curso, COUNT(DISTINCT m.id_alumno) AS numero_alumnos_matriculados FROM curso_escolar ce INNER JOIN alumno_se_matricula_asignatura m ON ce.id = m.id_curso_escolar GROUP BY ce.anyo_inicio ORDER BY ce.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS numero_asignaturas FROM profesor prof LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor LEFT JOIN persona p ON prof.id_profesor = p.id GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY numero_asignaturas DESC;
SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT p.id, p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN profesor prof ON p.id = prof.id_profesor LEFT JOIN departamento d ON prof.id_departamento = d.id LEFT JOIN asignatura a ON prof.id_profesor = a.id_profesor GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 HAVING COUNT(a.id) = 0;