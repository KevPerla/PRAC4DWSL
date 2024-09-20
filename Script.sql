DROP DATABASE IF EXISTS db_sistema_notas;
CREATE DATABASE db_sistema_notas;

USE db_sistema_notas;

CREATE TABLE permissions (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL
);

CREATE TABLE users_groups (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL
);

CREATE TABLE groups_permissions (
id INT PRIMARY KEY AUTO_INCREMENT,
id_user_group INT NOT NULL,
id_permission INT NOT NULL,
status TINYINT DEFAULT 1,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL,
FOREIGN KEY (id_user_group) REFERENCES users_groups(id),
FOREIGN KEY (id_permission) REFERENCES permissions(id)
);

CREATE TABLE users (
id INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
nombres VARCHAR(255) NOT NULL,
apellidos VARCHAR(255) NOT NULL,
imagen VARCHAR(255) NOT NULL,
carnet VARCHAR(10) NOT NULL,
id_user_group INT NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL,
FOREIGN KEY (id_user_group) REFERENCES users_groups(id)
);

CREATE TABLE asignaturas (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL
);

CREATE TABLE asignaturas_docentes (
id INT PRIMARY KEY AUTO_INCREMENT,
id_asignatura INT NOT NULL,
id_user_docente INT NOT NULL,
ciclo VARCHAR(1) NOT NULL,
year INT NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL,
FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id),
FOREIGN KEY (id_user_docente) REFERENCES users(id)
);

CREATE TABLE matriculas (
id INT PRIMARY KEY AUTO_INCREMENT,
id_asignatura INT NOT NULL,
id_user_estudiante INT NOT NULL,
ciclo VARCHAR(1) NOT NULL,
year INT NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL,
FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id),
FOREIGN KEY (id_user_estudiante) REFERENCES users(id)
);

CREATE TABLE computos (
id INT PRIMARY KEY AUTO_INCREMENT,
fecha_inicio DATE NULL,
fecha_finalizacion DATE NULL,
id_asignatura INT NOT NULL,
id_user_docente INT NOT NULL,
ciclo VARCHAR(1) NOT NULL,
year INT NOT NULL,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL,
FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id),
FOREIGN KEY (id_user_docente) REFERENCES users(id)
);

CREATE TABLE notas (
id INT PRIMARY KEY AUTO_INCREMENT,
id_computo INT NOT NULL,
id_user_estudiante INT NOT NULL,
laboratorio DECIMAL(4,2) DEFAULT 0,
parcial DECIMAL(4,2) DEFAULT 0,
promedio DECIMAL(4,2) DEFAULT 0,
created_at DATETIME DEFAULT NOW(),
updated_at DATETIME NULL,
FOREIGN KEY (id_computo) REFERENCES computos(id),
FOREIGN KEY (id_user_estudiante) REFERENCES users(id)
);
