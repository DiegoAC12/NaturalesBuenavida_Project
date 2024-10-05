DELIMITER //
CREATE PROCEDURE spUpdateCompra(
    IN p_compra_id INT,
    IN p_fecha_compra DATE,
    IN p_total DECIMAL,
    IN p_numero_factura VARCHAR(50),
    IN p_fkproducto_id INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL
)
BEGIN
    -- Actualizar la compra en tbl_compra
    UPDATE tbl_compra
    SET comp_fecha_compra = p_fecha_compra,
        comp_total = p_total
    WHERE comp_id = p_compra_id;

    -- Actualizar el detalle de la compra en tbl_detalle_compraproducto
    UPDATE tbl_detalle_compraproducto
    SET detc_numero_factura = p_numero_factura,
        tbl_producto_prod_id = p_fkproducto_id,
        detc_cantidad_comprada = p_cantidad,
        detc_precio_unitario = p_precio_unitario
    WHERE tbl_compra_comp_id = p_compra_id;
END //
DELIMITER ;
