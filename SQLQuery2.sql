CREATE DATABASE EventosHilton
GO
USE EventosHilton

-- Creacion de catalogos/entidades/sujetos de la BD
CREATE TABLE Evento(
	Id INT PRIMARY KEY IDENTITY (1,1),
	Fecha DATE,
	NumPersonas INT,
	HorasReserva FLOAT,
	Descripcion VARCHAR(200),
	Estado SMALLINT)

CREATE TABLE Sala(
	Id VARCHAR(5) PRIMARY KEY NOT NULL,
	PrecioHora MONEY,
	Nombre VARCHAR(20),
	Capacidad INT)

CREATE TABLE CLiente(
	Id INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(50))

CREATE TABLE Servicio(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Precio MONEY,
	NombreServicio VARCHAR(20))

-- Creacion de tablas de operaciones/verbos de la BD
CREATE TABLE DetalleEvento(
	Id  INT PRIMARY KEY IDENTITY(1,1),
	IdEvento INT,
	IdSala VARCHAR(5))

CREATE TABLE Factura(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdDetalleEvento INT,
	FechaPago DATE,
	IdCliente INT,
	TipoPago SMALLINT,
	Descuento FLOAT)

CREATE TABLE DetalleFactura(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdFactura INT,
	IdServicio INT)

-- Creacion de integridad relacional/relaciones
ALTER TABLE DetalleEvento
ADD FOREIGN KEY(IdEvento)
REFERENCES Evento(Id)

ALTER TABLE DetalleEvento
ADD FOREIGN KEY(IdSala)
REFERENCES Sala(Id)

ALTER TABLE Factura
ADD FOREIGN KEY(IdDetalleEvento)
REFERENCES DetalleEvento(Id)

ALTER TABLE Factura
ADD FOREIGN KEY(IdCliente)
REFERENCES Cliente(Id)

ALTER TABLE DetalleFactura
ADD FOREIGN KEY(IdFactura)
REFERENCES Factura(Id)

ALTER TABLE DetalleFactura
ADD FOREIGN KEY(IdServicio)
REFERENCES Servicio(Id)
