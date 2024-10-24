# Procedimiento Insertar Empleado

DELIMITER //
CREATE PROCEDURE spInsertEmployee(
    IN p_fkpersona_id INT
)
BEGIN
    INSERT INTO tbl_empleado (tbl_persona_pers_id)
    VALUES (p_fkpersona_id);
END //
DELIMITER ;

#Procedimiento mostrar empleado

DELIMITER //
CREATE PROCEDURE spGetEmployee()
BEGIN
    SELECT 
		per.pers_identificacion AS Identificacion,
        per.pers_nombre_razonsocial AS Nombre,
        per.pers_apellido AS Apellido,
        per.pers_telefono AS Telefono,
        per.pers_correo_electronico AS Correo
    FROM tbl_empleado as emp
    INNER JOIN tbl_persona AS per ON emp.emp_id = per.pers_id;
END //
DELIMITER ;

# Procedimiento Actualizar Empleado

DELIMITER //
CREATE PROCEDURE spUpdateEmployee(
    IN p_emp_id INT,
    IN p_persona_id INT
)
BEGIN
    UPDATE tbl_empleado 
    SET tbl_persona_pers_id = p_persona_id
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

#Procedimiento eliminar empleado

DELIMITER //
CREATE PROCEDURE spDeleteEmployee(
    IN p_emp_id INT
)
BEGIN
    DELETE FROM tbl_empleado
    WHERE emp_id = p_emp_id;
END //
DELIMITER ;

#Procedimiento mostrar empleado DDL

DELIMITER //
CREATE PROCEDURE spGetEmployeeDDL()
BEGIN
    SELECT 
        emp.emp_id AS Id,
        CONCAT(per.pers_nombre_razonsocial, " ", per.pers_apellido) AS NombreCompleto
    FROM tbl_empleado as emp
    INNER JOIN tbl_persona AS per ON emp.emp_id = per.pers_id;
END //
DELIMITER ;