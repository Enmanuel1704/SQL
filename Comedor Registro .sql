/****** Script for SelectTopNRows command from SSMS  ******/
SELECT Fecha_Come.Cedula_Empleados,Empleados.Nombres_Apellidos,Empleados.Departamento
	  ,Empleados.Piso,Fecha_Come.Horarios,Fecha_Come.Fecha ,Empleados.Condicion,Fecha_Come.Sancion 
FROM [DBComedor].[dbo].[Fecha_Come] inner join Empleados ON Cedula_Empleados = Cedula where Anio=2018 and Mes=3 and Dia >= 26 and Dia <=28 order by Id