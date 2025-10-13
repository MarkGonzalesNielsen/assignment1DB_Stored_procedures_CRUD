DELIMITER $$

CREATE TRIGGER trg_CheckGoalAchieved
AFTER UPDATE ON Goal
FOR EACH ROW
BEGIN
    -- VIGTIGT: Vi tjekker kun, hvis 'current_amount' er blevet ændret
    -- OG hvis målet endnu ikke er markeret som 'completed' (gammel status)
    IF NEW.current_amount <> OLD.current_amount AND OLD.status <> 'completed' THEN

        -- Tjekker om den nye opnåede mængde er større end eller lig med målet
        IF NEW.current_amount >= NEW.target_amount THEN

            -- Opdaterer kun rækken, der udløste triggeren
            UPDATE Goal
            SET status = 'completed'
            WHERE idGoal = NEW.idGoal;

            -- Her kunne man også indsætte en række i en 'Notification'-tabel
            -- eller logge hændelsen.

        END IF;
    END IF;

END $$
DELIMITER ;

