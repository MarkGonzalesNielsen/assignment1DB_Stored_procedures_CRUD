CREATE PROCEDURE CreateCategory(
    IN p_user_id INT,
    IN p_name VARCHAR(45),
    IN p_type FLOAT,
)
BEGIN
    INSERT INTO Category (user_id, name, type)
    VALUES (p_user_id, p_name, p_type);
END

CREATE PROCEDURE GetAllCategories()
BEGIN
    SELECT idCategory, user_id, name, type
    FROM Category;
END

CREATE PROCEDURE GetCategoryById(IN p_category_id INT)
BEGIN
    SELECT idCategory, user_id, name, type
    FROM Category
    WHERE idCategory = p_category_id;
END

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
END

CREATE PROCEDURE DeleteCategory(IN p_category_id INT)
BEGIN
    DELETE FROM Category WHERE idCategory = p_category_id;
END 


CREATE FUNCTION fn_GetTotalSpentByCategory (p_category_id INT)
RETURNS FLOAT
READS sql data
BEGIN
DECLARE v_total_spent FLOAT DEFAULT 0.0;

SELECT sum(T.amount)
    INTO v_total_spent
    FROM Transaktion T
    WHERE T.Category_idCategory = p_category_id
      AND T.type = 'expends';

IF v_total_spent IS NULL THEN
        RETURN v_total_spent;
    END IF;

RETURN v_total_spent;
END

//Måde at bruge den på: 

SELECT 
    b.idBudget,
    c.name AS CategoryName,
    b.amount AS BudgetAmount,
    -- Henter det faktiske forbrug via din nye funktion
    fn_GetTotalSpentByCategory(c.idCategory) AS ActualSpent,
    -- Beregner det resterende beløb
    b.amount - fn_GetTotalSpentByCategory(c.idCategory) AS Remaining
FROM 
    Budget b
JOIN 
    Category c ON b.Category_idCategory = c.idCategory;