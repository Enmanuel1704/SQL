﻿USE [DBComedor]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 9/17/2018 10:50:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Nombres_Apellidos] [nvarchar](255) NULL,
	[Cedula] [nvarchar](255) NULL,
	[Funcion] [nvarchar](255) NULL,
	[Departamento] [nvarchar](255) NULL,
	[Condicion] [nvarchar](255) NULL,
	[Especiales] [nvarchar](255) NULL,
	[Telefono] [varchar](15) NULL,
	[Piso] [varchar](15) NULL,
	[Num] [int] IDENTITY(1,1) NOT NULL,
	[Sancionado] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fecha_Come]    Script Date: 9/17/2018 10:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fecha_Come](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sancion] [varchar](100) NULL,
	[Fecha] [varchar](22) NULL,
	[Horarios] [varchar](10) NULL,
	[Cedula_Empleados] [varchar](13) NULL,
	[FechaAuto] [datetime] NULL,
	[Tipo] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pisos_Horario]    Script Date: 9/17/2018 10:50:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pisos_Horario](
	[Pisos] [varchar](15) NOT NULL,
	[Horario] [varchar](10) NULL,
	[Num] [char](1) NULL,
 CONSTRAINT [PK_Pisos] PRIMARY KEY CLUSTERED 
(
	[Pisos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fecha_Come] ADD  DEFAULT (getdate()) FOR [FechaAuto]
GO

 
 
 /****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Id]
      ,[Sancion]
	 ,'Mes' = CASE WHEN  SUBSTRING(Fecha,1,3) = 'Dec' THEN  12  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Nov' THEN  11   
		           WHEN  SUBSTRING(Fecha,1,3) = 'Oct' THEN  10   
		           WHEN  SUBSTRING(Fecha,1,3) = 'Sep' THEN  9   
		           WHEN  SUBSTRING(Fecha,1,3) = 'Aug' THEN  8  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Jul' THEN  7  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Jun' THEN  6  
		           WHEN  SUBSTRING(Fecha,1,3) = 'May' THEN  5  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Apr' THEN  4  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Mar' THEN  3  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Feb' THEN  2  
		           WHEN  SUBSTRING(Fecha,1,3) = 'Jan' THEN  1 
		       END   
      ,[Fecha]
      ,[Horarios]
      ,[Cedula_Empleados]
  FROM [DBComedor].[dbo].[Fecha_Come]


CREATE PROCEDURE OrderByAnioMesDia
AS
begin
  --alter table [DBComedor].[dbo].[Fecha_Come] add Dia int
  --alter table [DBComedor].[dbo].[Fecha_Come] add Mes int
  --alter table [DBComedor].[dbo].[Fecha_Come] add Anio int
  --alter table [DBComedor].[dbo].[Fecha_Come] add Horas varchar(8) 
  
  update [DBComedor].[dbo].[Fecha_Come] set Horas = SUBSTRING(Fecha,13,9)
  update [DBComedor].[dbo].[Fecha_Come] set Dia = SUBSTRING(Fecha,5,2)
  update [DBComedor].[dbo].[Fecha_Come] set Anio = SUBSTRING(Fecha,8,4)

  update [DBComedor].[dbo].[Fecha_Come] set Mes = CASE WHEN  SUBSTRING(Fecha,1,3) = 'Dec' THEN  12  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Nov' THEN  11   
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Oct' THEN  10   
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Sep' THEN  9   
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Aug' THEN  8  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Jul' THEN  7  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Jun' THEN  6  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'May' THEN  5  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Apr' THEN  4  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Mar' THEN  3  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Feb' THEN  2  
		                                               WHEN  SUBSTRING(Fecha,1,3) = 'Jan' THEN  1 
		                                           END 




SELECT [Id]
      ,[Sancion]
      ,[Fecha]
      ,[Horarios]
      ,[Cedula_Empleados]
      ,[Dia]
      ,[Mes]
      ,[Anio]
      ,[Horas]
  FROM [DBComedor].[dbo].[Fecha_Come] order by anio,Mes,Dia



/*
  -----SQL Server 2012
SELECT  IIf ( @i > 0, col1,col2) as col from test
---Other SQL Server versions
SELECT  CASE WHEN  @i > 0 THEN  col1 ELSE col2 END  as col from test
drop table test


declare @ints table(

  num int

)



insert into @ints (num) values (1),(2),(3),(4),(5),(6),(7),(8);



select num

    , mes=case num 

        when 1 then 'uno' 

        when 2 then 'dos' 

        when 3 then 'tres' 

    end

from @ints

*/
end
