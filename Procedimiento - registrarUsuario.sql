------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Permite registrar un nuevo usuario en la base de datos
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION registrarUsuario(
	pUsuario TEXT, pNombre TEXT, pPApellido TEXT, pSApellido TEXT,
	pCedula BIGINT, pContrasena TEXT, pCodigo TEXT, pTelefono TEXT, pRol int
) RETURNS TEXT

AS $$

BEGIN

	IF NOT EXISTS (SELECT Usuario FROM USUARIO WHERE Usuario=pUsuario)
	THEN
		IF NOT EXISTS (SELECT Cedula FROM USUARIO WHERE Cedula=pCedula)
		THEN
			IF ( (pCodigo IS NULL) AND (pRol=2) )
			THEN
				RETURN 'El código de ingeniero no puede ser null';
			ELSE
				INSERT INTO USUARIO(Usuario, Nombre, P_Apellido, S_Apellido, Cedula, Contrasena, Codigo, Telefono)
				VALUES (pUsuario, pNombre, pPApellido, pSApellido, pCedula, pContrasena, pCodigo, pTelefono);

				INSERT INTO ROL_USUARIO(Usuario, Id_Rol)
				VALUES (pUsuario, pRol);

				RETURN 'Usuario registrado correctamente';
			END IF;
				
		ELSE
			RETURN 'Ya existe un usuario con la misma cédula';
		END IF;

	ELSE
		RETURN 'Nombre de usuario ya esta en uso';
	END IF;
		
		

END;
	$$
	LANGUAGE 'plpgsql' VOLATILE


select * from registrarUsuario('test', 'test', 'test', 'test', 000000000, 'test', NULL, '37467468', 3)

