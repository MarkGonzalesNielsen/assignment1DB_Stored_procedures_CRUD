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

Part 2 alter tables:


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