

// Indexes for User and Account tables
CREATE INDEX idx_user_username ON User (username);
CREATE INDEX idx_user_email ON User (email);


//Hjælper ved joins mellem bruger og konto, samt når du søger efter kontonavn.
CREATE INDEX idx_account_user ON Account (User_idUser);
CREATE INDEX idx_account_name ON Account (name);

//Disse forbedrer performance ved joins og når du filtrerer efter dato eller type (fx “indkomst” vs “udgift”).
CREATE INDEX idx_transaktion_account ON Transaktion (Account_idAccount);
CREATE INDEX idx_transaktion_category ON Transaktion (Category_idCategory);
CREATE INDEX idx_transaktion_date ON Transaktion (date);
CREATE INDEX idx_transaktion_type ON Transaktion (type);

//Hjælper med forespørgsler som “vis alle aktive mål” eller “mål før en bestemt dato”.
CREATE INDEX idx_goal_user ON Goal (User_idUser);
CREATE INDEX idx_goal_status ON Goal (status);
CREATE INDEX idx_goal_target_date ON Goal (target_date);

