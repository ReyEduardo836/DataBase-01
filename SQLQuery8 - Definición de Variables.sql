--9--Definición de Variables
/*===============================================================*/
/*Para La Declaracion De Una Variable

    DECLARE @Nombre Tipo

    Declare  : Palabra Reservada Para Declarar Variables
    @Nombre  : Se Le Antepone Una “@” Seguida Con El Nombre De La Variable
    Tipo     : Es Donde Se Especifica el Tipo De Variable
    Set      : Para Asignar Valores Simples
    Select   : Para Asignar Valores Simples O Complejos
    Print    : Para Imprimir El Texto
    –        : Comentar una Linea
    /* Contexto */    : Comentar Varias Lineas*/
--Ejemplo sencillo
	declare @nombre varchar(50)--declara una variable-- @nombre es el identificador de la-- variable de tipo varchar
    set @nombre ='www.devjoker.com'-- El signo = es un operador-- www.devjoker.com es un literal
    print @Nombre -- Imprime por pantalla el valor de @nombre.-- No diferencia mayúsculas ni minúsculas

--Para Estos Ejemplos Se Utiliza La BD “Northwind“	
USE Northwind
DECLARE @NombreVariable NVARCHAR(20)
DECLARE @Id INT
DECLARE @Total INT

SET @NombreVariable = 'TechPeru'
SET @Id = 13
SELECT @Total = COUNT(*) from Products
 
PRINT '@NombreVariable = ' + @NombreVariable
PRINT '@Id = ' + CONVERT(NVARCHAR(20),@Id)
PRINT '@Total = ' + CONVERT(NVARCHAR(20),@Total)
SELECT ProductID,ProductName,UnitPrice FROM Products WHERE ProductID = @Id
--La Variable Puede Ser Utilizada En Cualquier Parte Del Codigo Previamente Declarado


/* Por último veamos como asignar variables a través de un cursor.*/
Select * from Customers

DECLARE @Contacto VARCHAR(100),
	@Compania VARCHAR(100),
	@Titulo VARCHAR(100)
 
DECLARE CDATOS CURSOR 
FOR
  SELECT ContactName , CompanyName, ContactTitle
  FROM Customers

OPEN CDATOS
FETCH CDATOS INTO @Contacto, @Compania, @Titulo
 
WHILE (@@FETCH_STATUS = 0)
BEGIN
	PRINT @Contacto
	PRINT @Compania
	PRINT @Titulo
	FETCH CDATOS INTO @Contacto, @Compania, @Titulo
END
 
CLOSE CDATOS
DEALLOCATE CDATOS
