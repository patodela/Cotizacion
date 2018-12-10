
-- =============================================
-- Author:		Patricio Imilqueo
-- Create date: 10-12-2018
-- Description:	Busca Usuario
-- =============================================
CREATE PROCEDURE sp_busca_usuario 
	@sUsuario			varchar(10),
	@sPasswd			varchar(15),
	@bError				int = 0 output,
	@sError				varchar(max) = '' output
AS
BEGIN

	BEGIN TRY
		
			IF EXISTS(SELECT 1 FROM usuario WHERE cod_usuario = @sUsuario and pwd_usuario = @sPasswd and activo = 1) 
			BEGIN
				SET @bError = 0
				SET @sError = 'SUCCESS'				
			END
			ELSE BEGIN
				SET @bError = 1
				SET @sError = 'Usuario no se encuentra registrado en el sistema y/o no se encuentra activo para iniciar sesión.'
			END

	END TRY
	BEGIN CATCH
		
		SET @bError = ERROR_LINE()
		SET @sError = ERROR_MESSAGE()

	END CATCH
	

END

