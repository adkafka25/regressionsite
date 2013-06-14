-- MySQL dump 10.13  Distrib 5.1.69, for Win32 (ia32)
--
-- Host: localhost    Database: regressionsite
-- ------------------------------------------------------
-- Server version	5.1.69-community

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bug`
--

DROP TABLE IF EXISTS `bug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bug` (
  `Bug_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Bug_Number` int(11) NOT NULL,
  `Bug_Status_ID` int(11) NOT NULL,
  PRIMARY KEY (`Bug_ID`),
  UNIQUE KEY `Bug_ID_UNIQUE` (`Bug_ID`),
  KEY `BugStatus_idx` (`Bug_Status_ID`),
  CONSTRAINT `Bug_BugStatus` FOREIGN KEY (`Bug_Status_ID`) REFERENCES `bugstatus` (`BugStatus_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (1,1299,1),(2,2044,2),(3,3000,3),(4,1,1),(5,2,2);
/*!40000 ALTER TABLE `bug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bugstatus`
--

DROP TABLE IF EXISTS `bugstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bugstatus` (
  `BugStatus_ID` int(11) NOT NULL AUTO_INCREMENT,
  `BugStatus_Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`BugStatus_ID`),
  UNIQUE KEY `BugStatus_ID_UNIQUE` (`BugStatus_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bugstatus`
--

LOCK TABLES `bugstatus` WRITE;
/*!40000 ALTER TABLE `bugstatus` DISABLE KEYS */;
INSERT INTO `bugstatus` VALUES (1,'Closed'),(2,'Stalled'),(3,'Open');
/*!40000 ALTER TABLE `bugstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `date`
--

DROP TABLE IF EXISTS `date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date` (
  `Date_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Date_Name` date DEFAULT NULL,
  PRIMARY KEY (`Date_ID`),
  UNIQUE KEY `Date_ID_UNIQUE` (`Date_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'2000-01-01'),(2,'2013-12-31');
/*!40000 ALTER TABLE `date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difference`
--

DROP TABLE IF EXISTS `difference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difference` (
  `Difference_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Difference_Name` varchar(45) DEFAULT NULL,
  `DiffType_ID` int(11) NOT NULL,
  PRIMARY KEY (`Difference_ID`),
  UNIQUE KEY `Difference_ID_UNIQUE` (`Difference_ID`),
  KEY `DiffType_idx` (`DiffType_ID`),
  CONSTRAINT `DiffType` FOREIGN KEY (`DiffType_ID`) REFERENCES `difftype` (`DiffType_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difference`
--

LOCK TABLES `difference` WRITE;
/*!40000 ALTER TABLE `difference` DISABLE KEYS */;
INSERT INTO `difference` VALUES (1,'Heading off center',3),(2,'Z character looks different',2),(3,'Text more in center',1),(4,'Font is sharper',1);
/*!40000 ALTER TABLE `difference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `difftype`
--

DROP TABLE IF EXISTS `difftype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difftype` (
  `DiffType_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DiffType_Name` varchar(45) DEFAULT NULL COMMENT 'Which difference kind it is (ex. better, worse...)',
  PRIMARY KEY (`DiffType_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difftype`
--

LOCK TABLES `difftype` WRITE;
/*!40000 ALTER TABLE `difftype` DISABLE KEYS */;
INSERT INTO `difftype` VALUES (1,'Better'),(2,'Neutral'),(3,'Worse');
/*!40000 ALTER TABLE `difftype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error` (
  `Error_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Error_Num` int(11) DEFAULT NULL,
  PRIMARY KEY (`Error_ID`),
  UNIQUE KEY `ErrorCode_ID_UNIQUE` (`Error_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
INSERT INTO `error` VALUES (1,400),(2,99);
/*!40000 ALTER TABLE `error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `format`
--

DROP TABLE IF EXISTS `format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `format` (
  `Format_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Format_Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Format_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'HTML'),(2,'PDF'),(3,'TIF');
/*!40000 ALTER TABLE `format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `Page_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Page_Name` varchar(45) NOT NULL,
  `Run_ID` int(11) NOT NULL,
  `Performance_ID` int(11) NOT NULL,
  `Error_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Page_ID`),
  UNIQUE KEY `Page_ID_UNIQUE` (`Page_ID`),
  KEY `Page_Error_idx` (`Error_ID`),
  KEY `Page_Performance_idx` (`Performance_ID`),
  KEY `Page_Run_idx` (`Run_ID`),
  CONSTRAINT `Page_Error` FOREIGN KEY (`Error_ID`) REFERENCES `error` (`Error_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Performance` FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Run` FOREIGN KEY (`Run_ID`) REFERENCES `run` (`Run_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'test.html',1,1,2),(2,'test.2.pdf',2,2,1),(3,'adam.1.html',1,2,1),(4,'one.1.tif',3,1,NULL),(5,'one.2.tif',3,2,NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagetobug`
--

DROP TABLE IF EXISTS `pagetobug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagetobug` (
  `Page_ID` int(11) NOT NULL,
  `Bug_ID` int(11) NOT NULL,
  PRIMARY KEY (`Page_ID`,`Bug_ID`),
  KEY `PageToBug_Page_idx` (`Page_ID`),
  KEY `PageToBug_Bug_idx` (`Bug_ID`),
  CONSTRAINT `PageToBug_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PageToBug_Bug` FOREIGN KEY (`Bug_ID`) REFERENCES `bug` (`Bug_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetobug`
--

LOCK TABLES `pagetobug` WRITE;
/*!40000 ALTER TABLE `pagetobug` DISABLE KEYS */;
INSERT INTO `pagetobug` VALUES (1,1),(1,2),(2,5),(3,3),(4,4);
/*!40000 ALTER TABLE `pagetobug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagetodifference`
--

DROP TABLE IF EXISTS `pagetodifference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagetodifference` (
  `Page_ID` int(11) NOT NULL,
  `Difference_ID` int(11) NOT NULL,
  PRIMARY KEY (`Page_ID`,`Difference_ID`),
  KEY `PageToDifference_Page_idx` (`Page_ID`),
  KEY `PageToDifference_Difference_idx` (`Difference_ID`),
  CONSTRAINT `PageToDifference_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PageToDifference_Difference` FOREIGN KEY (`Difference_ID`) REFERENCES `difference` (`Difference_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetodifference`
--

LOCK TABLES `pagetodifference` WRITE;
/*!40000 ALTER TABLE `pagetodifference` DISABLE KEYS */;
INSERT INTO `pagetodifference` VALUES (1,1),(1,2),(3,3);
/*!40000 ALTER TABLE `pagetodifference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance`
--

DROP TABLE IF EXISTS `performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `performance` (
  `Performance_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Performance_Time` time NOT NULL,
  PRIMARY KEY (`Performance_ID`),
  UNIQUE KEY `Performance_ID_UNIQUE` (`Performance_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (1,'00:01:00'),(2,'01:25:00'),(3,'00:00:50'),(4,'10:00:00');
/*!40000 ALTER TABLE `performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform` (
  `Platform_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Platform_Name` varchar(45) NOT NULL COMMENT 'Name of platform (ex Java, DLL...)',
  PRIMARY KEY (`Platform_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'VirtualViewer'),(2,'RasterMaster'),(3,'SnoBatch');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `play_evolutions`
--

DROP TABLE IF EXISTS `play_evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `play_evolutions` (
  `id` int(11) NOT NULL,
  `hash` varchar(255) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `apply_script` text,
  `revert_script` text,
  `state` varchar(255) DEFAULT NULL,
  `last_problem` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `play_evolutions`
--

LOCK TABLES `play_evolutions` WRITE;
/*!40000 ALTER TABLE `play_evolutions` DISABLE KEYS */;
INSERT INTO `play_evolutions` VALUES (1,'ee4c6b2e4096e2c2708d8515085a6e2057aaedf7','2013-06-10 19:03:01','SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;\nSET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;\nSET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=\'TRADITIONAL,ALLOW_INVALID_DATES\';\n\nCREATE SCHEMA IF NOT EXISTS `RegressionSite` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;\nUSE `RegressionSite` ;\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Platform`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Platform` (\n`Platform_ID` INT NOT NULL AUTO_INCREMENT ,\n`Platform_Name` VARCHAR(45) NOT NULL COMMENT \'Name of platform (ex Java, DLL...)\' ,\nPRIMARY KEY (`Platform_ID`) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Version`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Version` (\n`Version_ID` INT NOT NULL AUTO_INCREMENT COMMENT \'A unique key that specifies exactly which piece of software was tested.\' ,\n`Version_Name` VARCHAR(45) NOT NULL COMMENT \'For storing which revision/version of the Product.\' ,\n`Platform_ID` INT NOT NULL COMMENT \'Product that was tested\' ,\nPRIMARY KEY (`Version_ID`) ,\nINDEX `Version_Platform_idx` (`Platform_ID` ASC) ,\nCONSTRAINT `Version_Platform`\nFOREIGN KEY (`Platform_ID` )\nREFERENCES `RegressionSite`.`Platform` (`Platform_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Format`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Format` (\n`Format_ID` INT NOT NULL AUTO_INCREMENT ,\n`Format_Name` VARCHAR(45) NOT NULL ,\nPRIMARY KEY (`Format_ID`) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Date`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Date` (\n`Date_ID` INT NOT NULL AUTO_INCREMENT ,\n`Date_Name` DATE NULL ,\nPRIMARY KEY (`Date_ID`) ,\nUNIQUE INDEX `Date_ID_UNIQUE` (`Date_ID` ASC) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`SVN`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`SVN` (\n`SVN_ID` INT NOT NULL AUTO_INCREMENT ,\n`SVN_Num` INT NULL ,\nPRIMARY KEY (`SVN_ID`) ,\nUNIQUE INDEX `SVN_ID_UNIQUE` (`SVN_ID` ASC) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Performance`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Performance` (\n`Performance_ID` INT NOT NULL AUTO_INCREMENT ,\n`Performance_Time` TIME NOT NULL ,\nPRIMARY KEY (`Performance_ID`) ,\nUNIQUE INDEX `Performance_ID_UNIQUE` (`Performance_ID` ASC) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Run`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Run` (\n`Run_ID` INT NOT NULL AUTO_INCREMENT ,\n`Run_Name` VARCHAR(45) NOT NULL COMMENT \'Ex: 13.5 vs 13.2\' ,\n`Version_ID` INT NOT NULL ,\n`Format_ID` INT NOT NULL ,\n`Date_ID` INT NOT NULL ,\n`SVN_ID` INT NOT NULL ,\n`Performance_ID` INT NOT NULL ,\nPRIMARY KEY (`Run_ID`) ,\nINDEX `Product1_idx` (`Version_ID` ASC) ,\nINDEX `Format_idx` (`Format_ID` ASC) ,\nINDEX `Run_Date_idx` (`Date_ID` ASC) ,\nINDEX `Run_SVN_idx` (`SVN_ID` ASC) ,\nINDEX `Run_Performance_idx` (`Performance_ID` ASC) ,\nCONSTRAINT `Run_Version`\nFOREIGN KEY (`Version_ID` )\nREFERENCES `RegressionSite`.`Version` (`Version_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Run_Format`\nFOREIGN KEY (`Format_ID` )\nREFERENCES `RegressionSite`.`Format` (`Format_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Run_Date`\nFOREIGN KEY (`Date_ID` )\nREFERENCES `RegressionSite`.`Date` (`Date_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Run_SVN`\nFOREIGN KEY (`SVN_ID` )\nREFERENCES `RegressionSite`.`SVN` (`SVN_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Run_Performance`\nFOREIGN KEY (`Performance_ID` )\nREFERENCES `RegressionSite`.`Performance` (`Performance_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`DiffType`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`DiffType` (\n`DiffType_ID` INT NOT NULL AUTO_INCREMENT ,\n`DiffType_Name` VARCHAR(45) NULL COMMENT \'Which difference kind it is (ex. better, worse...)\' ,\nPRIMARY KEY (`DiffType_ID`) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`BugStatus`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`BugStatus` (\n`BugStatus_ID` INT NOT NULL AUTO_INCREMENT ,\n`BugStatus_Name` VARCHAR(45) NULL ,\nPRIMARY KEY (`BugStatus_ID`) ,\nUNIQUE INDEX `BugStatus_ID_UNIQUE` (`BugStatus_ID` ASC) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Bug`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Bug` (\n`Bug_ID` INT NOT NULL AUTO_INCREMENT ,\n`Bug_Number` VARCHAR(45) NULL ,\n`Bug_Status_ID` INT NOT NULL ,\n`Format_ID` INT NULL ,\n`Version_ID` INT NULL ,\n`Date_ID` INT NOT NULL ,\nPRIMARY KEY (`Bug_ID`) ,\nINDEX `BugStatus_idx` (`Bug_Status_ID` ASC) ,\nUNIQUE INDEX `Bug_ID_UNIQUE` (`Bug_ID` ASC) ,\nINDEX `Bug_Format_idx` (`Format_ID` ASC) ,\nINDEX `Bug_Version_idx` (`Version_ID` ASC) ,\nINDEX `Bug_Date_idx` (`Date_ID` ASC) ,\nCONSTRAINT `Bug_BugStatus`\nFOREIGN KEY (`Bug_Status_ID` )\nREFERENCES `RegressionSite`.`BugStatus` (`BugStatus_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Bug_Format`\nFOREIGN KEY (`Format_ID` )\nREFERENCES `RegressionSite`.`Format` (`Format_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Bug_Version`\nFOREIGN KEY (`Version_ID` )\nREFERENCES `RegressionSite`.`Version` (`Version_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Bug_Date`\nFOREIGN KEY (`Date_ID` )\nREFERENCES `RegressionSite`.`Date` (`Date_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Error`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Error` (\n`Error_ID` INT NOT NULL AUTO_INCREMENT ,\n`Error_Num` INT NULL ,\nPRIMARY KEY (`Error_ID`) ,\nUNIQUE INDEX `ErrorCode_ID_UNIQUE` (`Error_ID` ASC) )\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Page`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Page` (\n`Page_ID` INT NOT NULL AUTO_INCREMENT ,\n`Page_Name` VARCHAR(45) NOT NULL ,\n`Run_ID` INT NOT NULL ,\n`Format_ID` INT NOT NULL ,\n`Performance_ID` INT NOT NULL ,\n`Error_ID` INT NULL ,\nPRIMARY KEY (`Page_ID`) ,\nINDEX `FileFormatID_idx` (`Format_ID` ASC) ,\nINDEX `Page_Error_idx` (`Error_ID` ASC) ,\nINDEX `Page_Performance_idx` (`Performance_ID` ASC) ,\nINDEX `Page_Run_idx` (`Run_ID` ASC) ,\nUNIQUE INDEX `Page_ID_UNIQUE` (`Page_ID` ASC) ,\nCONSTRAINT `Page_Format`\nFOREIGN KEY (`Format_ID` )\nREFERENCES `RegressionSite`.`Format` (`Format_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Page_Error`\nFOREIGN KEY (`Error_ID` )\nREFERENCES `RegressionSite`.`Error` (`Error_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Page_Performance`\nFOREIGN KEY (`Performance_ID` )\nREFERENCES `RegressionSite`.`Performance` (`Performance_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `Page_Run`\nFOREIGN KEY (`Run_ID` )\nREFERENCES `RegressionSite`.`Run` (`Run_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`PageToBug`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`PageToBug` (\n`Page_ID` INT NOT NULL ,\n`Bug_ID` INT NOT NULL ,\nPRIMARY KEY (`Page_ID`, `Bug_ID`) ,\nINDEX `PageToBug_Page_idx` (`Page_ID` ASC) ,\nINDEX `PageToBug_Bug_idx` (`Bug_ID` ASC) ,\nCONSTRAINT `PageToBug_Page`\nFOREIGN KEY (`Page_ID` )\nREFERENCES `RegressionSite`.`Page` (`Page_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `PageToBug_Bug`\nFOREIGN KEY (`Bug_ID` )\nREFERENCES `RegressionSite`.`Bug` (`Bug_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`Difference`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`Difference` (\n`Difference_ID` INT NOT NULL AUTO_INCREMENT ,\n`Difference_Name` VARCHAR(45) NULL ,\n`DiffType_ID` INT NOT NULL ,\nPRIMARY KEY (`Difference_ID`) ,\nUNIQUE INDEX `Difference_ID_UNIQUE` (`Difference_ID` ASC) ,\nINDEX `DiffType_idx` (`DiffType_ID` ASC) ,\nCONSTRAINT `DiffType`\nFOREIGN KEY (`DiffType_ID` )\nREFERENCES `RegressionSite`.`DiffType` (`DiffType_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`PageToDifference`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`PageToDifference` (\n`Page_ID` INT NOT NULL ,\n`Difference_ID` INT NOT NULL ,\nPRIMARY KEY (`Page_ID`, `Difference_ID`) ,\nINDEX `PageToDifference_Page_idx` (`Page_ID` ASC) ,\nINDEX `PageToDifference_Difference_idx` (`Difference_ID` ASC) ,\nCONSTRAINT `PageToDifference_Page`\nFOREIGN KEY (`Page_ID` )\nREFERENCES `RegressionSite`.`Page` (`Page_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `PageToDifference_Difference`\nFOREIGN KEY (`Difference_ID` )\nREFERENCES `RegressionSite`.`Difference` (`Difference_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\n\n-- -----------------------------------------------------\n-- Table `RegressionSite`.`RunToBug`\n-- -----------------------------------------------------\nCREATE  TABLE IF NOT EXISTS `RegressionSite`.`RunToBug` (\n`Run_ID` INT NOT NULL ,\n`Bug_ID` INT NOT NULL ,\nPRIMARY KEY (`Run_ID`, `Bug_ID`) ,\nINDEX `RunToBug_Run_idx` (`Run_ID` ASC) ,\nINDEX `RunToBug_Bug_idx` (`Bug_ID` ASC) ,\nCONSTRAINT `RunToBug_Run`\nFOREIGN KEY (`Run_ID` )\nREFERENCES `RegressionSite`.`Run` (`Run_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,\nCONSTRAINT `RunToBug_Bug`\nFOREIGN KEY (`Bug_ID` )\nREFERENCES `RegressionSite`.`Bug` (`Bug_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION)\nENGINE = InnoDB;\n\nUSE `RegressionSite` ;\n\n\nSET SQL_MODE=@OLD_SQL_MODE;\nSET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\nSET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;','DROP TABLE IF EXISTS DiffType, Difference, PageToDifference, Error, Perofrmance, Page, PageToBug, Format, BugStatus, Bug, Date, Run, SVN, Platform, Version, RunToBug','applied',''),(2,'cd6c9f876540cd6701235a3deb694dd5273b0f9d','2013-06-11 15:36:50','ALTER TABLE `RegressionSite`.`Page`\nDROP FOREIGN KEY `Page_Format`,\nDROP COLUMN `Format_ID`,\nDROP INDEX `FileFormatID_idx` ;','ALTER TABLE `RegressionSite`.`Page`\nADD `Format_ID` INT NOT NULL ,\nADD INDEX `FileFormatID_idx` (`Format_ID` ASC) ,\nADD CONSTRAINT `Page_Format`\nFOREIGN KEY (`Format_ID` )\nREFERENCES `RegressionSite`.`Format` (`Format_ID` )\nON DELETE NO ACTION\nON UPDATE NO ACTION,','applied',''),(3,'c03f93d3e03e783ca30fd543e3e1fc46bf4cf519','2013-06-12 04:00:00','-- MySQL dump 10.13  Distrib 5.1.69, for Win32 (ia32)\n--\n-- Host: localhost    Database: regressionsite\n-- ------------------------------------------------------\n-- Server version	5.1.69-community\n\n/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;\n/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;\n/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;\n/*!40101 SET NAMES utf8 */;\n/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;\n/*!40103 SET TIME_ZONE=\'+00:00\' */;\n/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;\n/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;\n/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=\'NO_AUTO_VALUE_ON_ZERO\' */;\n/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;\n\n--\n-- Dumping data for table `bug`\n--\n\nLOCK TABLES `bug` WRITE;\n/*!40000 ALTER TABLE `bug` DISABLE KEYS */;\n/*!40000 ALTER TABLE `bug` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `bugstatus`\n--\n\nLOCK TABLES `bugstatus` WRITE;\n/*!40000 ALTER TABLE `bugstatus` DISABLE KEYS */;\n/*!40000 ALTER TABLE `bugstatus` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `date`\n--\n\nLOCK TABLES `date` WRITE;\n/*!40000 ALTER TABLE `date` DISABLE KEYS */;\nINSERT INTO `date` VALUES (1,\'2000-01-01\');\n/*!40000 ALTER TABLE `date` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `difference`\n--\n\nLOCK TABLES `difference` WRITE;\n/*!40000 ALTER TABLE `difference` DISABLE KEYS */;\nINSERT INTO `difference` VALUES (1,\'Heading off center\',3),(2,\'Z character looks different\',2),(3,\'Text more in center\',1),(4,\'Font is sharper\',1);\n/*!40000 ALTER TABLE `difference` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `difftype`\n--\n\nLOCK TABLES `difftype` WRITE;\n/*!40000 ALTER TABLE `difftype` DISABLE KEYS */;\nINSERT INTO `difftype` VALUES (1,\'Better\'),(2,\'Neutral\'),(3,\'Worse\');\n/*!40000 ALTER TABLE `difftype` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `error`\n--\n\nLOCK TABLES `error` WRITE;\n/*!40000 ALTER TABLE `error` DISABLE KEYS */;\nINSERT INTO `error` VALUES (1,400),(2,99);\n/*!40000 ALTER TABLE `error` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `format`\n--\n\nLOCK TABLES `format` WRITE;\n/*!40000 ALTER TABLE `format` DISABLE KEYS */;\nINSERT INTO `format` VALUES (1,\'HTML\'),(2,\'PDF\'),(3,\'TIF\');\n/*!40000 ALTER TABLE `format` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `page`\n--\n\nLOCK TABLES `page` WRITE;\n/*!40000 ALTER TABLE `page` DISABLE KEYS */;\nINSERT INTO `page` VALUES (1,\'test.html\',1,1,2),(2,\'test.2.pdf\',2,2,1),(3,\'adam.1.html\',1,2,1);\n/*!40000 ALTER TABLE `page` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `pagetobug`\n--\n\nLOCK TABLES `pagetobug` WRITE;\n/*!40000 ALTER TABLE `pagetobug` DISABLE KEYS */;\n/*!40000 ALTER TABLE `pagetobug` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `pagetodifference`\n--\n\nLOCK TABLES `pagetodifference` WRITE;\n/*!40000 ALTER TABLE `pagetodifference` DISABLE KEYS */;\nINSERT INTO `pagetodifference` VALUES (1,1),(1,2),(3,3);\n/*!40000 ALTER TABLE `pagetodifference` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `performance`\n--\n\nLOCK TABLES `performance` WRITE;\n/*!40000 ALTER TABLE `performance` DISABLE KEYS */;\nINSERT INTO `performance` VALUES (1,\'00:01:00\'),(2,\'01:25:00\'),(3,\'00:00:50\'),(4,\'10:00:00\');\n/*!40000 ALTER TABLE `performance` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `platform`\n--\n\nLOCK TABLES `platform` WRITE;\n/*!40000 ALTER TABLE `platform` DISABLE KEYS */;\nINSERT INTO `platform` VALUES (1,\'VirtualViewer\'),(2,\'RasterMaster\'),(3,\'SnoBatch\');\n/*!40000 ALTER TABLE `platform` ENABLE KEYS */;\nUNLOCK TABLES;\n\n\n--\n-- Dumping data for table `run`\n--\n\nLOCK TABLES `run` WRITE;\n/*!40000 ALTER TABLE `run` DISABLE KEYS */;\nINSERT INTO `run` VALUES (1,\'13.5 vs. 13.6\',1,1,1,1,1),(2,\'13.5 vs. gold\',1,2,1,1,1);\n/*!40000 ALTER TABLE `run` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `runtobug`\n--\n\nLOCK TABLES `runtobug` WRITE;\n/*!40000 ALTER TABLE `runtobug` DISABLE KEYS */;\n/*!40000 ALTER TABLE `runtobug` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `svn`\n--\n\nLOCK TABLES `svn` WRITE;\n/*!40000 ALTER TABLE `svn` DISABLE KEYS */;\nINSERT INTO `svn` VALUES (1,1234),(2,4321);\n/*!40000 ALTER TABLE `svn` ENABLE KEYS */;\nUNLOCK TABLES;\n\n--\n-- Dumping data for table `version`\n--\n\nLOCK TABLES `version` WRITE;\n/*!40000 ALTER TABLE `version` DISABLE KEYS */;\nINSERT INTO `version` VALUES (1,\'13.5\',1),(2,\'13.6\',2);\n/*!40000 ALTER TABLE `version` ENABLE KEYS */;\nUNLOCK TABLES;\n/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;\n\n/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;\n/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;\n/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;\n/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;\n/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;\n/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;\n/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;\n\n-- Dump completed on 2013-06-12 11:23:12','MANUALLY DELETE ALL DATA FROM TABLES!;','applying_up','');
/*!40000 ALTER TABLE `play_evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `run`
--

DROP TABLE IF EXISTS `run`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `run` (
  `Run_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Run_Name` varchar(45) NOT NULL COMMENT 'Ex: 13.5 vs 13.2',
  `Version_ID` int(11) NOT NULL,
  `Format_ID` int(11) NOT NULL,
  `Date_ID` int(11) NOT NULL,
  `SVN_ID` int(11) NOT NULL,
  `Performance_ID` int(11) NOT NULL,
  PRIMARY KEY (`Run_ID`),
  KEY `Product1_idx` (`Version_ID`),
  KEY `Format_idx` (`Format_ID`),
  KEY `Run_Date_idx` (`Date_ID`),
  KEY `Run_SVN_idx` (`SVN_ID`),
  KEY `Run_Performance_idx` (`Performance_ID`),
  CONSTRAINT `Run_Version` FOREIGN KEY (`Version_ID`) REFERENCES `version` (`Version_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_Format` FOREIGN KEY (`Format_ID`) REFERENCES `format` (`Format_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_Date` FOREIGN KEY (`Date_ID`) REFERENCES `date` (`Date_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_SVN` FOREIGN KEY (`SVN_ID`) REFERENCES `svn` (`SVN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_Performance` FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (1,'13.5 vs. 13.6',1,1,1,1,1),(2,'13.5 vs. gold',1,2,2,1,1),(3,'13.6 vs 13.5',2,3,1,2,2);
/*!40000 ALTER TABLE `run` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `runtobug`
--

DROP TABLE IF EXISTS `runtobug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `runtobug` (
  `Run_ID` int(11) NOT NULL,
  `Bug_ID` int(11) NOT NULL,
  PRIMARY KEY (`Run_ID`,`Bug_ID`),
  KEY `RunToBug_Run_idx` (`Run_ID`),
  KEY `RunToBug_Bug_idx` (`Bug_ID`),
  CONSTRAINT `RunToBug_Run` FOREIGN KEY (`Run_ID`) REFERENCES `run` (`Run_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `RunToBug_Bug` FOREIGN KEY (`Bug_ID`) REFERENCES `bug` (`Bug_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `runtobug`
--

LOCK TABLES `runtobug` WRITE;
/*!40000 ALTER TABLE `runtobug` DISABLE KEYS */;
/*!40000 ALTER TABLE `runtobug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `svn`
--

DROP TABLE IF EXISTS `svn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `svn` (
  `SVN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SVN_Num` int(11) DEFAULT NULL,
  PRIMARY KEY (`SVN_ID`),
  UNIQUE KEY `SVN_ID_UNIQUE` (`SVN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn`
--

LOCK TABLES `svn` WRITE;
/*!40000 ALTER TABLE `svn` DISABLE KEYS */;
INSERT INTO `svn` VALUES (1,1234),(2,4321);
/*!40000 ALTER TABLE `svn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version`
--

DROP TABLE IF EXISTS `version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `version` (
  `Version_ID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A unique key that specifies exactly which piece of software was tested.',
  `Version_Name` varchar(45) NOT NULL COMMENT 'For storing which revision/version of the Product.',
  `Platform_ID` int(11) NOT NULL COMMENT 'Product that was tested',
  PRIMARY KEY (`Version_ID`),
  KEY `Version_Platform_idx` (`Platform_ID`),
  CONSTRAINT `Version_Platform` FOREIGN KEY (`Platform_ID`) REFERENCES `platform` (`Platform_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'13.5',1),(2,'13.6',2);
/*!40000 ALTER TABLE `version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-06-14  9:57:14
