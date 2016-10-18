------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Procedimiento utilizado cuando un usuario inicia sesión, se comprueba
-- que el usuario este registrado en la base de datos y que la contraseña
-- de registro y con la que inicia sesión coincidan, si esto se cumple
-- se retorna una tabla con los roles registrados del usuario
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION iniciarSesion(pUsuario text, pContrasena text)
RETURNS TABLE(Rol varchar(100))

AS $$

DECLARE
	_mensaje varchar(100);	


BEGIN

	IF EXISTS (SELECT Usuario FROM USUARIO WHERE Usuario=pUsuario) -- Se comprueba que le usuario este registrado
	THEN
		IF ((SELECT Contrasena FROM USUARIO WHERE Usuario=pUsuario)=pContrasena)-- Se verifíca la contraseña
		THEN
			RETURN QUERY SELECT rol.Tipo
			FROM (SELECT Id_Rol FROM ROL_USUARIO WHERE Usuario=pUsuario) AS rolUsr INNER JOIN ROL AS rol ON rolUsr.Id_Rol=rol.Id;

		ELSE
			_mensaje := 'Usuario o contraseña incorrectos';
			RETURN QUERY SELECT _mensaje;
		END IF;

	ELSE
		_mensaje := 'Usuario o contraseña incorrectos';
		RETURN QUERY SELECT _mensaje;
	END IF;

END;

$$
  LANGUAGE 'plpgsql' VOLATILE;