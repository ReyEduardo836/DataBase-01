-- Creacion de Login de acceso (entidad de seguridad) mediante usuario del sistema operativo
CREATE LOGIN [DESKTOP-K1R9BD8\User] FROM WINDOWS

--Creacion de login de acceso (entidad de seguridad) mediante autenticacion de SQL
CREATE LOGIN Especialista WITH PASSWORD = '1234'

USE Northwind
GO 
-- SP_ADDUSER <LoginName>, <NameInDB>
SP_ADDUSER Especialista, Especialista
GRANT SELECT ON Employees TO Especialista
GRANT SELECT ON Orders TO Especialista
GRANT INSERT ON Employees TO Especialista
GRANT UPDATE ON Employees TO Especialista
 
-- dando permiso a un procedimiento almacenado
GRANT EXECUTE ON [dbo].[Ten Most Expensive Products] TO Especialista
-- quitando permiso a un procedimiento almacenado
REVOKE EXECUTE ON [dbo].[Ten Most Expensive Products] TO Especialista 

-- dando permiso a una vista
GRANT SELECT ON [dbo].[Product Sales for 1997] TO Especialista
