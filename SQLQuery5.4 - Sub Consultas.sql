--5--Sub – Consultas
/*================================================================*/
-- Restaurar y usar la BD Northwind

drop database Northwind

Restore database Northwind
from disk = 'C:\BASE DE DATOS I\III UNIDAD\Bases de Datos\Northwind.bak'
with replace

use Northwind

--Eliminar los productos discontinuados de las Ordenes
DELETE
FROM [Order Details]
WHERE ProductID in (SELECT ProductID FROM Products WHERE Discontinued=1)


-- Mostrar los productos cuyo precio es mayor al promedio de todos los productos.
SELECT *
FROM Products
WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products)

-- ¿Cual sería la consulta para este Script?
-- R// Mostrar los IdProductos que se realizaron en la primera venta
SELECT DISTINCT o.OrderDate, od.ProductID
FROM Orders o INNER JOIN [Order Details] od ON o.OrderID = od.OrderID
WHERE OrderDate = (SELECT MIN(OrderDate) FROM Orders)
SELECT * FROm [Order Details]


-- Ejemplo con Exist
SELECT lastname, employeeid 
FROM employees AS e 
WHERE 
EXISTS (SELECT * FROM orders AS o WHERE e.employeeid = o.employeeid AND o.orderdate = '5/9/1997')


/* Utilizando Any, All,  in y not in     */

Select * from Categories
Select * from Products

insert into categories([CategoryName],[Description]) values ('Tecnológicos', 'Productos Varios')

Select CategoryID, CategoryName
from Categories 
where CategoryID not in (Select CategoryId 
                         from Products)


Select CategoryID, CategoryName
from Categories 
where CategoryID = any (Select CategoryId from Products)



