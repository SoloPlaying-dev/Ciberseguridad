-- Crear la base de datos (si no existe)
CREATE DATABASE IF NOT EXISTS pfinal_poo;

-- Usar la base de datos
USE pfinal_poo;

-- Crear la tabla de artículos
CREATE TABLE articulos (
    codigo INT AUTO_INCREMENT PRIMARY KEY, -- Sintaxis CLAVE de MySQL
    descripcion VARCHAR(255) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);