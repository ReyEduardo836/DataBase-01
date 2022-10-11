--13--Cursores
/*=====================================================================*/
use Northwind

/*Un cursor es una estructura de datos
creada en memoria RAM producto de una sentencia SELECT y que nos 
permite navegar dentro de las filas para obtener la información.
Cuando trabajemos con cursores debemos seguir los siguientes pasos.

-Declarar el cursor, utilizando DECLARE 
-Abrir el cursor, utilizando OPEN 
-Leer los datos del cursor, utilizando FETCH ... INTO 
-Cerrar el cursor, utilizando CLOSE
-Liberar el cursor, utilizando DEALLOCATE*/


--Declarando el cursor
Declare Cursor1 Cursor scroll
   for select * from dbo.customers
--Abrir el cursor
Open Cursor1
--Navegar
Fetch first from Cursor1
Fetch next from Cursor1
Fetch last from Cursor1
Fetch prior from Cursor1

--select * from Customers
--cerrar el cursor
Close Cursor1
--liberar de memoria
Deallocate Cursor1
 
/*La sintaxis general para trabajar con un cursor es la siguiente.
– Declaración del cursor

DECLARE [NOMBRE CURSOR] CURSOR [ LOCAL | GLOBAL ]
[ FORWARD_ONLY | SCROLL ]
FOR [SENTENCIA DE SQL (SELECT)]
 – Apertura del cursor
OPEN [NOMBRE CURSOR]
 – Lectura de la primera fila del cursor
FETCH [NOMBRE CURSOR] INTO [LISTA DE VARIABLES DECLARADAS]
WHILE (@@FETCH_STATUS = 0)
BEGIN   
  – Lectura de la siguiente fila de un cursor
  FETCH [NOMBRE CURSOR] INTO [LISTA DE VARIABLES DECLARADAS]
  – Fin del bucle WHILE
END
– Cierra el cursor
CLOSE [NOMBRE CURSOR]
– Libera los recursos del cursor
DEALLOCATE [NOMBRE CURSOR]*/
 
/*El siguiente ejemplo muestra un cursor usando la base de datos northwind. 
Ejemplo 2 Cursores*/
Declare @codigo varchar(5), @compania varchar(200),
        @contacto varchar(150), @pais varchar(100)

Declare Ccustomers cursor GLOBAL
     for Select customerid, companyname, contactname,country 
	 from customers
Open Ccustomers
fetch Ccustomers into @codigo, @compania, @contacto,@pais
while(@@fetch_status=0)
  begin
   print @codigo +' '+ @compania +' '+ @contacto +' '+@pais
   fetch Ccustomers into @codigo, @compania, @contacto, @pais
  end
close Ccustomers
deallocate Ccustomers
 

/*Cuando trabajamos con cursores, la función
@@FETCH_STATUS nos indica el estado de la última instrucción
FETCH emitida, los valores posibles son:
Valor devuelto
 0 La instrucción FETCH se ejecutó correctamente.
-1 La instrucción FETCH no se ejecutó correctamente o la fila estaba más
   allá del conjunto de resultados.
-2 Falta la fila recuperada.*/
 
/*Para actualizar los datos de una tabla utilizando un cursor debemos
especificar FOR UPDATE después de la sentencia SELECT en la declaración 
del cursor, y WHERE CURRENT OF [Nombre Cursor] en la sentencia UPDATE 
tal y como muestra el siguiente ejemplo.*/
--Ejemplo 3 Cursores Actualizar datos
Declare 
@codigo1 varchar(5),
@compania1 varchar(200),
@contacto1 varchar(150),
@pais1 varchar(100)

Declare Ccustomers1 cursor 
     for Select customerid, companyname, contactname,country
     from customers FOR UPDATE
Open Ccustomers1
--select * from Customers
fetch Ccustomers1 into @codigo1, @compania1, @contacto1,@pais1

while(@@fetch_status=0)
 begin
   UPDATE customers
   set companyname= @compania1 + '-Modificado'
   where current of Ccustomers1
 
   fetch Ccustomers1 into @codigo1, @compania1, @contacto1,@pais1
 end
 close Ccustomers1
 deallocate Ccustomers1


 SELECT CompanyName FROM Customers

/***************************************************/
CREATE PROCEDURE Ventas_Vendedor @id_vendedor int
AS 
Begin
  Declare @Cantidad int, @Nombre varchar(50), @id int
  DECLARE Ventas CURSOR 
   FOR 
   Select E.[EmployeeID], count(o.OrderID) as Cantidad, E.FirstName from Orders O
   inner join Employees E on E.EmployeeID = O.EmployeeID
   group by E.FirstName, E.[EmployeeID]

  OPEN Ventas
  FETCH  Ventas INTO  @id, @Cantidad, @Nombre
  If(@id = @id_vendedor)
   Begin
     print @Nombre
     print @Cantidad
   end
  WHILE (@@FETCH_STATUS = 0)
   Begin
    FETCH  Ventas INTO @Id, @Cantidad, @Nombre
    If(@id = @id_vendedor)
      Begin
        print @Nombre
        print @Cantidad
      end
   end
 CLOSE Ventas
 DEALLOCATE  Ventas
End

--Ejecutar procedimiento
 exec Ventas_Vendedor 5  
