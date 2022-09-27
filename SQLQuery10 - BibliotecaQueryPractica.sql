CREATE DATABASE Biblioteca
GO
USE Biblioteca 
GO

CREATE TABLE Libro(
	Id INT PRIMARY KEY IDENTITY(1,1),
	NEdicion INT,
	Titulo VARCHAR(50),
	Editorial VARCHAR(50),
	AñoEdicion DATE,
	IdEstado INT)

CREATE TABLE Estado(
	Id INT PRIMARY KEY IDENTITY(1,1),
	NombreEstado VARCHAR(20))

CREATE TABLE Autor(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50))

CREATE TABLE AutorLibro(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdLibro INT,
	IdAutor INT)

CREATE TABLE Responsable(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50))

CREATE TABLE FichaPrestamo(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Fecha DATE,
	Hora TIME,
	IdResponsable INT)

CREATE TABLE PrestamoOffline(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdAutorLibro INT,
	IdFichaPrestamo INT)

CREATE TABLE Lector(
	Nombre VARCHAR(50),
	Direccion VARCHAR(200),
	Cedula VARCHAR(50) PRIMARY KEY,
	Telefono VARCHAR(20),
	FechaRetorno DATE)

CREATE TABLE PrestamoOnline(
	Id INT PRIMARY KEY IDENTITY(1,1),
	CedulaLector VARCHAR(50),
	IdAutorLibro INT,
	IdFichaPrestamo INT)

-- FOREIGN KEYS
ALTER TABLE Libro
ADD FOREIGN KEY(IdEstado)
REFERENCES Estado(Id)

ALTER TABLE AutorLibro
ADD FOREIGN KEY(IdLibro)
REFERENCES Libro(Id)

ALTER TABLE AutorLibro
ADD FOREIGN KEY(IdAutor)
REFERENCES Autor(Id)

ALTER TABLE PrestamoOffline
ADD FOREIGN KEY(IdAutorLibro)
REFERENCES AutorLibro(Id)

ALTER TABLE PrestamoOffline
ADD FOREIGN KEY(IdFichaPrestamo)
REFERENCES FichaPrestamo(Id)

ALTER TABLE FichaPrestamo
ADD FOREIGN KEY(IdResponsable)
REFERENCES Responsable(Id)

ALTER TABLE PrestamoOnline
ADD FOREIGN KEY(CedulaLector)
REFERENCES Lector(Cedula)

ALTER TABLE PrestamoOnline
ADD FOREIGN KEY(IdAutorLibro)
REFERENCES AutorLibro(Id)

ALTER TABLE PrestamoOnline
ADD FOREIGN KEY(IdFichaPrestamo)
REFERENCES FichaPrestamo(Id)


-- usando la base de datos northwind
--USE Northwind
--GO

--select distinct e.EmployeeID, concat(e.FirstName ,' ', e.LastName) NombreCompleto, year(getdate())- year(BirthDate) edad,
--	count(o.OrderID) cantidad, count(distinct ShipCountry) CantidadPaises, count(distinct CustomerId) CantidadClientes, SUM((UnitPrice * Quantity)-(Discount*(UnitPrice * Quantity))) VentasEmpleados
--from Employees as e inner join Orders as o on e.EmployeeID = o.EmployeeID
--inner join [Order Details] od on o.OrderID = od.OrderID
--GROUP BY e.EmployeeId, e.FirstName, e.LastName, BirthDate