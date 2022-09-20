--10--Procedimientos Almacenados
/*===============================================================*/
--Prodecimientos Almacenado con argumento de entrada
use Northwind

CREATE PROC HOL @hola int 
AS
  SELECT * 
  FROM Products 
  WHERE ProductID=@hola

  -- Ejecutar un Procedimiento Almacenado

EXEC HOL 5
/***************************************************************/
--Crear un procedimiento que obtenga los productos de un proveedor
CREATE PROCEDURE PROD_PROV1 @cod int
AS
  SELECT *
  FROM Products
  WHERE SupplierID=@cod

EXEC PROD_PROV1 5
/***********************************************************/
--Hacer un procedimiento que elimine una orden de compra
CREATE PROCEDURE elimina_orden @COD int
AS
   DELETE FROM [Order Details]
   WHERE OrderID=@COD
   DELETE FROM Orders
   WHERE OrderID=@COD

 SELECT OrderID FROM [Order Details]

EXEC elimina_orden 10590

-- Eliminar un Procedimiento Almacenado con DROP PROCEDURA NombreProcedimiento
DROP PROCEDURE elimina_orden

/*****************************************************/
--Crear un SP para cambiar el stock de un producto
--DROP PROCEDURE ACTUALIZAR
CREATE PROCEDURE ACTUALIZAR @NUEVO smallint, @id int
AS
  UPDATE Products
  SET UnitsInStock=@NUEVO
  WHERE ProductID=@id

  SELECT * FROM Products
  WHERE ProductID=@id

EXEC ACTUALIZAR 100,2
/*************************************************/
--Crear un SP cuantos productos han sido vendidos por los empleados en el año 1996
CREATE PROCEDURE empleado_unid @anio int
AS
 SELECT YEAR(Orders.OrderDate) AS ANIO,(Employees.LastName+''+Employees.FirstName) AS empleado,
 SUM([Order Details].Quantity) AS TOTAL
 FROM Employees INNER JOIN Orders ON Employees.EmployeeID=Orders.EmployeeID
 INNER JOIN [Order Details] ON Orders.OrderID=[Order Details].OrderID
 WHERE YEAR(Orders.OrderDate)=@anio
 GROUP BY Employees.LastName,Employees.FirstName,YEAR(Orders.OrderDate)
 ORDER BY Employees.LastName,Employees.FirstName

EXEC empleado_unid 1996
/*************************************************/
--Productos más vendidos, en un determinado año
CREATE PROCEDURE topVentas1 @num int, @anio int
AS
  SELECT TOP (@num) p.ProductName, (SUM(OD.Quantity*P.UnitPrice)) AS MONTO
  FROM [Order Details] AS OD INNER JOIN Orders AS O ON O.OrderID=OD.OrderID
  INNER JOIN Products AS P ON P.ProductID=OD.ProductID
  WHERE YEAR(O.OrderDate)=@anio
  GROUP BY P.ProductName
  ORDER BY (SUM(OD.Quantity*P.UnitPrice)) DESC

EXEC topVentas1 10,1996
/*************************************************************/
--Productos no vendidos en un determinado año (como sabemos que el producto no existe en otra tabla)
CREATE PROC prod_novendidos @anio int
AS
   SELECT ProductID,ProductName
   FROM Products
   WHERE ProductID NOT IN(SELECT OD.ProductID FROM [Order Details] AS OD
   INNER JOIN Orders AS O ON O.OrderID=OD.OrderID
   WHERE YEAR(O.OrderDate)=@anio)

EXEC prod_novendidos 1998
/**************************************************************/
--Buscar frase en el nombre del producto vendido y mostrar el empleado, cantidad, nombre producto 
--Alter PROC (Para modificar un procedimiento almacenado)         

Alter PROC frase @fra varchar(40) 
AS
  SELECT E.LastName, SUM(OD.Quantity) AS CANTIDAD, P.ProductName
  FROM Employees AS E 
   INNER JOIN Orders AS O ON E.EmployeeID=O.EmployeeID
   INNER JOIN [Order Details] AS OD ON O.OrderID=OD.OrderID
   INNER JOIN Products AS P ON OD.ProductID=P.ProductID
  WHERE P.ProductName LIKE @fra
  GROUP BY E.LastName,P.ProductName
  ORDER BY E.LastName,P.ProductName

EXEC frase 'Q%'  /******OJO*****/
/************************************************************************/
/*--Mostrar las cantidades de ordenes en un determinado año, cuyo envío sea menor a los días X transcurridos*/
 Select * from Orders
CREATE PROC diastranscur @d int, @anio int
AS
 SELECT COUNT(OrderID) AS cantord, DATEDIFF(DAY,ShippedDate,RequiredDate) AS dias_tras
 FROM Orders
 WHERE (DATEDIFF(DAY,ShippedDate,RequiredDate)<@d) AND YEAR(RequiredDate)=@anio
 GROUP BY DATEDIFF(DAY,ShippedDate,RequiredDate)


EXEC diastranscur 3,1996
/****************************************************************/
--Generar un numero al azar y al comparar con los empleados, y muestre al ganador
CREATE PROC GANADOR
AS
  DECLARE @AZAR int
  DECLARE @AUX int

  SET @AUX=(SELECT COUNT(*) FROM Employees)
  SET @AZAR=CAST((RAND()*@AUX) AS int)

  SELECT LastName
  FROM Employees
  WHERE EmployeeID=@AZAR

EXEC GANADOR


/***********************************************************************/
--Crear un PS que muestre el numero de la orden, el año de la orden, el total 
--pagado por la orden. Solo mostrar las ordenes segun el año ingresado al PS

CREATE PROCEDURE ordenar @anio int
AS
 SELECT O.OrderID,YEAR(o.OrderDate) AS Año,SUM(OD.Quantity) AS TPRODUCTO,
 SUM(OD.UnitPrice*OD.Quantity) AS MONTO
 FROM Products AS P 
 INNER JOIN [Order Details] AS OD ON P.ProductID=OD.ProductID
 INNER JOIN Orders AS O ON OD.OrderID=O.OrderID
 WHERE YEAR(OrderDate)=@anio
 GROUP BY O.OrderID, YEAR(O.OrderDate)

EXEC ordenar 1998
