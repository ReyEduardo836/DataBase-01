CREATE DATABASE Centro_Educativo

GO 

USE Centro_Educativo

GO

CREATE TABLE Estudiante(
	Numero CHAR(3) PRIMARY KEY,
	Nombre VARCHAR(30),
	Domicilio VARCHAR(15),
	Telefono CHAR(12),
	FechaNacimiento CHAR(6),
	IdCentro SMALLINT,
	NDirector CHAR(3),
	NDepartamento CHAR(4))

CREATE TABLE Curso(
	Numero CHAR(3) PRIMARY KEY,
	Nombre VARCHAR(30) UNIQUE,
	Descripcion VARCHAR(25) UNIQUE,
	Creditos SMALLINT,
	Tarifa DECIMAL(5,2),
	NDepartamento CHAR(4))

CREATE TABLE Departamento(
	Nombre CHAR(4) PRIMARY KEY,
	Edificio CHAR(2),
	Despacho SMALLINT,
	Director CHAR(3))

CREATE TABLE Clase(
	Id INT PRIMARY KEY IDENTITY(1,1),
	NumCurso CHAR(3),
	Seccion CHAR(2),
	NumProfesor CHAR(2),
	Dia CHAR(2),
	Hora CHAR(16),
	Edificio CHAR(2),
	Salon SMALLINT)

CREATE TABLE Matricula(
	Id INT PRIMARY KEY IDENTITY(1,1),
	NumCurso CHAR(3),
	Seccion CHAR(2),
	NumEstudiante CHAR(3),
	Fecha_Matricula DATE,
	Hora_Matricula TIME)

CREATE TABLE Claustro(
	NumeroProfesor CHAR(2) PRIMARY KEY,
	NombreProfesor CHAR(15),
	DomicilioProfesor VARCHAR(25),
	FechaContratacion DATE,
	NumAyudantes SMALLINT,
	Sueldo DECIMAL(7,2),
	NDepartamento CHAR(4))

CREATE TABLE Personal(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nombre CHAR(15),
	Cargo CHAR(10),
	Sueldo SMALLINT,
	NDepartamento CHAR(4))

/* -------------------------- */


ALTER TABLE Estudiante
ADD FOREIGN KEY (NDepartamento)
REFERENCES Departamento(Nombre)

ALTER TABLE Curso
ADD FOREIGN KEY (NDepartamento)
REFERENCES Departamento(Nombre)

ALTER TABLE Clase
ADD FOREIGN KEY (NumCurso)
REFERENCES Curso(Numero)

ALTER TABLE Matricula 
ADD FOREIGN KEY (NumCurso)
REFERENCES Curso(Numero)

ALTER TABLE Matricula
ADD FOREIGN KEY (NumEstudiante)
REFERENCES Estudiante(Numero)

ALTER TABLE Claustro
ADD FOREIGN KEY (NDepartamento)
REFERENCES Departamento(Nombre)

ALTER TABLE Personal 
ADD FOREIGN KEY (NDepartamento) 
REFERENCES Departamento(Nombre)

ALTER TABLE Clase
ADD FOREIGN KEY (NumProfesor)
REFERENCES Claustro(NumeroProfesor)

/*----------------------------*/


-- Table Departamento
INSERT INTO Departamento (Nombre, Edificio, Despacho, Director)
VALUES ('THEO', 'HU', 200, '10'),
		('CIS', 'SC', 300, '80'),
		('D.G.', 'SC', 100, '--'),
		('PHIL', 'HU', 100, '60')
 

-- Table Curso
INSERT INTO Curso(Numero, Nombre, Descripcion, Creditos, Tarifa, NDepartamento)
VALUES('C11', 'Introduccion a las CC.', 'Para novatos', 3, 100.00, 'CIS'),
		('C22', 'Estructura de Datos', 'Muy util', 3, 50.00, 'CIS'),
		('C33', 'Matematicas discretas', 'Absolutamente necesario', 3, .00, 'CIS'),
		('C44', 'Circuitos digitales', 'Ah Ha !', 3, .00, 'CIS'),
		('C55', 'Arquitect. Computadores', 'Maq. Von Neuman', 3, 100.00, 'CIS'),
		('C66', 'Bases de Datos relacionales', 'Imprescindible', 3, 500.00, 'CIS'),
		('P11', 'Empirismo', 'Verlo para creerlo', 3, 100.00, 'PHIL'),
		('P12', 'Racionalismo', 'Para usuarios CIS', 3, 50.00, 'PHIL'),
		('P33', 'Existencialismo', 'Para usuarios CIS(2)', 3, 200.00, 'PHIL'),
		('P44', 'Solipsismo', 'Para mi mismo', 6, 0.00, 'PHIL'),
		('T11', 'Escolasticismo', 'Para Beatos', 3, 150.00, 'THEO'),
		('T22', 'Fundamentalismo', 'Para descuidados', 3, 90.00, 'THEO'),
		('T33', 'Hedonismo', 'Para sanos', 3, 0.00, 'THEO'),
		('T44', 'Comunismo', 'Para avaros', 6, 200.00, 'THEO')

		
