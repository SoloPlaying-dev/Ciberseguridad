-- Crear la Base de Datos
CREATE DATABASE ventas;
USE ventas;

--  Tabla 'clientes'
CREATE TABLE clientes (
    cliente_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

--  Tabla 'productos'
CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(10, 2) NOT NULL
);

-- Tabla 'facturas' 
CREATE TABLE facturas (
    factura_id INT PRIMARY KEY,
    cliente_id INT,
    fecha DATE NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    -- Definición de la Clave Foránea
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

-- (Tabla de 'detalle_factura')
CREATE TABLE detalle_factura (
    detalle_id INT PRIMARY KEY,
    factura_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (factura_id) REFERENCES facturas(factura_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id)
);

-- Insertar datos en 'clientes'
INSERT INTO clientes (cliente_id, nombre, email) VALUES
(1, 'Ana López', 'ana.lopez@mail.com'),
(2, 'Carlos Ruiz', 'carlos.ruiz@mail.com');

-- Insertar datos en 'productos'
INSERT INTO productos (producto_id, nombre, precio) VALUES
(10, 'Laptop Gaming', 1200.00),
(20, 'Teclado Mecánico', 80.50),
(30, 'Monitor 27 Pulgadas', 350.99);

-- Insertar datos en 'facturas'
INSERT INTO facturas (factura_id, cliente_id, fecha, total) VALUES
(1000, 1, '2025-11-20', 1280.50), -- Ana compró Laptop y Teclado
(1001, 2, '2025-11-21', 350.99);  -- Carlos compró Monitor

-- Consultar todas las facturas con el nombre del cliente
SELECT
    f.factura_id,
    c.nombre AS cliente,
    f.fecha,
    f.total
FROM
    facturas f
JOIN
    clientes c ON f.cliente_id = c.cliente_id;

-- Consultar el total de ventas realizadas
SELECT
    SUM(total) AS total_ventas
FROM
    facturas;