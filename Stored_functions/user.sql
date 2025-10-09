// tilføj måske created_at

CREATE PROCEDURE CreateUser(
    IN p_username VARCHAR(45),
    IN p_password VARCHAR(45),
    IN p_email VARCHAR(45)
)
BEGIN
    INSERT INTO User (username, password, email, created_at)
    VALUES (p_username, p_password, p_email, NOW());
END //



CREATE PROCEDURE GetAllUsers()
BEGIN
    SELECT idUser, username, email, created_at
    FROM User;
END //


CREATE PROCEDURE GetUserById(IN p_user_id INT)
BEGIN
    SELECT idUser, username, email, created_at
    FROM User
    WHERE idUser = p_user_id;
END 


CREATE PROCEDURE UpdateUser(
    IN p_user_id INT,
    IN p_username VARCHAR(45),
    IN p_email VARCHAR(45)
)
BEGIN
    UPDATE User
    SET username = p_username,
        email = p_email
    WHERE idUser = p_user_id;
END //


CREATE PROCEDURE DeleteUser(IN p_user_id INT)
BEGIN
    DELETE FROM User WHERE idUser = p_user_id;
END 
