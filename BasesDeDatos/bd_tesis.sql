/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS bd_tesis
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE bd_tesis;

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
('Cálculo Multivariable', 'tesis', 'ciencia', 'contenido...'),
('Física Cuántica Aplicada', 'tesis', 'ciencia', 'contenido...'),
('Viajes Temporales: Teoría y Ficción', 'tesis', 'ciencia ficción', 'contenido...'),
('Análisis del Cerebro Artificial', 'tesis', 'tecnología', 'contenido...'),
('Sistemas Distribuidos', 'tesis', 'tecnología', 'contenido...'),
('Materia Oscura y Multiversos', 'tesis', 'ciencia ficción', 'contenido...'),
('Ingeniería Genética Moderna', 'tesis', 'ciencia', 'contenido...'),
('Desarrollo de Drones Autónomos', 'tesis', 'tecnología', 'contenido...'),
('Exploración del Tiempo Espacial', 'tesis', 'ciencia ficción', 'contenido...'),
('Computación Cuántica', 'tesis', 'ciencia', 'contenido...'),
('Minería de Datos con IA', 'tesis', 'tecnología', 'contenido...'),
('Relatos de Marte', 'tesis', 'ciencia ficción', 'contenido...'),
('Terapias Genéticas Emergentes', 'tesis', 'ciencia', 'contenido...'),
('Diseño de Chips Neuromórficos', 'tesis', 'tecnología', 'contenido...'),
('Robots y Sociedad', 'tesis', 'ciencia ficción', 'contenido...'),
('Estadística Aplicada a la Ciencia', 'tesis', 'ciencia', 'contenido...'),
('Machine Learning para Diagnóstico Médico', 'tesis', 'tecnología', 'contenido...');
