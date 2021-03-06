USE [cotizacion]
GO
/****** Object:  StoredProcedure [dbo].[sp_existe_usuario]    Script Date: 11/12/2018 0:21:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<jessen diaz>
-- Create date: <10/12/2018>
-- Description:	<verifica que exista el usuario del login>
-- =============================================
ALTER PROCEDURE [dbo].[sp_existe_usuario] 
	@sUsuario			varchar(10),
	@sPass			varchar(15)
AS
BEGIN
	SELECT id_usuario, id_tipo_usuario, nombre, cod_usuario, pwd_usuario, fecha_ingreso, activo, fecha_actualizacion 
	FROM   USUARIO
	WHERE  @sUsuario = cod_usuario
	AND	   @sPass    = pwd_usuario
END
