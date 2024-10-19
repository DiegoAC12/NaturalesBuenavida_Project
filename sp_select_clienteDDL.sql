DELIMITER //
CREATE PROCEDURE spSelectClienteDDL()
BEGIN
    SELECT 
        cli.cli_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, ' ', per.pers_apellido) AS NombreCompleto
    FROM tbl_cliente as cli
    INNER JOIN tbl_persona AS per ON cli.cli_id = per.pers_id;
END //
DELIMITER ;