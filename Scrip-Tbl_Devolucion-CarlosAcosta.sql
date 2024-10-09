DELIMITER $$

CREATE PROCEDURE sp_insertar_devolucion(
    IN p_dev_fecha_devolucion DATE,
    IN p_dev_motivo TEXT,
    IN p_vent_id INT
)
BEGIN
    INSERT INTO tbl_devolucion (dev_fecha_devolucion, dev_motivo, tbl_venta_vent_id)
    VALUES (p_dev_fecha_devolucion, p_dev_motivo, p_vent_id);
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE sp_mostrar_devoluciones()
BEGIN
    SELECT * FROM tbl_devolucion;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE sp_eliminar_devolucion(
    IN p_dev_id INT
)
BEGIN
    DELETE FROM tbl_devolucion WHERE dev_id = p_dev_id;
END $$

DELIMITER ;
DELIMITER $$

CREATE PROCEDURE sp_actualizar_devolucion(
    IN p_dev_id INT,
    IN p_dev_fecha_devolucion DATE,
    IN p_dev_motivo TEXT,
    IN p_vent_id INT
)
BEGIN
    UPDATE tbl_devolucion
    SET dev_fecha_devolucion = p_dev_fecha_devolucion,
        dev_motivo = p_dev_motivo,
        tbl_venta_vent_id = p_vent_id
    WHERE dev_id = p_dev_id;
END $$

DELIMITER ;
