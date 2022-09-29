--16--Secuenciador
/*****************************************************************/
CREATE SEQUENCE dbo.MySequence
 AS INT
   MINVALUE 1
   MAXVALUE 100000
   START WITH 1000


CREATE TABLE dbo.YourTable
 (YourTableId INT NOT NULL,
   AnotherColumn VARCHAR(10))
GO

ALTER TABLE dbo.YourTable
ADD DEFAULT NEXT VALUE FOR dbo.MySequence FOR YourTableId
GO

insert into dbo.YourTable(AnotherColumn) values ('Dato3')

Select * from dbo.YourTable


/***********************************/
CREATE SEQUENCE Identico
AS INT
INCREMENT BY -2
MINVALUE 1
MAXVALUE 1000
START WITH 1000


CREATE TABLE Prueba
(ID INT NOT NULL,
 NOMBRE VARCHAR(10))
GO

ALTER TABLE Prueba
ADD DEFAULT NEXT VALUE FOR Identico FOR ID
GO

insert into Prueba (NOMBRE) values ('Dato3')
Select * from Prueba