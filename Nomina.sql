/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [No#]
      ,[Empleado]
      ,[Lugar Funciones]
      ,[Estatus]
      ,[Función]
      ,t1.[Cedula]
      ,[Sueldo]
      ,[AFP]
      ,[ISR]
      ,[Seguro Fam#Salud]
      ,[SFS Salud Padres]
      ,[Seguro Vida]
      ,[Seguro Funerario INAVI]
      ,[Otros Desc#]
      ,[Total Desc#]
      ,[Aporte Fondos Pensiones]
      ,[Aporte Seguro Riesgo Laboral]
      ,[Aporte Seguro Familiar Salud]
      ,[Total Aportes]
  FROM [Nominas].[dbo].[Fijo$] t1
  left join [Hoja1$] t2 on t1.Cedula = t2.Cedula

   where  t2.Nombre is not null 

   order by No#

------------------------------------------------------------------------------
   SELECT [No#]
      ,[Empleado]
      ,[Lugar Funciones]
      ,[Estatus]
      ,[Función]
      ,[Cedula/Pasaporte]
      ,[Fecha Ingreso]
      ,[Fecha Vencimiento]
      ,[Sueldo]
      ,[AFP]
      ,[ISR]
      ,[Seguro Fam#Salud]
      ,[SFS Salud Padres]
      ,[Seguro Vida]
      ,[Serv#Funerario INAVI]
      ,[Otros Desc#]
      ,[Total Desc#]
      ,[Aporte Fondos Pensiones]
      ,[Aporte Seguro Riesgo Laboral]
      ,[Aporte Seguro Familiar Salud]
      ,[Total Aportes]
  FROM [Nominas].[dbo].[Contratados$] t1
  right join [Hoja1$] t2 on t1.[Cedula/Pasaporte] = t2.Cedula

   where  t2.Nombre is not  null 
   order by No#


   ----------------------------------------------------------------------------------


   SELECT  [Asegurado]
      ,[Nombre]
      ,[Fecha Nacimiento]
      ,t1.[Cedula]
	  ,t2.[Cedula/Pasaporte]
	  ,t3.Cedula
      ,[Valor Muerte]
      ,[Valor Pago Anticipo]
      ,[Valor Muerte Accidental]
      ,[Valor Ult# Gastos]
      ,[Prima Muerte]
      ,[Prima Pago Anticipo lM]
      ,[Prima Muerte Accidental]
      ,[Prima Ult# Gastos]
      ,[Total Prima]
  FROM [Nominas].[dbo].[Hoja1$] t1

 left join [Contratados$] t2 on t1.Cedula = t2.[Cedula/Pasaporte]
 left join [Fijo$] t3 on t1.Cedula = t3.Cedula

  where t3.Cedula is null and t2.[Cedula/Pasaporte] is null
  
  
   order by Nombre



