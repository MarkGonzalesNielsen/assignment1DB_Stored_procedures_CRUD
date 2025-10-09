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