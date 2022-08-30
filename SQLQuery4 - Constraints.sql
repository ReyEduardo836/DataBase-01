/*===============================================*/
--1.-- Creación de Bases de Datos con SQL
/*================================================*/

--Creación de una base de Datos
Create Database Ejemplo
on
Primary
( Name=EmploData,
filename='D:\Respaldos BD\ejemplo.mdf' ,
 size = 10MB,     --el Mínimo es 512Kb, el predeterminado es 1MB,     
maxsize=15MB,
Filegrowth=20%      -- Incremento o crecimiento default es 10%, minimo es 64KB
)
log on
( Name=EmploData_log,
filename='D:\Respaldos BD\ejemplo.ldf',
size=3MB,          --el Mínimo es 512Kb, el predeterminado es 1MB,
maxsize=15MB,
Filegrowth=20% --Incremento
)
/********************************************************/
DROP DATABASE Ejemplo -- Eliminar base de datos
/********************************************************/
-- Crear nuevamente la BD Ejemplo para usarla
-- Poner en uso la BD Ejemplo
use Ejemplo

-- Crear tablas de la base de datos
CREATE TABLE Customer
(First_Name char(50),
 Last_Name char(50),
 Address char(50),
 City char(50),
 Country char(25),
 Birth_Date datetime);

-- Borrar una tabla de la bd
DROP TABLE Customer

--Crear tabla con valores predeterminados.
CREATE TABLE Customer
(First_Name char(50),
 Last_Name char(50),
 Address char(50) default 'Unknown',
 City char(50) default 'Masaya',
 Country char(25),
 Birth_Date datetime);

 -- Insertar un registro en la tabla Customer
INSERT INTO Customer
(First_Name,Last_Name,Country,Birth_Date)
 VALUES ('Hilda','Corina','Managua','03/05/1961')

 Select * from Customer
/* NOT NULL
En forma predeterminada, una columna puede ser NULL. Si no desea permitir un valor NULL en una columna, querrá colocar una restricción
en esta columna especificando que NULL no es ahora un valor permitido.
Por ejemplo, en la siguiente instrucción */

DROP TABLE Customer
CREATE TABLE Customer
(SID integer NOT NULL,
Last_Name varchar (30) NOT NULL,
First_Name varchar(30));
--Las columnas “SID” y “Last_Name” no incluyen NULL, mientras que “First_Name” puede incluir NULL.

 -- Insertar un registro en la tabla Customer
INSERT INTO Customer
(SID,Last_Name,First_Name)
 VALUES ('1','Corina',NULL)

 
/* UNIQUE
La restricción UNIQUE asegura que todos los valores en una columna sean distintos.
Por ejemplo, en la siguiente instrucción*/

DROP TABLE Customer
CREATE TABLE Customer
(SID integer Unique,
Last_Name varchar (30),
First_Name varchar(30));
--La columna “SID” no puede incluir valores duplicados, mientras dicha restricción no se aplica para columnas “Last_Name” y “First_Name”.
--Por favor note que una columna que se especifica como clave primaria también puede ser única. Al mismo tiempo, una columna que es 
--única puede o no ser clave primaria.

 -- Insertar un registro en la tabla Customer
INSERT INTO Customer
(SID,Last_Name,First_Name)
 VALUES ('3','Corina',NULL)
 
SELECT * FROM Customer
/*CHECK
La restricción CHECK asegura que todos los valores en una columna cumplan ciertas condiciones.
Por ejemplo, en la siguiente instrucción*/

DROP TABLE Customer
CREATE TABLE Customer
(SID integer CHECK (SID > 2),
Last_Name varchar (30),
First_Name varchar(30));

/*A continuación se presentan ejemplos para la especificación de una clave primaria cuando se crea una tabla: */
--Primera forma: Especificar llave primaria al crear la tabla

DROP TABLE Customer
CREATE TABLE Customer
(SID integer PRIMARY KEY,
Last_Name varchar(30),
First_Name varchar(30));

--Segunda forma: Crear la tabla sin Especificar llave primaria y luego se modifica la tabla
CREATE TABLE Customer
(SID integer not NULL,
Last_Name varchar(30),
First_Name varchar(30));

  --Modificar tabla
ALTER TABLE Customer ADD PRIMARY KEY (SID);

  --Otra forma de modificar la tabla editanto el nombre del Keys a PK_Customer
ALTER TABLE Customer ADD 
CONSTRAINT PK_Customer primary key (SID);

/*En el ejemplo el campo Customer_SID en la tabla ORDERS es una clave externa (FOREIGN) relacionada con la tabla CUSTOMER */
 --Primera forma: Al momento de crear la tabla
DROP TABLE ORDERS

CREATE TABLE ORDERS
(Order_ID integer PRIMARY KEY,
Order_Date datetime,
Customer_SID integer FOREIGN KEY REFERENCES Customer (SID),
--Segunda forma
--Customer_SID integer FOREIGN KEY (Customer_SID) REFERENCES Customer (SID),
Amount float);

  --Tercera Forma: Con restricciones (CONSTRAINT)
CREATE TABLE ORDERS
(Order_ID integer PRIMARY KEY,
Order_Date datetime,
Customer_SID integer,
CONSTRAINT PK_orders2 FOREIGN KEY (Customer_SID) REFERENCES Customer (SID),
Amount float);

  --Cuarta Forma: Creando la tabla sin lleve foreign y luego alterando la tabla
 CREATE TABLE ORDERS
 (Order_ID integer PRIMARY KEY,
  Order_Date datetime,
  Customer_SID integer,
  Amount float);

ALTER TABLE ORDERS
ADD CONSTRAINT PK_order2 FOREIGN KEY (Customer_SID) REFERENCES Customer (SID);

-- Respaldo de la BD
Backup database Ejemplo
to disk = 'D:\Ejemplo.bak'

-- Visualiza los encabezados de las copias de seguridad de la BD 
Restore headeronly from disk = 'D:\Respaldos BD\Ejemplo.bak'

-- Listar los archivos de la BD y registro del conjunto de copia de seguridad
Restore filelistonly from disk = 'D:\Respaldos BD\Ejemplo.bak'
