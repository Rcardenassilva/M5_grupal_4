CREATE DATABASE nombre_base_de_datos;

CREATE USER 'nombre_usuario'@'host' IDENTIFIED BY 'contraseña';



CREATE TABLE Usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contrasena VARCHAR(255) NOT NULL,
  zona_horaria VARCHAR(20) DEFAULT 'UTC-3',
  genero VARCHAR(20) NOT NULL,
  telefono_contacto VARCHAR(20) NOT NULL
);
CREATE TABLE Ingresos (
  id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha_hora_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);
ALTER TABLE Usuarios MODIFY  zona_horaria VARCHAR(20) DEFAULT 'UTC-2';

INSERT INTO Usuarios (nombre, apellido, contrasena, genero, telefono_contacto)
VALUES
('Juan', 'Perez', 'contrasena1', 'Masculino', '1234567890'),
('Luisa', 'Castro', 'contrasena2', 'Femenino', '9876543210'),
('Franco', 'Cardenas', 'contrasena3', 'Masculino', '1111111111'),
('Camila', 'Gonzales', 'contrasena4', 'Femenino', '2222222222'),
('Andres', 'lopez', 'contrasena5', 'Masculino', '3333333333'),
('Martina', 'Campos', 'contrasena6', 'Femenino', '4444444444'),
('Rene', 'Montes', 'contrasena7', 'Masculino', '5555555555'),
('Josefa', 'Cardenas', 'contrasena8', 'Femenino', '6666666666');

INSERT INTO Ingresos (id_usuario, fecha_hora_ingreso)
SELECT id_usuario, CURRENT_TIMESTAMP
FROM Usuarios;
CREATE TABLE Contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  numero_telefono VARCHAR(20) NOT NULL,
  correo_electronico VARCHAR(50),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);


