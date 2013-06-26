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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (33,6371,NULL,73),(34,6373,NULL,74),(35,6374,NULL,75);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'2000-01-01'),(2,'2013-12-31'),(3,'2010-05-20'),(4,'2010-10-10'),(5,'2013-10-10'),(6,'2013-10-13'),(7,'1111-11-11'),(8,'2013-06-19'),(9,'2013-06-20'),(10,'2013-06-25');
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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difference`
--

LOCK TABLES `difference` WRITE;
/*!40000 ALTER TABLE `difference` DISABLE KEYS */;
INSERT INTO `difference` VALUES (70,'AddedCharacters',1),(71,'CorrectedCharacters',1),(72,'No description',2),(73,'TextLost',3),(74,'WrongCharacters',3),(75,'MissingDash',3),(76,'TextShrink',3),(77,'NoOverlap',1),(78,'Missing Time',3),(79,'Shifted Text',3),(80,'Wrong Date',3);
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
  `Error_Desc` varchar(110) DEFAULT NULL,
  PRIMARY KEY (`Error_ID`),
  UNIQUE KEY `ErrorCode_ID_UNIQUE` (`Error_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error`
--

LOCK TABLES `error` WRITE;
/*!40000 ALTER TABLE `error` DISABLE KEYS */;
INSERT INTO `error` VALUES (14,0,'.OutOfMemory'),(15,0,'.PageNotFound'),(16,0,'.CorruptedFile'),(17,0,'.ExceptionError'),(18,0,'.PasswordProtectedPDF'),(19,0,'.FormatNotAllowed'),(20,0,'JavaErrorInPageCount'),(21,0,'Page count Hang'),(22,0,'Page Hang'),(23,-1,'.OutOfMemory'),(24,-11,'.PageNotFound'),(25,-3,'.CorruptedFile'),(26,-38,'.ExceptionError'),(27,-44,'.PasswordProtectedPDF'),(28,-7,'.FormatNotAllowed'),(29,-1,'OutOfMemory'),(30,-11,'PageNotFound'),(31,-3,'CorruptedFile'),(32,-38,'ExceptionError'),(33,-44,'PasswordProtectedPDF'),(34,-7,'FormatNotAllowed');
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
) ENGINE=InnoDB AUTO_INCREMENT=5861 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (5689,'rla3a4.afp.1.tif',91,NULL,NULL),(5690,'18571-TEST2-Polish-currency.AFP.1.tif',91,NULL,NULL),(5691,'18571-TEST2-Polish-currency.AFP.2.tif',91,NULL,NULL),(5692,'18571-TEST2-Polish-currency.AFP.3.tif',91,NULL,NULL),(5693,'18571-TEST2-Polish-currency.AFP.4.tif',91,NULL,NULL),(5694,'18960-Letters.AFP.2.tif',91,NULL,NULL),(5695,'18960-Letters.AFP.3.tif',91,NULL,NULL),(5696,'uh220b.afp.1.tif',91,NULL,NULL),(5697,'15687-inversion.afp.2.tif',91,NULL,NULL),(5698,'15687-inversion.afp.3.tif',91,NULL,NULL),(5699,'15687-inversion.afp.4.tif',91,NULL,NULL),(5700,'15687-inversion.afp.5.tif',91,NULL,NULL),(5701,'15687-inversion.afp.6.tif',91,NULL,NULL),(5702,'a.afp.1.tif',91,NULL,NULL),(5703,'a.afp.10.tif',91,NULL,NULL),(5704,'a.afp.11.tif',91,NULL,NULL),(5705,'a.afp.12.tif',91,NULL,NULL),(5706,'a.afp.13.tif',91,NULL,NULL),(5707,'a.afp.14.tif',91,NULL,NULL),(5708,'a.afp.15.tif',91,NULL,NULL),(5709,'a.afp.16.tif',91,NULL,NULL),(5710,'a.afp.17.tif',91,NULL,NULL),(5711,'a.afp.18.tif',91,NULL,NULL),(5712,'a.afp.19.tif',91,NULL,NULL),(5713,'a.afp.2.tif',91,NULL,NULL),(5714,'a.afp.20.tif',91,NULL,NULL),(5715,'a.afp.3.tif',91,NULL,NULL),(5716,'a.afp.4.tif',91,NULL,NULL),(5717,'a.afp.5.tif',91,NULL,NULL),(5718,'a.afp.6.tif',91,NULL,NULL),(5719,'a.afp.7.tif',91,NULL,NULL),(5720,'a.afp.8.tif',91,NULL,NULL),(5721,'a.afp.9.tif',91,NULL,NULL),(5722,'P3.afp.1.tif',91,NULL,NULL),(5723,'P3.afp.10.tif',91,NULL,NULL),(5724,'P3.afp.13.tif',91,NULL,NULL),(5725,'P3.afp.4.tif',91,NULL,NULL),(5726,'P3.afp.5.tif',91,NULL,NULL),(5727,'P3.afp.7.tif',91,NULL,NULL),(5728,'12942-wrong-fonts.afp.1.tif',91,NULL,NULL),(5729,'15005-French-and-box-chars.afp.1.tif',91,NULL,NULL),(5730,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.tif',91,NULL,NULL),(5731,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.tif',91,NULL,NULL),(5732,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.tif',91,NULL,NULL),(5733,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.tif',91,NULL,NULL),(5734,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.tif',91,NULL,NULL),(5735,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.tif',91,NULL,NULL),(5736,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.tif',91,NULL,NULL),(5737,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.tif',91,NULL,NULL),(5738,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.tif',91,NULL,NULL),(5739,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.tif',91,NULL,NULL),(5740,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.tif',91,NULL,NULL),(5741,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.tif',91,NULL,NULL),(5742,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.tif',91,NULL,NULL),(5743,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.tif',91,NULL,NULL),(5744,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.tif',91,NULL,NULL),(5745,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.tif',91,NULL,NULL),(5746,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.tif',91,NULL,NULL),(5747,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.tif',91,NULL,NULL),(5748,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.tif',91,NULL,NULL),(5749,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.tif',91,NULL,NULL),(5750,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.tif',91,NULL,NULL),(5751,'18960-Letters.AFP.1.tif',91,NULL,NULL),(5752,'acifres.afp.1.tif',91,NULL,NULL),(5753,'15774-AFP_input-norwegian.afp.1.tif',91,NULL,NULL),(5754,'15774-AFP_input-norwegian.afp.11.tif',91,NULL,NULL),(5755,'15774-AFP_input-norwegian.afp.13.tif',91,NULL,NULL),(5756,'15774-AFP_input-norwegian.afp.15.tif',91,NULL,NULL),(5757,'15774-AFP_input-norwegian.afp.17.tif',91,NULL,NULL),(5758,'15774-AFP_input-norwegian.afp.19.tif',91,NULL,NULL),(5759,'15774-AFP_input-norwegian.afp.3.tif',91,NULL,NULL),(5760,'15774-AFP_input-norwegian.afp.5.tif',91,NULL,NULL),(5761,'15774-AFP_input-norwegian.afp.7.tif',91,NULL,NULL),(5762,'15774-AFP_input-norwegian.afp.9.tif',91,NULL,NULL),(5763,'UOFATC_VI_MC_AX.afp.3.tif',91,NULL,NULL),(5764,'18811-GOCA-fill.AFP.10.tif',91,NULL,NULL),(5765,'18811-GOCA-fill.AFP.11.tif',91,NULL,NULL),(5766,'18811-GOCA-fill.AFP.12.tif',91,NULL,NULL),(5767,'18811-GOCA-fill.AFP.13.tif',91,NULL,NULL),(5768,'18811-GOCA-fill.AFP.14.tif',91,NULL,NULL),(5769,'18811-GOCA-fill.AFP.15.tif',91,NULL,NULL),(5770,'18811-GOCA-fill.AFP.16.tif',91,NULL,NULL),(5771,'18811-GOCA-fill.AFP.19.tif',91,NULL,NULL),(5772,'18811-GOCA-fill.AFP.20.tif',91,NULL,NULL),(5773,'18811-GOCA-fill.AFP.3.tif',91,NULL,NULL),(5774,'18811-GOCA-fill.AFP.4.tif',91,NULL,NULL),(5775,'18811-GOCA-fill.AFP.5.tif',91,NULL,NULL),(5776,'18811-GOCA-fill.AFP.6.tif',91,NULL,NULL),(5777,'18811-GOCA-fill.AFP.7.tif',91,NULL,NULL),(5778,'18811-GOCA-fill.AFP.8.tif',91,NULL,NULL),(5779,'18811-GOCA-fill.AFP.9.tif',91,NULL,NULL),(5780,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.tif',91,NULL,NULL),(5781,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.tif',91,NULL,NULL),(5782,'17639-testfil.afp.1.tif',91,NULL,NULL),(5783,'621113386-01-18-2005.afp.1.tif',91,NULL,NULL),(5784,'645702207-10-25-2005.afp.1.tif',91,NULL,NULL),(5785,'12501-logo-1.afp.txt',91,NULL,30),(5786,'15005-French-and-box-chars.afp.txt',91,NULL,30),(5787,'15476-AFP-metatags.afp.txt',91,NULL,30),(5788,'17639-testfil.afp.txt',91,NULL,30),(5789,'621113386-01-18-2005.afp.txt',91,NULL,30),(5790,'645702207-10-25-2005.afp.txt',91,NULL,30),(5791,'acifres.afp.txt',91,NULL,30),(5792,'rla3a4.afp.txt',91,NULL,30),(5793,'afa.afp.txt',91,NULL,31),(5794,'17098-GoodDiagram.afp.txt',91,NULL,34),(5795,'TH-WORDwithLogoSig.doc.1.tif',92,NULL,NULL),(5796,'11515-checkboxes.doc.1.tif',92,NULL,NULL),(5797,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.tif',92,NULL,NULL),(5798,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.tif',92,NULL,NULL),(5799,'13801-wingding-bullets.doc.1.tif',92,NULL,NULL),(5800,'13802-font-change-after-field.doc.1.tif',92,NULL,NULL),(5801,'13803-1-appearing-before-date.doc.1.tif',92,NULL,NULL),(5802,'17829-test-drop-downs.XLS.1.tif',92,NULL,NULL),(5803,'17860-crash.xls.1.tif',92,NULL,NULL),(5804,'11083.doc.1.tif',92,NULL,NULL),(5805,'11083.doc.2.tif',92,NULL,NULL),(5806,'11083.doc.3.tif',92,NULL,NULL),(5807,'15197-table-grid-lines.doc.1.tif',92,NULL,NULL),(5808,'15197-table-grid-lines.doc.10.tif',92,NULL,NULL),(5809,'15197-table-grid-lines.doc.11.tif',92,NULL,NULL),(5810,'15197-table-grid-lines.doc.12.tif',92,NULL,NULL),(5811,'15197-table-grid-lines.doc.13.tif',92,NULL,NULL),(5812,'15197-table-grid-lines.doc.14.tif',92,NULL,NULL),(5813,'15197-table-grid-lines.doc.15.tif',92,NULL,NULL),(5814,'15197-table-grid-lines.doc.16.tif',92,NULL,NULL),(5815,'15197-table-grid-lines.doc.17.tif',92,NULL,NULL),(5816,'15197-table-grid-lines.doc.18.tif',92,NULL,NULL),(5817,'15197-table-grid-lines.doc.19.tif',92,NULL,NULL),(5818,'15197-table-grid-lines.doc.2.tif',92,NULL,NULL),(5819,'15197-table-grid-lines.doc.20.tif',92,NULL,NULL),(5820,'15197-table-grid-lines.doc.3.tif',92,NULL,NULL),(5821,'15197-table-grid-lines.doc.4.tif',92,NULL,NULL),(5822,'15197-table-grid-lines.doc.5.tif',92,NULL,NULL),(5823,'15197-table-grid-lines.doc.6.tif',92,NULL,NULL),(5824,'15197-table-grid-lines.doc.7.tif',92,NULL,NULL),(5825,'15197-table-grid-lines.doc.8.tif',92,NULL,NULL),(5826,'15197-table-grid-lines.doc.9.tif',92,NULL,NULL),(5827,'17501-Word 2002-Missing-Logo.DOC.2.tif',92,NULL,NULL),(5828,'17501-Word 2002-Missing-Logo.DOC.3.tif',92,NULL,NULL),(5829,'17501-Word 2002-Missing-Logo.DOC.4.tif',92,NULL,NULL),(5830,'17501-Word 2002-Missing-Logo.DOC.5.tif',92,NULL,NULL),(5831,'17501-Word 2002-Missing-Logo.DOC.6.tif',92,NULL,NULL),(5832,'17501-Word 2002-Missing-Logo.DOC.7.tif',92,NULL,NULL),(5833,'17501-Word 2002-Missing-Logo.DOC.8.tif',92,NULL,NULL),(5834,'18770-090dbba1dafdade6-1.0-1.xls.txt',92,NULL,29),(5835,'18770-jre-1.4-freeze.xls.txt',92,NULL,29),(5836,'12226-Empty_excel.xls.txt',92,NULL,30),(5837,'13270-NPE-BRU IMMS__944__test4.xls.txt',92,NULL,30),(5838,'13270-NPE-BRU IMMS__945__test5.xls.txt',92,NULL,30),(5839,'13270-NPE-BRU IMMS__946__test6.xls.txt',92,NULL,30),(5840,'13270-NPE-BRU IMMS__949__test9.xls.txt',92,NULL,30),(5841,'13270-NPE-BRU IMMS__950__test10.xls.txt',92,NULL,30),(5842,'13270-NPE-BRU IMMS__966__a6.xls.txt',92,NULL,30),(5843,'13270-NPE-BRU IMMS__967__a7.xls.txt',92,NULL,30),(5844,'13270-NPE-BRUSSELS CONVERSION__10830__test for voucher upload xls 3.12.xls.txt',92,NULL,30),(5845,'13270-NPE-MAN MTP INTERNAL INSTRUCTIONS__822__abc.xls.txt',92,NULL,30),(5846,'18974-Example-RasterMaster-Multiple-Sheets.xls.txt',92,NULL,30),(5847,'17420-Compliance Planning by Employee.page-not-found.xls.txt',92,NULL,31),(5848,'15961-twenty-screen-captures.xls.txt',92,NULL,32),(5849,'17724-MostComplexExcel.xls.txt',92,NULL,32),(5850,'17768-Table-and-diagram.xlsm.txt',92,NULL,32),(5851,'17966-Invoice3.xlsx.txt',92,NULL,32),(5852,'14067-password-to-read-equals-qa.xls.txt',92,NULL,33),(5853,'12593-created-by-outlook-AAR.rtf.txt',92,NULL,34),(5854,'~$artest.doc.txt',92,NULL,34),(5855,'17768-Table-and-diagram.xlsm.txt',92,NULL,20),(5856,'17966-Invoice3.xlsx.txt',92,NULL,20),(5857,'Word2007RTFSpec9.rtf.txt',92,NULL,20),(5858,'Word2007RTFSpec9.rtf.txt',92,NULL,21),(5859,'18770-090dbba1dafdade6-1.0-1.xls.0.txt',92,NULL,22),(5860,'18770-jre-1.4-freeze.xls.0.txt',92,NULL,22);
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
INSERT INTO `pagetobug` VALUES (5728,33),(5729,33),(5730,33),(5731,33),(5732,33),(5733,33),(5734,33),(5735,33),(5736,33),(5737,33),(5738,33),(5739,33),(5740,33),(5741,33),(5742,33),(5743,33),(5744,33),(5745,33),(5746,33),(5747,33),(5748,33),(5749,33),(5750,33),(5751,33),(5752,33),(5753,34),(5754,34),(5755,34),(5756,34),(5757,34),(5758,34),(5759,34),(5760,34),(5761,34),(5762,34),(5763,34),(5764,35),(5765,35),(5766,35),(5767,35),(5768,35),(5769,35),(5770,35),(5771,35),(5772,35),(5773,35),(5774,35),(5775,35),(5776,35),(5777,35),(5778,35),(5779,35),(5780,35),(5781,35);
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
INSERT INTO `pagetodifference` VALUES (5689,70),(5690,71),(5691,71),(5692,71),(5693,71),(5694,71),(5695,71),(5696,71),(5697,72),(5698,72),(5699,72),(5700,72),(5701,72),(5702,72),(5703,72),(5704,72),(5705,72),(5706,72),(5707,72),(5708,72),(5709,72),(5710,72),(5711,72),(5712,72),(5713,72),(5714,72),(5715,72),(5716,72),(5717,72),(5718,72),(5719,72),(5720,72),(5721,72),(5722,72),(5723,72),(5724,72),(5725,72),(5726,72),(5727,72),(5728,73),(5729,73),(5730,73),(5731,73),(5732,73),(5733,73),(5734,73),(5735,73),(5736,73),(5737,73),(5738,73),(5739,73),(5740,73),(5741,73),(5742,73),(5743,73),(5744,73),(5745,73),(5746,73),(5747,73),(5748,73),(5749,73),(5750,73),(5751,73),(5752,73),(5753,74),(5754,74),(5755,74),(5756,74),(5757,74),(5758,74),(5759,74),(5760,74),(5761,74),(5762,74),(5763,74),(5764,75),(5765,75),(5766,75),(5767,75),(5768,75),(5769,75),(5770,75),(5771,75),(5772,75),(5773,75),(5774,75),(5775,75),(5776,75),(5777,75),(5778,75),(5779,75),(5780,75),(5781,75),(5782,76),(5783,76),(5784,76),(5795,77),(5796,72),(5797,72),(5798,72),(5799,72),(5800,72),(5801,72),(5802,72),(5803,72),(5804,78),(5805,78),(5806,78),(5807,79),(5808,79),(5809,79),(5810,79),(5811,79),(5812,79),(5813,79),(5814,79),(5815,79),(5816,79),(5817,79),(5818,79),(5819,79),(5820,79),(5821,79),(5822,79),(5823,79),(5824,79),(5825,79),(5826,79),(5827,80),(5828,80),(5829,80),(5830,80),(5831,80),(5832,80),(5833,80);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance`
--

LOCK TABLES `performance` WRITE;
/*!40000 ALTER TABLE `performance` DISABLE KEYS */;
INSERT INTO `performance` VALUES (1,'00:01:00'),(2,'01:25:00'),(3,'00:00:50'),(4,'10:00:00'),(5,'10:05:20'),(6,'11:11:11'),(7,'05:20:34'),(8,'06:05:50'),(9,'04:10:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (91,'13.5-Build2.1 AFP',1,4,10,6,9),(92,'13.5-Build2.1 MSOffice',1,5,10,7,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn`
--

LOCK TABLES `svn` WRITE;
/*!40000 ALTER TABLE `svn` DISABLE KEYS */;
INSERT INTO `svn` VALUES (1,1234),(2,4321),(3,12345),(4,1111),(5,2222),(6,54321),(7,54322);
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

-- Dump completed on 2013-06-26 11:55:33
