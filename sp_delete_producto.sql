DELIMITER //
CREATE PROCEDURE spDeleteProducto(
    IN p_prod_id INT
)
BEGIN
    DELETE FROM tbl_producto
    WHERE prod_id = p_prod_id;
END //
DELIMITER ;
