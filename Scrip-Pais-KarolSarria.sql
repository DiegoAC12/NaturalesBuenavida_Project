DELIMITER //

CREATE PROCEDURE sp_insertar_pais (
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_pais (pais_codigo, pais_nombre)
    VALUES (p_codigo, p_nombre);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_mostrar_pais (
    IN p_id INT
)
BEGIN
    SELECT * FROM tbl_pais WHERE pais_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_actualizar_pais (
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(45)
)
BEGIN
    UPDATE tbl_pais
    SET pais_codigo = p_codigo,
        pais_nombre = p_nombre
    WHERE pais_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_eliminar_pais (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_pais WHERE pais_id = p_id;
END //

DELIMITER ;
