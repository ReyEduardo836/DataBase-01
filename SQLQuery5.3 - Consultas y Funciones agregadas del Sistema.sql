
--4--Consultas y Funciones agregadas del Sistema
/*============================================================*/
use Northwind

SELECT *
FROM Products
ORDER BY CategoryID, UnitPrice asc

-- Visualizar el máximo y el mínimo precio de los productos por categoría, mostrar el nombre de la categoría.
SELECT MAX(UnitPrice) as MaxPrecio, MIN(UnitPrice) as MinPrecio, Categories.CategoryName
FROM Products inner join Categories on Products.CategoryID = Categories.CategoryID
GROUP BY Categories.CategoryName

--Seleccionar la categorías que tengan más de 5 productos. Mostrar el nombre de la categoría y el número de productos
SELECT C.CategoryID, C.CategoryName, COUNT(P.QuantityPerUnit)
FROM Categories AS C INNER JOIN Products AS P ON C.CategoryID = P.CategoryID
GROUP BY C.CategoryID, C.CategoryName
HAVING COUNT(P.QuantityPerUnit)>'5'

--Calcular el stock total de los productos por cada categoría. Mostrar el nombre de la categoría y el stock por categorìa 2,5 y 8.
SELECT C.CategoryName, SUM(P.UnitsInStock) AS CANT_CATEGORI
FROM Categories AS C INNER JOIN Products AS P ON C.CategoryID= P.CategoryID
WHERE C.CategoryID IN (2,5,8)
GROUP BY C.CategoryName

--Contar el número de órdenes que se han realizado por año y meses.
SELECT MONTH(OrderDate) AS MES, YEAR(OrderDate) AS AÑO, COUNT(OrderId) AS CANT_ORDEN
FROM Orders
GROUP BY MONTH(OrderDate), YEAR(OrderDate)

-- Calcular el promedio de ventas netas por Empleado

Select CONCAT(E.FirstName,' ',E.LastName) as [Nombre Completo], AVG(OD.UnitPrice * OD.Quantity) as [Promedio Ventas] 
from Employees E inner join Orders O on E.EmployeeID = O.EmployeeID
inner join [Order Details] OD on OD.OrderID = O.OrderID
GROUP BY E.FirstName, E.LastName

-- Calcular el promedio de las edades en la tabla Employees

Select Avg(year(getdate()) - year([BirthDate])) as Promedio 
from Employees







