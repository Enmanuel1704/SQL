/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [codigo_comunicacion]
      ,TpersonasE.nomper+' '+TpersonasE.apeper as 'US. Emisor'
	  ,TareaE.descarea as 'area_Emisor'
      ,TpersonasR.nomper+' '+TpersonasR.apeper as 'US. Receptor'
	  ,TareaR.descarea as 'area_Receptor'
      ,[fecha_comunicacion]
      ,[fecha_revision]
      ,[descartada]
      ,[comentarios]
      ,[fecha_ultimo_comentario]
      ,[historico_comentarios]
      ,[tenor_comentarios]
  FROM [SIGOB_MIDEREC_DOM_PRODUCCION].[dbo].[comunicaciones_correspondencias] T

  inner join [despacho] Temisor	  on  Temisor.[codigo_despa] = [despacho_emisor]
  inner join [personas] TpersonasE on TpersonasE.email = Temisor.[username]+'@miderec.gob.do'
  inner join [area] TareaE on TareaE.[codarea] = Temisor.[codarea]

  inner join [despacho] Treceptor on  Treceptor.[codigo_despa] = [despacho_receptor]
  inner join [personas] TpersonasR on TpersonasR.email = Treceptor.[username]+'@miderec.gob.do'
  inner join [area] TareaR on TareaR.[codarea] = Treceptor.[codarea]

  left join [correspondencia] Tcorrespondencia on Tcorrespondencia.codcorr = T.[codcorr]
    