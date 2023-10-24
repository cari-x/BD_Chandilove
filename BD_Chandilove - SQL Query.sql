CREATE TABLE usuarios (
    ID_Usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nombre_Usuario NVARCHAR(20) NOT NULL UNIQUE,
    Email NVARCHAR(50) NOT NULL UNIQUE,
    Contraseña VARCHAR(60) NOT NULL,
    Biografía TEXT,
    Teléfono VARCHAR(15) NOT NULL,
    Foto_perfil VARCHAR(200),
    Ciudad VARCHAR(50) NOT NULL,
    Fecha_creacion DATETIME NOT NULL,
    Activo BOOLEAN,
    ID_TipoUsuario INT,
    FOREIGN KEY (ID_TipoUsuario) REFERENCES Tipo_Usuario(ID_TipoUsuario)
);

CREATE TABLE tipo_usuario (
    ID_TipoUsuario INT NOT NULL PRIMARY KEY,
    tipo_usuario VARCHAR(50)
);



CREATE TABLE personas (
    ID_Persona INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Nombre_Persona NVARCHAR(50) NOT NULL,
    Apellido_Persona NVARCHAR(50) NOT NULL,
    FechaNacimiento_Persona DATE NOT NULL,
    Genero_Persona VARCHAR(50) NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario)
);

CREATE TABLE fundaciones (
    ID_Fundacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Nombre_Fundacion NVARCHAR(50) NOT NULL,
    Dirección NVARCHAR(50) NOT NULL,
    Sitio_web NVARCHAR(50) NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario)
);

CREATE TABLE seguidores (
    ID_Seguidores INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario_seguidor INT NOT NULL,
    ID_Usuario_siguiendo INT NOT NULL,
    Fecha_seguimiento DATETIME,
    FOREIGN KEY (ID_Usuario_seguidor) REFERENCES usuarios(ID_Usuario),
    FOREIGN KEY (ID_Usuario_siguiendo) REFERENCES usuarios(ID_Usuario)
);

CREATE TABLE publicaciones (
    ID_Publicacion INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    Fecha_publicacion DATETIME,
    Fecha_actualizacion DATETIME,
    Descripcion TEXT,
    Imagen_publicacion NVARCHAR(200),
    Tipo_publicacion VARCHAR(50),
    FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario)
);

CREATE TABLE favoritos (
    ID_Favoritos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Usuario INT NOT NULL,
    ID_Publicacion INT NOT NULL,
    Fecha_favorito DATETIME NOT NULL,
	FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario),
    FOREIGN KEY (ID_Publicacion) REFERENCES publicaciones(ID_Publicacion)
);

CREATE TABLE post_mascotas(
    ID_Post_Mascota INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Publicacion INT NOT NULL,
    Edad_mascota INT NULL,
    Nombre_mascota VARCHAR(50),
    Raza_mascota VARCHAR(50),
    Color VARCHAR(50),
    FOREIGN KEY (ID_Publicacion) REFERENCES publicaciones(ID_Publicacion)
);

CREATE TABLE post_normales (
    ID_Post_Normal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Publicacion INT NOT NULL,
	FOREIGN KEY (ID_Publicacion) REFERENCES publicaciones(ID_Publicacion)
);

CREATE TABLE post_likes (
    ID_Post_Likes INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Publicacion INT NOT NULL,
    ID_Usuario INT NOT NULL,
    Fecha_likeusuariostipo_usuario DATETIME,
	FOREIGN KEY (ID_Publicacion) REFERENCES publicaciones(ID_Publicacion),
    FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario)
);

CREATE TABLE post_comentarios (
    ID_Post_Comentarios INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ID_Publicacion INT NOT NULL,
    ID_Usuario INT NOT NULL,
    Texto_comentario TEXT,
    Fecha_comentario DATETIME,
	FOREIGN KEY (ID_Publicacion) REFERENCES publicaciones(ID_Publicacion),
    FOREIGN KEY (ID_Usuario) REFERENCES usuarios(ID_Usuario)
);

