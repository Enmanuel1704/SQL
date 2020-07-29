
-- 1) Ahora quisiera saber cuáles fueron las primeras 50 órdenes enviadas. 

SELECT TOP (50) [order_id]
      ,[order_status]
      ,[order_date]
      ,[required_date]
      ,[shipped_date]
	  ,full_name = c.first_name + ' ' + c.last_name  
	  ,c.city
	  ,[ORDER_STATUS_DESCRIPTION]=CASE 
				WHEN order_status = 1 THEN 'PENDING'
				WHEN order_status = 2 THEN 'PROCESSING'
				WHEN order_status = 3 THEN 'REJECTED'
				WHEN order_status = 4 THEN 'COMPLETED'
				ELSE 'N/A' 
		END 
  FROM [BikeStores].[sales].[orders] o
  inner join [sales].[customers] c on o.customer_id = c.customer_id
  where shipped_date is not null
  order by shipped_date asc


/*
2) Ahora que lo pienso puede que diferentes estados tengan ciudades como el mismo nombre.​ 
Agrega al campo customer_city el nombre del estado en formato ‘ciudad, estado’. 
Además, me ha picado la curiosidad me gustaría ver las 10 órdenes más viejas que aún siguen ‘pending’ en el sistema’ 
*/

	SELECT TOP (10) o.[order_id]
      ,o.[order_status]
      ,o.[order_date]
      ,o.[required_date]
      ,o.[shipped_date]
	  ,full_name = c.first_name + ' ' + c.last_name  
	  ,'address'=c.city + ', ' + c.state
	  ,[ORDER_STATUS_DESCRIPTION]=CASE 
				WHEN o.order_status = 1 THEN 'PENDING'
				WHEN o.order_status = 2 THEN 'PROCESSING'
				WHEN o.order_status = 3 THEN 'REJECTED'
				WHEN o.order_status = 4 THEN 'COMPLETED'
				ELSE 'N/A' 
		END 
  FROM [BikeStores].[sales].[orders] o
  inner join [sales].[customers] c on o.customer_id = c.customer_id
  where o.order_status = 1
  order by o.order_date asc

  /*
  3) Ahora me gustaría saber cuáles sucursales (stores) tienen que ordenes pendientes organizadas por que tanto necesito entregarlos. 
  */

  SELECT  
		s.[store_id]
      ,s.[store_name]
      ,s.[phone]
      ,s.[email]
      ,s.[street]
      ,s.[city]
      ,s.[state]
      ,s.[zip_code]
	  ,o.order_id
	  ,o.order_date
	  ,[ORDER_STATUS_DESCRIPTION]=CASE 
				WHEN o.order_status = 1 THEN 'PENDING'
				WHEN o.order_status = 2 THEN 'PROCESSING'
				WHEN o.order_status = 3 THEN 'REJECTED'
				WHEN o.order_status = 4 THEN 'COMPLETED'
				ELSE 'N/A' 
		END
  FROM [BikeStores].[sales].[stores] s
  inner join [sales].[orders] o on s.store_id = o.store_id
  where o.order_status = 1
  order by s.store_name, o.order_date
/*
 4) Por otro lado, me gustaría saber cuáles son los nombres de los productos sacados el 2017 y ordenados por precio de menor a mayor. 
*/

SELECT [product_name]
      ,[model_year]
      ,[list_price]
  FROM [BikeStores].[production].[products]
  where model_year = 2017
  order by list_price asc

  /*
  5) Me gustaría saber de esos productos de 2017 cuales tienen nombre que comienza con T y dice ‘boy’. Puntos extra si solo usan un filtro en el where.
  */
  
