CREATE DATABASE bd_tesis;
USE bd_tesis;

CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    tipo VARCHAR(50),
    genero VARCHAR(100),
    contenido TEXT
);

INSERT INTO documentos (titulo, tipo, genero, contenido) VALUES
('Ecuaciones Diferenciales', 'tesis', 'ciencia', 'contenido...'),
('Inteligencia Artificial', 'tesis', 'ciencia ficción', 'contenido...'),
('Redes Neuronales', 'tesis', 'tecnología', 'contenido...');
