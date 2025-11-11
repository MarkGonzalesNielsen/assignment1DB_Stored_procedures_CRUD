// setup: 1. USE dit_database_navn;

//2. copy paste stored functions ind 

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

CREATE PROCEDURE GetAllAccounts()
BEGIN
    SELECT idAccount, name, saldo
    FROM Account;
END //

CREATE PROCEDURE GetAccountById(IN p_id INT)
BEGIN
    SELECT idAccount, User_idUser, name, saldo
    FROM Account
    WHERE idAccount = p_id;
END //

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
END //

CREATE PROCEDURE DeleteAccount(IN p_account_id INT)
BEGIN
    DELETE FROM Account WHERE idAccount = p_account_id;
END //

DELIMITER ;

//3. test at de virker
CALL CreateAccount(5, 'Savings Account', 10000000.0);
CALL GetAllAccounts();
CALL GetAccountById(1);
CALL UpdateAccount(1, 'Updated Account', 1500.0);
CALL DeleteAccount(1);



