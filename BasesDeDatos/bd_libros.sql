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
('Aprendiendo Python', 'libro', 'tecnología', 'contenido...');
