


/****** Script for SelectTopNRows command from SSMS 
SELECT  COUNT( [Id]) as Cantidad
      ,Fecha=CONVERT(varchar, Fecha,111)
	  
  FROM [JuegosNacionales].[dbo].[Comedor] 
  group by  CONVERT(varchar, Fecha,111) 
  order by Fecha 
   create table RegistroDetallado (
	Total int,
	Desayuno int,
	Comida int,
	Cena int,
	Fecha varchar(13)
	)******/

  ------------------------------------------------------------------------
 
  declare @desayuno int, @comida int, @cena int
  declare @cantidad int, @fecha varchar(13)
  delete from RegistroDetallado
  declare c_TotalFechas cursor for SELECT  COUNT( [Id]) as Cantidad,Fecha=CONVERT(varchar, Fecha,111) FROM [JuegosNacionales].[dbo].[Comedor] group by  CONVERT(varchar, Fecha,111)  order by CONVERT(varchar, Fecha,111) 

  open c_TotalFechas

  while (1=1)
  BEGIN
	fetch next from c_TotalFechas into @cantidad, @fecha
	if @@FETCH_STATUS != 0
	begin
		select * from RegistroDetallado 
		break
	end
	select @desayuno= COUNT(id) from [JuegosNacionales].[dbo].[Comedor] where Fecha >= @fecha+' 01:00:00' and Fecha <= @fecha+' 11:00:00'
	select @comida= COUNT(id) from [JuegosNacionales].[dbo].[Comedor] where Fecha >= @fecha+' 11:00:01' and Fecha <= @fecha+' 16:00:00'
	select @cena= COUNT(id) from [JuegosNacionales].[dbo].[Comedor] where Fecha >= @fecha+' 16:00:01' and Fecha <= @fecha+' 23:59:00'

	insert into RegistroDetallado values (@cantidad,@desayuno,@comida,@cena,@fecha)

	  
  END
  
close c_TotalFechas
deallocate c_TotalFechas



