/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS bd_videos
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bd_videos;

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
('Inteligencia Artificial explicada', 'video', 'tecnología', 'contenido...'),
('Viaje al centro del universo', 'video', 'ciencia ficción', 'contenido...'),
('La evolución del ser humano', 'video', 'ciencia', 'contenido...'),
('Realidades virtuales y cerebros', 'video', 'ciencia ficción', 'contenido...'),
('Redes neuronales profundas', 'video', 'tecnología', 'contenido...'),
('Exploración del océano profundo', 'video', 'ciencia', 'contenido...'),
('Futuros posibles: utopías y distopías', 'video', 'ciencia ficción', 'contenido...'),
('Robótica avanzada', 'video', 'tecnología', 'contenido...'),
('Microbiología moderna', 'video', 'ciencia', 'contenido...'),
('Naves espaciales autónomas', 'video', 'tecnología', 'contenido...'),
('Paradojas del tiempo', 'video', 'ciencia ficción', 'contenido...'),
('Átomos y partículas', 'video', 'ciencia', 'contenido...'),
('Ciberimplantes humanos', 'video', 'tecnología', 'contenido...'),
('Universos paralelos', 'video', 'ciencia ficción', 'contenido...'),
('La tabla periódica animada', 'video', 'ciencia', 'contenido...'),
('Smart cities: el futuro urbano', 'video', 'tecnología', 'contenido...'),
('La conciencia en las máquinas', 'video', 'ciencia ficción', 'contenido...');
