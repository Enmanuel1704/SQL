
SELECT [Cedula_Empleados]
      ,Nombres_Apellidos
      ,[FechaAuto]
      ,[Horarios]
	  ,'Esp.'=case when Especiales = 1 then 'Si' else 'No' end
	  ,Condicion,
	  case when Tipo is null or Tipo = 'null' then '' else Tipo end as 'Tipo'
  FROM [DBComedor].[dbo].[Fecha_Come] 
  left join [dbo].[Empleados] on Cedula_Empleados = Cedula
  where [FechaAuto] >= '2018-07-11' and [FechaAuto] <= '2018-07-30' 
  order by tipo,Id
 

 