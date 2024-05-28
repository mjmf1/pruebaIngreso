
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

