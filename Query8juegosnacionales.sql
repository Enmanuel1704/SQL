/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
		qr,t1.id,[Cedula]
      ,	t1.[Nombre]
      ,[Apellido]
      ,[Area] as Deporte
      ,[Disciplina] 
	  ,TieneImg
      ,t2.Nombre as Zona
  FROM [JuegosNacionales].[dbo].[Participantes_09_11] t1
  left join [dbo].[Zona] t2 on t1.IdZona = t2.Id
  where cedula = '00114840002' --t1.Nombre like '%enmanuel%' 
 -- where IdTipo = 7
  -- and IdZona=1
 --where IdTipo = 22 or IdTipo = 21--and IdZona>=1 -- 8895 - 9107
  order by  idtipo

 -- update [Participantes_09_11] set Comida = 1 where idtipo = 20
 
  --delete from [Participantes_09_11]  where cedula = '40214478089'
  

