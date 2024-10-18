DELIMITER //
CREATE PROCEDURE spSelectClienteDDL()
BEGIN
    SELECT 
		cli.cli_id AS Id,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.cli_id = per.pers_id;
END //
DELIMITER ;