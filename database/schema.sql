-- 1. CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE IF NOT EXISTS komalli_db;
USE komalli_db;

-- 2. CREACIÓN DEL USUARIO DE EXPERIMENTO
-- Se crea un usuario específico para estandarizar la conexión en todas las estaciones
CREATE USER IF NOT EXISTS 'komalli-user'@'localhost' IDENTIFIED BY 'KomalliUV-password2026';
GRANT ALL PRIVILEGES ON komalli_db.* TO 'komalli-user'@'localhost';
FLUSH PRIVILEGES;

-- ======================================================
-- ESTRUCTURA PARA EL MÓDULO A (GESTIÓN DE MENÚ)
-- ======================================================

CREATE TABLE IF NOT EXISTS Categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(50) NULL,
    estado_activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Platillos (
    id_platillo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_platillo VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    id_categoria INT,
    notas_receta VARCHAR(100) NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_categoria FOREIGN KEY (id_categoria) 
        REFERENCES Categorias(id_categoria)
);

-- ======================================================
-- ESTRUCTURA PARA EL MÓDULO B (GESTIÓN DE USUARIOS)
-- ======================================================

CREATE TABLE IF NOT EXISTS Roles (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre_rol VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NULL,
    estado_activo BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS Personal (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    nombre_completo VARCHAR(50) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    id_rol INT,
    notas_horario VARCHAR(100) NULL,
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_rol FOREIGN KEY (id_rol) 
        REFERENCES Roles(id_rol)
);