SELECT *
  FROM [BikeStores].[production].[products]
  where product_name like 'T%%boy%%2017%'
  order by list_price asc

  /*
  6) Me gustaría saber cuántos clientes hay en ciudades cuyo nombre termine con ‘dale’ como Pitbull. (u.u)
  */
  SELECT [Cantidad costumer]=count( c.customer_id )
	  ,'address'=c.city + ', ' + c.state
  FROM sales.customers C 
  where city like '%dale'
  group by c.city + ', ' + c.state
  order by count( c.customer_id )

  /*
  7) ¿Qué cliente puso la primera orden en el sistema? Necesito el nombre del cliente y la fecha de la orden. 
  */
  SELECT TOP (1) [order_id]
      ,[order_date]
	  ,full_name = c.first_name + ' ' + c.last_name  
  FROM [BikeStores].[sales].[orders] o
  inner join [sales].[customers] c on o.customer_id = c.customer_id
  order by order_date asc,o.order_id asc

  /*
  8) ¿Cuánto ha consumido cada cliente hasta el momento? Necesito el nombre del cliente y la cantidad consumida con descuento aplicado. 
  */
  SELECT  c.first_name+' '+c.last_name as 'Nombres y Apellidos'
		 ,sum(oi.list_price * oi.quantity *(1-oi.discount) ) as 'total'
  FROM [BikeStores].[sales].[orders] o
  right join [sales].[customers] c on o.customer_id = c.customer_id
  inner join sales.order_items oi on oi.order_id = o.order_id
  group by c.first_name+' '+c.last_name
  order by c.first_name+' '+c.last_name asc
  
  --SELECT  c.first_name+' '+c.last_name as 'Nombres y Apellidos'
		-- ,(oi.quantity) as cantidad 
		-- ,(oi.list_price) as 'total de precio'
		-- ,(oi.discount) as 'total descuentos'
		-- ,(oi.list_price*oi.quantity-oi.list_price*oi.quantity*oi.discount) as 'total'
  --FROM [BikeStores].[sales].[orders] o
  --right join [sales].[customers] c on o.customer_id = c.customer_id
  --inner join sales.order_items oi on oi.order_id = o.order_id
  --order by c.first_name+' '+c.last_name asc



  /*
  9) ¿Desde qué tienda se hacen más compras? Necesito el nombre de la tienda y la cantidad de compras realizadas. 
  */  
  SELECT top(1) s.store_name
		,sum(oi.quantity) as cantidad
  FROM [BikeStores].[sales].[orders] o
  right join [sales].[stores] s on s.store_id = o.store_id
  inner join sales.order_items oi on oi.order_id = o.order_id
  group by s.store_name
  order by sum(oi.quantity) desc 

  /*
  10) ¿Cuál es la orden más grande registrada en el sistema? Quiero saber en qué tienda se hizo, quien fue el cliente y a cuanto ascendió la orden sin descuentos.
  */
  SELECT top 1 o.order_id, s.store_name
		,CONCAT(c.first_name,' ',c.last_name) as cliente
		,sum(oi.quantity*oi.list_price) as cantidad
  FROM [BikeStores].[sales].[orders] o
  right join [sales].[stores] s on s.store_id = o.store_id
  inner join sales.order_items oi on oi.order_id = o.order_id
  inner join sales.customers c on c.customer_id = o.order_id
  group by o.order_id,s.store_name,CONCAT(c.first_name,' ',c.last_name)
  order by sum(oi.quantity*oi.list_price) desc 

  
  /* 
  11) ¿Cuántos empleados activos tengo por tienda?  
  */
  SELECT st.store_name, COUNT(em.staff_id) as 'Empleados activos'
  FROM [sales].[stores] st
  left join [sales].[staffs] em on em.store_id = st.store_id
  where em.active = 1
  group by st.store_name


  /*
  12) Para cada producto determinar la cantidad promedio que es comprada por ordenes. El resultado debería mostrar el nombre del producto y la cantidad promedio sus órdenes. 
  */
  select p.product_name, avg(oi.quantity)
  from [production].[products] p
  left join [sales].[order_items] oi on oi.product_id = p.product_id
  group by p.product_name

  
  /*
  13)Cuantos clientes tienen más de 3 compras. 
  */
  select CONCAT(c.first_name,' ', c.last_name), COUNT(o.order_id)
  from [sales].[customers] c
  left join [sales].[orders] o on o.customer_id = c.customer_id
  group by CONCAT(c.first_name,' ', c.last_name)
  having COUNT(o.order_id) >= 3
  
  
  /*
  14) Cual producto ha vendido más de 100,000 dólares. 
  */
  SELECT  p.product_name, sum(oi.list_price*oi.quantity)
  FROM [production].[products] p
  left join [sales].[order_items] oi on oi.product_id = p.product_id
  group by p.product_name
  having sum(oi.list_price*oi.quantity) > 100000
  order by sum(oi.list_price) desc
