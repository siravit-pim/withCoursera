-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemon` DEFAULT CHARACTER SET utf8 ;
USE `littlelemon` ;

-- -----------------------------------------------------
-- Table `mydb`.`DimCourse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`DimCourse` (
  `CourseID` INT NOT NULL,
  `CourseName` VARCHAR(45) NULL,
  `CuisineName` VARCHAR(45) NULL,
  `StarterName` VARCHAR(45) NULL,
  `DesertName` VARCHAR(45) NULL,
  `Drink` VARCHAR(45) NULL,
  `Sides` VARCHAR(45) NULL,
  PRIMARY KEY (`CourseID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`CourseID` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb`.`DimCountry`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`DimCountry` (
  `PostalCode` VARCHAR(45) NOT NULL,
  `CountryCode` VARCHAR(11) NULL,
  `City` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  PRIMARY KEY (`PostalCode`),
  UNIQUE INDEX `PostalCode_UNIQUE` (`PostalCode` ASC) VISIBLE,
  UNIQUE INDEX `CountryCode_UNIQUE` (`CountryCode` ASC) VISIBLE);


-- -----------------------------------------------------
-- Table `mydb`.`DimCustomer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`DimCustomer` (
  `CustomerID` VARCHAR(11) NOT NULL,
  `CustomerName` VARCHAR(255) NULL,
  `PostalCode` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`CustomerID` ASC) VISIBLE,
  INDEX `fk_Customer_Country1_idx` (`PostalCode` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_Country1`
    FOREIGN KEY (`PostalCode`)
    REFERENCES `mydb`.`DimCountry` (`PostalCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `mydb`.`FactOrder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemon`.`FactOrder` (
  `OrderID` VARCHAR(11) NOT NULL,
  `OrderDate` DATE NULL,
  `DeliveryDate` DATE NULL,
  `Cost` DECIMAL(19,9) NULL,
  `Sales` DECIMAL(19,9) NULL,
  `Quantity` INT NULL,
  `Discount` DECIMAL(19,9) NULL,
  `DeliveryCost` DECIMAL(19,9) NULL,
  `CourseID` INT NOT NULL,
  `CustomerID` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrderID_UNIQUE` (`OrderID` ASC) VISIBLE,
  INDEX `fk_Order_Course_idx` (`CourseID` ASC) VISIBLE,
  INDEX `fk_Order_Customer1_idx` (`CustomerID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Course`
    FOREIGN KEY (`CourseID`)
    REFERENCES `mydb`.`DimCourse` (`CourseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `mydb`.`DimCustomer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
