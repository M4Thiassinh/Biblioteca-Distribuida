CREATE DATABASE bd_libros;
USE bd_libros;

CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    tipo VARCHAR(50),
    genero VARCHAR(100),
    contenido TEXT
);

INSERT INTO documentos (titulo, tipo, genero, contenido) VALUES
('El Principito', 'libro', 'ciencia ficción', 'contenido...'),
('La teoría del todo', 'libro', 'ciencia', 'contenido...'),
('Aprendiendo Python', 'libro', 'tecnología', 'contenido...')
('Cien Años de Soledad', 'libro', 'ciencia ficción', 'contenido...'),
('Breves respuestas a las grandes preguntas', 'libro', 'ciencia', 'contenido...'),
('Inteligencia Artificial para principiantes', 'libro', 'tecnología', 'contenido...'),
('La Odisea', 'libro', 'ciencia ficción', 'contenido...'),
('Cosmos', 'libro', 'ciencia', 'contenido...'),
('Código Limpio', 'libro', 'tecnología', 'contenido...'),
('1984', 'libro', 'ciencia ficción', 'contenido...'),
('El Universo en una Cáscara de Nuez', 'libro', 'ciencia', 'contenido...'),
('Estructura de Datos en Python', 'libro', 'tecnología', 'contenido...'),
('Fundación', 'libro', 'ciencia ficción', 'contenido...'),
('Breve Historia del Tiempo', 'libro', 'ciencia', 'contenido...'),
('Machine Learning 101', 'libro', 'tecnología', 'contenido...'),
('Crónicas Marcianas', 'libro', 'ciencia ficción', 'contenido...'),
('El Gen Egoísta', 'libro', 'ciencia', 'contenido...'),
('Redes Neuronales con Python', 'libro', 'tecnología', 'contenido...'),
('Neuromante', 'libro', 'ciencia ficción', 'contenido...'),
('La ciencia de la computación', 'libro', 'ciencia', 'contenido...');
