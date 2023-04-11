

create login Vendedor with password = '1234'
create login Programador with password = '1234'

use Northwind
go
sp_adduser Vendedor, visita
sp_adduser ProgramadorBD, Programador

-- Asignacion de Permisos para manipular un esquema
/* 
las tablas, vistas y procedimientos que este usuario cree, 
se crearan con el schema predeterminado: Programador.Comisiones		
*/
grant create table to Programador
grant create view to Programador
grant create procedure to Programador

-- creando un schema y dandole autorizacion de uso a Programador
create schema Ventas authorization Programador

--cambiando el schema de "Programador.Comisiones" al schema "Ventas.Comisiones"
alter schema Ventas transfer Programador.Comisiones

------------------------------------------------------------------------------------

-- dandole permisos en un schema al user Visita
grant select on Schema::Ventas to Visita
grant insert on schema::Ventas to Visita

-- quitandole permisos en un schema al user Visita
revoke insert on schema::Ventas to Visita