--3.--Consulta de Datos  SQL (Select –Where – Order by)
/*================================================================*/
--Restaure la BD Northwind para practicar con el Script propuesto
use master
drop database Northwind
restore database Northwind
from disk = 'D:\Respaldos BD\Northwind.bak'
with replace

--Establezca en uso la BD Northwind
use Northwind

-- Visualice todos los campos de la tabla Products
SELECT * FROM Products

--Varias condiciones que se pueden usar con: Between, AND Y OR
SELECT * 
FROM Products 
WHERE CategoryID=6 OR CategoryID=4

SELECT * 
FROM Products 
WHERE CategoryID BETWEEN 4 AND 6

SELECT ProductID,ProductName,UnitPrice 
FROM Products 
WHERE UnitPrice BETWEEN 30 AND 60

--Con IN
SELECT * 
FROM Products 
WHERE CategoryID IN (4,6,8,2)

--Permite seleccionar una parte de la fecha ORDERDATE
SELECT * 
FROM Orders 
WHERE YEAR(OrderDate)='1998'

--Usando DATEPART
SELECT * 
FROM Orders 
WHERE EmployeeID IN (2,3,4,5) AND CustomerID LIKE '[A-G]%' AND DATEPART (MM,OrderDate)='07' AND DATEPART (DD,OrderDate)='31' 

--Ordenar los registros (ASC DESC)
SELECT ProductID,ProductName,UnitPrice 
FROM Products 
WHERE UnitPrice BETWEEN 30 AND 60 
ORDER BY ProductName asc --desc

--Devuelve un numero determinado de registros (TOP)
SELECT TOP 3 ProductID,ProductName,UnitPrice 
FROM Products 
WHERE UnitPrice BETWEEN 30 AND 60 
ORDER BY ProductName asc -- desc

/* Ejercicios:
1. Seleccionar todos los campos de la tabla clientes, ordenado por nombre
 del contacto de la compañìa, alfabeticamente.
2.-Seleccionar todos los campos de la tabla òrdenes por fecha de la orden, descendentemente.
 */