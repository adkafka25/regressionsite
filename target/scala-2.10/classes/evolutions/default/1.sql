# --- First database schema

# --- !Ups

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `RegressionSite` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `RegressionSite` ;

-- -----------------------------------------------------
-- Table `RegressionSite`.`Platform`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Platform` (
  `Platform_ID` INT NOT NULL AUTO_INCREMENT ,
  `Platform_Name` VARCHAR(45) NOT NULL COMMENT 'Name of platform (ex Java, DLL...)' ,
  PRIMARY KEY (`Platform_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Version`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Version` (
  `Version_ID` INT NOT NULL AUTO_INCREMENT COMMENT 'A unique key that specifies exactly which piece of software was tested.' ,
  `Version_Name` VARCHAR(45) NOT NULL COMMENT 'For storing which revision/version of the Product.' ,
  `Platform_ID` INT NOT NULL COMMENT 'Product that was tested' ,
  PRIMARY KEY (`Version_ID`) ,
  INDEX `Version_Platform_idx` (`Platform_ID` ASC) ,
  CONSTRAINT `Version_Platform`
    FOREIGN KEY (`Platform_ID` )
    REFERENCES `RegressionSite`.`Platform` (`Platform_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Format`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Format` (
  `Format_ID` INT NOT NULL AUTO_INCREMENT ,
  `Format_Name` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`Format_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Date`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Date` (
  `Date_ID` INT NOT NULL AUTO_INCREMENT ,
  `Date_Name` DATE NULL ,
  PRIMARY KEY (`Date_ID`) ,
  UNIQUE INDEX `Date_ID_UNIQUE` (`Date_ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`SVN`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`SVN` (
  `SVN_ID` INT NOT NULL AUTO_INCREMENT ,
  `SVN_Num` INT NULL ,
  PRIMARY KEY (`SVN_ID`) ,
  UNIQUE INDEX `SVN_ID_UNIQUE` (`SVN_ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Performance`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Performance` (
  `Performance_ID` INT NOT NULL AUTO_INCREMENT ,
  `Performance_Time` TIME NOT NULL ,
  PRIMARY KEY (`Performance_ID`) ,
  UNIQUE INDEX `Performance_ID_UNIQUE` (`Performance_ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Run`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Run` (
  `Run_ID` INT NOT NULL AUTO_INCREMENT ,
  `Run_Name` VARCHAR(45) NOT NULL COMMENT 'Ex: 13.5 vs 13.2' ,
  `Version_ID` INT NOT NULL ,
  `Format_ID` INT NOT NULL ,
  `Date_ID` INT NOT NULL ,
  `SVN_ID` INT NOT NULL ,
  `Performance_ID` INT NOT NULL ,
  PRIMARY KEY (`Run_ID`) ,
  INDEX `Product1_idx` (`Version_ID` ASC) ,
  INDEX `Format_idx` (`Format_ID` ASC) ,
  INDEX `Run_Date_idx` (`Date_ID` ASC) ,
  INDEX `Run_SVN_idx` (`SVN_ID` ASC) ,
  INDEX `Run_Performance_idx` (`Performance_ID` ASC) ,
  CONSTRAINT `Run_Version`
    FOREIGN KEY (`Version_ID` )
    REFERENCES `RegressionSite`.`Version` (`Version_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Run_Format`
    FOREIGN KEY (`Format_ID` )
    REFERENCES `RegressionSite`.`Format` (`Format_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Run_Date`
    FOREIGN KEY (`Date_ID` )
    REFERENCES `RegressionSite`.`Date` (`Date_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Run_SVN`
    FOREIGN KEY (`SVN_ID` )
    REFERENCES `RegressionSite`.`SVN` (`SVN_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Run_Performance`
    FOREIGN KEY (`Performance_ID` )
    REFERENCES `RegressionSite`.`Performance` (`Performance_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`DiffType`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`DiffType` (
  `DiffType_ID` INT NOT NULL AUTO_INCREMENT ,
  `DiffType_Name` VARCHAR(45) NULL COMMENT 'Which difference kind it is (ex. better, worse...)' ,
  PRIMARY KEY (`DiffType_ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`BugStatus`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`BugStatus` (
  `BugStatus_ID` INT NOT NULL AUTO_INCREMENT ,
  `BugStatus_Name` VARCHAR(45) NULL ,
  PRIMARY KEY (`BugStatus_ID`) ,
  UNIQUE INDEX `BugStatus_ID_UNIQUE` (`BugStatus_ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Bug`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Bug` (
  `Bug_ID` INT NOT NULL AUTO_INCREMENT ,
  `Bug_Number` VARCHAR(45) NULL ,
  `Bug_Status_ID` INT NOT NULL ,
  `Format_ID` INT NULL ,
  `Version_ID` INT NULL ,
  `Date_ID` INT NOT NULL ,
  PRIMARY KEY (`Bug_ID`) ,
  INDEX `BugStatus_idx` (`Bug_Status_ID` ASC) ,
  UNIQUE INDEX `Bug_ID_UNIQUE` (`Bug_ID` ASC) ,
  INDEX `Bug_Format_idx` (`Format_ID` ASC) ,
  INDEX `Bug_Version_idx` (`Version_ID` ASC) ,
  INDEX `Bug_Date_idx` (`Date_ID` ASC) ,
  CONSTRAINT `Bug_BugStatus`
    FOREIGN KEY (`Bug_Status_ID` )
    REFERENCES `RegressionSite`.`BugStatus` (`BugStatus_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bug_Format`
    FOREIGN KEY (`Format_ID` )
    REFERENCES `RegressionSite`.`Format` (`Format_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bug_Version`
    FOREIGN KEY (`Version_ID` )
    REFERENCES `RegressionSite`.`Version` (`Version_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Bug_Date`
    FOREIGN KEY (`Date_ID` )
    REFERENCES `RegressionSite`.`Date` (`Date_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Error`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Error` (
  `Error_ID` INT NOT NULL AUTO_INCREMENT ,
  `Error_Num` INT NULL ,
  PRIMARY KEY (`Error_ID`) ,
  UNIQUE INDEX `ErrorCode_ID_UNIQUE` (`Error_ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Page`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Page` (
  `Page_ID` INT NOT NULL AUTO_INCREMENT ,
  `Page_Name` VARCHAR(45) NOT NULL ,
  `Run_ID` INT NOT NULL ,
  `Format_ID` INT NOT NULL ,
  `Performance_ID` INT NOT NULL ,
  `Error_ID` INT NULL ,
  PRIMARY KEY (`Page_ID`) ,
  INDEX `FileFormatID_idx` (`Format_ID` ASC) ,
  INDEX `Page_Error_idx` (`Error_ID` ASC) ,
  INDEX `Page_Performance_idx` (`Performance_ID` ASC) ,
  INDEX `Page_Run_idx` (`Run_ID` ASC) ,
  UNIQUE INDEX `Page_ID_UNIQUE` (`Page_ID` ASC) ,
  CONSTRAINT `Page_Format`
    FOREIGN KEY (`Format_ID` )
    REFERENCES `RegressionSite`.`Format` (`Format_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Page_Error`
    FOREIGN KEY (`Error_ID` )
    REFERENCES `RegressionSite`.`Error` (`Error_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Page_Performance`
    FOREIGN KEY (`Performance_ID` )
    REFERENCES `RegressionSite`.`Performance` (`Performance_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Page_Run`
    FOREIGN KEY (`Run_ID` )
    REFERENCES `RegressionSite`.`Run` (`Run_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`PageToBug`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`PageToBug` (
  `Page_ID` INT NOT NULL ,
  `Bug_ID` INT NOT NULL ,
  PRIMARY KEY (`Page_ID`, `Bug_ID`) ,
  INDEX `PageToBug_Page_idx` (`Page_ID` ASC) ,
  INDEX `PageToBug_Bug_idx` (`Bug_ID` ASC) ,
  CONSTRAINT `PageToBug_Page`
    FOREIGN KEY (`Page_ID` )
    REFERENCES `RegressionSite`.`Page` (`Page_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PageToBug_Bug`
    FOREIGN KEY (`Bug_ID` )
    REFERENCES `RegressionSite`.`Bug` (`Bug_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`Difference`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`Difference` (
  `Difference_ID` INT NOT NULL AUTO_INCREMENT ,
  `Difference_Name` VARCHAR(45) NULL ,
  `DiffType_ID` INT NOT NULL ,
  PRIMARY KEY (`Difference_ID`) ,
  UNIQUE INDEX `Difference_ID_UNIQUE` (`Difference_ID` ASC) ,
  INDEX `DiffType_idx` (`DiffType_ID` ASC) ,
  CONSTRAINT `DiffType`
    FOREIGN KEY (`DiffType_ID` )
    REFERENCES `RegressionSite`.`DiffType` (`DiffType_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`PageToDifference`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`PageToDifference` (
  `Page_ID` INT NOT NULL ,
  `Difference_ID` INT NOT NULL ,
  PRIMARY KEY (`Page_ID`, `Difference_ID`) ,
  INDEX `PageToDifference_Page_idx` (`Page_ID` ASC) ,
  INDEX `PageToDifference_Difference_idx` (`Difference_ID` ASC) ,
  CONSTRAINT `PageToDifference_Page`
    FOREIGN KEY (`Page_ID` )
    REFERENCES `RegressionSite`.`Page` (`Page_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PageToDifference_Difference`
    FOREIGN KEY (`Difference_ID` )
    REFERENCES `RegressionSite`.`Difference` (`Difference_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `RegressionSite`.`RunToBug`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `RegressionSite`.`RunToBug` (
  `Run_ID` INT NOT NULL ,
  `Bug_ID` INT NOT NULL ,
  PRIMARY KEY (`Run_ID`, `Bug_ID`) ,
  INDEX `RunToBug_Run_idx` (`Run_ID` ASC) ,
  INDEX `RunToBug_Bug_idx` (`Bug_ID` ASC) ,
  CONSTRAINT `RunToBug_Run`
    FOREIGN KEY (`Run_ID` )
    REFERENCES `RegressionSite`.`Run` (`Run_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `RunToBug_Bug`
    FOREIGN KEY (`Bug_ID` )
    REFERENCES `RegressionSite`.`Bug` (`Bug_ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `RegressionSite` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

# --- !Downs

DROP TABLE IF EXISTS DiffType, Difference, PageToDifference, Error, Perofrmance, Page, PageToBug, Format, BugStatus, Bug, Date, Run, SVN, Platform, Version, RunToBug
