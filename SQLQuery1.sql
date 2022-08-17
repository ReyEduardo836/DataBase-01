CREATE DATABASE Taller
use Taller

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

CREATE TABLE Mantenimiento 
(	IdMantenimiento INT PRIMARY KEY IDENTITY(1,1).
	IdVehiculo INT,
	FechaIngreso DATE,
	FechaSalida DATE)

CREATE TABLE Mecanico
(	IdMecanico INT PRIMARY KEY IDENTITY(1,1),
	PrimerNombre VARCHAR(80),
	PrimerApellido VARCHAR(80),
	Cedula VARCHAR(80),
	Correo VARCHAR(80))

CREATE TABLE ServicioMantenimiento
(	IdServicioMantenimiento INT PRIMARY KEY IDENTITY(1,1),
	IdMantenimiento INT,
	IdServicio INT,
	IdMecanico INT,
	Costo MONEY)

CREATE TABLE ServicioRepuesto
(	IdServicioMantenimiento INT,
	IdRepuesto INT,
	Costo MONEY,
	Cantidad INT)

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
-- Creacion 