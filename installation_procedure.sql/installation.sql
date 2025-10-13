Part 1 create schema + tables:

-- Create schema
CREATE DATABASE IF NOT EXISTS mydb
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
USE mydb;

-- -----------------------------------------------------
-- Table `User`
-- -----------------------------------------------------
CREATE TABLE `User` (
  `idUser` INT AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(45),
  `password` VARCHAR(45),
  `email` VARCHAR(45),
  `created_at` DATE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- -----------------------------------------------------
-- Table `Account`
-- -----------------------------------------------------
CREATE TABLE `Account` (
  `idAccount` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(45),
  `saldo` FLOAT,
  `User_idUser` INT,
  CONSTRAINT `fk_Account_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- -----------------------------------------------------
-- Table `Category`
-- -----------------------------------------------------
CREATE TABLE `Category` (
  `idCategory` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(45),
  `type` VARCHAR(45)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- -----------------------------------------------------
-- Table `Budget`
-- -----------------------------------------------------
CREATE TABLE `Budget` (
  `idBudget` INT AUTO_INCREMENT PRIMARY KEY,
  `amount` FLOAT,
  `budget_date` DATE,
  `Category_idCategory` INT,
  `User_idUser` INT,
  CONSTRAINT `fk_Budget_Category1`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Budget_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- -----------------------------------------------------
-- Table `Goal`
-- -----------------------------------------------------
CREATE TABLE `Goal` (
  `idGoal` INT AUTO_INCREMENT PRIMARY KEY,
  `name` VARCHAR(45),
  `target_amount` FLOAT,
  `current_amount` FLOAT,
  `target_date` DATE,
  `status` VARCHAR(45),
  `User_idUser` INT,
  CONSTRAINT `fk_Goal_User1`
    FOREIGN KEY (`User_idUser`)
    REFERENCES `User` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- -----------------------------------------------------
-- Table `Transaktion`
-- -----------------------------------------------------
CREATE TABLE `Transaktion` (
  `idTransaktion` INT AUTO_INCREMENT PRIMARY KEY,
  `amount` FLOAT,
  `description` VARCHAR(45),
  `date` DATE,
  `type` ENUM('income', 'expends'),
  `Category_idCategory` INT,
  `Account_idAccount` INT,
  CONSTRAINT `fk_Transaktion_Category1`
    FOREIGN KEY (`Category_idCategory`)
    REFERENCES `Category` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Transaktion_Account1`
    FOREIGN KEY (`Account_idAccount`)
    REFERENCES `Account` (`idAccount`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

Part 2 populate tables:

USE mydb;

-- Populate User table
INSERT INTO User (idUser, username, password, email, created_at)
VALUES
(1, 'mark', 'password123', 'mark@example.com', '2025-01-01'),
(2, 'anna', 'securepass', 'anna@example.com', '2025-02-15'),
(3, 'john', 'mypassword', 'john@example.com', '2025-03-10');

-- Populate Account table
INSERT INTO Account (idAccount, name, saldo, User_idUser)
VALUES
(1, 'Main Account', 5000.00, 1),
(2, 'Savings Account', 12000.00, 1),
(3, 'Holiday Fund', 2000.00, 2),
(4, 'Checking', 750.00, 3);

-- Populate Category table
INSERT INTO Category (idCategory, name, type)
VALUES
(1, 'Groceries', 'Expense'),
(2, 'Rent', 'Expense'),
(3, 'Salary', 'Income'),
(4, 'Entertainment', 'Expense'),
(5, 'Savings', 'Income');

-- Populate Transaktion table
INSERT INTO Transaktion (idTransaktion, amount, description, date, type, Category_idCategory, Account_idAccount)
VALUES
(1, 3000.00, 'Monthly Salary', '2025-09-30', 'income', 3, 1),
(2, 150.00, 'Groceries at Supermarket', '2025-10-01', 'expends', 1, 1),
(3, 700.00, 'Monthly Rent', '2025-10-02', 'expends', 2, 1),
(4, 200.00, 'Cinema and Snacks', '2025-10-03', 'expends', 4, 1),
(5, 500.00, 'Transfer to Savings', '2025-10-04', 'expends', 5, 1),
(6, 1000.00, 'Freelance Project', '2025-09-29', 'income', 3, 4);

-- Populate Budget table
INSERT INTO Budget (idBudget, amount, budget_date, Category_idCategory, User_idUser)
VALUES
(1, 400.00, '2025-10-01', 1, 1),
(2, 800.00, '2025-10-01', 2, 1),
(3, 200.00, '2025-10-01', 4, 1),
(4, 500.00, '2025-10-01', 1, 2),
(5, 1000.00, '2025-10-01', 2, 3);

-- Populate Goal table
INSERT INTO Goal (idGoal, name, target_amount, current_amount, target_date, status, User_idUser)
VALUES
(1, 'Buy New Laptop', 8000.00, 3000.00, '2025-12-31', 'in progress', 1),
(2, 'Vacation in Spain', 5000.00, 2000.00, '2025-07-01', 'in progress', 2),
(3, 'Emergency Fund', 10000.00, 7000.00, '2026-01-01', 'in progress', 3);



Part 3 alter tables:


-- MySQL Workbench Synchronization
-- Generated: 2025-10-09 16:07
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: johan

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `mydb`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `mydb`.`Transaktion` 
DROP FOREIGN KEY `fk_Transaktion_Account1`;

ALTER TABLE `mydb`.`Budget` 
DROP FOREIGN KEY `fk_Budget_Category1`,
DROP FOREIGN KEY `fk_Budget_User1`;

ALTER TABLE `mydb`.`Account` 
DROP FOREIGN KEY `fk_Account_User1`;

ALTER TABLE `mydb`.`Goal` 
DROP FOREIGN KEY `fk_Goal_User1`;

ALTER TABLE `mydb`.`Transaktion` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `type` `type` ENUM("income", "expends") NULL DEFAULT NULL ;

ALTER TABLE `mydb`.`Category` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`Budget` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`User` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`Account` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`Goal` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `mydb`.`Transaktion` 
DROP FOREIGN KEY `fk_Transaktion_Category1`;

ALTER TABLE `mydb`.`Transaktion` ADD CONSTRAINT `fk_Transaktion_Category1`
  FOREIGN KEY (`Category_idCategory`)
  REFERENCES `mydb`.`Category` (`idCategory`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Transaktion_Account1`
  FOREIGN KEY (`Account_idAccount`)
  REFERENCES `mydb`.`Account` (`idAccount`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`Budget` 
ADD CONSTRAINT `fk_Budget_Category1`
  FOREIGN KEY (`Category_idCategory`)
  REFERENCES `mydb`.`Category` (`idCategory`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Budget_User1`
  FOREIGN KEY (`User_idUser`)
  REFERENCES `mydb`.`User` (`idUser`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`Account` 
ADD CONSTRAINT `fk_Account_User1`
  FOREIGN KEY (`User_idUser`)
  REFERENCES `mydb`.`User` (`idUser`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `mydb`.`Goal` 
ADD CONSTRAINT `fk_Goal_User1`
  FOREIGN KEY (`User_idUser`)
  REFERENCES `mydb`.`User` (`idUser`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;