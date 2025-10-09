-- Eventet kører den 1. i hver måned ved midnat.
CREATE EVENT evt_MonthlyBudgetSetup
ON SCHEDULE EVERY 1 MONTH
STARTS DATE_ADD(MAKEDATE(YEAR(CURDATE()), 1), INTERVAL 1 MONTH) -- Starter den 1. i næste måned
DO
BEGIN
    CALL sp_StartNewBudgetMonth();
END;