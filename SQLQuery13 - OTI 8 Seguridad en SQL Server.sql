/* Crear un login llamado "sesion10" con pasword 123
y agregar el Usuario 10 a la conexion */
CREATE LOGIN [sesion 10] WITH PASSWORD = '123'

USE Northwind
GO
SP_ADDUSER [sesion 10]

/* Asignar el rol ddladmin al usuario 10 */
sp_addrolemember [db_ddladmin], [sesion 10]

/*Negar los permisos de creación de vistas y procedimientos
almacenados al Usuario10*/REVOKE CREATE VIEW TO [sesion 10]REVOKE CREATE PROCEDURE TO [sesion 10]/*Crear un rol de base de datos llamado: Auditoria*//* 5) Asignar al rol Aditoria los permisos de:
- Selección en todas las tablas
- Escritura en las tablas de employees, customers y categories
- Permisos de actualizado en los campos country y city en la tabla
de empleados */CREATE ROLE AuditoriaGOGRANT SELECT TO AuditoriaGRANT INSERT ON Employees TO AuditoriaGRANT INSERT ON Customers TO AuditoriaGRANT INSERT ON Categories TO AuditoriaGRANT UPDATE ON Employees(Country, City)TO Auditoria/* Asignar el rol de auditoria al usuario */sp_addrolemember Auditoria, [sesion 10]/* Negarle el permiso de selección en la tabla orders y order
details */
DENY SELECT ON Orders TO [sesion 10]
DENY SELECT ON [Order Details] TO [sesion 10]