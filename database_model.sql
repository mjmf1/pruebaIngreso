-- Ejecutar primero todos los CREATE TABLE statements

CREATE TABLE Usuarios (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE Autores (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    biografía TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
CREATE TABLE Colaboradores (
    id SERIAL PRIMARY KEY,
    usuario_id INT,
    rol VARCHAR(255),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
CREATE TABLE Videos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descripcion TEXT,
    url VARCHAR(255) NOT NULL,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    autor_id INT,
    FOREIGN KEY (autor_id) REFERENCES Autores(id)
);
CREATE TABLE Videos_Colaboradores (
    video_id INT,
    colaborador_id INT,
    PRIMARY KEY (video_id, colaborador_id),
    FOREIGN KEY (video_id) REFERENCES Videos(id),
    FOREIGN KEY (colaborador_id) REFERENCES Colaboradores(id)
);
CREATE TABLE Comentarios (
    id SERIAL PRIMARY KEY,
    contenido TEXT NOT NULL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    video_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (video_id) REFERENCES Videos(id)
);
CREATE TABLE Reviews (
    id SERIAL PRIMARY KEY,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    contenido TEXT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario_id INT,
    video_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (video_id) REFERENCES Videos(id)
);

-- Ejecutar después todos los INSERT statements

INSERT INTO Usuarios (nombre, email, contraseña) VALUES ('Juan Pérez', 'juan@example.com', 'password123');

INSERT INTO Usuarios (nombre, email, contraseña) VALUES ('María García', 'maria@example.com', 'password456');

INSERT INTO Autores (usuario_id, biografía) VALUES (1, 'Autor de vídeos técnicos.');

INSERT INTO Colaboradores (usuario_id, rol) VALUES (2, 'Editor');

INSERT INTO Videos (titulo, descripcion, url, autor_id) VALUES ('Cómo programar en JavaScript', 'Tutorial de JavaScript para principiantes', 'http://example.com/js-tutorial', 1);

INSERT INTO Videos_Colaboradores (video_id, colaborador_id) VALUES (1, 1);

INSERT INTO Comentarios (contenido, usuario_id, video_id) VALUES ('Muy buen tutorial, gracias!', 2, 1);

INSERT INTO Reviews (rating, contenido, usuario_id, video_id) VALUES (5, 'Excelente tutorial!', 2, 1);
