CREATE PROCEDURE sp_auditoria_juan (
    IN p_mensaje_auditoria VARCHAR(100)
)
BEGIN
    
        INSERT INTO LOGEOS (MENSAJE)
        VALUES (p_mensaje_auditoria);

END //

DELIMITER ;
-- Asegúrate de que la tabla de logs exista con la estructura vista
-- MENAJE VARCHAR(100), FECHA TIMESTAMP DEFAULT CURRENT_TIMESTAMP

SET GLOBAL event_scheduler = ON;

CREATE TABLE LOGEOS(
	ID INT auto_increment PRIMARY KEY,
    MENSAJE VARCHAR(100),
    FECHA TIMESTAMP DEFAULT current_timestamp);


CREATE EVENT REVISION_JUAN
ON SCHEDULE EVERY 1 MINUTE
DO
    CALL sp_auditoria_juan ('EJECUTADO DESDE EL EVENTO') ;
    
SELECT * FROM LOGEOS;

CREATE EVENT REVISION_JUAN
ON SCHEDULE EVERY 1 MINUTE
DO
    CALL sp_auditoria_juan ('EJECUTADO DESDE EL EVENTO') ;
    
SELECT * FROM LOGEOS;

CALL sp_insertar_pago ('ak-std-000031', 4, 'Paypal', sysdate(), 300);