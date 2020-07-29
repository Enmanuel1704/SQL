/****** Script for SelectTopNRows command from SSMS  ******/
SELECT COUNT( t1.[Id]), t3.Nombre
      
  FROM [JuegosNacionales].[dbo].[Participantes_09_11] t1 
  left join [dbo].[Tipo] t2 on t2.Id = t1.IdTipo
  left join [dbo].[Zona] t3 on t3.Id = t1.IdZona
  where IdTipo = 3 
  group by t3.Nombre
  order by t3.Nombre

