CREATE PROCEDURE CreateBudget(
    IN p_user_id INT,
    IN p_amount FLOAT,
    IN p_budget_date DATE,
)
BEGIN
    INSERT INTO Budget (user_id, amount, budget_date)
    VALUES (p_user_id, p_amount, p_budget_date);
END

CREATE PROCEDURE GetAllBudgets()
BEGIN
    SELECT idBudget, user_id, amount, budget_date
    FROM Budget;
END

CREATE PROCEDURE GetBudgetById(IN p_budget_id INT)
BEGIN
    SELECT idBudget, user_id, amount, budget_date
    FROM Budget
    WHERE idBudget = p_budget_id;
END

CREATE PROCEDURE UpdateBudget(
    IN p_budget_id INT,
    IN p_amount FLOAT,
    IN p_budget_date DATE
)
BEGIN
    UPDATE Budget
    SET amount = p_amount,
        budget_date = p_budget_date
    WHERE idBudget = p_budget_id;
END

CREATE PROCEDURE DeleteBudget(IN p_budget_id INT)
BEGIN
    DELETE FROM Budget WHERE idBudget = p_budget_id;
END



CREATE PROCEDURE StartNewBudgetMonth ()
BEGIN
DECLARE next_month_date DATE;
    SET next_month_date = DATE_ADD(LAST_DAY(CURDATE()), INTERVAL 1 DAY);

    INSERT INTO Budget (amount, budget_date, Category_idCategory, Account_idAccount)
    SELECT 
        B.amount, 
        next_month_date,
        B.Category_idCategory,
        B.Account_idAccount
    FROM 
        Budget B
    Where
    B.budget_date = (SELECT MAX(budget_date) FROM Budget);
END