-- Table Claustro
INSERT INTO Claustro( NumeroProfesor, NombreProfesor, DomicilioProfesor, FechaContratacion, NumAyudantes, Sueldo, NDepartamento)
VALUES ('06', 'KATHY PEPE', 'CALLE DE LAPIEDRA, 7', '1979-01-15', 2, 35000.00, 'PHIL'),
		('10', 'JESSIE MARTIN', 'DR. DEL ESTE, 4', '1969-09-01', 1, 45000.00, 'THEO'),
		('08', 'JOSE COHN', 'APTDO, CORREOS 1138', '1979-07-09', 2, 35000.00, 'CIS'),
		('85', 'AL HARTLEY', 'CALLE DE LA PLATA', '1979-09-05', 7, 45000.00, 'CIS'),
		('60', 'JULIA MARTIN', 'DR. ESTE, 4', '1969-09-01', 1, 45000.00, 'PHIL'),
		('65', 'LISA BOBAK', 'CAMINO DE LA RISA, 77', '1981-09-06', NULL, 36000.00, 'THEO'),
		('80', 'BARB HLAVATY', 'CALLE DEL SUR, 489', '1982-01-16', 3, 35000.00, 'CIS')


-- Table Clase
INSERT INTO Clase ( NumCurso, Seccion, NumProfesor, Dia, Hora, Edificio, Salon)
VALUES ('C11', '01', '08', 'LU', '08:00 – 09:00 am', 'SC', 305),
		('C11', '02', '08', 'MA', '08:00 – 09:00 am', 'SC', 306),
		('C33', '01', '80', 'MI', '09:00 – 10:00 am', 'SC', 305),
		('C55', '01', '85', 'JU', '11:00 – 12:00 am', 'HU', 306),
		('P11', '01', '06', 'JU', '09:00 – 10:00 am', 'HU', 102),
		('P33', '01', '06', 'VI', '11:00 – 12:00 am', 'HU', 201),
		('T11', '01', '10', 'LU', '10:00 – 11:00 am', 'HU', 101),
		('T11', '02', '65', 'LU', '10:00 – 11:00 am', 'HU', 102),
		('T33', '01', '65', 'MI', '11:00 – 12:00 am', 'HU', 101)


-- Table Estudiante
INSERT INTO Estudiante ( Numero, Nombre, Domicilio, Telefono, FechaNacimiento, IdCentro, NDirector, NDepartamento)
VALUES ('325', 'CURLEY DUBAY', 'CONNECTICUT', '203-1234567', '780517', 122, '10', 'THEO'),
		('150', 'LARRY DUBAY', 'CONNECTICUT', '203-123-4567', '780517', 121, '80', 'CIS'),
		('100', 'MOE DUBAY', 'CONNECTICUT', '203-123-4567', '780517', 12, '10', 'THEO'),
		('800', 'ROCKY BALBOA', 'PENNSYLVANIA', '112-112-1122', '461004', 99, '60', 'PHIL')


-- Table Matricula
INSERT INTO Matricula ( NumCurso, Seccion, NumEstudiante, Fecha_Matricula, Hora_Matricula)
VALUES ('C11', '01', '325', '1987-01-04', '09:41:30'),
		('C11', '01', '800', '1987-12-15', '11:49:00'),
		('C11', '02', '100', '1987-12-17', '09:32:00'),
		('C11', '02', '150', '1987-12-17', '09:32:30'),
		('P33', '01', '100', '1987-12-23', '11:30:00'),
		('P33', '01', '800', '1987-12-23', '11:23:00'),
		('T11', '01', '100', '1987-12-23', '11:21:00'),
		('T11', '01', '150', '1987-12-15', '11:35:30'),
		('T11', '01', '800', '1987-12-15', '14:00:00')


-- Table Personal
INSERT INTO Personal ( Nombre, Cargo, Sueldo, NDepartamento)
VALUES ('LUCAS', 'EVANG1', 53, 'THEO'),
		('MARCOS', 'EVANG2', 52, 'THEO'),
		('MATEO', 'EVANG3', 51, 'THEO'),
		('DICK NIX', 'LADRON', 25001, 'PHIL'),
		('HANK KISS', 'BUFON', 25000, 'PHIL'),
		('JUAN', 'EVANG4', 54, 'THEO'),
		('EUCLIDES', 'ATE. LAB.', 1000, NULL),
		('ARQUIMIDES', 'ATE. LAB.', 200, NULL),
		('DVINCI', 'ATE. LAB.', 500, NULL)