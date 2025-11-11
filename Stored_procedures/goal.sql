USE dit_database_navn;

DELIMITER //

CREATE PROCEDURE CreateGoal(
    IN p_name VARCHAR(45),
    IN p_target_amount FLOAT,
    IN p_current_amount FLOAT,
    IN p_target_date DATE,
    IN p_status VARCHAR(45)
)
BEGIN
    INSERT INTO Goal (name, target_amount, current_amount, target_date, status)
    VALUES (p_name, p_target_amount, p_current_amount, p_target_date, p_status);
END //

CREATE PROCEDURE GetAllGoals()
BEGIN
    SELECT idGoal, name, target_amount, current_amount, target_date, status
    FROM Goal;
END //

CREATE PROCEDURE GetGoalById(IN p_goal_id INT)
BEGIN
    SELECT idGoal, name, target_amount, current_amount, target_date, status
    FROM Goal
    WHERE idGoal = p_goal_id;
END //

CREATE PROCEDURE UpdateGoal(
    IN p_goal_id INT,
    IN p_name VARCHAR(45),
    IN p_target_amount FLOAT,
    IN p_current_amount FLOAT,
    IN p_target_date DATE,
    IN p_status VARCHAR(45)
)
BEGIN
    UPDATE Goal
    SET name = p_name,
        target_amount = p_target_amount,
        current_amount = p_current_amount,
        target_date = p_target_date,
        status = p_status
    WHERE idGoal = p_goal_id;
END //

CREATE PROCEDURE DeleteGoal(IN p_goal_id INT)
BEGIN
    DELETE FROM Goal WHERE idGoal = p_goal_id;
END //

DELIMITER ;

//test
CALL CreateGoal('Køb bil', 200000, 50000, '2026-01-01', 'Active');
CALL GetAllGoals();
CALL GetGoalById(1);
CALL UpdateGoal(1, 'Køb ny bil', 250000, 60000, '2026-03-01', 'In Progress');
CALL DeleteGoal(1);

