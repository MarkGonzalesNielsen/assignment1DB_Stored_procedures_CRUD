CREATE PROCEDURE CreateGoal(
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
