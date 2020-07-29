USE [DBComedor]
GO
UPDATE top(1000) [Asistencia].[dbo].[Empleados]
   SET Sancionado =cast( (SELECT top(1) [IdSexo]  FROM [dbElectores].[dbo].[Electores2019] t where t.Cedula COLLATE DATABASE_DEFAULT = Cedula2 COLLATE DATABASE_DEFAULT)  as varchar(100) )
 WHERE Sancionado is null
GO



