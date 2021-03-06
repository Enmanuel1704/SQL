/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [CODIGO]
      ,[CODBAR]
      ,[FECHA]
      ,[PH1]
      ,[PH2]
      ,[PH3]
      ,[PH4]
      ,[PH5]
      ,[PH6]
      ,[PH7]
      ,[PH8]
      ,[DESCRIP],id
      
  FROM [PONCHE].[dbo].[Ponches]-- where DESCRIP ='Tardanza/Salida Tarde'
  
   where CODBAR=1802 order by FECHA 

  

  declare @i int
  declare @p1 varchar(10), @p2 varchar(10) , @des varchar(max)
  
  declare c_yo cursor for SELECT  id FROM [PONCHE].[dbo].[Ponches] where CODBAR=1802 order by NEWID() 
  declare c_ayu cursor for SELECT top(20) [PH1]   ,[PH2], DESCRIP FROM [PONCHE].[dbo].[Ponches] where DESCRIP ='Tard.  en Gracia'
  
  open c_ayu
  open c_yo 
  
  FETCH NEXT FROM c_yo INTO @i
  FETCH NEXT FROM c_ayu INTO @p1,@p2,@des
  
  WHILE @@FETCH_STATUS = 0  
  BEGIN

	  update [PONCHE].[dbo].[Ponches] set PH1=@p1,PH2=@p2,DESCRIP=@des where id = @i
  
	  FETCH NEXT FROM c_yo INTO @i
	  FETCH NEXT FROM c_ayu INTO @p1,@p2,@des
  end
   CLOSE c_yo  
   DEALLOCATE c_yo
   CLOSE c_ayu  
   DEALLOCATE c_ayu
	  
	



