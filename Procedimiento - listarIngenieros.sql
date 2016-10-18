------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Obtiene la información de todos los ingenieros/arquitectos (ROL 2)
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION listarIngenieros() 
RETURNS TABLE(Nombre varchar(20), Primer_Apellido varchar(20), Segundo_Apellido varchar(20), Usuario varchar(20), Cédula bigint, Contraseña varchar(16), Código varchar(10), Teléfono varchar(10)) 

AS $$

BEGIN
	
	RETURN QUERY SELECT usr.Nombre, usr.P_Apellido, usr.S_Apellido, usr.Usuario, usr.Cedula, usr.Contrasena, usr.Codigo, usr.Telefono
	FROM USUARIO AS usr INNER JOIN (SELECT rol.Usuario FROM ROL_USUARIO AS rol WHERE rol.Id_Rol=2) AS users ON usr.Usuario=users.Usuario;

END;

$$
  LANGUAGE 'plpgsql' VOLATILE;