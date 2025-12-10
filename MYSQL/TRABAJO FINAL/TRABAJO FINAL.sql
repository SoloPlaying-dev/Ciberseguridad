-- Creación de la Base de Datos
CREATE DATABASE sistema_academico;
USE sistema_academico;

-- 1. Departamento (Lado 'Uno' para Profesor y Curso)
CREATE TABLE Departamento (
    departamento_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_departamento VARCHAR(100) UNIQUE NOT NULL
);

-- 2. Profesor (Lado 'Muchos' de Departamento)
CREATE TABLE Profesor (
    profesor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(departamento_id)
);

-- 3. Curso (Lado 'Muchos' de Departamento)
CREATE TABLE Curso (
    curso_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(150) NOT NULL,
    creditos INT,
    departamento_id INT,
    FOREIGN KEY (departamento_id) REFERENCES Departamento(departamento_id)
);

-- 4. Estudiante
CREATE TABLE Estudiante (
    estudiante_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE
);

-- 5. Clase (Lado 'Muchos' de Profesor y Curso - Es la instancia específica del curso)
CREATE TABLE Clase (
    clase_id INT PRIMARY KEY AUTO_INCREMENT,
    curso_id INT,
    profesor_id INT,
    semestre VARCHAR(20) NOT NULL,
    año YEAR NOT NULL,
    FOREIGN KEY (curso_id) REFERENCES Curso(curso_id),
    FOREIGN KEY (profesor_id) REFERENCES Profesor(profesor_id)
);

-- 6. Inscripcion (Relación N:M entre Estudiante y Clase)
CREATE TABLE Inscripcion (
    inscripcion_id INT PRIMARY KEY AUTO_INCREMENT,
    estudiante_id INT,
    clase_id INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (estudiante_id) REFERENCES Estudiante(estudiante_id),
    FOREIGN KEY (clase_id) REFERENCES Clase(clase_id),
    UNIQUE KEY uk_estudiante_clase (estudiante_id, clase_id) -- Un estudiante solo se inscribe una vez por clase
);

-- 7. Calificacion (Lado 'Muchos' de Inscripcion)
CREATE TABLE Calificacion (
    calificacion_id INT PRIMARY KEY AUTO_INCREMENT,
    inscripcion_id INT,
    tipo_evaluacion VARCHAR(50), -- Ej: 'Examen Final', 'Proyecto'
    puntaje DECIMAL(5, 2),
    FOREIGN KEY (inscripcion_id) REFERENCES Inscripcion(inscripcion_id)
);

-- 2.1 Insertar Departamentos
INSERT INTO Departamento (nombre_departamento) VALUES
('Ingeniería de Software'),
('Ciencias Sociales'),
('Matemáticas');

-- 2.2 Insertar Profesores (Relación 1:M con Departamento)
INSERT INTO Profesor (nombre, apellido, departamento_id) VALUES
('Ana', 'García', 1), -- Ingeniería
('Benito', 'López', 2), -- Sociales
('Clara', 'Díaz', 3); -- Matemáticas

-- 2.3 Insertar Cursos (Relación 1:M con Departamento)
INSERT INTO Curso (nombre_curso, creditos, departamento_id) VALUES
('Bases de Datos I', 4, 1),
('Algoritmos', 5, 1),
('Introducción a la Sociología', 3, 2),
('Cálculo I', 6, 3);

-- 2.4 Insertar Estudiantes
INSERT INTO Estudiante (nombre, apellido, fecha_nacimiento) VALUES
('David', 'Ruiz', '2000-01-10'),
('Elena', 'Soto', '2001-05-25');

-- 2.5 Insertar Clases (Instancias específicas de Cursos con Profesores)
INSERT INTO Clase (curso_id, profesor_id, semestre, año) VALUES
(1, 1, 'Otoño', 2025), -- Bases de Datos con Ana
(4, 3, 'Otoño', 2025), -- Cálculo I con Clara
(3, 2, 'Primavera', 2026); -- Sociología con Benito

-- 2.6 Insertar Inscripciones (N:M)
INSERT INTO Inscripcion (estudiante_id, clase_id, fecha_inscripcion) VALUES
(1, 1, '2025-08-15'), -- David inscrito en Bases de Datos
(1, 2, '2025-08-15'), -- David inscrito en Cálculo I
(2, 1, '2025-08-16'); -- Elena inscrita en Bases de Datos

-- 2.7 Insertar Calificaciones
INSERT INTO Calificacion (inscripcion_id, tipo_evaluacion, puntaje) VALUES
(1, 'Parcial 1', 90.50),
(1, 'Proyecto Final', 95.00),
(2, 'Parcial 1', 88.00);

-- Actualizar el puntaje de una calificación:
UPDATE Calificacion
SET puntaje = 92.00
WHERE calificacion_id = 1;

-- Actualizar el departamento de un curso:
UPDATE Curso
SET departamento_id = 3 -- Mover Algoritmos a Matemáticas (ejemplo)
WHERE curso_id = 2;

-- Eliminar una calificación (por ejemplo, si se ingresó incorrectamente):
DELETE FROM Calificacion
WHERE calificacion_id = 3;

-- Eliminar un estudiante que no está matriculado en ninguna clase (la FK en Inscripcion lo impediría si estuviera matriculado):

DELETE FROM Inscripcion WHERE estudiante_id = 2;
DELETE FROM Estudiante WHERE estudiante_id = 2;
-- ---------------------------------------------------------------
SELECT
    P.nombre AS Nombre_Profesor,
    P.apellido AS Apellido_Profesor,
    D.nombre_departamento AS Departamento
FROM
    Profesor P
JOIN
    Departamento D ON P.departamento_id = D.departamento_id;
    
    SELECT
    C.nombre_curso,
    C.creditos
FROM
    Curso C
JOIN
    Departamento D ON C.departamento_id = D.departamento_id
WHERE
    D.nombre_departamento = 'Ingeniería de Software';
-- -----------------------------------
    SELECT
    E.nombre AS Estudiante,
    E.apellido AS Apellido,
    Cu.nombre_curso AS Curso,
    Cl.semestre,
    Cl.año
FROM
    Estudiante E
JOIN
    Inscripcion I ON E.estudiante_id = I.estudiante_id
JOIN
    Clase Cl ON I.clase_id = Cl.clase_id
JOIN
    Curso Cu ON Cl.curso_id = Cu.curso_id
ORDER BY
    Estudiante;
    -- -----------------------------------
    SELECT
    E.nombre AS Estudiante,
    Cu.nombre_curso AS Curso,
    AVG(Ca.puntaje) AS Promedio
FROM
    Estudiante E
JOIN
    Inscripcion I ON E.estudiante_id = I.estudiante_id
JOIN
    Clase Cl ON I.clase_id = Cl.clase_id
JOIN
    Curso Cu ON Cl.curso_id = Cu.curso_id
JOIN
    Calificacion Ca ON I.inscripcion_id = Ca.inscripcion_id
GROUP BY
    E.nombre, Cu.nombre_curso;
    -- -----------------------------------------------------
    SELECT
    D.nombre_departamento,
    COUNT(P.profesor_id) AS Total_Profesores
FROM
    Departamento D
LEFT JOIN -- LEFT JOIN para incluir departamentos sin profesores aún
    Profesor P ON D.departamento_id = P.departamento_id
GROUP BY
    D.nombre_departamento
ORDER BY
    Total_Profesores DESC;
    -- ------------------------------------------------------------
    SELECT
    nombre_curso,
    creditos
FROM
    Curso
ORDER BY
    creditos DESC
LIMIT 1;