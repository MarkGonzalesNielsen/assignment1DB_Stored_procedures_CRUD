//CALL CreateAccount(5, 'Savings Account', 10000000.0);

CREATE PROCEDURE CreateAccount(
    IN p_user_id INT,
    IN p_name VARCHAR(45),
    IN p_saldo FLOAT
)
BEGIN
    INSERT INTO Account (user_id, name, saldo)
    VALUES (p_user_id, p_name, p_saldo);
END 

//CALL GetAllAccounts();


CREATE PROCEDURE GetAllAccounts()
BEGIN
    SELECT idAccount, name, saldo
    from Account;
END 

CREATE PROCEDURE GetAccountById(IN p_id INT)
BEGIN
    SELECT idAccount, User_idUser, name, saldo
    FROM Account
    WHERE idAccount = p_id;
END

//CALL UpdateAccount(1, 'Updated Account Name', 1500.0);

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

CREATE PROCEDURE DeleteAccount(IN p_account_id INT)
BEGIN
    DELETE FROM Account WHERE idAccount = p_account_id;
END

