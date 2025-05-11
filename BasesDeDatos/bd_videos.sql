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
('Viaje al centro del átomo', 'video', 'ciencia', 'contenido...'),
('El impacto de la IA en el trabajo', 'video', 'tecnología', 'contenido...'),
('Civilizaciones del futuro', 'video', 'ciencia ficción', 'contenido...'),
('Tornados: ciencia en acción', 'video', 'ciencia', 'contenido...'),
('La historia de la computación', 'video', 'tecnología', 'contenido...'),
('Aliens y contacto', 'video', 'ciencia ficción', 'contenido...'),
('Biotecnología hoy', 'video', 'ciencia', 'contenido...'),
('Vehículos autónomos explicados', 'video', 'tecnología', 'contenido...'),
('Colonias en la luna', 'video', 'ciencia ficción', 'contenido...'),
('Vacunas del futuro', 'video', 'ciencia', 'contenido...'),
('Internet de las cosas explicado', 'video', 'tecnología', 'contenido...'),
('La vida en Marte', 'video', 'ciencia ficción', 'contenido...'),
('Genoma humano en detalle', 'video', 'ciencia', 'contenido...'),
('Cómo funciona un CPU', 'video', 'tecnología', 'contenido...'),
('Sueños virtuales', 'video', 'ciencia ficción', 'contenido...'),
('El poder de los imanes', 'video', 'ciencia', 'contenido...'),
('Nube y computación moderna', 'video', 'tecnología', 'contenido...');