
-- 1) Retorna el número total de alumnos
SELECT COUNT(*) AS total_alumnos FROM persona WHERE tipo = 'alumno';

-- 2) Calcula cuántos alumnos nacieron en 1999
SELECT COUNT(*) AS alumnos_1999 
FROM persona 
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 3) Número de profesores por departamento (solo los que tienen profesores)
SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS numero_profesores
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY numero_profesores DESC;

-- 4) Todos los departamentos con el número de profesores (incluye departamentos sin profesores)
SELECT d.nombre AS nombre_departamento, COUNT(p.id_profesor) AS numero_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre;

-- 5) Grados con número de asignaturas (incluye grados sin asignaturas)
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
ORDER BY numero_asignaturas DESC;

-- 6) Grados con más de 40 asignaturas
SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre
HAVING numero_asignaturas > 40;

-- 7) Nombre de los grados y suma de créditos por tipo de asignatura
SELECT g.nombre AS nombre_grado, a.tipo AS tipo_asignatura, SUM(a.creditos) AS total_creditos
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY g.nombre, a.tipo;

-- 8) Número de alumnos matriculados por curso escolar
SELECT ce.anyo_inicio, COUNT(DISTINCT ama.id_alumno) AS numero_alumnos
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura ama ON ce.id = ama.id_curso_escolar
GROUP BY ce.anyo_inicio;

-- 9) Número de asignaturas impartidas por cada profesor (incluye profesores sin asignaturas)
SELECT p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.id) AS numero_asignaturas
FROM profesor p
JOIN persona pe ON p.id_profesor = pe.id
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor
GROUP BY p.id_profesor, pe.nombre, pe.apellido1, pe.apellido2
ORDER BY numero_asignaturas DESC;

-- 10) Datos del alumno más joven
SELECT * FROM persona 
WHERE tipo = 'alumno'
ORDER BY fecha_nacimiento DESC
LIMIT 1;

-- 11) Profesores con departamento pero que no imparten ninguna asignatura
SELECT pe.*
FROM profesor p
JOIN persona pe ON p.id_profesor = pe.id
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE a.id IS NULL AND p.id_departamento IS NOT NULL;

-- 12) Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos/as. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

SELECT apellido1, apellido2, nombre 
FROM persona
WHERE tipo = "alumno"
ORDER BY apellido1, apellido2, nombre DESC;

-- 13) Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2 
FROM persona
WHERE tipo = "alumno" AND telefono IS NULL;

--14) Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * 
FROM persona
WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;

--15) Devuelve el listado de profesores/as que no han dado de alta su número de teléfono en la base de datos y además su NIF termina en K.
SELECT * 
FROM persona
WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE '%K';

--16) Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

--17) Devuelve un listado de los profesores/as junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.
SELECT pe.apellido1, pe.apellido2, pe.nombre, d.nombre
FROM profesor p
JOIN persona pe ON p.id_profesor = pe.id
LEFT JOIN departamento d ON p.id_departamento = d.id
ORDER BY pe.apellido1, pe.nombre DESC;

--18) Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno/a con NIF 26902806M.
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin
FROM alumno_se_matricula_asignatura al
JOIN persona pe ON al.id_alumno = pe.id
JOIN curso_escolar ce ON al.id_curso_escolar = ce.id
LEFT JOIN asignatura a ON al.id_asignatura = a.id
WHERE pe.nif = '26902806M';

--19) Devuelve un listado con el nombre de todos los departamentos que tienen profesores/as que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT d.nombre
FROM departamento d
JOIN profesor pr ON d.id = pr.id_departamento
JOIN asignatura a ON pr.id_profesor = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE a.id_profesor IS NOT NULL AND g.nombre LIKE 'Grado en Ingeniería Informática (Plan 2015)';

--20) Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT pe.nombre, pe.apellido1, pe.apellido2
FROM persona pe
JOIN alumno_se_matricula_asignatura ama ON pe.id = ama.id_alumno
JOIN curso_escolar ce ON ama.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;