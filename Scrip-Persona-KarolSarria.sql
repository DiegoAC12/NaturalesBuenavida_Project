DELIMITER //
CREATE PROCEDURE spInsertPersona (
    IN p_identificacion VARCHAR(45),
    IN p_nombre_razonsocial VARCHAR(45),
    IN p_apellido VARCHAR(45),
    IN p_telefono VARCHAR(15),
    IN p_direccion VARCHAR(80),
    IN p_correo_electronico VARCHAR(80),
    IN p_fkdoc_id INT,
    IN p_fkpais_id INT
)
BEGIN
    INSERT INTO tbl_persona (pers_identificacion, pers_nombre_razonsocial, pers_apellido, 
                              pers_telefono, pers_direccion, pers_correo_electronico, 
                              tbl_tipo_documento_doc_id, tbl_pais_pais_id)
    VALUES (p_identificacion, p_nombre_razonsocial, p_apellido, 
            p_telefono, p_direccion, p_correo_electronico, 
            p_fkdoc_id, p_fkpais_id);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectPersona ()
SELECT
	per.pers_id as id,
	per.pers_identificacion as Identidad, 
	per.pers_nombre_razonsocial as Nombre, 
	per.pers_apellido as Apellido, 
    per.pers_telefono as Telefono,
	per.pers_direccion as Dirección,
	per.pers_correo_electronico as Correo,
	doc.doc_tipo_documento as "Tipo Doc",
	pai.pais_nombre as Pais
	FROM tbl_persona as per
    INNER JOIN tbl_tipo_documento as doc ON per.tbl_tipo_documento_doc_id=doc.doc_id
	INNER JOIN tbl_pais as pai ON per.tbl_pais_pais_id=pai.pais_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_actualizar_persona (
    IN p_id INT,
    IN p_identificacion VARCHAR(45),
    IN p_nombre_razonsocial VARCHAR(45),
    IN p_apellido VARCHAR(45),
    IN p_telefono VARCHAR(15),
    IN p_direccion VARCHAR(80),
    IN p_correo_electronico VARCHAR(80),
    IN p_doc_id INT,
    IN p_pais_id INT
)
BEGIN
    UPDATE tbl_persona
    SET pers_identificacion = p_identificacion,
        pers_nombre_razonsocial = p_nombre_razonsocial,
        pers_apellido = p_apellido,
        pers_telefono = p_telefono,
        pers_direccion = p_direccion,
        pers_correo_electronico = p_correo_electronico,
        tbl_tipo_documento_doc_id = p_doc_id,
        tbl_pais_pais_id = p_pais_id
    WHERE pers_id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_eliminar_persona (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_persona WHERE pers_id = p_id;
END //
DELIMITER ;
