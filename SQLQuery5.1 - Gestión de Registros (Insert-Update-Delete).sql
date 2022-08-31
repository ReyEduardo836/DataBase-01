

--3.--Gestión de Registros (Insert-Update-Delete)
/*========================================================*/
--Restaure la BD Northwind para practicar con el Script propuesto
restore database Northwind
from disk = 'D:\Respaldos BD\Northwind.bak'
with replace

--Establezca en uso la BD Northwind
use Northwind

--Visualizar todos los registros de la tabla Shippers
SELECT * FROM Shippers

--Ingresar un registro en la tabla Shippers
INSERT INTO Shippers
(CompanyName,Phone)
VALUES ('AmerCont','(503) 555-9831)')

-- Listar el campo Country de la tabla Customers
SELECT Country FROM Customers

-- Cambia el nombre del país de UK por el de Perú en la tabla Customers 
UPDATE Customers
SET Country='Peru'
WHERE Country='UK'

-- Listar el campo Country de la tabla Suppliers
SELECT Country FROM Suppliers

-- Cambia el nombre del país de UK por el de Perú en la tabla Suppliers
UPDATE Suppliers
SET Country='Peru'
WHERE Country='UK'

--Listar el campo Fax de la tabla Suppliers
SELECT Fax FROM Suppliers

-- Establecer en 0 el campo Fax que sea NULL de la tabla Suppliers
UPDATE Suppliers
SET Fax='0'
WHERE Fax is null

-- Listar todos los campos de la tabla Products
SELECT * FROM Products

/*  Si se elimina una información en una tabla, se debe de eliminar en todas las tablas 
en donde afecte el registro eliminado */
  -- Primera forma: Eliminar los productos descontinuados
DELETE
FROM [Order Details]
where ProductID in (5,9,17,24,28,29,42,53)

DELETE
FROM Products
where Discontinued=1

  -- Segunda forma: Eliminar los productos descontinuados
DELETE
FROM [Order Details]
WHERE ProductID in (SELECT ProductID FROM Products WHERE Discontinued=1)

DELETE
FROM Products
where Discontinued=1