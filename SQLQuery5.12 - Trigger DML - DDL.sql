--12--Trigger DML / DDL
/*==============================================================*/
Use Northwind
--Permitir eliminar un solo registro de la tabla order details.
CREATE TRIGGER BorrarOrd
ON [Order Details]
For DELETE
AS
  IF (SELECT COUNT(*) FROM Deleted)>1
   BEGIN
    RAISERROR('Solo puede eliminar un registro a la vez',16,1)
    ROLLBACK TRANSACTION
   END

-- Consultas de verificación del Trigger DELETE
   SELECT *
   FROM [Order Details]
  
-- El trigger se activa solo según la programación del disparador
DELETE FROM [Order Details]
WHERE OrderID=10248 and ProductID = 11


/**************************************************/
--Cuando se inserte un registro en la tabla order details,
--la cantidad se debe restar en el campo unitsinstock de la
--tabla products
CREATE TRIGGER dismunuir_stock
ON [Order Details]
FOR INSERT
AS
   UPDATE P
   SET UnitsInStock=(P.UnitsInStock- I.Quantity)
   FROM Products AS P INNER JOIN INSERTED AS I
   ON P.ProductID=I.ProductID

--Instrucciones de verificación del Trigger INSERT
   SELECT ProductID,ProductName,UnitPrice,UnitsInStock
   FROM Products
   WHERE ProductID=12

   select * from [Order Details] where OrderID = 10260
     
   INSERT INTO [Order Details]
   VALUES(10260,12,14,5,0)
/**************************************************/
-- Cuando se quiere actualizar el nombre de la compañia del proveedor,
-- no debe permitirlo
   CREATE TRIGGER NOM_PROVEEDOR
   ON Suppliers
   FOR UPDATE
   AS
      IF UPDATE(CompanyName)
	  BEGIN
	    RAISERROR('NO PUEDE CAMBIAR EL NOMBRE DE LA COMPAÑIA',10,1)
		ROLLBACK TRANSACTION
      END

--Consultas de verificación del Triger UPDATE
	  select * from Suppliers

	  UPDATE Suppliers
	  SET CompanyName='Juan'
	  WHERE SupplierID=2

/**************************************************/
--Crear una tabla historica que vaya guardando el nombre de la compañia
--(actual nombre y nuevo nombre) de los proveedores. 
--Tabla: Historico (id, actual, nuevo) el id es identity
DROP TRIGGER NOM_PROVEEDOR

CREATE TABLE Historico
( id int IDENTITY(1,1),
  ACTUAL nvarchar(40),
  NUEVO  nvarchar(40)
)

--ALTER TRIGGER (para modificar el trigger una vez que exista)
CREATE TRIGGER HISTORICA
ON Suppliers
FOR UPDATE
AS
   IF UPDATE(CompanyName)
   BEGIN
     DECLARE @C_ACT VARCHAR(50)
	 DECLARE @C_NEW VARCHAR(50)

	 SELECT  @C_ACT=CompanyName FROM DELETED
	 SELECT  @C_NEW=CompanyName FROM INSERTED

	 INSERT INTO Historico
	 (ACTUAL, NUEVO)
	 VALUES (@C_ACT, @C_NEW)
   END

   --Consultad de verificación de trigger
	 UPDATE Suppliers
	 SET CompanyName='Juan'
	 WHERE SupplierID=2

	 SELECT *
	 FROM Historico

	 SELECT * FROM Suppliers Where SupplierID = 2

--Identifique en que escenario se pueden utilizar triggers
--para el Caso 4 del archivo "CASOS DE ESTUDIOS PARA ANALISIS.pdf"