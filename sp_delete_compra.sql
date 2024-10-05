DELIMITER //
CREATE PROCEDURE spDeleteCompra(
    IN p_compra_id INT
)
BEGIN
    -- Eliminar detalles de la compra en tbl_detalle_compraproducto
    DELETE FROM tbl_detalle_compraproducto
    WHERE tbl_compra_comp_id = p_compra_id;

    -- Eliminar la compra en tbl_compra
    DELETE FROM tbl_compra
    WHERE comp_id = p_compra_id;
END //
DELIMITER ;
