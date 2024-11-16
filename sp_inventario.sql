# Procedimiento Insertar inventario

DELIMITER //
CREATE PROCEDURE spInsertInventory(
   	IN p_cantidad INT, 
	IN p_fecha DATE, 
	IN p_observacion TEXT,
	IN p_fkproducto_id INT,
	IN p_fkempleado_id INT
)
BEGIN
    INSERT INTO tbl_inventario (inv_cantidad, inv_fecha_realizacion, inv_observacion, tbl_producto_prod_id, tbl_empleado_emp_id)
    VALUES (p_cantidad, p_fecha, p_observacion, p_fkproducto_id, p_fkempleado_id);
END //
DELIMITER ;

#Procedimiento mostrar inventario

DELIMITER //
CREATE PROCEDURE spGetInventory()
BEGIN
    SELECT 
		inv.inv_cantidad AS Cantidad,
        inv.inv_fecha_realizacion AS Fecha,
        inv.inv_observacion AS Observación,
        pro.prod_nombre AS Producto,
        CONCAT(per.pers_nombre_razonsocial, " ", per.pers_apellido) AS NombreCompleto
    FROM tbl_inventario as inv
	INNER JOIN tbl_producto AS pro ON inv.tbl_producto_prod_id = pro.prod_id
	INNER JOIN tbl_persona AS per ON inv.tbl_empleado_emp_id = per.pers_id;
END //
DELIMITER ;

# Procedimiento Actualizar inventario

DELIMITER //
CREATE PROCEDURE spUpdateInventory(
    IN p_inv_id INT,
    IN p_cantidad INT,
    IN p_fecha DATE,
    IN p_observacion TEXT,
    IN p_fkproducto INT,
    IN p_fkempleado INT
)
BEGIN
    UPDATE tbl_inventario 
    SET inv_cantidad = p_cantidad, 
        inv_fecha_realizacion = p_fecha, 
        inv_observacion = p_observacion, 
        tbl_producto_prod_id = p_fkproducto, 
        tbl_empleado_emp_id = p_fkempleado
    WHERE inv_id = p_inv_id;
END //
DELIMITER ;

#Procedimiento eliminar inventario

DELIMITER //
CREATE PROCEDURE spDeleteInventory(
    IN p_inv_id INT
)
BEGIN
    DELETE FROM tbl_inventario
    WHERE inv_id = p_inv_id;
END //
DELIMITER ;

#Procedimiento mostrar inventario DDL

DELIMITER //
CREATE PROCEDURE spGetInventoryDDL()
BEGIN
    SELECT 
		inv.inv_cantidad AS Cantidad,
        inv.inv_fecha_realizacion AS Fecha,
        pro.prod_nombre AS Producto,
        CONCAT(per.pers_nombre_razonsocial, " ", per.pers_apellido) AS NombreCompleto
    FROM tbl_inventario as inv
	INNER JOIN tbl_producto AS pro ON inv.tbl_producto_prod_id = pro.prod_id
	INNER JOIN tbl_persona AS per ON inv.tbl_empleado_emp_id = per.pers_id;
END //
DELIMITER ;