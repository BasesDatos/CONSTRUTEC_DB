------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Permite registrar un nuevo proyecto, asociado con un cliente y un
-- ingeniero
------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION registrarProyecto(
	pNombre TEXT, pProvincia TEXT,
	pCanton TEXT, pDistrito TEXT, pCliente TEXT,
	pIngeniero TEXT
) RETURNS INT

AS  $$

DECLARE
	_idProyecto INT;

BEGIN 

	INSERT INTO PROYECTO(Nombre, Estado, Provincia, Canton, Distrito)
	VALUES (pNombre, TRUE, pProvincia, pCanton, pDistrito)
	RETURNING Id
	INTO _idProyecto;

	INSERT INTO PROYECTO_USUARIO(Usuario, Id_Proyecto)
	VALUES (pCliente, _idProyecto), (pIngeniero, _idProyecto);

	RETURN _idProyecto;


END;
	$$
	LANGUAGE 'plpgsql' VOLATILE;

select * from registrarProyecto('test2', 'provincia2', 'canton2', 'distrito2', 'juanp1995', 'user1')