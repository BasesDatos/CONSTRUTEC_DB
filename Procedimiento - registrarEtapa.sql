------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Permite registrar una nueva etapa en la base de datos, la cual estara
-- disponible para que cualquier ingeniero/arquitecto la asocie con sus
-- proyectos
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION registrarEtapa(
	pNombre TEXT, pDescripcion TEXT
) RETURNS TEXT

AS $$

BEGIN

	IF EXISTS (SELECT Nombre FROM ETAPA WHERE Nombre=pNombre)
	THEN
		RETURN 'Ya hay una etapa con el mismo nombre';
	ELSE
		INSERT INTO ETAPA(Nombre, Descripcion)
		VALUES (pNombre, pDescripcion);

		RETURN 'Etapa registrada correctamente';
	END IF;

END;
	$$
	LANGUAGE 'plpgsql' VOLATILE;


select * from registraretapa('prueba2', 'etapaprueba')