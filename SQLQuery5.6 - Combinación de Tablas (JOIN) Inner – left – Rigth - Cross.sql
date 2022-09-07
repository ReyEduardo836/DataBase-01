--6--Combinaci�n de Tablas (JOIN) Inner � left � Rigth - Cross
/*===============================================================*/
use Northwind
--Mostrar: C�digo, nombre, ciudad y pa�s de proveedor, c�digo,nombre,precio,stock del producto
SELECT S.SupplierID,S.CompanyName,S.Country,P.ProductID,P.ProductName,P.UnitPrice,P.UnitsInStock
FROM Suppliers AS S INNER JOIN Products AS P ON S.SupplierID=P.SupplierID
WHERE P.UnitsInStock='0'

--Mostrar:C�digo y nombre de la categor�a, c�digo, nombre, precio y stock de los productos, c�digo, nombre de los proveedores.
--cuyo precio unitario de los productos est� entre 50 y 100
SELECT C.CategoryID,C.CategoryName,P.ProductID,P.ProductName,P.UnitPrice,P.UnitsInStock,S.SupplierID,S.CompanyName
FROM Categories AS C INNER JOIN Products AS P 
ON C.CategoryID=P.CategoryID INNER JOIN Suppliers AS S ON S.SupplierID=P.SupplierID
WHERE P.UnitPrice BETWEEN 50 AND 100

-- Mostrar:N�mero de la orden, fecha, nombre del producto, nombre de la categor�a, nombre del proveedor
-- del mes de mayo a agosto del a�o 1996
SELECT O.OrderID,O.OrderDate,P.ProductName,C.CategoryName,S.CompanyName
FROM Orders AS O INNER JOIN [Order Details] AS OD ON O.OrderID=OD.OrderID
INNER JOIN Products AS P ON OD.ProductID=P.ProductID
INNER JOIN Categories AS C ON C.CategoryID=P.CategoryID
INNER JOIN Suppliers as S ON S.SupplierID=P.SupplierID
WHERE (MONTH(O.OrderDate) BETWEEN 5 AND 8 ) AND (YEAR(o.OrderDate)='1996')
ORDER BY OrderDate ASC


/* Unir por la Izquierda, significando que se ponen todos los registros de la primera tabla
   y solo los registros coincidentes de la segunda tabla   */

SELECT S.CustomerID, S.ContactName, S.Country,P.OrderID
FROM Customers AS S left JOIN Orders AS P ON s.CustomerID=p.CustomerID


Select *
FROM Customers

Select *
FROM Orders

-- Insertar un registro cualquiera en la tabla Customer para ver que el LEFT JOIN agrega el registro
INSERT INTO Customers (CustomerID,CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax)
VALUES ('OK','OK','OK','OK','OK','OK','OK','OK','OK','OK','OK')

SELECT S.CustomerID, S.ContactName, S.Country,P.OrderID
FROM Customers AS S full outer join Orders AS P ON s.CustomerID=p.CustomerID

SELECT S.CustomerID, S.ContactName, S.Country,P.OrderID
FROM Customers AS S inner join Orders AS P ON s.CustomerID=p.CustomerID




