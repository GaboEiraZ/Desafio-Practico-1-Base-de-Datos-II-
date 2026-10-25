DROP DATABASE IF EXISTS desafio_sql;

CREATE DATABASE desafio_sql;
USE desafio_sql;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo_electronico VARCHAR(100),
    telefono VARCHAR(20)
);

INSERT INTO clientes (id_cliente, nombre, apellido, correo_electronico, telefono) VALUES
(1, 'Juan',   'Pérez',     'juan.perez@ejemplo.com',   '0414-1234567'),
(2, 'María',  'Gómez',     'maria.gomez@ejemplo.com',  '0424-2345678'),
(3, 'Carlos', 'Rodríguez', 'carlos.r@otrodominio.com', '0412-3456789'),
(4, 'Ana',    'Martínez',  'ana.martinez@ejemplo.com', '0416-4567890'),
(5, 'Luis',   'Fernández', 'luis.f@otrodominio.com',   '0426-5678901');

SELECT * FROM clientes;

SELECT nombre, apellido, correo_electronico FROM clientes;

SELECT id_cliente, nombre, apellido
FROM clientes
WHERE correo_electronico LIKE '%@ejemplo.com';

UPDATE clientes
SET correo_electronico = 'nuevo.correo@ejemplo.com'
WHERE id_cliente = 1;

UPDATE clientes
SET nombre = 'María José'
WHERE id_cliente = 2;

SELECT * FROM clientes;

DELETE FROM clientes
WHERE id_cliente = 3;

SELECT * FROM clientes;

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    fecha_pedido DATE,
    total DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO pedidos (id_pedido, id_cliente, fecha_pedido, total) VALUES
(101, 1, '2026-04-10', 150.50),
(102, 1, '2026-04-15',  89.99),
(103, 2, '2026-04-18', 230.00),
(104, 4, '2026-04-20',  45.75),
(105, 5, '2026-04-22', 310.20);

SELECT * FROM pedidos;

SELECT c.id_cliente, c.nombre, c.apellido,
       p.id_pedido, p.fecha_pedido, p.total
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente;

SELECT c.nombre, c.apellido, SUM(p.total) AS total_gastado
FROM clientes c
INNER JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre, c.apellido;

SELECT c.nombre, c.apellido, p.id_pedido, p.total
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente;

