DELIMITER //

CREATE PROCEDURE sp_insertar_departamento (
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_pais_id INT
)
BEGIN
    INSERT INTO tbl_departamento (dep_codigo, dep_nombre, tbl_pais_pais_id)
    VALUES (p_codigo, p_nombre, p_pais_id);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_mostrar_departamento (
    IN p_id INT
)
BEGIN
    SELECT * FROM tbl_departamento WHERE dep_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_actualizar_departamento (
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_pais_id INT
)
BEGIN
    UPDATE tbl_departamento
    SET dep_codigo = p_codigo,
        dep_nombre = p_nombre,
        tbl_pais_pais_id = p_pais_id
    WHERE dep_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_eliminar_departamento (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_departamento WHERE dep_id = p_id;
END //

DELIMITER ;
