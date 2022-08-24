CREATE DATABASE Practica
GO
USE Practica

CREATE TABLE Persona(
	Nombre VARCHAR(80),
	Apellido VARCHAR(80),
	Dni INT)

INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Martin', 'Marquesi', 26125988)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Pablo', 'Marquesi', 25485699)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Roberto', 'Sanchez', 20566401)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Estefania', 'Guissini', 27128064)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Ruben', 'Alegrato', 24238975)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Sandra', 'Britte', 25483669)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Melisa', 'Ardul', 27456224)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Soledad', 'Michelli', 29889656)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Betania', 'Musachegui', 27128765)
INSERT INTO Persona(Nombre, Apellido, Dni) VALUES ('Juan', 'Serrat', 28978845)

-- 3.2 SELECT
SELECT Nombre 
FROM Persona
WHERE Apellido = 'Marquesi'

-- 3.3
SELECT Nombre AS [Nombre Primero]
FROM Persona 
WHERE Apellido = 'Marquesi'

-- Predicados y conectores 
-- Conectores logicos "AND OR NOT"
-- Operadores aritmetricos + - / *

-- 3.4 BETWEEN, NOT BETWEEN
SELECT Nombre, Dni
FROM Persona
WHERE Dni BETWEEN 26000000 AND 28000000

SELECT Nombre, Dni
FROM Persona
WHERE Dni NOT BETWEEN 26000000 AND 28000000

-- 3.5
-- El caracter % es igual a cualquier sub cadena
-- El operador _ es igual a cualqier caracter
-- Estos caracteres especiales (%, _) se relacionan con la palabra reservada LIKE o NOT LIKE
SELECT Nombre
FROM Persona 
WHERE(Nombre LIKE 'P%') OR (Nombre LIKE '______')

-- 3.6 DISTINCT esta palabra reservada es para traer algun atributo sin repetirlos
SELECT DISTINCT Apellido
FROM Persona

-- 3.7 
-- CREAR TABLA JUGADORES

CREATE TABLE Jugadores(
	Dni INT PRIMARY KEY,
	Puesto VARCHAR(15),
	NumCamiseta int)

INSERT INTO Jugadores (Dni, Puesto, NumCamiseta) VALUES (26125988, 'Delantero', 9)
INSERT INTO Jugadores (Dni, Puesto, NumCamiseta) VALUES (25685699, 'Medio', 5)
INSERT INTO Jugadores (Dni, Puesto, NumCamiseta) VALUES (28978845, 'Arquero', 1)
INSERT INTO Jugadores (Dni, Puesto, NumCamiseta) VALUES (29789854, 'Defensor', 3)

-- 3.8 Seleccionar todos los nombres y apellidos de la relacion persona cuyos apellidos sean Marquesi o Serrat
-- Operaciones en conjunto con UNION, INTERSECT, MINUS
-- Por omision, la operacion UNION elimina los datos duplicados. Para retener los duplicados se debe escribir UNION ALL en lugar de UNION
SELECT Nombre, Apellido
FROM Persona 
WHERE Apellido = 'Marquesi'
UNION
SELECT Nombre, Apellido
FROM Persona
WHERE Apellido = 'Serrat'

-- 3.9 Obtener todos los Dni de los jugadores y ademas, que esten en la lista de Personas
-- EXISTS, NOT EXISTS
SELECT DISTINCT Dni 
FROM Persona
WHERE EXISTS
	(SELECT * 
	FROM Jugadores 
	WHERE Persona.Dni = Jugadores.Dni)
-- Tambien se podria haber escrito como:
SELECT DISTINCT Persona.Dni
FROM Persona INNER JOIN Jugadores
ON Persona.Dni = Jugadores.Dni