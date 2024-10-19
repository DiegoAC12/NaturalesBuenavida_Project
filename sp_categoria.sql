DELIMITER $$
CREATE PROCEDURE sp_create_categoria(
    IN p_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_categoria (cat_descripcion)
    VALUES (p_descripcion);
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_read_categoria()
BEGIN
    SELECT cat_id, cat_descripcion 
    FROM tbl_categoria;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_update_categoria(
    IN p_cat_id INT,
    IN p_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_categoria 
    SET cat_descripcion = p_descripcion
    WHERE cat_id = p_cat_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_delete_categoria(
    IN p_cat_id INT
)
BEGIN
    DELETE FROM tbl_categoria
    WHERE cat_id = p_cat_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_get_productos_with_categoria_and_proveedor()
BEGIN
    SELECT 
        p.prod_nombre AS Producto,
        c.cat_descripcion AS Categoria,
        pr.prov_id AS Proveedor
    FROM 
        tbl_producto p
    INNER JOIN 
        tbl_categoria c ON p.tbl_categoria_cat_id = c.cat_id
    INNER JOIN 
        tbl_proveedor pr ON p.tbl_proveedor_prov_id = pr.prov_id;
END $$
DELIMITER ;
