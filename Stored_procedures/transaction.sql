// ved ikke med type ENUM og selv navnet transaktion
// skal den hedde Transaction eller CreateTransaction?

USE dit_database_navn;

DELIMITER //

CREATE PROCEDURE CreateTransaction(
    IN p_account_id INT,
    IN p_amount FLOAT,
    IN p_description VARCHAR(45),
    IN p_date DATE,
    IN p_type VARCHAR(45),
    IN p_category_id INT
)
BEGIN
    INSERT INTO Transaktion (account_id, amount, description, date, type, category_id)
    VALUES (p_account_id, p_amount, p_description, p_date, p_type, p_category_id);
END //

CREATE PROCEDURE GetAllTransactions()
BEGIN
    SELECT idTransaction, account_id, amount, description, date, type, category_id
    FROM Transaktion;
END //

CREATE PROCEDURE GetTransactionById(IN p_transaction_id INT)
BEGIN
    SELECT idTransaction, account_id, amount, description, date, type, category_id
    FROM Transaktion
    WHERE idTransaction = p_transaction_id;
END //

CREATE PROCEDURE UpdateTransaction(
    IN p_transaction_id INT,
    IN p_account_id INT,
    IN p_amount FLOAT,
    IN p_description VARCHAR(45),
    IN p_date DATE,
    IN p_type VARCHAR(45),
    IN p_category_id INT
)
BEGIN
    UPDATE Transaktion
    SET account_id = p_account_id,
        amount = p_amount,
        description = p_description,
        date = p_date,
        type = p_type,
        category_id = p_category_id
    WHERE idTransaction = p_transaction_id;
END //

CREATE PROCEDURE DeleteTransaction(IN p_transaction_id INT)
BEGIN
    DELETE FROM Transaktion WHERE idTransaction = p_transaction_id;
END //

DELIMITER ;

