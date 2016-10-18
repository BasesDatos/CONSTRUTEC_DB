------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Obtiene la información de todos los administradores (ROL 3)
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION listarAdministradores() 
RETURNS TABLE(Nombre varchar(20), Primer_Apellido varchar(20), Segundo_Apellido varchar(20), Usuario varchar(20), Cédula bigint, Contraseña varchar(16), Teléfono varchar(10)) 

AS $$

BEGIN
	
	RETURN QUERY SELECT usr.Nombre, usr.P_Apellido, usr.S_Apellido, usr.Usuario, usr.Cedula, usr.Contrasena, usr.Telefono
	FROM USUARIO AS usr INNER JOIN (SELECT rol.Usuario FROM ROL_USUARIO AS rol WHERE rol.Id_Rol=3) AS users ON usr.Usuario=users.Usuario;

END;

$$
  LANGUAGE 'plpgsql' VOLATILE;