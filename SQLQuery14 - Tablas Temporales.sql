--14--Tablas Temporales
/*=================================================================*/

SELECT IDENTITY(INT, 1, 1) AS ID, CustomerID, CompanyName, ContactName, Country 
INTO #TMP_CUSTOMER 
FROM Customers 
ORDER BY Country 

SELECT * FROM #TMP_CUSTOMER 
DROP TABLE #TMP_CUSTOMER 


/****************************************************/
/*Ahora, si la tabla de la cual vamos a obtener la información contiene una columna IDENTITY, 
el motor encontrará que hay 2 columnas INDENTITY en la tabla a generar, produciendo un error.
Para solucionar este problema es necesario convertir la columna IDENTITY de la tabla que causa
el problema al mismo tipo de dato (lo que se hace es quitarle el IDENTITY)
Por ejemplo, la tabla Products de la base de datos Northwind tiene definida la propiedad IDENTITY
en la columna ProductID.*/

SELECT IDENTITY(INT, 1, 1) AS ID, CAST(ProductID AS INT) AS ProductID, ProductName 
INTO #TMP_PRODUCTS 
FROM Products 

SELECT * FROM #TMP_PRODUCTS 
DROP TABLE #TMP_PRODUCTS 