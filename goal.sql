CREATE PROCEDURE CreateGoal(
    IN p_user_id INT,
    IN p_name VARCHAR(45),
    IN p_target_amount FLOAT,
    IN p_current-ammount FLOAT,
    IN p_target_date DATE,
    IN p_status VARCHAR(45)
)
BEGIN
    INSERT INTO Goal (user_id, name, target_amount, current_amount, target_date, status)
    VALUES (p_user_id, p_name, p_target_amount, p_current-ammount, p_target_date, p_status);
END 

CREATE PROCEDURE GetAllGoals()
BEGIN
    SELECT idGoal, user_id, name, target_amount, current_amount, target_date
    FROM Goal;
END

Create PROCEDURE GetGoalById(IN p_goal_id INT)
BEGIN
    SELECT idGoal, user_id, name, target_amount, current_amount, target_date
    FROM Goal
    WHERE idGoal = p_goal_id;
END

Create PROCEDURE UpdateAccount(
    IN p_goal_id INT,
    IN p_name VARCHAR(45),
    IN p_target_amount FLOAT,
    IN p_current-ammount FLOAT,
    IN p_target_date DATE,
    IN p_status VARCHAR(45)
)
BEGIN
    UPDATE Goal
    SET name = p_name,
        target_amount = p_target_amount,
        current_amount = p_current-ammount,
        target_date = p_target_date,
        status = p_status
    WHERE idGoal = p_goal_id;
END

Create PROCEDURE DeleteGoal(IN p_goal_id INT)
BEGIN
    DELETE FROM Goal WHERE idGoal = p_goal_id;
END 