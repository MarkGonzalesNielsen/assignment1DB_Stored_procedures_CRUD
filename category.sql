CREATE PROCEDURE CreateGoal(
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


