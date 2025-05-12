/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS bd_libros
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bd_libros;

CREATE TABLE documentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255),
    tipo VARCHAR(50),
    genero VARCHAR(100),
    contenido TEXT
) 
  ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_unicode_ci;

INSERT INTO documentos (titulo, tipo, genero, contenido) VALUES
('El universo en expansión', 'libro', 'ciencia', 'contenido...'),
('Nanotecnología para principiantes', 'libro', 'tecnología', 'contenido...'),
('La máquina del tiempo', 'libro', 'ciencia ficción', 'contenido...'),
('Genética avanzada', 'libro', 'ciencia', 'contenido...'),
('Tecnologías del mañana', 'libro', 'tecnología', 'contenido...'),
('Mundos imaginarios', 'libro', 'ciencia ficción', 'contenido...'),
('Física para curiosos', 'libro', 'ciencia', 'contenido...'),
('Guía práctica de IA', 'libro', 'tecnología', 'contenido...'),
('Exploradores del futuro', 'libro', 'ciencia ficción', 'contenido...'),
('Biología sin fronteras', 'libro', 'ciencia', 'contenido...'),
('Impresión 4D: el siguiente paso', 'libro', 'tecnología', 'contenido...'),
('Alienígenas y contactos', 'libro', 'ciencia ficción', 'contenido...'),
('El cerebro descifrado', 'libro', 'ciencia', 'contenido...'),
('Robots entre nosotros', 'libro', 'tecnología', 'contenido...'),
('Dimensiones ocultas', 'libro', 'ciencia ficción', 'contenido...'),
('Neurociencia para todos', 'libro', 'ciencia', 'contenido...'),
('Tecnología y sociedad', 'libro', 'tecnología', 'contenido...');
