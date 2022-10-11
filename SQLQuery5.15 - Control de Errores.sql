--15--Control de Errores / Transacciones
/*================================================================*/
use Northwind

--Select * from Products

--Vamos a realizar una transacción que modifica el precio de dos productos de la base de datos.
--Declaramos una variable que utilizaremos para almacenar un posible código de error
DECLARE @Error int
                            
--Iniciamos la transacción
BEGIN TRAN
  UPDATE Products SET UnitPrice=20 WHERE ProductName = 'Chai'
   --Almacenar el codigo de error 
  SET @Error=@@ERROR
  PRINT @Error
   --Si ocurre un error se almacena el error en la variable @Error
   --y se salta al trozo de código que deshace la transacción con un GOTO, 
   --pero no pasa nada por usarlo cuando sea necesario.
  IF (@Error<>0) GOTO TratarError
     --Si la primera sentencia se ejecuta con éxito, pasamos a la segunda
  UPDATE Products SET UnitPrice=20 WHERE ProductName='Chang'
  SET @Error=@@ERROR
     --Y si hay un error hacemos como antes
  IF (@Error<>0) GOTO TratarError
     --Si llegamos hasta aquí es que los dos UPDATE se han completado con
     --éxito y se puede "guardar" la transacción en la base de datos
COMMIT TRAN 

 --Si ha ocurrido algún error el compilador salta a esta instrucción
TratarError:
  If (@@Error<>0) 
    BEGIN
      PRINT 'Ha ecorrido un error. Abortamos la transacción'
       --Se lo comunicamos al usuario y deshacemos la transacción
       --todo volverá a estar como si nada hubiera ocurrido
      ROLLBACK TRAN
   END 


/*********************************/
CREATE PROCEDURE GetCustomers @CustomerID1 nvarchar(5), @CustomerID2 nvarchar(5)
AS
  DECLARE @err_message nvarchar(255)

--if no customers found return SEV 11 error to abort stored procedure
IF NOT EXISTS (Select CustomerID from Customers where CustomerID = @CustomerID1 or CustomerID = @CustomerID2) 
	BEGIN	
	 SET @err_message = @CustomerID1 + ' and ' + @CustomerID2 + ' Not found raise sev 11'
	 RAISERROR (@err_message,11,1)
	END

 --if 1st customerid not found throw SEV 10 exception
IF EXISTS (Select CustomerID from Customers where CustomerID = @CustomerID1)
	BEGIN
	  select * from Customers where CustomerID = @CustomerID1
	END
ELSE
	BEGIN
	  SET @err_message = @CustomerID1 + ' not found raise sev 10'
      RAISERROR (@err_message,10, 1) 	
	END

--if 2nd customerid not found throw SEV 10 exception
IF EXISTS (select * from Customers where CustomerID = @CustomerID2)
	BEGIN
	  select * from Customers where CustomerID = @CustomerID2
	END
ELSE
	BEGIN
	  SET @err_message = @CustomerID2 +  ' not found raise sev 10'
      RAISERROR (@err_message,10, 1) 
	END


EXEC GetCustomers HOLA,BERGS
