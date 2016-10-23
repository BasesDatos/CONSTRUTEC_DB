------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Permite obtener la lista de etapas registradas en la base de datos
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION listarEtapas() RETURNS TABLE(id INT, nombre VARCHAR(15), descripcion VARCHAR(100))

AS $$

BEGIN

	RETURN QUERY SELECT et.Id, et.Nombre, et.Descripcion FROM ETAPA AS et;


END;
	$$
	LANGUAGE 'plpgsql' VOLATILE;



select * from listarEtapas()