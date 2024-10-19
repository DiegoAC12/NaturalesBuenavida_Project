DELIMITER $$
CREATE PROCEDURE sp_create_empleado(
    IN p_persona_id INT
)
BEGIN
    INSERT INTO tbl_empleado (tbl_persona_pers_id)
    VALUES (p_persona_id);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_read_empleado()
BEGIN
    SELECT emp_id, tbl_persona_pers_id 
    FROM tbl_empleado;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_update_empleado(
    IN p_emp_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_empleado 
    SET tbl_persona_pers_id = p_persona_id
    WHERE emp_id = p_emp_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_delete_empleado(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM tbl_empleado
    WHERE emp_id = p_emp_id;
END $$
DELIMITER ;
