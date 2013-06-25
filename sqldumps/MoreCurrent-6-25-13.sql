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
  `Difference_ID` int(11) NOT NULL,
  PRIMARY KEY (`Bug_ID`),
  UNIQUE KEY `Bug_ID_UNIQUE` (`Bug_ID`),
  KEY `BugStatus_idx` (`Bug_Status_ID`),
  KEY `Bug_Difference_idx` (`Difference_ID`),
  CONSTRAINT `Bug_Difference` FOREIGN KEY (`Difference_ID`) REFERENCES `difference` (`Difference_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Bug_BugStatus` FOREIGN KEY (`Bug_Status_ID`) REFERENCES `bugstatus` (`BugStatus_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (30,6371,NULL,73),(31,6373,NULL,74),(32,6374,NULL,75);
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
  `BugStatus_Name` varchar(45) NOT NULL,
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
  `Date_Name` date NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difference`
--

LOCK TABLES `difference` WRITE;
/*!40000 ALTER TABLE `difference` DISABLE KEYS */;
INSERT INTO `difference` VALUES (70,'AddedCharacters',1),(71,'CorrectedCharacters',1),(72,'No description',2),(73,'TextLost',3),(74,'WrongCharacters',3),(75,'MissingDash',3),(76,'TextShrink',3);
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
  `DiffType_Name` varchar(45) NOT NULL COMMENT 'Which difference kind it is (ex. better, worse...)',
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
  `Error_Num` int(11) NOT NULL,
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
  CONSTRAINT `Page_Run` FOREIGN KEY (`Run_ID`) REFERENCES `run` (`Run_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Page_Error` FOREIGN KEY (`Error_ID`) REFERENCES `error` (`Error_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Performance` FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2698 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (2602,'rla3a4.afp.1.tif',49,NULL,NULL),(2603,'18571-TEST2-Polish-currency.AFP.1.tif',49,NULL,NULL),(2604,'18571-TEST2-Polish-currency.AFP.2.tif',49,NULL,NULL),(2605,'18571-TEST2-Polish-currency.AFP.3.tif',49,NULL,NULL),(2606,'18571-TEST2-Polish-currency.AFP.4.tif',49,NULL,NULL),(2607,'18960-Letters.AFP.2.tif',49,NULL,NULL),(2608,'18960-Letters.AFP.3.tif',49,NULL,NULL),(2609,'uh220b.afp.1.tif',49,NULL,NULL),(2610,'15687-inversion.afp.2.tif',49,NULL,NULL),(2611,'15687-inversion.afp.3.tif',49,NULL,NULL),(2612,'15687-inversion.afp.4.tif',49,NULL,NULL),(2613,'15687-inversion.afp.5.tif',49,NULL,NULL),(2614,'15687-inversion.afp.6.tif',49,NULL,NULL),(2615,'a.afp.1.tif',49,NULL,NULL),(2616,'a.afp.10.tif',49,NULL,NULL),(2617,'a.afp.11.tif',49,NULL,NULL),(2618,'a.afp.12.tif',49,NULL,NULL),(2619,'a.afp.13.tif',49,NULL,NULL),(2620,'a.afp.14.tif',49,NULL,NULL),(2621,'a.afp.15.tif',49,NULL,NULL),(2622,'a.afp.16.tif',49,NULL,NULL),(2623,'a.afp.17.tif',49,NULL,NULL),(2624,'a.afp.18.tif',49,NULL,NULL),(2625,'a.afp.19.tif',49,NULL,NULL),(2626,'a.afp.2.tif',49,NULL,NULL),(2627,'a.afp.20.tif',49,NULL,NULL),(2628,'a.afp.3.tif',49,NULL,NULL),(2629,'a.afp.4.tif',49,NULL,NULL),(2630,'a.afp.5.tif',49,NULL,NULL),(2631,'a.afp.6.tif',49,NULL,NULL),(2632,'a.afp.7.tif',49,NULL,NULL),(2633,'a.afp.8.tif',49,NULL,NULL),(2634,'a.afp.9.tif',49,NULL,NULL),(2635,'P3.afp.1.tif',49,NULL,NULL),(2636,'P3.afp.10.tif',49,NULL,NULL),(2637,'P3.afp.13.tif',49,NULL,NULL),(2638,'P3.afp.4.tif',49,NULL,NULL),(2639,'P3.afp.5.tif',49,NULL,NULL),(2640,'P3.afp.7.tif',49,NULL,NULL),(2641,'12942-wrong-fonts.afp.1.tif',49,NULL,NULL),(2642,'15005-French-and-box-chars.afp.1.tif',49,NULL,NULL),(2643,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.tif',49,NULL,NULL),(2644,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.tif',49,NULL,NULL),(2645,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.tif',49,NULL,NULL),(2646,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.tif',49,NULL,NULL),(2647,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.tif',49,NULL,NULL),(2648,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.tif',49,NULL,NULL),(2649,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.tif',49,NULL,NULL),(2650,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.tif',49,NULL,NULL),(2651,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.tif',49,NULL,NULL),(2652,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.tif',49,NULL,NULL),(2653,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.tif',49,NULL,NULL),(2654,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.tif',49,NULL,NULL),(2655,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.tif',49,NULL,NULL),(2656,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.tif',49,NULL,NULL),(2657,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.tif',49,NULL,NULL),(2658,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.tif',49,NULL,NULL),(2659,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.tif',49,NULL,NULL),(2660,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.tif',49,NULL,NULL),(2661,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.tif',49,NULL,NULL),(2662,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.tif',49,NULL,NULL),(2663,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.tif',49,NULL,NULL),(2664,'18960-Letters.AFP.1.tif',49,NULL,NULL),(2665,'acifres.afp.1.tif',49,NULL,NULL),(2666,'15774-AFP_input-norwegian.afp.1.tif',49,NULL,NULL),(2667,'15774-AFP_input-norwegian.afp.11.tif',49,NULL,NULL),(2668,'15774-AFP_input-norwegian.afp.13.tif',49,NULL,NULL),(2669,'15774-AFP_input-norwegian.afp.15.tif',49,NULL,NULL),(2670,'15774-AFP_input-norwegian.afp.17.tif',49,NULL,NULL),(2671,'15774-AFP_input-norwegian.afp.19.tif',49,NULL,NULL),(2672,'15774-AFP_input-norwegian.afp.3.tif',49,NULL,NULL),(2673,'15774-AFP_input-norwegian.afp.5.tif',49,NULL,NULL),(2674,'15774-AFP_input-norwegian.afp.7.tif',49,NULL,NULL),(2675,'15774-AFP_input-norwegian.afp.9.tif',49,NULL,NULL),(2676,'UOFATC_VI_MC_AX.afp.3.tif',49,NULL,NULL),(2677,'18811-GOCA-fill.AFP.10.tif',49,NULL,NULL),(2678,'18811-GOCA-fill.AFP.11.tif',49,NULL,NULL),(2679,'18811-GOCA-fill.AFP.12.tif',49,NULL,NULL),(2680,'18811-GOCA-fill.AFP.13.tif',49,NULL,NULL),(2681,'18811-GOCA-fill.AFP.14.tif',49,NULL,NULL),(2682,'18811-GOCA-fill.AFP.15.tif',49,NULL,NULL),(2683,'18811-GOCA-fill.AFP.16.tif',49,NULL,NULL),(2684,'18811-GOCA-fill.AFP.19.tif',49,NULL,NULL),(2685,'18811-GOCA-fill.AFP.20.tif',49,NULL,NULL),(2686,'18811-GOCA-fill.AFP.3.tif',49,NULL,NULL),(2687,'18811-GOCA-fill.AFP.4.tif',49,NULL,NULL),(2688,'18811-GOCA-fill.AFP.5.tif',49,NULL,NULL),(2689,'18811-GOCA-fill.AFP.6.tif',49,NULL,NULL),(2690,'18811-GOCA-fill.AFP.7.tif',49,NULL,NULL),(2691,'18811-GOCA-fill.AFP.8.tif',49,NULL,NULL),(2692,'18811-GOCA-fill.AFP.9.tif',49,NULL,NULL),(2693,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.tif',49,NULL,NULL),(2694,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.tif',49,NULL,NULL),(2695,'17639-testfil.afp.1.tif',49,NULL,NULL),(2696,'621113386-01-18-2005.afp.1.tif',49,NULL,NULL),(2697,'645702207-10-25-2005.afp.1.tif',49,NULL,NULL);
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
  CONSTRAINT `PageToBug_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PageToBug_Bug` FOREIGN KEY (`Bug_ID`) REFERENCES `bug` (`Bug_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetobug`
--

LOCK TABLES `pagetobug` WRITE;
/*!40000 ALTER TABLE `pagetobug` DISABLE KEYS */;
INSERT INTO `pagetobug` VALUES (2641,30),(2642,30),(2643,30),(2644,30),(2645,30),(2646,30),(2647,30),(2648,30),(2649,30),(2650,30),(2651,30),(2652,30),(2653,30),(2654,30),(2655,30),(2656,30),(2657,30),(2658,30),(2659,30),(2660,30),(2661,30),(2662,30),(2663,30),(2664,30),(2665,30),(2666,31),(2667,31),(2668,31),(2669,31),(2670,31),(2671,31),(2672,31),(2673,31),(2674,31),(2675,31),(2676,31),(2677,32),(2678,32),(2679,32),(2680,32),(2681,32),(2682,32),(2683,32),(2684,32),(2685,32),(2686,32),(2687,32),(2688,32),(2689,32),(2690,32),(2691,32),(2692,32),(2693,32),(2694,32);
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
  CONSTRAINT `PageToDifference_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PageToDifference_Difference` FOREIGN KEY (`Difference_ID`) REFERENCES `difference` (`Difference_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetodifference`
--

LOCK TABLES `pagetodifference` WRITE;
/*!40000 ALTER TABLE `pagetodifference` DISABLE KEYS */;
INSERT INTO `pagetodifference` VALUES (2602,70),(2603,71),(2604,71),(2605,71),(2606,71),(2607,71),(2608,71),(2609,71),(2610,72),(2611,72),(2612,72),(2613,72),(2614,72),(2615,72),(2616,72),(2617,72),(2618,72),(2619,72),(2620,72),(2621,72),(2622,72),(2623,72),(2624,72),(2625,72),(2626,72),(2627,72),(2628,72),(2629,72),(2630,72),(2631,72),(2632,72),(2633,72),(2634,72),(2635,72),(2636,72),(2637,72),(2638,72),(2639,72),(2640,72),(2641,73),(2642,73),(2643,73),(2644,73),(2645,73),(2646,73),(2647,73),(2648,73),(2649,73),(2650,73),(2651,73),(2652,73),(2653,73),(2654,73),(2655,73),(2656,73),(2657,73),(2658,73),(2659,73),(2660,73),(2661,73),(2662,73),(2663,73),(2664,73),(2665,73),(2666,74),(2667,74),(2668,74),(2669,74),(2670,74),(2671,74),(2672,74),(2673,74),(2674,74),(2675,74),(2676,74),(2677,75),(2678,75),(2679,75),(2680,75),(2681,75),(2682,75),(2683,75),(2684,75),(2685,75),(2686,75),(2687,75),(2688,75),(2689,75),(2690,75),(2691,75),(2692,75),(2693,75),(2694,75),(2695,76),(2696,76),(2697,76);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'Java'),(2,'Native');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (49,'13.5 Build 2.1 AFP',1,4,4,5,8);
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
  `SVN_Num` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'13.5',1),(2,'13.6',2),(3,'13.4.4.1',1),(6,'',2),(9,'1',2),(10,'20.1',1),(11,'20.1',2),(12,'1',1),(13,'13.5',2),(14,'123',2);
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

-- Dump completed on 2013-06-25 10:55:31
