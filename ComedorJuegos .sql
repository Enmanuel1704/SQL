/****** Script for SelectTopNRows command from SSMS  ******/
SELECT t2.Cedula,NombresApellidos= t2.Nombre+' '+t2.Apellido
		, t2.Area,t2.Disciplina	
FROM [JuegosNacionales].[dbo].[Comedor] t1
inner join [dbo].[Participantes_09_11] t2 on t2.Id = t1.IdParticipantes 
inner join [DBComedor].dbo.Empleados t3 on t3.Cedula2 = t2.Cedula
WHERE (t1.Fecha >= '2018-12-06') and (t1.Fecha <= '2018-12-07') 
group by t2.Cedula, t2.Nombre+' '+t2.Apellido, t2.Area,t2.Disciplina 
order by  t2.Nombre+' '+t2.Apellido



  

