-- Crear la Base de Datos
CREATE DATABASE colegio;
USE colegio;

-- 1.1 Tabla 'estudiantes'
CREATE TABLE estudiantes (
    estudiante_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE
);

-- 1.2 Tabla 'cursos'
CREATE TABLE cursos (
    curso_id INT PRIMARY KEY,
    nombre_curso VARCHAR(100) NOT NULL,
    creditos INT
);

-- 1.3 Tabla 'matriculas' (Relación N:M entre estudiantes y cursos)
CREATE TABLE matriculas (
    matricula_id INT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    fecha_matricula DATE NOT NULL,
    -- Definición de Claves Foráneas
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(estudiante_id),
    FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
);

-- Insertar datos en 'estudiantes'
INSERT INTO estudiantes (estudiante_id, nombre, apellido, fecha_nacimiento) VALUES
(1, 'Sofía', 'Martínez', '2005-08-15'),
(2, 'Diego', 'Pérez', '2006-03-20'),
(3, 'Elena', 'Gómez', '2005-11-01');

-- Insertar datos en 'cursos'
INSERT INTO cursos (curso_id, nombre_curso, creditos) VALUES
(10, 'Matemáticas Avanzadas', 5),
(20, 'Historia Universal', 4),
(30, 'Programación Web', 6);

-- Insertar datos en 'matriculas'
INSERT INTO matriculas (matricula_id, estudiante_id, curso_id, fecha_matricula) VALUES
(100, 1, 10, '2025-09-01'), -- Sofía en Matemáticas
(101, 1, 20, '2025-09-01'), -- Sofía en Historia
(102, 2, 10, '2025-09-02'), -- Diego en Matemáticas
(103, 3, 30, '2025-09-05'), -- Elena en Programación
(104, 2, 30, '2025-09-05'); -- Diego en Programación

-- Consultar qué cursos está tomando un estudiante específico (ej. Sofía)
SELECT
    e.nombre,
    e.apellido,
    c.nombre_curso
FROM
    matriculas m
JOIN
    estudiantes e ON m.estudiante_id = e.estudiante_id
JOIN
    cursos c ON m.curso_id = c.curso_id
WHERE
    e.nombre = 'Sofía';

-- Consultar cuántos estudiantes hay matriculados en cada curso
SELECT
    c.nombre_curso,
    COUNT(m.estudiante_id) AS total_estudiantes
FROM
    cursos c
LEFT JOIN
    matriculas m ON c.curso_id = m.curso_id
GROUP BY
    c.nombre_curso
ORDER BY
    total_estudiantes DESC;