/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Puerta]
      ,[NombreUsuario]
      ,[Adulta]
      ,[Fecha]
  FROM [Encuesta].[dbo].[Peatones] where Fecha > '2018-05-10' order by Fecha