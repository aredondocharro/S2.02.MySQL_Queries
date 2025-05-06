
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
JOIN persona pe ON p.id = pe.id
LEFT JOIN asignatura a ON p.id = a.id_profesor
WHERE a.id IS NULL AND p.id_departamento IS NOT NULL;
