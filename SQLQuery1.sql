CREATE DATABASE Taller
GO
use Taller

-- Creacion de catalogos/entidades/sujetos de la BD
CREATE TABLE Cliente
(	IdCliente INT PRIMARY KEY IDENTITY (1,1),
	PrimerNombre VARCHAR(80),
	PrimerApellido VARCHAR(80),
	Cedula VARCHAR(80),
	Correo VARCHAR(80))

CREATE TABLE Vehiculo
(	IdVehiculo INT PRIMARY KEY IDENTITY (1,1),
	IdCliente INT,
	Marca VARCHAR(80),
	Modelo VARCHAR(80),
	Anio INT)

CREATE TABLE Mecanico
(	IdMecanico INT PRIMARY KEY IDENTITY(1,1),
	PrimerNombre VARCHAR(80),
	PrimerApellido VARCHAR(80),
	Cedula VARCHAR(80),
	Correo VARCHAR(80))

CREATE TABLE Repuesto
(	IdRepuesto INT PRIMARY KEY IDENTITY (1,1),
	Titulo VARCHAR(80),
	Descripcion VARCHAR(100),
	Marca VARCHAR(50),
	Modelo VARCHAR(50),
	Precio MONEY)

CREATE TABLE Servicio
(	IdServicio INT PRIMARY KEY IDENTITY(1,1),
	Descipcion VARCHAR(100),
	Precio MONEY,
	TipoMantenimiento VARCHAR(100))

-- Creacion de Tablas de Operaciones/Verbos de la BD
CREATE TABLE Mantenimiento 
(	IdMantenimiento INT PRIMARY KEY IDENTITY(1,1),
	IdVehiculo INT,
	FechaIngreso DATE,
	FechaSalida DATE)

CREATE TABLE ServicioMantenimiento
(	IdServicioMantenimiento INT PRIMARY KEY IDENTITY(1,1),
	IdMantenimiento INT,
	IdServicio INT,
	IdMecanico INT,
	Costo MONEY)

CREATE TABLE ServicioRepuesto
(	IdServicioMantenimiento INT NOT NULL,
	IdRepuesto INT NOT NULL,
	Costo MONEY,
	Cantidad INT)

-- Creacion de integridad referencial/relaciones
ALTER TABLE Vehiculo
ADD FOREIGN KEY(IdCliente)
REFERENCES Cliente(IdCliente)

ALTER TABLE Mantenimiento
ADD FOREIGN KEY(IdVehiculo)
REFERENCES Vehiculo(IdVehiculo)

ALTER TABLE ServicioMantenimiento
ADD FOREIGN KEY(IdMantenimiento)
REFERENCES Mantenimiento(IdMantenimiento)

ALTER TABLE ServicioMantenimiento
ADD FOREIGN KEY(IdServicio)
REFERENCES Servicio(IdServicio)

ALTER TABLE ServicioMantenimiento
ADD FOREIGN KEY(IdMecanico)
REFERENCES Mecanico(IdMecanico)

ALTER TABLE ServicioRepuesto
ADD FOREIGN KEY(IdServicioMantenimiento)
REFERENCES ServicioMantenimiento(IdServicioMantenimiento)

ALTER TABLE ServicioRepuesto
ADD FOREIGN KEY(IdRepuesto)
REFERENCES Repuesto(IdRepuesto)

ALTER TABLE ServicioRepuesto
ADD PRIMARY KEY(IdServicioMantenimiento, IdRepuesto)