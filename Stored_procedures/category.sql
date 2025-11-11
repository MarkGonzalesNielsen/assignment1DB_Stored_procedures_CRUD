USE dit_database_navn;

DELIMITER //

CREATE PROCEDURE CreateCategory(
    IN p_user_id INT,
    IN p_name VARCHAR(45),
    IN p_type FLOAT
)
BEGIN
    INSERT INTO Category (user_id, name, type)
    VALUES (p_user_id, p_name, p_type);
END //

CREATE PROCEDURE GetAllCategories()
BEGIN
    SELECT idCategory, user_id, name, type
    FROM Category;
END //

CREATE PROCEDURE GetCategoryById(IN p_category_id INT)
BEGIN
    SELECT idCategory, user_id, name, type
    FROM Category
    WHERE idCategory = p_category_id;
END //

CREATE PROCEDURE UpdateCategory(
    IN p_category_id INT,
    IN p_name VARCHAR(45),
    IN p_type FLOAT
)
BEGIN
    UPDATE Category
    SET name = p_name,
        type = p_type
    WHERE idCategory = p_category_id;
END //

CREATE PROCEDURE DeleteCategory(IN p_category_id INT)
BEGIN
    DELETE FROM Category WHERE idCategory = p_category_id;
END //

-- Funktion til at beregne total forbrug pr. kategori
CREATE FUNCTION fn_GetTotalSpentByCategory(p_category_id INT)
RETURNS FLOAT
READS SQL DATA
BEGIN
    DECLARE v_total_spent FLOAT DEFAULT 0.0;

    SELECT SUM(T.amount)
    INTO v_total_spent
    FROM Transaktion T
    WHERE T.Category_idCategory = p_category_id
      AND T.type = 'expends';

    IF v_total_spent IS NULL THEN
        SET v_total_spent = 0.0;
    END IF;

    RETURN v_total_spent;
END //

DELIMITER ;


//test
CALL CreateCategory(1, 'Groceries', 1);
CALL GetAllCategories();
CALL GetCategoryById(1);
CALL UpdateCategory(1, 'Updated Category', 2);
CALL DeleteCategory(1);
