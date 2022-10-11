-- ROLES DE SERVIDOR

-- dandole un rol de servidor al usuario Especialista
sp_addsrvrolemember Especialista, [sysadmin]
sp_addsrvrolemember Especialista, [dbcreator] -- permite crear bases de datos
sp_addsrvrolemember Especialista, [diskadmin] -- permite crear un dispositivo de almacenamiento en disco
sp_addsrvrolemember Especialista, [securityadmin]

-- quitandole un rol de servidor al usuario Especialsta
sp_dropsrvrolemember Especialista, [sysadmin]
sp_dropsrvrolemember Especialista, [dbcreator]
sp_dropsrvrolemember Especialista, [diskadmin]
sp_dropsrvrolemember Especialista, [securityadmin]


-- ROLES DE BASES DE DATOS

sp_helplogins Especialista 
sp_helpuser Especialista -- para visualizar los roles de bases de datos del usuario

-- dandole un rol de bases de datos al usuario especailista
sp_addrolemember [db_backupoperator], Especialista
sp_addrolemember [db_datareader], Especialista
sp_addrolemember [db_datawriter], Especialista

-- para denegar el acceso de alguna tabla 
DENY SELECT ON Employees TO Especialista

-- quitandole un rol de bases de datos al usuario especailista
sp_droprolemember [db_backupoperator], Especialista
sp_droprolemember [db_datareader], Especialista
sp_droprolemember [db_datawriter], Especialista

-- Creando un rol
CREATE ROLE Digitador 
GO 
GRANT SELECT ON [dbo].[Employees] TO Digitador
GRANT INSERT ON [dbo].[Employees] TO Digitador

-- Asignando nuestro rol creado al usuario Especialista
sp_addrolemember Digitador, Especialista

