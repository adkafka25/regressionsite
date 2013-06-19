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
  `Bug_Status_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Bug_ID`),
  UNIQUE KEY `Bug_ID_UNIQUE` (`Bug_ID`),
  KEY `BugStatus_idx` (`Bug_Status_ID`),
  CONSTRAINT `Bug_BugStatus` FOREIGN KEY (`Bug_Status_ID`) REFERENCES `bugstatus` (`BugStatus_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (9,6371,NULL),(10,6373,NULL),(11,6374,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'2000-01-01'),(2,'2013-12-31'),(3,'2010-05-20'),(4,'2010-10-10'),(5,'2013-10-10'),(6,'2013-10-13'),(7,'1111-11-11'),(8,'2013-06-19'),(9,'2013-06-20');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difference`
--

LOCK TABLES `difference` WRITE;
/*!40000 ALTER TABLE `difference` DISABLE KEYS */;
INSERT INTO `difference` VALUES (13,'AddedCharacters',1),(14,'CorrectedCharacters',1),(15,'No description',2),(16,'TextLost',3),(17,'WrongCharacters',3),(18,'MissingDash',3),(19,'TextShrink',3),(20,'NoOverlap',1),(21,'Missing Time',3),(22,'Shifted Text',3),(23,'Wrong Date',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difftype`
--

LOCK TABLES `difftype` WRITE;
/*!40000 ALTER TABLE `difftype` DISABLE KEYS */;
INSERT INTO `difftype` VALUES (1,'Better'),(2,'Neutral'),(3,'Worse'),(4,'None');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'HTML'),(2,'PDF'),(3,'TIF'),(4,'AFP'),(5,'MS Office');
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
  `Page_Name` varchar(110) NOT NULL,
  `Run_ID` int(11) NOT NULL,
  `Performance_ID` int(11) DEFAULT NULL,
  `Error_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`Page_ID`),
  UNIQUE KEY `Page_ID_UNIQUE` (`Page_ID`),
  KEY `Page_Error_idx` (`Error_ID`),
  KEY `Page_Performance_idx` (`Performance_ID`),
  KEY `Page_Run_idx` (`Run_ID`),
  CONSTRAINT `Page_Error` FOREIGN KEY (`Error_ID`) REFERENCES `error` (`Error_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Performance` FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Run` FOREIGN KEY (`Run_ID`) REFERENCES `run` (`Run_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1237 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (829,'rla3a4.afp.1.1ref.tif',34,NULL,NULL),(830,'rla3a4.afp.1.2new.tif',34,NULL,NULL),(831,'rla3a4.afp.1.3dif.tif',34,NULL,NULL),(832,'18571-TEST2-Polish-currency.AFP.1.1ref.tif',34,NULL,NULL),(833,'18571-TEST2-Polish-currency.AFP.1.2new.tif',34,NULL,NULL),(834,'18571-TEST2-Polish-currency.AFP.1.3dif.tif',34,NULL,NULL),(835,'18571-TEST2-Polish-currency.AFP.2.1ref.tif',34,NULL,NULL),(836,'18571-TEST2-Polish-currency.AFP.2.2new.tif',34,NULL,NULL),(837,'18571-TEST2-Polish-currency.AFP.2.3dif.tif',34,NULL,NULL),(838,'18571-TEST2-Polish-currency.AFP.3.1ref.tif',34,NULL,NULL),(839,'18571-TEST2-Polish-currency.AFP.3.2new.tif',34,NULL,NULL),(840,'18571-TEST2-Polish-currency.AFP.3.3dif.tif',34,NULL,NULL),(841,'18571-TEST2-Polish-currency.AFP.4.1ref.tif',34,NULL,NULL),(842,'18571-TEST2-Polish-currency.AFP.4.2new.tif',34,NULL,NULL),(843,'18571-TEST2-Polish-currency.AFP.4.3dif.tif',34,NULL,NULL),(844,'18960-Letters.AFP.2.1ref.tif',34,NULL,NULL),(845,'18960-Letters.AFP.2.2new.tif',34,NULL,NULL),(846,'18960-Letters.AFP.2.3dif.tif',34,NULL,NULL),(847,'18960-Letters.AFP.3.1ref.tif',34,NULL,NULL),(848,'18960-Letters.AFP.3.2new.tif',34,NULL,NULL),(849,'18960-Letters.AFP.3.3dif.tif',34,NULL,NULL),(850,'uh220b.afp.1.1ref.tif',34,NULL,NULL),(851,'uh220b.afp.1.2new.tif',34,NULL,NULL),(852,'uh220b.afp.1.3dif.tif',34,NULL,NULL),(853,'15687-inversion.afp.2.1ref.tif',34,NULL,NULL),(854,'15687-inversion.afp.2.2new.tif',34,NULL,NULL),(855,'15687-inversion.afp.2.3dif.tif',34,NULL,NULL),(856,'15687-inversion.afp.3.1ref.tif',34,NULL,NULL),(857,'15687-inversion.afp.3.2new.tif',34,NULL,NULL),(858,'15687-inversion.afp.3.3dif.tif',34,NULL,NULL),(859,'15687-inversion.afp.4.1ref.tif',34,NULL,NULL),(860,'15687-inversion.afp.4.2new.tif',34,NULL,NULL),(861,'15687-inversion.afp.4.3dif.tif',34,NULL,NULL),(862,'15687-inversion.afp.5.1ref.tif',34,NULL,NULL),(863,'15687-inversion.afp.5.2new.tif',34,NULL,NULL),(864,'15687-inversion.afp.5.3dif.tif',34,NULL,NULL),(865,'15687-inversion.afp.6.1ref.tif',34,NULL,NULL),(866,'15687-inversion.afp.6.2new.tif',34,NULL,NULL),(867,'15687-inversion.afp.6.3dif.tif',34,NULL,NULL),(868,'a.afp.1.1ref.tif',34,NULL,NULL),(869,'a.afp.1.2new.tif',34,NULL,NULL),(870,'a.afp.1.3dif.tif',34,NULL,NULL),(871,'a.afp.10.1ref.tif',34,NULL,NULL),(872,'a.afp.10.2new.tif',34,NULL,NULL),(873,'a.afp.10.3dif.tif',34,NULL,NULL),(874,'a.afp.11.1ref.tif',34,NULL,NULL),(875,'a.afp.11.2new.tif',34,NULL,NULL),(876,'a.afp.11.3dif.tif',34,NULL,NULL),(877,'a.afp.12.1ref.tif',34,NULL,NULL),(878,'a.afp.12.2new.tif',34,NULL,NULL),(879,'a.afp.12.3dif.tif',34,NULL,NULL),(880,'a.afp.13.1ref.tif',34,NULL,NULL),(881,'a.afp.13.2new.tif',34,NULL,NULL),(882,'a.afp.13.3dif.tif',34,NULL,NULL),(883,'a.afp.14.1ref.tif',34,NULL,NULL),(884,'a.afp.14.2new.tif',34,NULL,NULL),(885,'a.afp.14.3dif.tif',34,NULL,NULL),(886,'a.afp.15.1ref.tif',34,NULL,NULL),(887,'a.afp.15.2new.tif',34,NULL,NULL),(888,'a.afp.15.3dif.tif',34,NULL,NULL),(889,'a.afp.16.1ref.tif',34,NULL,NULL),(890,'a.afp.16.2new.tif',34,NULL,NULL),(891,'a.afp.16.3dif.tif',34,NULL,NULL),(892,'a.afp.17.1ref.tif',34,NULL,NULL),(893,'a.afp.17.2new.tif',34,NULL,NULL),(894,'a.afp.17.3dif.tif',34,NULL,NULL),(895,'a.afp.18.1ref.tif',34,NULL,NULL),(896,'a.afp.18.2new.tif',34,NULL,NULL),(897,'a.afp.18.3dif.tif',34,NULL,NULL),(898,'a.afp.19.1ref.tif',34,NULL,NULL),(899,'a.afp.19.2new.tif',34,NULL,NULL),(900,'a.afp.19.3dif.tif',34,NULL,NULL),(901,'a.afp.2.1ref.tif',34,NULL,NULL),(902,'a.afp.2.2new.tif',34,NULL,NULL),(903,'a.afp.2.3dif.tif',34,NULL,NULL),(904,'a.afp.20.1ref.tif',34,NULL,NULL),(905,'a.afp.20.2new.tif',34,NULL,NULL),(906,'a.afp.20.3dif.tif',34,NULL,NULL),(907,'a.afp.3.1ref.tif',34,NULL,NULL),(908,'a.afp.3.2new.tif',34,NULL,NULL),(909,'a.afp.3.3dif.tif',34,NULL,NULL),(910,'a.afp.4.1ref.tif',34,NULL,NULL),(911,'a.afp.4.2new.tif',34,NULL,NULL),(912,'a.afp.4.3dif.tif',34,NULL,NULL),(913,'a.afp.5.1ref.tif',34,NULL,NULL),(914,'a.afp.5.2new.tif',34,NULL,NULL),(915,'a.afp.5.3dif.tif',34,NULL,NULL),(916,'a.afp.6.1ref.tif',34,NULL,NULL),(917,'a.afp.6.2new.tif',34,NULL,NULL),(918,'a.afp.6.3dif.tif',34,NULL,NULL),(919,'a.afp.7.1ref.tif',34,NULL,NULL),(920,'a.afp.7.2new.tif',34,NULL,NULL),(921,'a.afp.7.3dif.tif',34,NULL,NULL),(922,'a.afp.8.1ref.tif',34,NULL,NULL),(923,'a.afp.8.2new.tif',34,NULL,NULL),(924,'a.afp.8.3dif.tif',34,NULL,NULL),(925,'a.afp.9.1ref.tif',34,NULL,NULL),(926,'a.afp.9.2new.tif',34,NULL,NULL),(927,'a.afp.9.3dif.tif',34,NULL,NULL),(928,'P3.afp.1.1ref.tif',34,NULL,NULL),(929,'P3.afp.1.2new.tif',34,NULL,NULL),(930,'P3.afp.1.3dif.tif',34,NULL,NULL),(931,'P3.afp.10.1ref.tif',34,NULL,NULL),(932,'P3.afp.10.2new.tif',34,NULL,NULL),(933,'P3.afp.10.3dif.tif',34,NULL,NULL),(934,'P3.afp.13.1ref.tif',34,NULL,NULL),(935,'P3.afp.13.2new.tif',34,NULL,NULL),(936,'P3.afp.13.3dif.tif',34,NULL,NULL),(937,'P3.afp.4.1ref.tif',34,NULL,NULL),(938,'P3.afp.4.2new.tif',34,NULL,NULL),(939,'P3.afp.4.3dif.tif',34,NULL,NULL),(940,'P3.afp.5.1ref.tif',34,NULL,NULL),(941,'P3.afp.5.2new.tif',34,NULL,NULL),(942,'P3.afp.5.3dif.tif',34,NULL,NULL),(943,'P3.afp.7.1ref.tif',34,NULL,NULL),(944,'P3.afp.7.2new.tif',34,NULL,NULL),(945,'P3.afp.7.3dif.tif',34,NULL,NULL),(946,'12942-wrong-fonts.afp.1.1ref.tif',34,NULL,NULL),(947,'12942-wrong-fonts.afp.1.2new.tif',34,NULL,NULL),(948,'12942-wrong-fonts.afp.1.3dif.tif',34,NULL,NULL),(949,'15005-French-and-box-chars.afp.1.1ref.tif',34,NULL,NULL),(950,'15005-French-and-box-chars.afp.1.2new.tif',34,NULL,NULL),(951,'15005-French-and-box-chars.afp.1.3dif.tif',34,NULL,NULL),(952,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.1ref.tif',34,NULL,NULL),(953,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.2new.tif',34,NULL,NULL),(954,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.3dif.tif',34,NULL,NULL),(955,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.1ref.tif',34,NULL,NULL),(956,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.2new.tif',34,NULL,NULL),(957,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.3dif.tif',34,NULL,NULL),(958,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.1ref.tif',34,NULL,NULL),(959,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.2new.tif',34,NULL,NULL),(960,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.3dif.tif',34,NULL,NULL),(961,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.1ref.tif',34,NULL,NULL),(962,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.2new.tif',34,NULL,NULL),(963,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.3dif.tif',34,NULL,NULL),(964,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.1ref.tif',34,NULL,NULL),(965,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.2new.tif',34,NULL,NULL),(966,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.3dif.tif',34,NULL,NULL),(967,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.1ref.tif',34,NULL,NULL),(968,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.2new.tif',34,NULL,NULL),(969,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.3dif.tif',34,NULL,NULL),(970,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.1ref.tif',34,NULL,NULL),(971,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.2new.tif',34,NULL,NULL),(972,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.3dif.tif',34,NULL,NULL),(973,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.1ref.tif',34,NULL,NULL),(974,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.2new.tif',34,NULL,NULL),(975,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.3dif.tif',34,NULL,NULL),(976,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.1ref.tif',34,NULL,NULL),(977,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.2new.tif',34,NULL,NULL),(978,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.3dif.tif',34,NULL,NULL),(979,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.1ref.tif',34,NULL,NULL),(980,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.2new.tif',34,NULL,NULL),(981,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.3dif.tif',34,NULL,NULL),(982,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.1ref.tif',34,NULL,NULL),(983,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.2new.tif',34,NULL,NULL),(984,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.3dif.tif',34,NULL,NULL),(985,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.1ref.tif',34,NULL,NULL),(986,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.2new.tif',34,NULL,NULL),(987,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.3dif.tif',34,NULL,NULL),(988,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.1ref.tif',34,NULL,NULL),(989,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.2new.tif',34,NULL,NULL),(990,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.3dif.tif',34,NULL,NULL),(991,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.1ref.tif',34,NULL,NULL),(992,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.2new.tif',34,NULL,NULL),(993,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.3dif.tif',34,NULL,NULL),(994,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.1ref.tif',34,NULL,NULL),(995,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.2new.tif',34,NULL,NULL),(996,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.3dif.tif',34,NULL,NULL),(997,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.1ref.tif',34,NULL,NULL),(998,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.2new.tif',34,NULL,NULL),(999,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.3dif.tif',34,NULL,NULL),(1000,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.1ref.tif',34,NULL,NULL),(1001,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.2new.tif',34,NULL,NULL),(1002,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.3dif.tif',34,NULL,NULL),(1003,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.1ref.tif',34,NULL,NULL),(1004,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.2new.tif',34,NULL,NULL),(1005,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.3dif.tif',34,NULL,NULL),(1006,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.1ref.tif',34,NULL,NULL),(1007,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.2new.tif',34,NULL,NULL),(1008,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.3dif.tif',34,NULL,NULL),(1009,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.1ref.tif',34,NULL,NULL),(1010,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.2new.tif',34,NULL,NULL),(1011,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.3dif.tif',34,NULL,NULL),(1012,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.1ref.tif',34,NULL,NULL),(1013,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.2new.tif',34,NULL,NULL),(1014,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.3dif.tif',34,NULL,NULL),(1015,'18960-Letters.AFP.1.1ref.tif',34,NULL,NULL),(1016,'18960-Letters.AFP.1.2new.tif',34,NULL,NULL),(1017,'18960-Letters.AFP.1.3dif.tif',34,NULL,NULL),(1018,'acifres.afp.1.1ref.tif',34,NULL,NULL),(1019,'acifres.afp.1.2new.tif',34,NULL,NULL),(1020,'acifres.afp.1.3dif.tif',34,NULL,NULL),(1021,'15774-AFP_input-norwegian.afp.1.1ref.tif',34,NULL,NULL),(1022,'15774-AFP_input-norwegian.afp.1.2new.tif',34,NULL,NULL),(1023,'15774-AFP_input-norwegian.afp.1.3dif.tif',34,NULL,NULL),(1024,'15774-AFP_input-norwegian.afp.11.1ref.tif',34,NULL,NULL),(1025,'15774-AFP_input-norwegian.afp.11.2new.tif',34,NULL,NULL),(1026,'15774-AFP_input-norwegian.afp.11.3dif.tif',34,NULL,NULL),(1027,'15774-AFP_input-norwegian.afp.13.1ref.tif',34,NULL,NULL),(1028,'15774-AFP_input-norwegian.afp.13.2new.tif',34,NULL,NULL),(1029,'15774-AFP_input-norwegian.afp.13.3dif.tif',34,NULL,NULL),(1030,'15774-AFP_input-norwegian.afp.15.1ref.tif',34,NULL,NULL),(1031,'15774-AFP_input-norwegian.afp.15.2new.tif',34,NULL,NULL),(1032,'15774-AFP_input-norwegian.afp.15.3dif.tif',34,NULL,NULL),(1033,'15774-AFP_input-norwegian.afp.17.1ref.tif',34,NULL,NULL),(1034,'15774-AFP_input-norwegian.afp.17.2new.tif',34,NULL,NULL),(1035,'15774-AFP_input-norwegian.afp.17.3dif.tif',34,NULL,NULL),(1036,'15774-AFP_input-norwegian.afp.19.1ref.tif',34,NULL,NULL),(1037,'15774-AFP_input-norwegian.afp.19.2new.tif',34,NULL,NULL),(1038,'15774-AFP_input-norwegian.afp.19.3dif.tif',34,NULL,NULL),(1039,'15774-AFP_input-norwegian.afp.3.1ref.tif',34,NULL,NULL),(1040,'15774-AFP_input-norwegian.afp.3.2new.tif',34,NULL,NULL),(1041,'15774-AFP_input-norwegian.afp.3.3dif.tif',34,NULL,NULL),(1042,'15774-AFP_input-norwegian.afp.5.1ref.tif',34,NULL,NULL),(1043,'15774-AFP_input-norwegian.afp.5.2new.tif',34,NULL,NULL),(1044,'15774-AFP_input-norwegian.afp.5.3dif.tif',34,NULL,NULL),(1045,'15774-AFP_input-norwegian.afp.7.1ref.tif',34,NULL,NULL),(1046,'15774-AFP_input-norwegian.afp.7.2new.tif',34,NULL,NULL),(1047,'15774-AFP_input-norwegian.afp.7.3dif.tif',34,NULL,NULL),(1048,'15774-AFP_input-norwegian.afp.9.1ref.tif',34,NULL,NULL),(1049,'15774-AFP_input-norwegian.afp.9.2new.tif',34,NULL,NULL),(1050,'15774-AFP_input-norwegian.afp.9.3dif.tif',34,NULL,NULL),(1051,'uh220b.afp.1.1ref.tif',34,NULL,NULL),(1052,'uh220b.afp.1.2new.tif',34,NULL,NULL),(1053,'uh220b.afp.1.3dif.tif',34,NULL,NULL),(1054,'UOFATC_VI_MC_AX.afp.3.1ref.tif',34,NULL,NULL),(1055,'UOFATC_VI_MC_AX.afp.3.2new.tif',34,NULL,NULL),(1056,'UOFATC_VI_MC_AX.afp.3.3dif.tif',34,NULL,NULL),(1057,'18811-GOCA-fill.AFP.10.1ref.tif',34,NULL,NULL),(1058,'18811-GOCA-fill.AFP.10.2new.tif',34,NULL,NULL),(1059,'18811-GOCA-fill.AFP.10.3dif.tif',34,NULL,NULL),(1060,'18811-GOCA-fill.AFP.11.1ref.tif',34,NULL,NULL),(1061,'18811-GOCA-fill.AFP.11.2new.tif',34,NULL,NULL),(1062,'18811-GOCA-fill.AFP.11.3dif.tif',34,NULL,NULL),(1063,'18811-GOCA-fill.AFP.12.1ref.tif',34,NULL,NULL),(1064,'18811-GOCA-fill.AFP.12.2new.tif',34,NULL,NULL),(1065,'18811-GOCA-fill.AFP.12.3dif.tif',34,NULL,NULL),(1066,'18811-GOCA-fill.AFP.13.1ref.tif',34,NULL,NULL),(1067,'18811-GOCA-fill.AFP.13.2new.tif',34,NULL,NULL),(1068,'18811-GOCA-fill.AFP.13.3dif.tif',34,NULL,NULL),(1069,'18811-GOCA-fill.AFP.14.1ref.tif',34,NULL,NULL),(1070,'18811-GOCA-fill.AFP.14.2new.tif',34,NULL,NULL),(1071,'18811-GOCA-fill.AFP.14.3dif.tif',34,NULL,NULL),(1072,'18811-GOCA-fill.AFP.15.1ref.tif',34,NULL,NULL),(1073,'18811-GOCA-fill.AFP.15.2new.tif',34,NULL,NULL),(1074,'18811-GOCA-fill.AFP.15.3dif.tif',34,NULL,NULL),(1075,'18811-GOCA-fill.AFP.16.1ref.tif',34,NULL,NULL),(1076,'18811-GOCA-fill.AFP.16.2new.tif',34,NULL,NULL),(1077,'18811-GOCA-fill.AFP.16.3dif.tif',34,NULL,NULL),(1078,'18811-GOCA-fill.AFP.19.1ref.tif',34,NULL,NULL),(1079,'18811-GOCA-fill.AFP.19.2new.tif',34,NULL,NULL),(1080,'18811-GOCA-fill.AFP.19.3dif.tif',34,NULL,NULL),(1081,'18811-GOCA-fill.AFP.20.1ref.tif',34,NULL,NULL),(1082,'18811-GOCA-fill.AFP.20.2new.tif',34,NULL,NULL),(1083,'18811-GOCA-fill.AFP.20.3dif.tif',34,NULL,NULL),(1084,'18811-GOCA-fill.AFP.3.1ref.tif',34,NULL,NULL),(1085,'18811-GOCA-fill.AFP.3.2new.tif',34,NULL,NULL),(1086,'18811-GOCA-fill.AFP.3.3dif.tif',34,NULL,NULL),(1087,'18811-GOCA-fill.AFP.4.1ref.tif',34,NULL,NULL),(1088,'18811-GOCA-fill.AFP.4.2new.tif',34,NULL,NULL),(1089,'18811-GOCA-fill.AFP.4.3dif.tif',34,NULL,NULL),(1090,'18811-GOCA-fill.AFP.5.1ref.tif',34,NULL,NULL),(1091,'18811-GOCA-fill.AFP.5.2new.tif',34,NULL,NULL),(1092,'18811-GOCA-fill.AFP.5.3dif.tif',34,NULL,NULL),(1093,'18811-GOCA-fill.AFP.6.1ref.tif',34,NULL,NULL),(1094,'18811-GOCA-fill.AFP.6.2new.tif',34,NULL,NULL),(1095,'18811-GOCA-fill.AFP.6.3dif.tif',34,NULL,NULL),(1096,'18811-GOCA-fill.AFP.7.1ref.tif',34,NULL,NULL),(1097,'18811-GOCA-fill.AFP.7.2new.tif',34,NULL,NULL),(1098,'18811-GOCA-fill.AFP.7.3dif.tif',34,NULL,NULL),(1099,'18811-GOCA-fill.AFP.8.1ref.tif',34,NULL,NULL),(1100,'18811-GOCA-fill.AFP.8.2new.tif',34,NULL,NULL),(1101,'18811-GOCA-fill.AFP.8.3dif.tif',34,NULL,NULL),(1102,'18811-GOCA-fill.AFP.9.1ref.tif',34,NULL,NULL),(1103,'18811-GOCA-fill.AFP.9.2new.tif',34,NULL,NULL),(1104,'18811-GOCA-fill.AFP.9.3dif.tif',34,NULL,NULL),(1105,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.1ref.tif',34,NULL,NULL),(1106,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.2new.tif',34,NULL,NULL),(1107,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.3dif.tif',34,NULL,NULL),(1108,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.1ref.tif',34,NULL,NULL),(1109,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.2new.tif',34,NULL,NULL),(1110,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.3dif.tif',34,NULL,NULL),(1111,'17639-testfil.afp.1.1ref.tif',34,NULL,NULL),(1112,'17639-testfil.afp.1.2new.tif',34,NULL,NULL),(1113,'17639-testfil.afp.1.3dif.tif',34,NULL,NULL),(1114,'621113386-01-18-2005.afp.1.1ref.tif',34,NULL,NULL),(1115,'621113386-01-18-2005.afp.1.2new.tif',34,NULL,NULL),(1116,'621113386-01-18-2005.afp.1.3dif.tif',34,NULL,NULL),(1117,'645702207-10-25-2005.afp.1.1ref.tif',34,NULL,NULL),(1118,'645702207-10-25-2005.afp.1.2new.tif',34,NULL,NULL),(1119,'645702207-10-25-2005.afp.1.3dif.tif',34,NULL,NULL),(1120,'TH-WORDwithLogoSig.doc.1.1ref.tif',35,NULL,NULL),(1121,'TH-WORDwithLogoSig.doc.1.2new.tif',35,NULL,NULL),(1122,'TH-WORDwithLogoSig.doc.1.3dif.tif',35,NULL,NULL),(1123,'11515-checkboxes.doc.1.1ref.tif',35,NULL,NULL),(1124,'11515-checkboxes.doc.1.2new.tif',35,NULL,NULL),(1125,'11515-checkboxes.doc.1.3dif.tif',35,NULL,NULL),(1126,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.1ref.tif',35,NULL,NULL),(1127,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.2new.tif',35,NULL,NULL),(1128,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.3dif.tif',35,NULL,NULL),(1129,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.1ref.tif',35,NULL,NULL),(1130,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.2new.tif',35,NULL,NULL),(1131,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.3dif.tif',35,NULL,NULL),(1132,'13801-wingding-bullets.doc.1.1ref.tif',35,NULL,NULL),(1133,'13801-wingding-bullets.doc.1.2new.tif',35,NULL,NULL),(1134,'13801-wingding-bullets.doc.1.3dif.tif',35,NULL,NULL),(1135,'13802-font-change-after-field.doc.1.1ref.tif',35,NULL,NULL),(1136,'13802-font-change-after-field.doc.1.2new.tif',35,NULL,NULL),(1137,'13802-font-change-after-field.doc.1.3dif.tif',35,NULL,NULL),(1138,'13803-1-appearing-before-date.doc.1.1ref.tif',35,NULL,NULL),(1139,'13803-1-appearing-before-date.doc.1.2new.tif',35,NULL,NULL),(1140,'13803-1-appearing-before-date.doc.1.3dif.tif',35,NULL,NULL),(1141,'17829-test-drop-downs.XLS.1.1ref.tif',35,NULL,NULL),(1142,'17829-test-drop-downs.XLS.1.2new.tif',35,NULL,NULL),(1143,'17829-test-drop-downs.XLS.1.3dif.tif',35,NULL,NULL),(1144,'17860-crash.xls.1.1ref.tif',35,NULL,NULL),(1145,'17860-crash.xls.1.2new.tif',35,NULL,NULL),(1146,'17860-crash.xls.1.3dif.tif',35,NULL,NULL),(1147,'11083.doc.1.1ref.tif',35,NULL,NULL),(1148,'11083.doc.1.2new.tif',35,NULL,NULL),(1149,'11083.doc.1.3dif.tif',35,NULL,NULL),(1150,'11083.doc.2.1ref.tif',35,NULL,NULL),(1151,'11083.doc.2.2new.tif',35,NULL,NULL),(1152,'11083.doc.2.3dif.tif',35,NULL,NULL),(1153,'11083.doc.3.1ref.tif',35,NULL,NULL),(1154,'11083.doc.3.2new.tif',35,NULL,NULL),(1155,'11083.doc.3.3dif.tif',35,NULL,NULL),(1156,'15197-table-grid-lines.doc.1.1ref.tif',35,NULL,NULL),(1157,'15197-table-grid-lines.doc.1.2new.tif',35,NULL,NULL),(1158,'15197-table-grid-lines.doc.1.3dif.tif',35,NULL,NULL),(1159,'15197-table-grid-lines.doc.10.1ref.tif',35,NULL,NULL),(1160,'15197-table-grid-lines.doc.10.2new.tif',35,NULL,NULL),(1161,'15197-table-grid-lines.doc.10.3dif.tif',35,NULL,NULL),(1162,'15197-table-grid-lines.doc.11.1ref.tif',35,NULL,NULL),(1163,'15197-table-grid-lines.doc.11.2new.tif',35,NULL,NULL),(1164,'15197-table-grid-lines.doc.11.3dif.tif',35,NULL,NULL),(1165,'15197-table-grid-lines.doc.12.1ref.tif',35,NULL,NULL),(1166,'15197-table-grid-lines.doc.12.2new.tif',35,NULL,NULL),(1167,'15197-table-grid-lines.doc.12.3dif.tif',35,NULL,NULL),(1168,'15197-table-grid-lines.doc.13.1ref.tif',35,NULL,NULL),(1169,'15197-table-grid-lines.doc.13.2new.tif',35,NULL,NULL),(1170,'15197-table-grid-lines.doc.13.3dif.tif',35,NULL,NULL),(1171,'15197-table-grid-lines.doc.14.1ref.tif',35,NULL,NULL),(1172,'15197-table-grid-lines.doc.14.2new.tif',35,NULL,NULL),(1173,'15197-table-grid-lines.doc.14.3dif.tif',35,NULL,NULL),(1174,'15197-table-grid-lines.doc.15.1ref.tif',35,NULL,NULL),(1175,'15197-table-grid-lines.doc.15.2new.tif',35,NULL,NULL),(1176,'15197-table-grid-lines.doc.15.3dif.tif',35,NULL,NULL),(1177,'15197-table-grid-lines.doc.16.1ref.tif',35,NULL,NULL),(1178,'15197-table-grid-lines.doc.16.2new.tif',35,NULL,NULL),(1179,'15197-table-grid-lines.doc.16.3dif.tif',35,NULL,NULL),(1180,'15197-table-grid-lines.doc.17.1ref.tif',35,NULL,NULL),(1181,'15197-table-grid-lines.doc.17.2new.tif',35,NULL,NULL),(1182,'15197-table-grid-lines.doc.17.3dif.tif',35,NULL,NULL),(1183,'15197-table-grid-lines.doc.18.1ref.tif',35,NULL,NULL),(1184,'15197-table-grid-lines.doc.18.2new.tif',35,NULL,NULL),(1185,'15197-table-grid-lines.doc.18.3dif.tif',35,NULL,NULL),(1186,'15197-table-grid-lines.doc.19.1ref.tif',35,NULL,NULL),(1187,'15197-table-grid-lines.doc.19.2new.tif',35,NULL,NULL),(1188,'15197-table-grid-lines.doc.19.3dif.tif',35,NULL,NULL),(1189,'15197-table-grid-lines.doc.2.1ref.tif',35,NULL,NULL),(1190,'15197-table-grid-lines.doc.2.2new.tif',35,NULL,NULL),(1191,'15197-table-grid-lines.doc.2.3dif.tif',35,NULL,NULL),(1192,'15197-table-grid-lines.doc.20.1ref.tif',35,NULL,NULL),(1193,'15197-table-grid-lines.doc.20.2new.tif',35,NULL,NULL),(1194,'15197-table-grid-lines.doc.20.3dif.tif',35,NULL,NULL),(1195,'15197-table-grid-lines.doc.3.1ref.tif',35,NULL,NULL),(1196,'15197-table-grid-lines.doc.3.2new.tif',35,NULL,NULL),(1197,'15197-table-grid-lines.doc.3.3dif.tif',35,NULL,NULL),(1198,'15197-table-grid-lines.doc.4.1ref.tif',35,NULL,NULL),(1199,'15197-table-grid-lines.doc.4.2new.tif',35,NULL,NULL),(1200,'15197-table-grid-lines.doc.4.3dif.tif',35,NULL,NULL),(1201,'15197-table-grid-lines.doc.5.1ref.tif',35,NULL,NULL),(1202,'15197-table-grid-lines.doc.5.2new.tif',35,NULL,NULL),(1203,'15197-table-grid-lines.doc.5.3dif.tif',35,NULL,NULL),(1204,'15197-table-grid-lines.doc.6.1ref.tif',35,NULL,NULL),(1205,'15197-table-grid-lines.doc.6.2new.tif',35,NULL,NULL),(1206,'15197-table-grid-lines.doc.6.3dif.tif',35,NULL,NULL),(1207,'15197-table-grid-lines.doc.7.1ref.tif',35,NULL,NULL),(1208,'15197-table-grid-lines.doc.7.2new.tif',35,NULL,NULL),(1209,'15197-table-grid-lines.doc.7.3dif.tif',35,NULL,NULL),(1210,'15197-table-grid-lines.doc.8.1ref.tif',35,NULL,NULL),(1211,'15197-table-grid-lines.doc.8.2new.tif',35,NULL,NULL),(1212,'15197-table-grid-lines.doc.8.3dif.tif',35,NULL,NULL),(1213,'15197-table-grid-lines.doc.9.1ref.tif',35,NULL,NULL),(1214,'15197-table-grid-lines.doc.9.2new.tif',35,NULL,NULL),(1215,'15197-table-grid-lines.doc.9.3dif.tif',35,NULL,NULL),(1216,'17501-Word 2002-Missing-Logo.DOC.2.1ref.tif',35,NULL,NULL),(1217,'17501-Word 2002-Missing-Logo.DOC.2.2new.tif',35,NULL,NULL),(1218,'17501-Word 2002-Missing-Logo.DOC.2.3dif.tif',35,NULL,NULL),(1219,'17501-Word 2002-Missing-Logo.DOC.3.1ref.tif',35,NULL,NULL),(1220,'17501-Word 2002-Missing-Logo.DOC.3.2new.tif',35,NULL,NULL),(1221,'17501-Word 2002-Missing-Logo.DOC.3.3dif.tif',35,NULL,NULL),(1222,'17501-Word 2002-Missing-Logo.DOC.4.1ref.tif',35,NULL,NULL),(1223,'17501-Word 2002-Missing-Logo.DOC.4.2new.tif',35,NULL,NULL),(1224,'17501-Word 2002-Missing-Logo.DOC.4.3dif.tif',35,NULL,NULL),(1225,'17501-Word 2002-Missing-Logo.DOC.5.1ref.tif',35,NULL,NULL),(1226,'17501-Word 2002-Missing-Logo.DOC.5.2new.tif',35,NULL,NULL),(1227,'17501-Word 2002-Missing-Logo.DOC.5.3dif.tif',35,NULL,NULL),(1228,'17501-Word 2002-Missing-Logo.DOC.6.1ref.tif',35,NULL,NULL),(1229,'17501-Word 2002-Missing-Logo.DOC.6.2new.tif',35,NULL,NULL),(1230,'17501-Word 2002-Missing-Logo.DOC.6.3dif.tif',35,NULL,NULL),(1231,'17501-Word 2002-Missing-Logo.DOC.7.1ref.tif',35,NULL,NULL),(1232,'17501-Word 2002-Missing-Logo.DOC.7.2new.tif',35,NULL,NULL),(1233,'17501-Word 2002-Missing-Logo.DOC.7.3dif.tif',35,NULL,NULL),(1234,'17501-Word 2002-Missing-Logo.DOC.8.1ref.tif',35,NULL,NULL),(1235,'17501-Word 2002-Missing-Logo.DOC.8.2new.tif',35,NULL,NULL),(1236,'17501-Word 2002-Missing-Logo.DOC.8.3dif.tif',35,NULL,NULL);
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
  CONSTRAINT `PageToBug_Bug` FOREIGN KEY (`Bug_ID`) REFERENCES `bug` (`Bug_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PageToBug_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetobug`
--

LOCK TABLES `pagetobug` WRITE;
/*!40000 ALTER TABLE `pagetobug` DISABLE KEYS */;
INSERT INTO `pagetobug` VALUES (946,9),(947,9),(948,9),(949,9),(950,9),(951,9),(952,9),(953,9),(954,9),(955,9),(956,9),(957,9),(958,9),(959,9),(960,9),(961,9),(962,9),(963,9),(964,9),(965,9),(966,9),(967,9),(968,9),(969,9),(970,9),(971,9),(972,9),(973,9),(974,9),(975,9),(976,9),(977,9),(978,9),(979,9),(980,9),(981,9),(982,9),(983,9),(984,9),(985,9),(986,9),(987,9),(988,9),(989,9),(990,9),(991,9),(992,9),(993,9),(994,9),(995,9),(996,9),(997,9),(998,9),(999,9),(1000,9),(1001,9),(1002,9),(1003,9),(1004,9),(1005,9),(1006,9),(1007,9),(1008,9),(1009,9),(1010,9),(1011,9),(1012,9),(1013,9),(1014,9),(1015,9),(1016,9),(1017,9),(1018,9),(1019,9),(1020,9),(1021,10),(1022,10),(1023,10),(1024,10),(1025,10),(1026,10),(1027,10),(1028,10),(1029,10),(1030,10),(1031,10),(1032,10),(1033,10),(1034,10),(1035,10),(1036,10),(1037,10),(1038,10),(1039,10),(1040,10),(1041,10),(1042,10),(1043,10),(1044,10),(1045,10),(1046,10),(1047,10),(1048,10),(1049,10),(1050,10),(1051,10),(1052,10),(1053,10),(1054,10),(1055,10),(1056,10),(1057,11),(1058,11),(1059,11),(1060,11),(1061,11),(1062,11),(1063,11),(1064,11),(1065,11),(1066,11),(1067,11),(1068,11),(1069,11),(1070,11),(1071,11),(1072,11),(1073,11),(1074,11),(1075,11),(1076,11),(1077,11),(1078,11),(1079,11),(1080,11),(1081,11),(1082,11),(1083,11),(1084,11),(1085,11),(1086,11),(1087,11),(1088,11),(1089,11),(1090,11),(1091,11),(1092,11),(1093,11),(1094,11),(1095,11),(1096,11),(1097,11),(1098,11),(1099,11),(1100,11),(1101,11),(1102,11),(1103,11),(1104,11),(1105,11),(1106,11),(1107,11),(1108,11),(1109,11),(1110,11);
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
  CONSTRAINT `PageToDifference_Difference` FOREIGN KEY (`Difference_ID`) REFERENCES `difference` (`Difference_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PageToDifference_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetodifference`
--

LOCK TABLES `pagetodifference` WRITE;
/*!40000 ALTER TABLE `pagetodifference` DISABLE KEYS */;
INSERT INTO `pagetodifference` VALUES (829,13),(830,13),(831,13),(832,14),(833,14),(834,14),(835,14),(836,14),(837,14),(838,14),(839,14),(840,14),(841,14),(842,14),(843,14),(844,14),(845,14),(846,14),(847,14),(848,14),(849,14),(850,14),(851,14),(852,14),(853,15),(854,15),(855,15),(856,15),(857,15),(858,15),(859,15),(860,15),(861,15),(862,15),(863,15),(864,15),(865,15),(866,15),(867,15),(868,15),(869,15),(870,15),(871,15),(872,15),(873,15),(874,15),(875,15),(876,15),(877,15),(878,15),(879,15),(880,15),(881,15),(882,15),(883,15),(884,15),(885,15),(886,15),(887,15),(888,15),(889,15),(890,15),(891,15),(892,15),(893,15),(894,15),(895,15),(896,15),(897,15),(898,15),(899,15),(900,15),(901,15),(902,15),(903,15),(904,15),(905,15),(906,15),(907,15),(908,15),(909,15),(910,15),(911,15),(912,15),(913,15),(914,15),(915,15),(916,15),(917,15),(918,15),(919,15),(920,15),(921,15),(922,15),(923,15),(924,15),(925,15),(926,15),(927,15),(928,15),(929,15),(930,15),(931,15),(932,15),(933,15),(934,15),(935,15),(936,15),(937,15),(938,15),(939,15),(940,15),(941,15),(942,15),(943,15),(944,15),(945,15),(946,16),(947,16),(948,16),(949,16),(950,16),(951,16),(952,16),(953,16),(954,16),(955,16),(956,16),(957,16),(958,16),(959,16),(960,16),(961,16),(962,16),(963,16),(964,16),(965,16),(966,16),(967,16),(968,16),(969,16),(970,16),(971,16),(972,16),(973,16),(974,16),(975,16),(976,16),(977,16),(978,16),(979,16),(980,16),(981,16),(982,16),(983,16),(984,16),(985,16),(986,16),(987,16),(988,16),(989,16),(990,16),(991,16),(992,16),(993,16),(994,16),(995,16),(996,16),(997,16),(998,16),(999,16),(1000,16),(1001,16),(1002,16),(1003,16),(1004,16),(1005,16),(1006,16),(1007,16),(1008,16),(1009,16),(1010,16),(1011,16),(1012,16),(1013,16),(1014,16),(1015,16),(1016,16),(1017,16),(1018,16),(1019,16),(1020,16),(1021,17),(1022,17),(1023,17),(1024,17),(1025,17),(1026,17),(1027,17),(1028,17),(1029,17),(1030,17),(1031,17),(1032,17),(1033,17),(1034,17),(1035,17),(1036,17),(1037,17),(1038,17),(1039,17),(1040,17),(1041,17),(1042,17),(1043,17),(1044,17),(1045,17),(1046,17),(1047,17),(1048,17),(1049,17),(1050,17),(1051,17),(1052,17),(1053,17),(1054,17),(1055,17),(1056,17),(1057,18),(1058,18),(1059,18),(1060,18),(1061,18),(1062,18),(1063,18),(1064,18),(1065,18),(1066,18),(1067,18),(1068,18),(1069,18),(1070,18),(1071,18),(1072,18),(1073,18),(1074,18),(1075,18),(1076,18),(1077,18),(1078,18),(1079,18),(1080,18),(1081,18),(1082,18),(1083,18),(1084,18),(1085,18),(1086,18),(1087,18),(1088,18),(1089,18),(1090,18),(1091,18),(1092,18),(1093,18),(1094,18),(1095,18),(1096,18),(1097,18),(1098,18),(1099,18),(1100,18),(1101,18),(1102,18),(1103,18),(1104,18),(1105,18),(1106,18),(1107,18),(1108,18),(1109,18),(1110,18),(1111,19),(1112,19),(1113,19),(1114,19),(1115,19),(1116,19),(1117,19),(1118,19),(1119,19),(1120,20),(1121,20),(1122,20),(1123,15),(1124,15),(1125,15),(1126,15),(1127,15),(1128,15),(1129,15),(1130,15),(1131,15),(1132,15),(1133,15),(1134,15),(1135,15),(1136,15),(1137,15),(1138,15),(1139,15),(1140,15),(1141,15),(1142,15),(1143,15),(1144,15),(1145,15),(1146,15),(1147,21),(1148,21),(1149,21),(1150,21),(1151,21),(1152,21),(1153,21),(1154,21),(1155,21),(1156,22),(1157,22),(1158,22),(1159,22),(1160,22),(1161,22),(1162,22),(1163,22),(1164,22),(1165,22),(1166,22),(1167,22),(1168,22),(1169,22),(1170,22),(1171,22),(1172,22),(1173,22),(1174,22),(1175,22),(1176,22),(1177,22),(1178,22),(1179,22),(1180,22),(1181,22),(1182,22),(1183,22),(1184,22),(1185,22),(1186,22),(1187,22),(1188,22),(1189,22),(1190,22),(1191,22),(1192,22),(1193,22),(1194,22),(1195,22),(1196,22),(1197,22),(1198,22),(1199,22),(1200,22),(1201,22),(1202,22),(1203,22),(1204,22),(1205,22),(1206,22),(1207,22),(1208,22),(1209,22),(1210,22),(1211,22),(1212,22),(1213,22),(1214,22),(1215,22),(1216,23),(1217,23),(1218,23),(1219,23),(1220,23),(1221,23),(1222,23),(1223,23),(1224,23),(1225,23),(1226,23),(1227,23),(1228,23),(1229,23),(1230,23),(1231,23),(1232,23),(1233,23),(1234,23),(1235,23),(1236,23);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (1,'00:01:00'),(2,'01:25:00'),(3,'00:00:50'),(4,'10:00:00'),(5,'10:05:20'),(6,'11:11:11'),(7,'05:20:34'),(8,'06:05:50');
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
INSERT INTO `platform` VALUES (1,'VirtualViewer'),(2,'RasterMaster'),(3,'SnowBatch');
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
  CONSTRAINT `Run_Date` FOREIGN KEY (`Date_ID`) REFERENCES `date` (`Date_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_Format` FOREIGN KEY (`Format_ID`) REFERENCES `format` (`Format_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_Performance` FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_SVN` FOREIGN KEY (`SVN_ID`) REFERENCES `svn` (`SVN_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Run_Version` FOREIGN KEY (`Version_ID`) REFERENCES `version` (`Version_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (34,'13.5-Build2.1',4,4,8,4,7),(35,'13.5-Build2.1 2nd run',13,5,9,5,8);
/*!40000 ALTER TABLE `run` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn`
--

LOCK TABLES `svn` WRITE;
/*!40000 ALTER TABLE `svn` DISABLE KEYS */;
INSERT INTO `svn` VALUES (1,1234),(2,4321),(3,12345),(4,1111),(5,2222);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'13.5',1),(2,'13.6',2),(3,'13.4.4.1',1),(4,'13.5',3),(5,'13.4',3),(6,'',2),(7,'f',3),(8,'1',3),(9,'1',2),(10,'20.1',1),(11,'20.1',2),(12,'1',1),(13,'13.5',2);
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

-- Dump completed on 2013-06-19 17:12:13
