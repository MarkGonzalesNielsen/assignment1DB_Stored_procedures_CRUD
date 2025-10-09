// Transaction view for User with kontoaName and category name

CREATE VIEW UserTransactions AS
SELECT 
    u.idUser,
    u.username,
    a.name AS account_name,
    t.amount,
    t.description,
    t.date,
    t.type,
    c.name AS category_name,
    c.type AS category_type
FROM Transaktion t
JOIN Account a ON t.Account_idAccount = a.idAccount
JOIN User u ON a.User_idUser = u.idUser
JOIN Category c ON t.Category_idCategory = c.idCategory;


//view for budget per category  

CREATE VIEW BudgetOverview AS
SELECT 
    u.username,
    c.name AS category_name,
    b.amount AS budget_amount,
    b.budget_date
FROM Budget b
JOIN Category c ON b.Category_idCategory = c.idCategory
JOIN User u ON b.User_idUser = u.idUser;


//view for goals with user name

CREATE VIEW GoalProgress AS
SELECT 
    u.username,
    g.name AS goal_name,
    g.target_amount,
    g.current_amount,
    g.target_date,
    g.status,
    (g.current_amount / g.target_amount) * 100 AS progress_percent
FROM Goal g
JOIN User u ON g.User_idUser = u.idUser;

//view saldo per account
CREATE VIEW AccountBalances AS
SELECT 
    u.username,
    a.name AS account_name,
    a.saldo
FROM Account a
JOIN User u ON a.User_idUser = u.idUser;


//view spending vs budget per category for user

CREATE VIEW SpendingVsBudget AS
SELECT 
    u.username,
    c.name AS category_name,
    SUM(t.amount) AS total_spent,
    b.amount AS budget_amount,
    (SUM(t.amount) - b.amount) AS difference
FROM Transaktion t
JOIN Account a ON t.Account_idAccount = a.idAccount
JOIN User u ON a.User_idUser = u.idUser
JOIN Category c ON t.Category_idCategory = c.idCategory
JOIN Budget b ON b.Category_idCategory = c.idCategory 
               AND b.User_idUser = u.idUser
GROUP BY u.username, c.name, b.amount;

