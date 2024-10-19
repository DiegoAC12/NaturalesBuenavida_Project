DELIMITER $$
CREATE PROCEDURE sp_create_inventario(
    IN p_cantidad INT,
    IN p_fecha DATE,
    IN p_observacion TEXT,
    IN p_prod_id INT,
    IN p_emp_id INT
)
BEGIN
    INSERT INTO tbl_inventario (inv_cantidad, inv_fecha_realizacion, inv_observacion, tbl_producto_prod_id, tbl_empleado_emp_id)
    VALUES (p_cantidad, p_fecha, p_observacion, p_prod_id, p_emp_id);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_read_inventario()
BEGIN
    SELECT inv_id, inv_cantidad, inv_fecha_realizacion, inv_observacion, tbl_producto_prod_id, tbl_empleado_emp_id 
    FROM tbl_inventario;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_update_inventario(
    IN p_inv_id INT,
    IN p_cantidad INT,
    IN p_fecha DATE,
    IN p_observacion TEXT,
    IN p_prod_id INT,
    IN p_emp_id INT
)
BEGIN
    UPDATE tbl_inventario 
    SET inv_cantidad = p_cantidad, 
        inv_fecha_realizacion = p_fecha, 
        inv_observacion = p_observacion, 
        tbl_producto_prod_id = p_prod_id, 
        tbl_empleado_emp_id = p_emp_id
    WHERE inv_id = p_inv_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_delete_inventario(
    IN p_inv_id INT
)
BEGIN
    DELETE FROM tbl_inventario
    WHERE inv_id = p_inv_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_get_inventario_with_empleado_and_producto()
BEGIN
    SELECT 
        inv.inv_id AS Inventario_ID,
        inv.inv_cantidad AS Cantidad,
        inv.inv_fecha_realizacion AS Fecha_Realizacion,
        e.emp_id AS Empleado_ID,
        p.prod_nombre AS Producto
    FROM 
        tbl_inventario inv
    INNER JOIN 
        tbl_empleado e ON inv.tbl_empleado_emp_id = e.emp_id
    INNER JOIN 
        tbl_producto p ON inv.tbl_producto_prod_id = p.prod_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_get_productos_with_inventario_and_categoria()
BEGIN
    SELECT 
        p.prod_nombre AS Producto,
        c.cat_descripcion AS Categoria,
        inv.inv_cantidad AS Cantidad_En_Inventario,
        inv.inv_fecha_realizacion AS Fecha_Inventario
    FROM 
        tbl_producto p
    INNER JOIN 
        tbl_categoria c ON p.tbl_categoria_cat_id = c.cat_id
    INNER JOIN 
        tbl_inventario inv ON p.prod_id = inv.tbl_producto_prod_id;
END $$
DELIMITER ;
