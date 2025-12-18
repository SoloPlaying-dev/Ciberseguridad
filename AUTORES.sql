-- Base de Datos
CREATE DATABASE biblioteca;
USE biblioteca;

-- Tabla 'autores'
CREATE TABLE autores (
    autor_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50)
);

-- Tabla 'libros'
CREATE TABLE libros (
    libro_id INT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor_id INT,
    publicacion INT,
    genero VARCHAR(50),
    -- Definición de la Clave Foránea
    FOREIGN KEY (autor_id) REFERENCES autores(autor_id)
);

-- Insertar datos en 'autores'
INSERT INTO autores (autor_id, nombre, nacionalidad) VALUES
(1, 'Gabriel García Márquez', 'Colombiano'),
(2, 'Jane Austen', 'Británica'),
(3, 'George Orwell', 'Británico');

-- Insertar datos en 'libros'
INSERT INTO libros (libro_id, titulo, autor_id, publicacion, genero) VALUES
(101, 'Cien años de soledad', 1, 1967, 'Ficción'),
(102, 'Orgullo y prejuicio', 2, 1813, 'Romance'),
(103, '1984', 3, 1949, 'Distopía'),
(104, 'El amor en los tiempos del cólera', 1, 1985, 'Ficción');

-- Consultar todos los libros con el nombre del autor
SELECT
    l.titulo,
    a.nombre AS autor,
    l.publicacion
FROM
    libros l
JOIN
    autores a ON l.autor_id = a.autor_id;

-- Consultar cuántos libros tiene cada autor
SELECT
    a.nombre AS autor,
    COUNT(l.libro_id) AS total_libros
FROM
    autores a
LEFT JOIN
    libros l ON a.autor_id = l.autor_id
GROUP BY
    a.nombre;



    
