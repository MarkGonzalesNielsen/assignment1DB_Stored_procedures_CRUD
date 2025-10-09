DELIMITER //
CREATE PROCEDURE CreateAccount(
    IN p_user_id INT,
    IN p_name VARCHAR(45),
    IN p_saldo FLOAT
)
BEGIN
    INSERT INTO Account (user_id, name, saldo)
    VALUES (p_user_id, p_name, p_saldo);
END //
DELIMITER ;

DELIMITER //

CREATE PROCEDURE GetAllAccounts()
BEGIN
    SELECT idAccount, user_id, name, saldo
    from Account;
END 
DELIMITER;

DELIMITER //
Create PROCEDURE GetAccountbyId(IN p_account_id INT)
BEGIN
    SELECT idAccount, user_id, name, saldo
    FROM Account
    WHERE idAccount = p_account_id;
END
DELIMITER;

DELIMITER //
CREATE PROCEDURE UpdateAccount(
    IN p_account_id INT,
    IN p_name VARCHAR(45),
    IN p_saldo FLOAT
)
BEGIN
    UPDATE Account
    SET name = p_name,
        saldo = p_saldo
    WHERE idAccount = p_account_id;
END
DELIMITER; 

DELIMITER //
CREATE PROCEDURE DeleteAccount(IN p_account_id INT)
BEGIN
    DELETE FROM Account WHERE idAccount = p_account_id;
END
DELIMITER ;

