DELIMITER //

CREATE PROCEDURE sp_insertar_ciudad (
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_dep_id INT
)
BEGIN
    INSERT INTO tbl_ciudad (ciu_codigo, ciu_nombre, tbl_departamento_dep_id)
    VALUES (p_codigo, p_nombre, p_dep_id);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_mostrar_ciudad (
    IN p_id INT
)
BEGIN
    SELECT * FROM tbl_ciudad WHERE ciu_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_actualizar_ciudad (
    IN p_id INT,
    IN p_codigo VARCHAR(45),
    IN p_nombre VARCHAR(80),
    IN p_dep_id INT
)
BEGIN
    UPDATE tbl_ciudad
    SET ciu_codigo = p_codigo,
        ciu_nombre = p_nombre,
        tbl_departamento_dep_id = p_dep_id
    WHERE ciu_id = p_id;
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE sp_eliminar_ciudad (
    IN p_id INT
)
BEGIN
    DELETE FROM tbl_ciudad WHERE ciu_id = p_id;
END //

DELIMITER ;
