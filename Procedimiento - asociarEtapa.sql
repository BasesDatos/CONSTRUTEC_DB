------------------------------------------------------------------------
--			PROCEDIMIENTO ALMACENADO

-- Permite asociar una etapa con un proyecto, agregando sus detalles como,
-- la fecha de inicio y la fecha de finalización
------------------------------------------------------------------------


CREATE OR REPLACE FUNCTION asociarEtapa(
	pIdProyecto INT, pIdEtapa INT, 
	pFInicio DATE, pFFin DATE
) RETURNS TEXT

AS $$

DECLARE 
	_idRelacion INT;
	_idDetalle INT;

BEGIN

	IF EXISTS (SELECT Id FROM PROYECTO WHERE Id=pIdProyecto)
	THEN
		IF EXISTS (SELECT Id FROM ETAPA WHERE Id=pIdEtapa)
		THEN
			INSERT INTO ETAPA_PROYECTO(Id_Proyecto, Id_Etapa)-- Se relaciona el proyecto con la etapa
			VALUES (pIdProyecto, pIdEtapa)
			RETURNING Id
			INTO _idRelacion;

			INSERT INTO DETALLE(Estado, F_Inicio, F_Fin)-- Se insertan los detalles de la etapa
			VALUES (TRUE, pFInicio, pFFin)
			RETURNING Id
			INTO _idDetalle;

			INSERT INTO DETALLE_ETAPA(Id_EtapaProyecto, Id_Detalle)-- Se asocia los detalles con la relacion proyecto-etapa
			VALUES (_idRelacion, _idDetalle);

			RETURN 'Etapa asociada correctamente';
		ELSE
			RETURN 'La etapa a asociar no existe';
		END IF;
		
	ELSE
		RETURN 'El proyecto asociado no existe';
	END IF;

END;
	$$
	LANGUAGE 'plpgsql' VOLATILE;

select * from registrarproyecto('proyecto1', 'Cartago', 'El Guarco', 'San Isidro', 'juanp1995', 'juanp1995')
select * from registraretapa('Etapa1', 'Descripcion')
select * from asociarEtapa(1,1,'10/12/2016', '10/12/2017')