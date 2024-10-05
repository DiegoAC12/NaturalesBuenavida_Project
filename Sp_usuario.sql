-- Insertar usuario
DELIMITER //
CREATE PROCEDURE spInsertUser(
    IN p_user_Name VARCHAR(45),
    IN p_user_Password Text,
    IN p_user_State VARCHAR(15),
    IN p_user_DateCreation DATE,
    IN p_user_fkempId INT,
    IN p_user_fkrolId INT)
BEGIN
    INSERT INTO tbl_usuario (usu_usuario, usu_contrasena, usu_estado, usu_fecha_creacion, tbl_empleado_emp_id, tbl_rol_rol_id)
    VALUES (p_user_Name, p_user_Password, p_user_State, p_user_DateCreation, p_user_fkempId, p_user_fkrolId);
END//
DELIMITER ;

-- Actualizar un usuario
DELIMITER //
CREATE PROCEDURE spUpdateUser(
    IN p_user_Id INT,
    IN p_user_Name VARCHAR(45),
    IN p_user_Password TEXT,
    IN p_user_State VARCHAR(15),
    IN p_user_DateCreation DATE,
    IN p_user_fkempId INT,
    IN p_user_fkrolId INT)
BEGIN
    UPDATE tbl_usuario
    SET 
        usu_usuario = p_user_Name,
        usu_contrasena = p_user_Password,
        usu_estado = p_user_State,
        usu_fecha_creacion = p_user_DateCreation,
        tbl_empleado_emp_id = p_user_fkempId,
        tbl_rol_rol_id = p_user_fkrolId
    WHERE usu_id = p_user_Id;
END//
DELIMITER ;

-- Mostrar todos los usuarios
DELIMITER //
CREATE PROCEDURE spGetAllUsers()
BEGIN
    SELECT * FROM tbl_usuario;
END//
DELIMITER ;

-- Eliminar un usuario
DELIMITER //
CREATE PROCEDURE spDeleteUser(IN p_user_Id INT)
BEGIN
    DELETE FROM tbl_usuario
    WHERE usu_id = p_user_Id;
END//
DELIMITER ;

