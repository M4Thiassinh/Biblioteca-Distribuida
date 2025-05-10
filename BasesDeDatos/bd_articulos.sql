CREATE DATABASE bd_articulos;
USE bd_articulos;

CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    tipo VARCHAR(50),
    genero VARCHAR(100),
    contenido TEXT
);

INSERT INTO documentos (titulo, tipo, genero, contenido) VALUES
('Avances en medicina cuántica', 'articulo', 'ciencia', 'contenido...'),
('El futuro de los viajes espaciales', 'articulo', 'ciencia ficción', 'contenido...'),
('Tendencias tecnológicas 2025', 'articulo', 'tecnología', 'contenido...');
