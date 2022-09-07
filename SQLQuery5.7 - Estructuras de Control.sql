--7--Estructuras de Control 
/*****************************************************************/
use Northwind

-- Declaración de Variables
DECLARE @Web varchar(100), @diminutivo varchar(3)
SET @diminutivo = 'DJK'
IF @diminutivo = 'DJK'
  BEGIN
     PRINT 'www.devjoker.com'
  END
ELSE
  BEGIN
     PRINT 'Otra Web (peor!)'
  END 

/* La variable @TotalProducts actualizada dentro del SELECT */
DECLARE @TotalProductos INT
SELECT @TotalProductos = COUNT(*) FROM Products
PRINT @TotalProductos


--SELECT @TotalProductos AS TOTAL
IF @TotalProductos > 100
 PRINT 'Existen Mas De 100 Productos'
ELSE
 PRINT 'Existen Menos De 100 Productos'

 /***********************************************/
 -- La estructura IF admite consultas: 
 IF (SELECT COUNT(*) FROM Products WHERE UnitsInStock>=100)> 6
 BEGIN
   PRINT 'Existen Mas De 6 Productos Con Mas De 100 Unidades En Stock'
   SELECT ProductName,UnitsInStock
   FROM Products
   WHERE UnitsInStock > 100
 END
ELSE
   PRINT 'No Hay Productos Con Mas De 100 Unidades En StocK'
 
 /*********************************************************/
 --La estructura IF admite el uso de subconsultas:
DECLARE @CategoryID int, @descripcion varchar(255)
set @CategoryID = 5
set @descripcion = 'Cheeses'
IF EXISTS(SELECT * FROM Categories WHERE CategoryID= @CategoryID)
  BEGIN
    UPDATE Categories
    SET Description = @descripcion
    WHERE CategoryID = @CategoryID
  END
ELSE
  BEGIN
     INSERT INTO Categories
     (CategoryID, Description) 
     VALUES (@CategoryID, @descripcion)
 END

/*La estructura condicional CASE permite evaluar una expresion y devolver un valor u otro.
La sintaxis general de case es:
   CASE
   WHEN THEN
   WHEN THEN
   ELSE — Valor por defecto
   END
Ejemplo de CASE.*/

Select Precio =
 CASE
 WHEN UnitPrice is null THEN 'Desconocido'
 WHEN UnitPrice < 10 THEN 'PRECIO ALTO'
 WHEN UnitPrice > 10 THEN 'PRECIO BAJO'
 ELSE 'Cuesta Exactamente 10'
 END
from products

/*********************************************/
-- Ciclo While
Declare @Contador int
set @Contador = 10
while (@Contador > 0)
  begin
     print '@Contador = ' + CONVERT(NVARCHAR,@Contador)
     set @Contador = @Contador -1
  end
