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
  `Bug_Number` int(11) DEFAULT NULL,
  `Bug_Status_ID` int(11) DEFAULT NULL,
  `Difference_ID` int(11) NOT NULL,
  PRIMARY KEY (`Bug_ID`),
  UNIQUE KEY `Bug_ID_UNIQUE` (`Bug_ID`),
  KEY `BugStatus_idx` (`Bug_Status_ID`),
  KEY `Bug_Difference_idx` (`Difference_ID`),
  CONSTRAINT `Bug_BugStatus` FOREIGN KEY (`Bug_Status_ID`) REFERENCES `bugstatus` (`BugStatus_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Bug_Difference` FOREIGN KEY (`Difference_ID`) REFERENCES `difference` (`Difference_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (91,6371,NULL,99),(92,6373,NULL,100),(93,6374,NULL,101),(94,1111,NULL,102),(95,NULL,NULL,104),(96,NULL,NULL,105),(97,NULL,NULL,106);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'2000-01-01'),(2,'2013-12-31'),(3,'2010-05-20'),(4,'2010-10-10'),(5,'2013-10-10'),(6,'2013-10-13'),(7,'1111-11-11'),(8,'2013-06-19'),(9,'2013-06-20'),(10,'2013-06-25'),(11,'2013-07-02'),(12,'2011-03-03');
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
  CONSTRAINT `Difference_DiffType` FOREIGN KEY (`DiffType_ID`) REFERENCES `difftype` (`DiffType_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difference`
--

LOCK TABLES `difference` WRITE;
/*!40000 ALTER TABLE `difference` DISABLE KEYS */;
INSERT INTO `difference` VALUES (96,'AddedCharacters',1),(97,'CorrectedCharacters',1),(98,NULL,2),(99,'TextLost',3),(100,'WrongCharacters',3),(101,'MissingDash',3),(102,'TextShrink',3),(103,'NoOverlap',1),(104,'Missing Time',3),(105,'Shifted Text',3),(106,'Wrong Date',3);
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
  CONSTRAINT `Page_Error` FOREIGN KEY (`Error_ID`) REFERENCES `error` (`Error_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Performance` FOREIGN KEY (`Performance_ID`) REFERENCES `performance` (`Performance_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Page_Run` FOREIGN KEY (`Run_ID`) REFERENCES `run` (`Run_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8891 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (8653,'rla3a4.afp.1.tif',134,NULL,NULL),(8654,'18571-TEST2-Polish-currency.AFP.1.tif',134,NULL,NULL),(8655,'18571-TEST2-Polish-currency.AFP.2.tif',134,NULL,NULL),(8656,'18571-TEST2-Polish-currency.AFP.3.tif',134,NULL,NULL),(8657,'18571-TEST2-Polish-currency.AFP.4.tif',134,NULL,NULL),(8658,'18960-Letters.AFP.2.tif',134,NULL,NULL),(8659,'18960-Letters.AFP.3.tif',134,NULL,NULL),(8660,'uh220b.afp.1.tif',134,NULL,NULL),(8661,'15687-inversion.afp.2.tif',134,NULL,NULL),(8662,'15687-inversion.afp.3.tif',134,NULL,NULL),(8663,'15687-inversion.afp.4.tif',134,NULL,NULL),(8664,'15687-inversion.afp.5.tif',134,NULL,NULL),(8665,'15687-inversion.afp.6.tif',134,NULL,NULL),(8666,'a.afp.1.tif',134,NULL,NULL),(8667,'a.afp.10.tif',134,NULL,NULL),(8668,'a.afp.11.tif',134,NULL,NULL),(8669,'a.afp.12.tif',134,NULL,NULL),(8670,'a.afp.13.tif',134,NULL,NULL),(8671,'a.afp.14.tif',134,NULL,NULL),(8672,'a.afp.15.tif',134,NULL,NULL),(8673,'a.afp.16.tif',134,NULL,NULL),(8674,'a.afp.17.tif',134,NULL,NULL),(8675,'a.afp.18.tif',134,NULL,NULL),(8676,'a.afp.19.tif',134,NULL,NULL),(8677,'a.afp.2.tif',134,NULL,NULL),(8678,'a.afp.20.tif',134,NULL,NULL),(8679,'a.afp.3.tif',134,NULL,NULL),(8680,'a.afp.4.tif',134,NULL,NULL),(8681,'a.afp.5.tif',134,NULL,NULL),(8682,'a.afp.6.tif',134,NULL,NULL),(8683,'a.afp.7.tif',134,NULL,NULL),(8684,'a.afp.8.tif',134,NULL,NULL),(8685,'a.afp.9.tif',134,NULL,NULL),(8686,'P3.afp.1.tif',134,NULL,NULL),(8687,'P3.afp.10.tif',134,NULL,NULL),(8688,'P3.afp.13.tif',134,NULL,NULL),(8689,'P3.afp.4.tif',134,NULL,NULL),(8690,'P3.afp.5.tif',134,NULL,NULL),(8691,'P3.afp.7.tif',134,NULL,NULL),(8692,'12942-wrong-fonts.afp.1.tif',134,NULL,NULL),(8693,'15005-French-and-box-chars.afp.1.tif',134,NULL,NULL),(8694,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.tif',134,NULL,NULL),(8695,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.tif',134,NULL,NULL),(8696,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.tif',134,NULL,NULL),(8697,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.tif',134,NULL,NULL),(8698,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.tif',134,NULL,NULL),(8699,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.tif',134,NULL,NULL),(8700,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.tif',134,NULL,NULL),(8701,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.tif',134,NULL,NULL),(8702,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.tif',134,NULL,NULL),(8703,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.tif',134,NULL,NULL),(8704,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.tif',134,NULL,NULL),(8705,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.tif',134,NULL,NULL),(8706,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.tif',134,NULL,NULL),(8707,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.tif',134,NULL,NULL),(8708,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.tif',134,NULL,NULL),(8709,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.tif',134,NULL,NULL),(8710,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.tif',134,NULL,NULL),(8711,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.tif',134,NULL,NULL),(8712,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.tif',134,NULL,NULL),(8713,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.tif',134,NULL,NULL),(8714,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.tif',134,NULL,NULL),(8715,'18960-Letters.AFP.1.tif',134,NULL,NULL),(8716,'acifres.afp.1.tif',134,NULL,NULL),(8717,'15774-AFP_input-norwegian.afp.1.tif',134,NULL,NULL),(8718,'15774-AFP_input-norwegian.afp.11.tif',134,NULL,NULL),(8719,'15774-AFP_input-norwegian.afp.13.tif',134,NULL,NULL),(8720,'15774-AFP_input-norwegian.afp.15.tif',134,NULL,NULL),(8721,'15774-AFP_input-norwegian.afp.17.tif',134,NULL,NULL),(8722,'15774-AFP_input-norwegian.afp.19.tif',134,NULL,NULL),(8723,'15774-AFP_input-norwegian.afp.3.tif',134,NULL,NULL),(8724,'15774-AFP_input-norwegian.afp.5.tif',134,NULL,NULL),(8725,'15774-AFP_input-norwegian.afp.7.tif',134,NULL,NULL),(8726,'15774-AFP_input-norwegian.afp.9.tif',134,NULL,NULL),(8727,'UOFATC_VI_MC_AX.afp.3.tif',134,NULL,NULL),(8728,'18811-GOCA-fill.AFP.10.tif',134,NULL,NULL),(8729,'18811-GOCA-fill.AFP.11.tif',134,NULL,NULL),(8730,'18811-GOCA-fill.AFP.12.tif',134,NULL,NULL),(8731,'18811-GOCA-fill.AFP.13.tif',134,NULL,NULL),(8732,'18811-GOCA-fill.AFP.14.tif',134,NULL,NULL),(8733,'18811-GOCA-fill.AFP.15.tif',134,NULL,NULL),(8734,'18811-GOCA-fill.AFP.16.tif',134,NULL,NULL),(8735,'18811-GOCA-fill.AFP.19.tif',134,NULL,NULL),(8736,'18811-GOCA-fill.AFP.20.tif',134,NULL,NULL),(8737,'18811-GOCA-fill.AFP.3.tif',134,NULL,NULL),(8738,'18811-GOCA-fill.AFP.4.tif',134,NULL,NULL),(8739,'18811-GOCA-fill.AFP.5.tif',134,NULL,NULL),(8740,'18811-GOCA-fill.AFP.6.tif',134,NULL,NULL),(8741,'18811-GOCA-fill.AFP.7.tif',134,NULL,NULL),(8742,'18811-GOCA-fill.AFP.8.tif',134,NULL,NULL),(8743,'18811-GOCA-fill.AFP.9.tif',134,NULL,NULL),(8744,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.tif',134,NULL,NULL),(8745,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.tif',134,NULL,NULL),(8746,'17639-testfil.afp.1.tif',134,NULL,NULL),(8747,'621113386-01-18-2005.afp.1.tif',134,NULL,NULL),(8748,'645702207-10-25-2005.afp.1.tif',134,NULL,NULL),(8749,'12501-logo-1.afp.txt',134,NULL,30),(8750,'15005-French-and-box-chars.afp.txt',134,NULL,30),(8751,'15476-AFP-metatags.afp.txt',134,NULL,30),(8752,'17639-testfil.afp.txt',134,NULL,30),(8753,'621113386-01-18-2005.afp.txt',134,NULL,30),(8754,'645702207-10-25-2005.afp.txt',134,NULL,30),(8755,'acifres.afp.txt',134,NULL,30),(8756,'rla3a4.afp.txt',134,NULL,30),(8757,'afa.afp.txt',134,NULL,31),(8758,'17098-GoodDiagram.afp.txt',134,NULL,34),(8759,'TH-WORDwithLogoSig.doc.1.tif',135,NULL,NULL),(8760,'11515-checkboxes.doc.1.tif',135,NULL,NULL),(8761,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.tif',135,NULL,NULL),(8762,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.tif',135,NULL,NULL),(8763,'13801-wingding-bullets.doc.1.tif',135,NULL,NULL),(8764,'13802-font-change-after-field.doc.1.tif',135,NULL,NULL),(8765,'13803-1-appearing-before-date.doc.1.tif',135,NULL,NULL),(8766,'17829-test-drop-downs.XLS.1.tif',135,NULL,NULL),(8767,'17860-crash.xls.1.tif',135,NULL,NULL),(8768,'11083.doc.1.tif',135,NULL,NULL),(8769,'11083.doc.2.tif',135,NULL,NULL),(8770,'11083.doc.3.tif',135,NULL,NULL),(8771,'15197-table-grid-lines.doc.1.tif',135,NULL,NULL),(8772,'15197-table-grid-lines.doc.10.tif',135,NULL,NULL),(8773,'15197-table-grid-lines.doc.11.tif',135,NULL,NULL),(8774,'15197-table-grid-lines.doc.12.tif',135,NULL,NULL),(8775,'15197-table-grid-lines.doc.13.tif',135,NULL,NULL),(8776,'15197-table-grid-lines.doc.14.tif',135,NULL,NULL),(8777,'15197-table-grid-lines.doc.15.tif',135,NULL,NULL),(8778,'15197-table-grid-lines.doc.16.tif',135,NULL,NULL),(8779,'15197-table-grid-lines.doc.17.tif',135,NULL,NULL),(8780,'15197-table-grid-lines.doc.18.tif',135,NULL,NULL),(8781,'15197-table-grid-lines.doc.19.tif',135,NULL,NULL),(8782,'15197-table-grid-lines.doc.2.tif',135,NULL,NULL),(8783,'15197-table-grid-lines.doc.20.tif',135,NULL,NULL),(8784,'15197-table-grid-lines.doc.3.tif',135,NULL,NULL),(8785,'15197-table-grid-lines.doc.4.tif',135,NULL,NULL),(8786,'15197-table-grid-lines.doc.5.tif',135,NULL,NULL),(8787,'15197-table-grid-lines.doc.6.tif',135,NULL,NULL),(8788,'15197-table-grid-lines.doc.7.tif',135,NULL,NULL),(8789,'15197-table-grid-lines.doc.8.tif',135,NULL,NULL),(8790,'15197-table-grid-lines.doc.9.tif',135,NULL,NULL),(8791,'17501-Word 2002-Missing-Logo.DOC.2.tif',135,NULL,NULL),(8792,'17501-Word 2002-Missing-Logo.DOC.3.tif',135,NULL,NULL),(8793,'17501-Word 2002-Missing-Logo.DOC.4.tif',135,NULL,NULL),(8794,'17501-Word 2002-Missing-Logo.DOC.5.tif',135,NULL,NULL),(8795,'17501-Word 2002-Missing-Logo.DOC.6.tif',135,NULL,NULL),(8796,'17501-Word 2002-Missing-Logo.DOC.7.tif',135,NULL,NULL),(8797,'17501-Word 2002-Missing-Logo.DOC.8.tif',135,NULL,NULL),(8798,'18770-090dbba1dafdade6-1.0-1.xls.txt',135,NULL,29),(8799,'18770-jre-1.4-freeze.xls.txt',135,NULL,29),(8800,'12226-Empty_excel.xls.txt',135,NULL,30),(8801,'13270-NPE-BRU IMMS__944__test4.xls.txt',135,NULL,30),(8802,'13270-NPE-BRU IMMS__945__test5.xls.txt',135,NULL,30),(8803,'13270-NPE-BRU IMMS__946__test6.xls.txt',135,NULL,30),(8804,'13270-NPE-BRU IMMS__949__test9.xls.txt',135,NULL,30),(8805,'13270-NPE-BRU IMMS__950__test10.xls.txt',135,NULL,30),(8806,'13270-NPE-BRU IMMS__966__a6.xls.txt',135,NULL,30),(8807,'13270-NPE-BRU IMMS__967__a7.xls.txt',135,NULL,30),(8808,'13270-NPE-BRUSSELS CONVERSION__10830__test for voucher upload xls 3.12.xls.txt',135,NULL,30),(8809,'13270-NPE-MAN MTP INTERNAL INSTRUCTIONS__822__abc.xls.txt',135,NULL,30),(8810,'18974-Example-RasterMaster-Multiple-Sheets.xls.txt',135,NULL,30),(8811,'17420-Compliance Planning by Employee.page-not-found.xls.txt',135,NULL,31),(8812,'15961-twenty-screen-captures.xls.txt',135,NULL,32),(8813,'17724-MostComplexExcel.xls.txt',135,NULL,32),(8814,'17768-Table-and-diagram.xlsm.txt',135,NULL,32),(8815,'17966-Invoice3.xlsx.txt',135,NULL,32),(8816,'14067-password-to-read-equals-qa.xls.txt',135,NULL,33),(8817,'12593-created-by-outlook-AAR.rtf.txt',135,NULL,34),(8818,'~$artest.doc.txt',135,NULL,34),(8819,'17768-Table-and-diagram.xlsm.txt',135,NULL,20),(8820,'17966-Invoice3.xlsx.txt',135,NULL,20),(8821,'Word2007RTFSpec9.rtf.txt',135,NULL,20),(8822,'Word2007RTFSpec9.rtf.txt',135,NULL,21),(8823,'18770-090dbba1dafdade6-1.0-1.xls.0.txt',135,NULL,22),(8824,'18770-jre-1.4-freeze.xls.0.txt',135,NULL,22),(8825,'TH-WORDwithLogoSig.doc.1.tif',136,NULL,NULL),(8826,'11515-checkboxes.doc.1.tif',136,NULL,NULL),(8827,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.tif',136,NULL,NULL),(8828,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.tif',136,NULL,NULL),(8829,'13801-wingding-bullets.doc.1.tif',136,NULL,NULL),(8830,'13802-font-change-after-field.doc.1.tif',136,NULL,NULL),(8831,'13803-1-appearing-before-date.doc.1.tif',136,NULL,NULL),(8832,'17829-test-drop-downs.XLS.1.tif',136,NULL,NULL),(8833,'17860-crash.xls.1.tif',136,NULL,NULL),(8834,'11083.doc.1.tif',136,NULL,NULL),(8835,'11083.doc.2.tif',136,NULL,NULL),(8836,'11083.doc.3.tif',136,NULL,NULL),(8837,'15197-table-grid-lines.doc.1.tif',136,NULL,NULL),(8838,'15197-table-grid-lines.doc.10.tif',136,NULL,NULL),(8839,'15197-table-grid-lines.doc.11.tif',136,NULL,NULL),(8840,'15197-table-grid-lines.doc.12.tif',136,NULL,NULL),(8841,'15197-table-grid-lines.doc.13.tif',136,NULL,NULL),(8842,'15197-table-grid-lines.doc.14.tif',136,NULL,NULL),(8843,'15197-table-grid-lines.doc.15.tif',136,NULL,NULL),(8844,'15197-table-grid-lines.doc.16.tif',136,NULL,NULL),(8845,'15197-table-grid-lines.doc.17.tif',136,NULL,NULL),(8846,'15197-table-grid-lines.doc.18.tif',136,NULL,NULL),(8847,'15197-table-grid-lines.doc.19.tif',136,NULL,NULL),(8848,'15197-table-grid-lines.doc.2.tif',136,NULL,NULL),(8849,'15197-table-grid-lines.doc.20.tif',136,NULL,NULL),(8850,'15197-table-grid-lines.doc.3.tif',136,NULL,NULL),(8851,'15197-table-grid-lines.doc.4.tif',136,NULL,NULL),(8852,'15197-table-grid-lines.doc.5.tif',136,NULL,NULL),(8853,'15197-table-grid-lines.doc.6.tif',136,NULL,NULL),(8854,'15197-table-grid-lines.doc.7.tif',136,NULL,NULL),(8855,'15197-table-grid-lines.doc.8.tif',136,NULL,NULL),(8856,'15197-table-grid-lines.doc.9.tif',136,NULL,NULL),(8857,'17501-Word 2002-Missing-Logo.DOC.2.tif',136,NULL,NULL),(8858,'17501-Word 2002-Missing-Logo.DOC.3.tif',136,NULL,NULL),(8859,'17501-Word 2002-Missing-Logo.DOC.4.tif',136,NULL,NULL),(8860,'17501-Word 2002-Missing-Logo.DOC.5.tif',136,NULL,NULL),(8861,'17501-Word 2002-Missing-Logo.DOC.6.tif',136,NULL,NULL),(8862,'17501-Word 2002-Missing-Logo.DOC.7.tif',136,NULL,NULL),(8863,'17501-Word 2002-Missing-Logo.DOC.8.tif',136,NULL,NULL),(8864,'18770-090dbba1dafdade6-1.0-1.xls.txt',136,NULL,29),(8865,'18770-jre-1.4-freeze.xls.txt',136,NULL,29),(8866,'12226-Empty_excel.xls.txt',136,NULL,30),(8867,'13270-NPE-BRU IMMS__944__test4.xls.txt',136,NULL,30),(8868,'13270-NPE-BRU IMMS__945__test5.xls.txt',136,NULL,30),(8869,'13270-NPE-BRU IMMS__946__test6.xls.txt',136,NULL,30),(8870,'13270-NPE-BRU IMMS__949__test9.xls.txt',136,NULL,30),(8871,'13270-NPE-BRU IMMS__950__test10.xls.txt',136,NULL,30),(8872,'13270-NPE-BRU IMMS__966__a6.xls.txt',136,NULL,30),(8873,'13270-NPE-BRU IMMS__967__a7.xls.txt',136,NULL,30),(8874,'13270-NPE-BRUSSELS CONVERSION__10830__test for voucher upload xls 3.12.xls.txt',136,NULL,30),(8875,'13270-NPE-MAN MTP INTERNAL INSTRUCTIONS__822__abc.xls.txt',136,NULL,30),(8876,'18974-Example-RasterMaster-Multiple-Sheets.xls.txt',136,NULL,30),(8877,'17420-Compliance Planning by Employee.page-not-found.xls.txt',136,NULL,31),(8878,'15961-twenty-screen-captures.xls.txt',136,NULL,32),(8879,'17724-MostComplexExcel.xls.txt',136,NULL,32),(8880,'17768-Table-and-diagram.xlsm.txt',136,NULL,32),(8881,'17966-Invoice3.xlsx.txt',136,NULL,32),(8882,'14067-password-to-read-equals-qa.xls.txt',136,NULL,33),(8883,'12593-created-by-outlook-AAR.rtf.txt',136,NULL,34),(8884,'~$artest.doc.txt',136,NULL,34),(8885,'17768-Table-and-diagram.xlsm.txt',136,NULL,20),(8886,'17966-Invoice3.xlsx.txt',136,NULL,20),(8887,'Word2007RTFSpec9.rtf.txt',136,NULL,20),(8888,'Word2007RTFSpec9.rtf.txt',136,NULL,21),(8889,'18770-090dbba1dafdade6-1.0-1.xls.0.txt',136,NULL,22),(8890,'18770-jre-1.4-freeze.xls.0.txt',136,NULL,22);
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
  CONSTRAINT `PageToBug_Bug` FOREIGN KEY (`Bug_ID`) REFERENCES `bug` (`Bug_ID`) ON UPDATE CASCADE,
  CONSTRAINT `PageToBug_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetobug`
--

LOCK TABLES `pagetobug` WRITE;
/*!40000 ALTER TABLE `pagetobug` DISABLE KEYS */;
INSERT INTO `pagetobug` VALUES (8660,92),(8692,91),(8693,91),(8694,91),(8695,91),(8696,91),(8697,91),(8698,91),(8699,91),(8700,91),(8701,91),(8702,91),(8703,91),(8704,91),(8705,91),(8706,91),(8707,91),(8708,91),(8709,91),(8710,91),(8711,91),(8712,91),(8713,91),(8714,91),(8715,91),(8716,91),(8717,92),(8718,92),(8719,92),(8720,92),(8721,92),(8722,92),(8723,92),(8724,92),(8725,92),(8726,92),(8727,92),(8728,93),(8729,93),(8730,93),(8731,93),(8732,93),(8733,93),(8734,93),(8735,93),(8736,93),(8737,93),(8738,93),(8739,93),(8740,93),(8741,93),(8742,93),(8743,93),(8744,93),(8745,93),(8746,94),(8747,94),(8748,94),(8768,95),(8769,95),(8770,95),(8771,96),(8772,96),(8773,96),(8774,96),(8775,96),(8776,96),(8777,96),(8778,96),(8779,96),(8780,96),(8781,96),(8782,96),(8783,96),(8784,96),(8785,96),(8786,96),(8787,96),(8788,96),(8789,96),(8790,96),(8791,97),(8792,97),(8793,97),(8794,97),(8795,97),(8796,97),(8797,97),(8834,95),(8835,95),(8836,95),(8837,96),(8838,96),(8839,96),(8840,96),(8841,96),(8842,96),(8843,96),(8844,96),(8845,96),(8846,96),(8847,96),(8848,96),(8849,96),(8850,96),(8851,96),(8852,96),(8853,96),(8854,96),(8855,96),(8856,96),(8857,97),(8858,97),(8859,97),(8860,97),(8861,97),(8862,97),(8863,97);
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
  CONSTRAINT `PageToDifference_Difference` FOREIGN KEY (`Difference_ID`) REFERENCES `difference` (`Difference_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `PageToDifference_Page` FOREIGN KEY (`Page_ID`) REFERENCES `page` (`Page_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagetodifference`
--

LOCK TABLES `pagetodifference` WRITE;
/*!40000 ALTER TABLE `pagetodifference` DISABLE KEYS */;
INSERT INTO `pagetodifference` VALUES (8653,96),(8654,97),(8655,97),(8656,97),(8657,97),(8658,97),(8659,97),(8660,97),(8660,100),(8661,98),(8662,98),(8663,98),(8664,98),(8665,98),(8666,98),(8667,98),(8668,98),(8669,98),(8670,98),(8671,98),(8672,98),(8673,98),(8674,98),(8675,98),(8676,98),(8677,98),(8678,98),(8679,98),(8680,98),(8681,98),(8682,98),(8683,98),(8684,98),(8685,98),(8686,98),(8687,98),(8688,98),(8689,98),(8690,98),(8691,98),(8692,99),(8693,99),(8694,99),(8695,99),(8696,99),(8697,99),(8698,99),(8699,99),(8700,99),(8701,99),(8702,99),(8703,99),(8704,99),(8705,99),(8706,99),(8707,99),(8708,99),(8709,99),(8710,99),(8711,99),(8712,99),(8713,99),(8714,99),(8715,99),(8716,99),(8717,100),(8718,100),(8719,100),(8720,100),(8721,100),(8722,100),(8723,100),(8724,100),(8725,100),(8726,100),(8727,100),(8728,101),(8729,101),(8730,101),(8731,101),(8732,101),(8733,101),(8734,101),(8735,101),(8736,101),(8737,101),(8738,101),(8739,101),(8740,101),(8741,101),(8742,101),(8743,101),(8744,101),(8745,101),(8746,102),(8747,102),(8748,102),(8759,103),(8760,98),(8761,98),(8762,98),(8763,98),(8764,98),(8765,98),(8766,98),(8767,98),(8768,104),(8769,104),(8770,104),(8771,105),(8772,105),(8773,105),(8774,105),(8775,105),(8776,105),(8777,105),(8778,105),(8779,105),(8780,105),(8781,105),(8782,105),(8783,105),(8784,105),(8785,105),(8786,105),(8787,105),(8788,105),(8789,105),(8790,105),(8791,106),(8792,106),(8793,106),(8794,106),(8795,106),(8796,106),(8797,106),(8825,103),(8826,98),(8827,98),(8828,98),(8829,98),(8830,98),(8831,98),(8832,98),(8833,98),(8834,104),(8835,104),(8836,104),(8837,105),(8838,105),(8839,105),(8840,105),(8841,105),(8842,105),(8843,105),(8844,105),(8845,105),(8846,105),(8847,105),(8848,105),(8849,105),(8850,105),(8851,105),(8852,105),(8853,105),(8854,105),(8855,105),(8856,105),(8857,106),(8858,106),(8859,106),(8860,106),(8861,106),(8862,106),(8863,106);
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
  `SVN_ID` int(11) DEFAULT NULL,
  `Performance_ID` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (134,'13.5-Build2.1',1,4,11,1,8),(135,'test',1,4,12,8,NULL),(136,'test',1,4,12,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `svn`
--

LOCK TABLES `svn` WRITE;
/*!40000 ALTER TABLE `svn` DISABLE KEYS */;
INSERT INTO `svn` VALUES (1,1234),(2,4321),(3,12345),(4,1111),(5,2222),(6,54321),(7,54322),(8,12);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'13.5',1),(2,'13.6',2),(3,'13.4.4.1',1),(6,'',2),(9,'1',2),(10,'20.1',1),(11,'20.1',2),(12,'1',1),(13,'13.5',2),(14,'123',2),(15,'f',1);
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

-- Dump completed on 2013-07-02 11:16:22
