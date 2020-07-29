USE [JuegosNacionales]
GO



SELECT t1.[Id]
     
      ,[Cedula]
      ,t1.[Nombre]
      ,[Apellido]
      ,[Disciplina]
      ,t2.Nombre as Tipo,t3.Nombre as Equipo
  FROM [JuegosNacionales].[dbo].[Participantes_09_11] t1
  inner join [JuegosNacionales].[dbo].[Tipo] t2 on t2.Id = t1.IdTipo
  left join [JuegosNacionales].[dbo].Zona t3 on t3.Id =t1.IdEquipo
  where Entregado is null and t1.id <> 8039 and t1.id <> 8031





  SELECT
      t2.Nombre as Tipo,COUNT(t2.id) as Cantidad
  FROM [JuegosNacionales].[dbo].[Participantes_09_11] t1
  inner join [JuegosNacionales].[dbo].[Tipo] t2 on t2.Id = t1.IdTipo
  left join [JuegosNacionales].[dbo].Zona t3 on t3.Id =t1.IdEquipo
  where Entregado is null and t1.id <> 8039 and t1.id <> 8031 --and TieneImg =1
  group by t2.Nombre
 




/*

SELECT [CODIGO]
      ,[CODBAR]
      ,[FECHA]
      ,[PH1]
      ,case when LEN(PH6) >2 then PH6
			when LEN(PH5) >2 then PH5
			when LEN(PH4) >2 then PH4
			when LEN(PH3) >2 then PH3
			else [PH2]
	  end
	  as PH2
	  
      ,[DESCRIP]
  FROM [PONCHE].[dbo].[Ponches] order by CODBAR,FECHA









INSERT INTO [dbo].[Participantes_09_11]
           ([IdTipo]
           ,[IdEquipo]
		   ,[Cedula]
           ,[Nombre]
           ,[Apellido]
		   ,[Area]
           ,[Disciplina]
           ,[P1]
           ,[P2]
           ,[P3]
           ,[P4]
           ,[P5]
           ,[P6]
		   ,[P7]
           ,[P8])
     VALUES

	 (1,1,'co001','JOSE RAMON','PERALTA','PRESIDENTE COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)
,(1,1,'co002','ALEJANDRO','MONTAS','COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)

,(1,1,'co003','FERNANDO','HASBUN','COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)
,(1,1,'co004','NEY','ALDRIN','COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)

,(1,1,'co005','LEO','CORPORAN','ASESOR DEL  COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)

,(1,1,'co006','RAFAEL','URIBE','ASESOR DEL  COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)
,(1,1,'co007','LUISIN','MEJIA','ASESOR DEL  COMITÉ ORGANIZADOR','',1,1,1,1,1,1,1,1)






          (1,1,'00111372868','JOSE AUGUSTO','CASTRO','','',1,1,1,1,1,1,1,1)
,(1,1,'00113908636','JOSE ALBERTO','CASTRO','','',1,1,1,1,1,1,1,1)
,(1,8,'00101594109','ALBERTO','RODRIGUEZ','','',1,1,1,1,1,1,1,1)
,(1,8,'00114304736','YERKIN','FIGUEREO','','',1,1,1,1,1,1,1,1)
,(1,8,'00102352853','AMAURY','DURAN','','',1,1,1,1,1,1,1,1)
,(1,6,'00101609725','ONESIMO','ACOSTA','','',1,1,1,1,1,1,1,1)
,(1,4,'00107321499','RAMON','GONZALEZ','','',1,1,1,1,1,1,1,1)
,(1,2,'00104624101','HECTOR','GIL','','',1,1,1,1,1,1,1,1)
,(1,5,'00102809795','JOSE','BOYON DOMINGUEZ','','',1,1,1,1,1,1,1,1)
,(1,3,'00101031821','AGUSTIN','ESPINOSA','','',1,1,1,1,1,1,1,1)
,(1,3,'00100233527','JHONNY','PEGUERO','','',1,1,1,1,1,1,1,1)
,(1,7,'00111940938','MILTON','DIAZ','','',1,1,1,1,1,1,1,1)

GO


*/