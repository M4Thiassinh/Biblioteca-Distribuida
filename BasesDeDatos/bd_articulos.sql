/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS bd_articulos
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bd_articulos;

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
('La ciencia detrás del teletransporte', 'articulo', 'ciencia ficción', 'contenido...'),
('Tecnologías emergentes en medicina', 'articulo', 'ciencia', 'contenido...'),
('Blockchain más allá del dinero', 'articulo', 'tecnología', 'contenido...'),
('Colonización de exoplanetas', 'articulo', 'ciencia ficción', 'contenido...'),
('Nuevos materiales inteligentes', 'articulo', 'ciencia', 'contenido...'),
('Avances en visión por computador', 'articulo', 'tecnología', 'contenido...'),
('Sociedad y androides', 'articulo', 'ciencia ficción', 'contenido...'),
('Algoritmos genéticos aplicados', 'articulo', 'tecnología', 'contenido...'),
('Estudio sobre agujeros negros', 'articulo', 'ciencia', 'contenido...'),
('Robots en la educación del futuro', 'articulo', 'tecnología', 'contenido...'),
('Cibernética y emociones humanas', 'articulo', 'ciencia ficción', 'contenido...'),
('Física en la vida cotidiana', 'articulo', 'ciencia', 'contenido...'),
('Ciberseguridad en 2030', 'articulo', 'tecnología', 'contenido...'),
('Hologramas interactivos', 'articulo', 'ciencia ficción', 'contenido...'),
('Microbiología de ambientes extremos', 'articulo', 'ciencia', 'contenido...'),
('Redes 6G: Lo que viene', 'articulo', 'tecnología', 'contenido...'),
('Cerebros sintéticos: real o ficción', 'articulo', 'ciencia ficción', 'contenido...');