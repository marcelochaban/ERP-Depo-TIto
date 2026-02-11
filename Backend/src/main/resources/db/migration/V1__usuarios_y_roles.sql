-- 1. Crear tabla de roles
CREATE TABLE roles (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       nombre VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Crear tabla de usuarios
CREATE TABLE usuarios (
                          id BIGINT AUTO_INCREMENT PRIMARY KEY,
                          username VARCHAR(50) NOT NULL UNIQUE,
                          password VARCHAR(255) NOT NULL,
                          nombre_completo VARCHAR(100),
                          email VARCHAR(100) UNIQUE,
                          activo BOOLEAN DEFAULT TRUE,
                          rol_id BIGINT,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          CONSTRAINT fk_usuario_rol FOREIGN KEY (rol_id) REFERENCES roles(id)
);

-- 3. Cargar roles iniciales para DepoTito
INSERT INTO roles (nombre) VALUES ('ROL_ADMIN');
INSERT INTO roles (nombre) VALUES ('ROL_ENCARGADO');
INSERT INTO roles (nombre) VALUES ('ROL_CAJERO');

-- 4. Crear un usuario administrador por defecto (password: admin123)
-- Nota: En producción esto se hace con BCrypt, para la V1 lo ponemos así o lo creamos por código
INSERT INTO usuarios (username, password, nombre_completo, email, rol_id)
VALUES ('admin', '$2a$10$8.UnVuG9HHgffUDAlk8qfOuVGkqRzgVymGe07xd00DMxs.TVuHOnu', 'Administrador Tito', 'admin@depositotito.com', 1)