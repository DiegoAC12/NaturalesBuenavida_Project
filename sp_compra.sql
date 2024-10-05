######################
## Insert Compra #####
######################

DELIMITER //
CREATE PROCEDURE spInsertarCompraYDetalle(
    IN p_fecha_compra DATE,
    IN p_total DECIMAL,
    IN p_fkprov_id INT,
    IN p_fkproducto_id INT,
    IN p_cantidad INT,
    IN p_precio_unitario DECIMAL,
    IN p_numero_factura VARCHAR(50)
)
BEGIN
    DECLARE p_compra_id INT;

    -- Insertar en tbl_compra
    INSERT INTO tbl_compra (comp_fecha_compra, comp_total, tbl_proveedor_prov_id)
    VALUES (p_fecha_compra, p_total, p_prov_id);

    -- Obtener el último ID insertado en tbl_compra
    SET p_compra_id = LAST_INSERT_ID();

    -- Insertar en tbl_detalle_compraproducto
    INSERT INTO tbl_detalle_compraproducto (tbl_compra_compra_id, tbl_producto_producto_id, det_cantidad, det_precio_unitario, detc_numero_factura)
    VALUES (p_compra_id, p_producto_id, p_cantidad, p_precio_unitario, p_numero_factura);
END //
DELIMITER ;

######################
## Select Compra #####
######################

DELIMITER //
CREATE PROCEDURE spSelectCompraYDetalle()
BEGIN
    SELECT 
        c.comp_id AS CompraID,
        c.comp_fecha_compra AS FechaCompra,
        c.comp_total AS TotalCompra,
        d.detc_numero_factura AS NumeroFactura,
        d.detc_cantidad_comprada AS CantidadComprada,
        d.detc_precio_unitario AS PrecioUnitario,
        p.prod_nombre AS NombreProducto
    FROM tbl_compra AS c
    INNER JOIN tbl_detalle_compraproducto AS d ON c.comp_id = d.tbl_compra_comp_id
    INNER JOIN tbl_producto AS p ON d.tbl_producto_prod_id = p.prod_id
    ORDER BY c.comp_id;
END //
DELIMITER ;

######################
## Update Compra #####
######################

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

######################
## Delete Compra #####
######################

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