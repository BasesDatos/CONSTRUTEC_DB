------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Permite a un usuario que ya este registrado en la base de datos, poder
-- registrarse con un nuevo rol
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION registrarNuevaCuenta(
	pUsuario text, pContrasena text, pCodigo text, pRol int
) RETURNS TEXT

AS $$

BEGIN

	IF EXISTS (SELECT Usuario FROM USUARIO WHERE Usuario=pUsuario)
	THEN
		IF EXISTS (SELECT Contrasena FROM USUARIO WHERE Contrasena=pContrasena)
		THEN
			IF EXISTS (SELECT ids.Id_Rol FROM (SELECT Id_Rol FROM ROL_USUARIO AS rol WHERE rol.Usuario=pUsuario) AS ids WHERE ids.Id_Rol=pRol)
			THEN
				RETURN 'Usuario ya esta registrado con el rol especificado';
			ELSE
				IF ( ((SELECT Codigo FROM USUARIO WHERE Usuario=pUsuario) IS NOT NULL) AND (pCodigo IS NULL) )
				THEN

					INSERT INTO ROL_USUARIO(Usuario, Id_Rol)
					VALUES (pUsuario, pRol);

					RETURN 'Nueva cuenta registrada correctamente';
				ELSE
					IF ( (pCodigo IS NULL) AND (pRol=2))
					THEN
						RETURN 'El código de ingeniero no puede ser null';
					ELSE
						UPDATE USUARIO
						SET Codigo=pCodigo
						WHERE Usuario=pUsuario;

						INSERT INTO ROL_USUARIO(Usuario, Id_Rol)
						VALUES (pUsuario, pRol);

						RETURN 'Nueva cuenta registrada correctamente';
					END IF;
					
				END IF;
				
			END IF;
			
		ELSE
			RETURN 'Contraseña incorrecta';
		END IF;
		
	ELSE
		RETURN 'Usuario no se encuentra registrado';
	END IF;

END;
	$$
	LANGUAGE 'plpgsql' VOLATILE


select * from registrarNuevaCuenta('test', 'test', null, 3)