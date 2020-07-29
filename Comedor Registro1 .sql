/****** Script for SelectTopNRows command from SSMS  ******/


SELECT [Cedula_Empleados]
      ,Nombres_Apellidos
      ,[FechaAuto]
      ,[Horarios]
	  ,[Sancion]
	  ,'Esp.'=case when Especiales = 1 then 'Si' else 'No' end
	  ,Condicion
  FROM [DBComedor].[dbo].[Fecha_Come] 
  inner join [dbo].[Empleados] on Cedula_Empleados = Cedula
  where [FechaAuto] >= '2018-04-19' --and [FechaAuto] <= '2018-04-11' 
  order by Id
 

