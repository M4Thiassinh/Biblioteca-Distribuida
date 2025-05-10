CREATE DATABASE bd_videos;
USE bd_videos;

CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    tipo VARCHAR(50),
    genero VARCHAR(100),
    contenido TEXT
);

INSERT INTO documentos (titulo, tipo, genero, contenido) VALUES
('Introducción a la Inteligencia Artificial', 'video', 'tecnología', 'contenido...'),
('Documental del Universo', 'video', 'ciencia', 'contenido...'),
('Historias del futuro', 'video', 'ciencia ficción', 'contenido...');
