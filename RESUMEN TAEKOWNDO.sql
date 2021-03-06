/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  T1.[Id]
      ,T1.[Nombre]
      ,[Apellido]
      ,TIPO = case when [OpenS] = 1 then 'OPEN CHAMPIONSHIP' else 'OFFICIAL' END
      ,T2.NOMBRE 
      , CARGO =  case when [IdArea] = 1 then 'OC' else 
	  case when [IdArea] = 2 then 'PATU' else 
	  case when [IdArea] = 3 then 'ITO' else 
	  case when [IdArea] = 4 then 'MD' else 
	  case when [IdArea] = 5 then 'PR' else 
	  case when [IdArea] = 6 then 'VOL' else 
	  case when [IdArea] = 7 then 'VIP' else 
	  case when [IdArea] = 8 then 'AT' else 
	  case when [IdArea] = 9 then 'CH' else 'OFFICIAL' END END END END END END END END END
  FROM [JuegosNacionales].[dbo].[Participantes] T1 LEFT JOIN [dbo].[PAIS] T2 ON T2.IDMIO = T1.IdPais



  SELECT  COUNT(Id), 
       CARGO =  case when [IdArea] = 1 then 'OC' else 
	  case when [IdArea] = 2 then 'PATU' else 
	  case when [IdArea] = 3 then 'ITO' else 
	  case when [IdArea] = 4 then 'MD' else 
	  case when [IdArea] = 5 then 'PR' else 
	  case when [IdArea] = 6 then 'VOL' else 
	  case when [IdArea] = 7 then 'VIP' else 
	  case when [IdArea] = 8 then 'AT' else 
	  case when [IdArea] = 9 then 'CH' else 'OFFICIAL' END END END END END END END END END    
  FROM [JuegosNacionales].[dbo].[Participantes] group by IdArea

  --CREATE TABLE PAIS(
  --ID INT IDENTITY(1,1),
  --NOMBRE VARCHAR(100),
  --IDMIO INT
  --)
--  INSERT INTO [dbo].[PAIS] VALUES
--  ('AFRICA', 1),
--('ANTIGUA Y BARBUDA', 2),
--('ARGENTINA', 3),
--('ARUBA', 4),
--('BAHAMAS', 5),
--('BARBADOS', 6),
--('BELICE', 7),
--('BOLIVIA', 8),
--('BRASIL', 9),
--('CANADA', 10),
--('CHILE', 11),
--('COLOMBIA', 12),
--('COSTA RICA', 13),
--('CUBA', 14),
--('CURAZAO', 15),
--('DOMINICA', 16),
--('ECUADOR', 17),
--('ESTADOS UNIDOS', 18),
--('GRANADA', 19),
--('GUADALUPE', 20),
--('GUATEMALA', 21),
--('GUYANA', 22),
--('HAITI', 23),
--('HONDURA', 24),
--('JAMAICA', 25),
--('MEXICO', 26),
--('NICARAGUA', 27),
--('PANAMA', 28),
--('PARAGUAY', 29),
--('PERU', 30),
--('PUERTO RICO', 31),
--('REPUBLICA DOMINICANA', 32),
--('SALVADOR', 33),
--('SAN CRISTOBAL Y NIEVES', 34),
--('SAN VICENTE Y LA GRANADINA', 35),
--('SANTA LUCIA', 36),
--('SURINAM', 37),
--('TRINIDAD Y TOBAGO', 38),
--('URUGUAY', 39),
--('VENEZUELA', 40)
