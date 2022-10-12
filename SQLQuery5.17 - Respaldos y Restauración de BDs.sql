
/* Respaldo de Bases de datos
   Full
   Diferencial (Una copia de seguridad diferencial es una copia de los
        datos creados y modificados desde la última copia de seguridad 
		completa.)
   Registro transacciones log */

--Los Backup Full se pueden ejecutar unicamente fuera de la misma BD
use master

/* Drop database Northwind
restore database Northwind
from disk ='D:\Respaldos BD\Northwind.bak'
with replace */
use Northwind

--Modelo de recuperacion Completa
/*Alter Database Northwind
Set RECOVERY FULL*/

--Modelo de recuperacion Registro Masivo
Alter Database Northwind
Set RECOVERY BULK_LOGGED

--Modelo de recuperacion Simple 
--Log de transacciones es pequeño y no permite hacer backup de Log de Trasacciones
/*Alter Database Northwind
Set Recovery SIMPLE*/

Backup database Northwind
to disk = 'D:\Respaldos BD\Northwind.bak'
with 
name = 'Backup Full',
Description= 'Backup Full Northwind 10/10/2022'

--Visualiza toda la información de la copia de seguridad 
Restore headeronly from disk = 'D:\Respaldos BD\Northwind.bak'

--Crear una tabla para modificar la BD
Create table Respaldo (Id int)

-- Backup Diferencial
Backup database Northwind
to disk = 'D:\Respaldos BD\Northwind.bak'
with 
name = 'Backup Diferencial 2',
Description= 'Backup Diferencial Northwind 10/10/2022',
Differential

Insert into Respaldo values (1)

-- Backup Log (Hace respaldo solo del registro de transacciones)
Backup log Northwind
to disk = 'D:\Respaldos BD\Northwind.bak'
with 
name = 'Backup Log 1',
Description= 'Primer Backup log de Northwind 22/05/2022'


Insert into Respaldo values (2)

Backup log Northwind
to disk = 'D:\Respaldos BD\Northwind.bak'
with 
name = 'Backup Log 2',
Description= 'Segundo Backup log de Northwind 25/05/2022'

Insert into Respaldo values (3)

Backup log Northwind
to disk = 'D:\Respaldos BD\Northwind.bak'
with 
name = 'Backup Log 3',
Description= 'Tercer Backup log de Northwind 25/05/2022'


-- Agregando un Segundo backup diferencial
Backup database Northwind
to disk = 'D:\Respaldos BD\Northwind.bak'
with 
name = 'Backup Diferencial II',
Description= 'Backup Diferencial II Northwind 25/05/2022',
Differential

--Visualiza toda la información de la copia de seguridad 
Restore headeronly from disk = 'D:\Respaldos BD\Northwind.bak'

-- Borrar la BD Northwind y restaurarla por backup realizado
use master
Drop database Northwind

Restore database Northwind
from disk ='D:\Respaldos BD\Northwind.bak'
with file = 1,  --2,3,4,5
norecovery -- utilizar "recovery" para terminar la recuperación de la BD

use Northwind
go

Select * from Respaldo

