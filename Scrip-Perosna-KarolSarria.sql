DELIMITER //

CREATE PROCEDURE sp_insertar_persona (
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
    INSERT INTO tbl_persona (pers_identificacion, pers_nombre_razonsocial, pers_apellido, 
                              pers_telefono, pers_direccion, pers_correo_electronico, 
                              tbl_tipo_documento_doc_id, tbl_pais_pais_id)
    VALUES (p_identificacion, p_nombre_razonsocial, p_apellido, 
            p_telefono, p_direccion, p_correo_electronico, 
            p_doc_id, p_pais_id);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_insertar_persona (
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
    INSERT INTO tbl_persona (pers_identificacion, pers_nombre_razonsocial, pers_apellido, 
                              pers_telefono, pers_direccion, pers_correo_electronico, 
                              tbl_tipo_documento_doc_id, tbl_pais_pais_id)
    VALUES (p_identificacion, p_nombre_razonsocial, p_apellido, 
            p_telefono, p_direccion, p_correo_electronico, 
            p_doc_id, p_pais_id);
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
