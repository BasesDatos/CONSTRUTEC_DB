------------------------------------------------------------
-- SCRIPT DE CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS
-- CONSTRU-TEC
------------------------------------------------------------

CREATE TABLE USUARIO(
	Usuario 	VARCHAR(20) PRIMARY KEY NOT NULL,
	Nombre 		VARCHAR(20) 		NOT NULL,
	P_Apellido 	VARCHAR(20) 		NOT NULL,
	S_Apellido 	VARCHAR(20),
	Cedula 		BIGINT UNIQUE 		NOT NULL,
	Contrasena 	VARCHAR(16) 		NOT NULL,
	Codigo 		VARCHAR(10),
	Telefono 	VARCHAR(10)
);


CREATE TABLE PROYECTO(
	Id 	SERIAL PRIMARY KEY 	NOT NULL,
	Nombre 		VARCHAR(20) 	NOT NULL,
	Estado 		BOOLEAN		NOT NULL,
	Costo 		MONEY,
	Provincia 	VARCHAR(20) 	NOT NULL,
	Canton 		VARCHAR(20) 	NOT NULL,
	Distrito 	VARCHAR(20)
);



CREATE TABLE ETAPA(
	Id SERIAL 	PRIMARY KEY 	NOT NULL,
	Nombre 		VARCHAR(15) 	NOT NULL,
	Descripcion 	VARCHAR(100),
	Costo 		MONEY,
	Estado 		BIT 		NOT NULL,
	F_Inicio 	DATE,
	F_Fin 		DATE,
	Comentarios 	JSON
);


-- Tipos de usuario
--	1 = Usuario general
--	2 = Ingeniero/Arquitecto
--	3 = Administrador
CREATE TABLE ROL(
	Id SERIAL PRIMARY KEY 	NOT NULL,
	Tipo 	VARCHAR(20) 	NOT NULL
);


CREATE TABLE MATERIAL(
	Id BIGINT PRIMARY KEY 		NOT NULL,
	Nombre 		VARCHAR(20) 	NOT NULL,
	Descripcion 	VARCHAR(50)
);


-- Tabla que relaciona USUARIO y ROL
CREATE TABLE ROL_USUARIO(
	Id SERIAL PRIMARY KEY 		NOT NULL,
	Usuario 	VARCHAR(20) 	REFERENCES USUARIO(Usuario),
	Id_Rol 		INT 		REFERENCES ROL(Id)
);


-- Tabla que relaciona PROYECTO y USUARIO
CREATE TABLE PROYECTO_USUARIO(
	Id SERIAL PRIMARY KEY 		NOT NULL,
	Usuario 	VARCHAR(20) 	REFERENCES USUARIO(Usuario),
	Id_Proyecto 	INT 		REFERENCES PROYECTO(Id)
);


-- Tabla que relaciona ETAPA y PROYECTO
CREATE TABLE ETAPA_PROYECTO(
	Id SERIAL PRIMARY KEY 	NOT NULL,
	Id_Proyecto 	INT 	REFERENCES PROYECTO(Id),
	Id_Etapa 	INT 	REFERENCES ETAPA(Id)
);


-- Tabla que relaciona MATERIAL y ETAPA
CREATE TABLE MATERIAL_ETAPA(
	Id SERIAL PRIMARY KEY 	NOT NULL,
	Id_Etapa 	INT 	REFERENCES ETAPA(Id),
	Id_Material 	INT 	REFERENCES MATERIAL(Id),
	Cantidad	INT	NOT NULL
);

