DELIMITER $$
CREATE PROCEDURE sp_create_proveedor(
    IN p_persona_id INT
)
BEGIN
    INSERT INTO tbl_proveedor (tbl_persona_pers_id)
    VALUES (p_persona_id);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_read_proveedor()
BEGIN
    SELECT prov_id, tbl_persona_pers_id 
    FROM tbl_proveedor;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_update_proveedor(
    IN p_prov_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_proveedor 
    SET tbl_persona_pers_id = p_persona_id
    WHERE prov_id = p_prov_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_delete_proveedor(
    IN p_prov_id INT
)
BEGIN
    DELETE FROM tbl_proveedor
    WHERE prov_id = p_prov_id;
END $$
DELIMITER ;
