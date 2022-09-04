USE Northwind

--Selecciona todos los paises sin repeticion de la tabla suppliers 
--y los ordena de la "A" a la "Z"
SELECT DISTINCT country
FROM Suppliers
ORDER BY Country
GO

-- Selecciona todos los datos de las columnas "companyname" y "Fax"
-- de la tabla suppliers donde Fax es igual a null
SELECT companyname, Fax
FROM Suppliers
WHERE Fax IS NULL
GO

-- Selecciona todos los datos de las columnas "companyname" y "country"
-- de la tabla suppliers donde "country" sea igual a "Japan" o "Italy"
SELECT companyname, country
FROM Suppliers
WHERE Country IN('Japan', 'Italy')
GO

-- Selecciona todos los datos de las columnas "productname" y unitprice
-- de la tabla products donde el valor numerico de UnitPrice este entre 10 y 20
SELECT productname, unitprice
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20
GO

-- Selecciona todos los datos de las columnas productid, productname, supplierid, unitprice
-- de la tabla products donde ProductName tenga una T al comienzo del nombre o ProductID sea igual a 46
-- y donde el UnitPrice sea mayor a 16
SELECT productid, productname, supplierid, unitprice
FROM Products
WHERE (ProductName LIKE 'T%' OR ProductID = 46)
AND (UnitPrice > 16)
GO

-- Selecciona los primeros 5 datos de las columnas orderid, productid, quantity
-- de la tabla [Order Details] 
-- ordenadas por "quantity" de manera descendente
SELECT TOP 5 orderid, productid, quantity
FROM [Order Details]
ORDER BY quantity DESC
GO

-- Selecciona los primeros 5 datos de las columnas orderid, productid, quantity
-- (si hay datos que son iguales al 5to dato con respecto a la columna Quantity, estos se mostraran)
-- de la tabla [Order Details]
-- ordenadas con respecto a Quantity de manerta descendente
SELECT TOP 5 WITH TIES orderid, productid, quantity
FROM [Order Details]
ORDER BY Quantity DESC
GO

-- Cueta cuantos registros hay registrados en la tabla employees
SELECT COUNT (*)
FROM Employees
GO

-- Selecciona todos los datos de las columnas productid y quantity
-- de la tabla [Order Details]
-- los agrupa por productid y hace la suma de todos los productid iguales
-- muestra los registros donde la suma sea mayor o igual a 30
SELECT productid, SUM(quantity) AS total_quantity
FROM [Order Details]
GROUP BY productid
HAVING SUM(quantity) >= 30
GO

-- Selecciona todos los datos de las columnas productid y quantity
-- de la tabla [Order Details]
-- los agrupa por productid y hace la suma de todos los productid iguales
-- muestra los registros donde la suma sea mayor a 1200
SELECT productid, SUM(quantity) As total_quantity
FROM [Order Details]
GROUP BY productid
HAVING SUM(quantity) > 1200
