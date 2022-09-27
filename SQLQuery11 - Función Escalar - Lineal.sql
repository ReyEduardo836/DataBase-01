--11--Función Escalar / Lineal
/*================================================================*/
use Northwind

--Hacer una funcion para calcular el IVA
CREATE FUNCTION dbo.fn_iva(@monto money)
returns money 
AS
  BEGIN
    DECLARE @iva money
    SET @iva=@monto*0.15
    return @iva
  END

-- llamado de la funcion dbo.fn_iva desde el select
SELECT UnitPrice,dbo.fn_iva(UnitPrice) AS IVA
FROM Products


/*****************************************************/
--Crear una funcion que borre los espacios tanto de la derecha como de la izquierda.

CREATE FUNCTION fn_espacios (@frase varchar(30))
returns varchar(30)
AS
BEGIN
		DECLARE @cadena varchar(30)
		SET @cadena=LTRIM(RTRIM(@frase))
		return @cadena
END


SELECT dbo.fn_espacios(' Alex ')

/********************************************************/
--Crear una funcion que devuelva el precio en cordobas
CREATE FUNCTION fn_cordobas (@monto_dolares money, @tipo_cambio money)
returns money
AS
BEGIN
	DECLARE @monto_cordobas money
	SET @monto_cordobas=@monto_dolares*@tipo_cambio
	RETURN @monto_cordobas
END

SELECT dbo.fn_cordobas(30,26.2) AS CORDOBAS
/******************************************************/
--Funciones con valores de tablas de varias instrucciones
--Crear una funcion que ingrese "C" (corto) si se desea visualizar solo el ID y apellido
-- del empleado,y "L" (largo) si se desea visualizar ID, nombre y apellido del empleado.
CREATE FUNCTION fn_tabla2 (@tipo char(1))
RETURNS @fn_empleados TABLE(ID int PRIMARY KEY NOT NULL,
                             nombre nvarchar(61) NOT NULL)
AS
BEGIN
  IF upper(@tipo)='L'
    INSERT @fn_empleados
	SELECT EmployeeID,(FirstName+'  '+LastName) AS NOMBRE
	FROM Employees
 ELSE IF upper(@tipo)='C'
    INSERT @fn_empleados
	SELECT EmployeeID,LastName 
	FROM Employees
RETURN 
END

SELECT * FROM dbo.fn_tabla2('C')
/***********************************************************/
--Crear una funcion que muestre el ID, cliente. Filtradas por la region
CREATE FUNCTION fn_CustomerNameInRegion (@RegionParameter varchar(30))
RETURNS table
AS
RETURN(
   SELECT CustomerID, CompanyName
   FROM Customers 
   WHERE Region=@RegionParameter)


   SELECT * FROM fn_CustomerNameInRegion('WA')
/**************************************************/
   --Crear una funcion que nos permita seleccionar aleatoriamente "N"
   --cantidad de registros de la tabla Products
   CREATE VIEW v_r
   AS
   SELECT rand() AS number

   CREATE FUNCTION fn_productos (@num int)
   RETURNS @prod TABLE
            (codigo int, nombre varchar(40))
   AS 
   BEGIN
    DECLARE @reg_azar int, @i int, @j int, @nr int
	SET @i=0
	SELECT @nr=COUNT(*) FROM products
	WHILE @i<@num
	   BEGIN
	      SET @reg_azar=CAST((SELECT number FROM v_r)*@nr+1 AS int)
		  SELECT @j=COUNT(*) FROM @prod WHERE codigo=@reg_azar
		  IF @j=0
		       BEGIN
			       SET @i=@i+1
				   INSERT @prod
				   SELECT ProductID,ProductName FROM Products
				   WHERE ProductID=@reg_azar
			   END -- del if
		END -- del while
	RETURN
  END -- de la función

 SELECT * FROM dbo.fn_productos(3)