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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bug`
--

LOCK TABLES `bug` WRITE;
/*!40000 ALTER TABLE `bug` DISABLE KEYS */;
INSERT INTO `bug` VALUES (91,6371,NULL,99),(92,6373,NULL,100),(93,6374,NULL,101),(94,1111,NULL,102),(98,NULL,NULL,102),(99,112,NULL,104),(100,NULL,NULL,105),(101,NULL,NULL,106);
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `date`
--

LOCK TABLES `date` WRITE;
/*!40000 ALTER TABLE `date` DISABLE KEYS */;
INSERT INTO `date` VALUES (1,'2000-01-01'),(2,'2013-12-31'),(3,'2010-05-20'),(4,'2010-10-10'),(5,'2013-10-10'),(6,'2013-10-13'),(7,'1111-11-11'),(8,'2013-06-19'),(9,'2013-06-20'),(10,'2013-06-25'),(11,'2013-07-02'),(12,'2011-03-03'),(13,'2013-07-03'),(14,'2013-07-04'),(15,'2013-07-16'),(16,'2013-07-11'),(17,'2013-08-23'),(18,'2014-05-20'),(19,'2013-07-10'),(20,'2013-07-17'),(21,'2013-07-13'),(22,'2013-07-06'),(23,'2013-07-08');
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
  `Default_Input_Dir` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Format_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `format`
--

LOCK TABLES `format` WRITE;
/*!40000 ALTER TABLE `format` DISABLE KEYS */;
INSERT INTO `format` VALUES (1,'HTML','D:\\Geoff\\HTMLs'),(2,'PDF','D:\\Geoff\\PDFs'),(3,'TIF','D:\\Geoff\\TIFs'),(4,'AFP','D:\\Geoff\\AFPs'),(5,'MS Office','D:\\Geoff\\Office2007'),(6,'GIF-PNG-DICOM','D:\\Geoff\\GIF-PNG-DICOM'),(7,'RTF','D:\\geoff\\RTFs'),(8,'PCL','D:\\Geoff\\PCLs'),(9,'MSG','D:\\Geoff\\MSGs');
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
) ENGINE=InnoDB AUTO_INCREMENT=11021 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (8653,'rla3a4.afp.1.tif',134,NULL,NULL),(8654,'18571-TEST2-Polish-currency.AFP.1.tif',134,NULL,NULL),(8655,'18571-TEST2-Polish-currency.AFP.2.tif',134,NULL,NULL),(8656,'18571-TEST2-Polish-currency.AFP.3.tif',134,NULL,NULL),(8657,'18571-TEST2-Polish-currency.AFP.4.tif',134,NULL,NULL),(8658,'18960-Letters.AFP.2.tif',134,NULL,NULL),(8659,'18960-Letters.AFP.3.tif',134,NULL,NULL),(8660,'uh220b.afp.1.tif',134,NULL,NULL),(8661,'15687-inversion.afp.2.tif',134,NULL,NULL),(8662,'15687-inversion.afp.3.tif',134,NULL,NULL),(8663,'15687-inversion.afp.4.tif',134,NULL,NULL),(8664,'15687-inversion.afp.5.tif',134,NULL,NULL),(8665,'15687-inversion.afp.6.tif',134,NULL,NULL),(8666,'a.afp.1.tif',134,NULL,NULL),(8667,'a.afp.10.tif',134,NULL,NULL),(8668,'a.afp.11.tif',134,NULL,NULL),(8669,'a.afp.12.tif',134,NULL,NULL),(8670,'a.afp.13.tif',134,NULL,NULL),(8671,'a.afp.14.tif',134,NULL,NULL),(8672,'a.afp.15.tif',134,NULL,NULL),(8673,'a.afp.16.tif',134,NULL,NULL),(8674,'a.afp.17.tif',134,NULL,NULL),(8675,'a.afp.18.tif',134,NULL,NULL),(8676,'a.afp.19.tif',134,NULL,NULL),(8677,'a.afp.2.tif',134,NULL,NULL),(8678,'a.afp.20.tif',134,NULL,NULL),(8679,'a.afp.3.tif',134,NULL,NULL),(8680,'a.afp.4.tif',134,NULL,NULL),(8681,'a.afp.5.tif',134,NULL,NULL),(8682,'a.afp.6.tif',134,NULL,NULL),(8683,'a.afp.7.tif',134,NULL,NULL),(8684,'a.afp.8.tif',134,NULL,NULL),(8685,'a.afp.9.tif',134,NULL,NULL),(8686,'P3.afp.1.tif',134,NULL,NULL),(8687,'P3.afp.10.tif',134,NULL,NULL),(8688,'P3.afp.13.tif',134,NULL,NULL),(8689,'P3.afp.4.tif',134,NULL,NULL),(8690,'P3.afp.5.tif',134,NULL,NULL),(8691,'P3.afp.7.tif',134,NULL,NULL),(8692,'12942-wrong-fonts.afp.1.tif',134,NULL,NULL),(8693,'15005-French-and-box-chars.afp.1.tif',134,NULL,NULL),(8694,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.tif',134,NULL,NULL),(8695,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.tif',134,NULL,NULL),(8696,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.tif',134,NULL,NULL),(8697,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.tif',134,NULL,NULL),(8698,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.tif',134,NULL,NULL),(8699,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.tif',134,NULL,NULL),(8700,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.tif',134,NULL,NULL),(8701,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.tif',134,NULL,NULL),(8702,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.tif',134,NULL,NULL),(8703,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.tif',134,NULL,NULL),(8704,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.tif',134,NULL,NULL),(8705,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.tif',134,NULL,NULL),(8706,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.tif',134,NULL,NULL),(8707,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.tif',134,NULL,NULL),(8708,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.tif',134,NULL,NULL),(8709,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.tif',134,NULL,NULL),(8710,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.tif',134,NULL,NULL),(8711,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.tif',134,NULL,NULL),(8712,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.tif',134,NULL,NULL),(8713,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.tif',134,NULL,NULL),(8714,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.tif',134,NULL,NULL),(8715,'18960-Letters.AFP.1.tif',134,NULL,NULL),(8716,'acifres.afp.1.tif',134,NULL,NULL),(8717,'15774-AFP_input-norwegian.afp.1.tif',134,NULL,NULL),(8718,'15774-AFP_input-norwegian.afp.11.tif',134,NULL,NULL),(8719,'15774-AFP_input-norwegian.afp.13.tif',134,NULL,NULL),(8720,'15774-AFP_input-norwegian.afp.15.tif',134,NULL,NULL),(8721,'15774-AFP_input-norwegian.afp.17.tif',134,NULL,NULL),(8722,'15774-AFP_input-norwegian.afp.19.tif',134,NULL,NULL),(8723,'15774-AFP_input-norwegian.afp.3.tif',134,NULL,NULL),(8724,'15774-AFP_input-norwegian.afp.5.tif',134,NULL,NULL),(8725,'15774-AFP_input-norwegian.afp.7.tif',134,NULL,NULL),(8726,'15774-AFP_input-norwegian.afp.9.tif',134,NULL,NULL),(8727,'UOFATC_VI_MC_AX.afp.3.tif',134,NULL,NULL),(8728,'18811-GOCA-fill.AFP.10.tif',134,NULL,NULL),(8729,'18811-GOCA-fill.AFP.11.tif',134,NULL,NULL),(8730,'18811-GOCA-fill.AFP.12.tif',134,NULL,NULL),(8731,'18811-GOCA-fill.AFP.13.tif',134,NULL,NULL),(8732,'18811-GOCA-fill.AFP.14.tif',134,NULL,NULL),(8733,'18811-GOCA-fill.AFP.15.tif',134,NULL,NULL),(8734,'18811-GOCA-fill.AFP.16.tif',134,NULL,NULL),(8735,'18811-GOCA-fill.AFP.19.tif',134,NULL,NULL),(8736,'18811-GOCA-fill.AFP.20.tif',134,NULL,NULL),(8737,'18811-GOCA-fill.AFP.3.tif',134,NULL,NULL),(8738,'18811-GOCA-fill.AFP.4.tif',134,NULL,NULL),(8739,'18811-GOCA-fill.AFP.5.tif',134,NULL,NULL),(8740,'18811-GOCA-fill.AFP.6.tif',134,NULL,NULL),(8741,'18811-GOCA-fill.AFP.7.tif',134,NULL,NULL),(8742,'18811-GOCA-fill.AFP.8.tif',134,NULL,NULL),(8743,'18811-GOCA-fill.AFP.9.tif',134,NULL,NULL),(8744,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.tif',134,NULL,NULL),(8745,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.tif',134,NULL,NULL),(8746,'17639-testfil.afp.1.tif',134,NULL,NULL),(8747,'621113386-01-18-2005.afp.1.tif',134,NULL,NULL),(8748,'645702207-10-25-2005.afp.1.tif',134,NULL,NULL),(8749,'12501-logo-1.afp.txt',134,NULL,30),(8750,'15005-French-and-box-chars.afp.txt',134,NULL,30),(8751,'15476-AFP-metatags.afp.txt',134,NULL,30),(8752,'17639-testfil.afp.txt',134,NULL,30),(8753,'621113386-01-18-2005.afp.txt',134,NULL,30),(8754,'645702207-10-25-2005.afp.txt',134,NULL,30),(8755,'acifres.afp.txt',134,NULL,30),(8756,'rla3a4.afp.txt',134,NULL,30),(8757,'afa.afp.txt',134,NULL,31),(8758,'17098-GoodDiagram.afp.txt',134,NULL,34),(10399,'TH-WORDwithLogoSig.doc.1.tif',155,NULL,NULL),(10400,'11515-checkboxes.doc.1.tif',155,NULL,NULL),(10401,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.tif',155,NULL,NULL),(10402,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.tif',155,NULL,NULL),(10403,'13801-wingding-bullets.doc.1.tif',155,NULL,NULL),(10404,'13802-font-change-after-field.doc.1.tif',155,NULL,NULL),(10405,'13803-1-appearing-before-date.doc.1.tif',155,NULL,NULL),(10406,'17829-test-drop-downs.XLS.1.tif',155,NULL,NULL),(10407,'17860-crash.xls.1.tif',155,NULL,NULL),(10408,'11083.doc.1.tif',155,NULL,NULL),(10409,'11083.doc.2.tif',155,NULL,NULL),(10410,'11083.doc.3.tif',155,NULL,NULL),(10411,'15197-table-grid-lines.doc.1.tif',155,NULL,NULL),(10412,'15197-table-grid-lines.doc.10.tif',155,NULL,NULL),(10413,'15197-table-grid-lines.doc.11.tif',155,NULL,NULL),(10414,'15197-table-grid-lines.doc.12.tif',155,NULL,NULL),(10415,'15197-table-grid-lines.doc.13.tif',155,NULL,NULL),(10416,'15197-table-grid-lines.doc.14.tif',155,NULL,NULL),(10417,'15197-table-grid-lines.doc.15.tif',155,NULL,NULL),(10418,'15197-table-grid-lines.doc.16.tif',155,NULL,NULL),(10419,'15197-table-grid-lines.doc.17.tif',155,NULL,NULL),(10420,'15197-table-grid-lines.doc.18.tif',155,NULL,NULL),(10421,'15197-table-grid-lines.doc.19.tif',155,NULL,NULL),(10422,'15197-table-grid-lines.doc.2.tif',155,NULL,NULL),(10423,'15197-table-grid-lines.doc.20.tif',155,NULL,NULL),(10424,'15197-table-grid-lines.doc.3.tif',155,NULL,NULL),(10425,'15197-table-grid-lines.doc.4.tif',155,NULL,NULL),(10426,'15197-table-grid-lines.doc.5.tif',155,NULL,NULL),(10427,'15197-table-grid-lines.doc.6.tif',155,NULL,NULL),(10428,'15197-table-grid-lines.doc.7.tif',155,NULL,NULL),(10429,'15197-table-grid-lines.doc.8.tif',155,NULL,NULL),(10430,'15197-table-grid-lines.doc.9.tif',155,NULL,NULL),(10431,'17501-Word 2002-Missing-Logo.DOC.2.tif',155,NULL,NULL),(10432,'17501-Word 2002-Missing-Logo.DOC.3.tif',155,NULL,NULL),(10433,'17501-Word 2002-Missing-Logo.DOC.4.tif',155,NULL,NULL),(10434,'17501-Word 2002-Missing-Logo.DOC.5.tif',155,NULL,NULL),(10435,'17501-Word 2002-Missing-Logo.DOC.6.tif',155,NULL,NULL),(10436,'17501-Word 2002-Missing-Logo.DOC.7.tif',155,NULL,NULL),(10437,'17501-Word 2002-Missing-Logo.DOC.8.tif',155,NULL,NULL),(10438,'18770-090dbba1dafdade6-1.0-1.xls.txt',155,NULL,29),(10439,'18770-jre-1.4-freeze.xls.txt',155,NULL,29),(10440,'12226-Empty_excel.xls.txt',155,NULL,30),(10441,'13270-NPE-BRU IMMS__944__test4.xls.txt',155,NULL,30),(10442,'13270-NPE-BRU IMMS__945__test5.xls.txt',155,NULL,30),(10443,'13270-NPE-BRU IMMS__946__test6.xls.txt',155,NULL,30),(10444,'13270-NPE-BRU IMMS__949__test9.xls.txt',155,NULL,30),(10445,'13270-NPE-BRU IMMS__950__test10.xls.txt',155,NULL,30),(10446,'13270-NPE-BRU IMMS__966__a6.xls.txt',155,NULL,30),(10447,'13270-NPE-BRU IMMS__967__a7.xls.txt',155,NULL,30),(10448,'13270-NPE-BRUSSELS CONVERSION__10830__test for voucher upload xls 3.12.xls.txt',155,NULL,30),(10449,'13270-NPE-MAN MTP INTERNAL INSTRUCTIONS__822__abc.xls.txt',155,NULL,30),(10450,'18974-Example-RasterMaster-Multiple-Sheets.xls.txt',155,NULL,30),(10451,'17420-Compliance Planning by Employee.page-not-found.xls.txt',155,NULL,31),(10452,'15961-twenty-screen-captures.xls.txt',155,NULL,32),(10453,'17724-MostComplexExcel.xls.txt',155,NULL,32),(10454,'17768-Table-and-diagram.xlsm.txt',155,NULL,32),(10455,'17966-Invoice3.xlsx.txt',155,NULL,32),(10456,'14067-password-to-read-equals-qa.xls.txt',155,NULL,33),(10457,'12593-created-by-outlook-AAR.rtf.txt',155,NULL,34),(10458,'~$artest.doc.txt',155,NULL,34),(10459,'17768-Table-and-diagram.xlsm.txt',155,NULL,20),(10460,'17966-Invoice3.xlsx.txt',155,NULL,20),(10461,'Word2007RTFSpec9.rtf.txt',155,NULL,20),(10462,'Word2007RTFSpec9.rtf.txt',155,NULL,21),(10463,'18770-090dbba1dafdade6-1.0-1.xls.0.txt',155,NULL,22),(10464,'18770-jre-1.4-freeze.xls.0.txt',155,NULL,22),(10637,'rla3a4.afp.1.tif',158,NULL,NULL),(10638,'18571-TEST2-Polish-currency.AFP.1.tif',158,NULL,NULL),(10639,'18571-TEST2-Polish-currency.AFP.2.tif',158,NULL,NULL),(10640,'18571-TEST2-Polish-currency.AFP.3.tif',158,NULL,NULL),(10641,'18571-TEST2-Polish-currency.AFP.4.tif',158,NULL,NULL),(10642,'18960-Letters.AFP.2.tif',158,NULL,NULL),(10643,'18960-Letters.AFP.3.tif',158,NULL,NULL),(10644,'uh220b.afp.1.tif',158,NULL,NULL),(10645,'15687-inversion.afp.2.tif',158,NULL,NULL),(10646,'15687-inversion.afp.3.tif',158,NULL,NULL),(10647,'15687-inversion.afp.4.tif',158,NULL,NULL),(10648,'15687-inversion.afp.5.tif',158,NULL,NULL),(10649,'15687-inversion.afp.6.tif',158,NULL,NULL),(10650,'a.afp.1.tif',158,NULL,NULL),(10651,'a.afp.10.tif',158,NULL,NULL),(10652,'a.afp.11.tif',158,NULL,NULL),(10653,'a.afp.12.tif',158,NULL,NULL),(10654,'a.afp.13.tif',158,NULL,NULL),(10655,'a.afp.14.tif',158,NULL,NULL),(10656,'a.afp.15.tif',158,NULL,NULL),(10657,'a.afp.16.tif',158,NULL,NULL),(10658,'a.afp.17.tif',158,NULL,NULL),(10659,'a.afp.18.tif',158,NULL,NULL),(10660,'a.afp.19.tif',158,NULL,NULL),(10661,'a.afp.2.tif',158,NULL,NULL),(10662,'a.afp.20.tif',158,NULL,NULL),(10663,'a.afp.3.tif',158,NULL,NULL),(10664,'a.afp.4.tif',158,NULL,NULL),(10665,'a.afp.5.tif',158,NULL,NULL),(10666,'a.afp.6.tif',158,NULL,NULL),(10667,'a.afp.7.tif',158,NULL,NULL),(10668,'a.afp.8.tif',158,NULL,NULL),(10669,'a.afp.9.tif',158,NULL,NULL),(10670,'P3.afp.1.tif',158,NULL,NULL),(10671,'P3.afp.10.tif',158,NULL,NULL),(10672,'P3.afp.13.tif',158,NULL,NULL),(10673,'P3.afp.4.tif',158,NULL,NULL),(10674,'P3.afp.5.tif',158,NULL,NULL),(10675,'P3.afp.7.tif',158,NULL,NULL),(10676,'12942-wrong-fonts.afp.1.tif',158,NULL,NULL),(10677,'15005-French-and-box-chars.afp.1.tif',158,NULL,NULL),(10678,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.tif',158,NULL,NULL),(10679,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.tif',158,NULL,NULL),(10680,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.tif',158,NULL,NULL),(10681,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.tif',158,NULL,NULL),(10682,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.tif',158,NULL,NULL),(10683,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.tif',158,NULL,NULL),(10684,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.tif',158,NULL,NULL),(10685,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.tif',158,NULL,NULL),(10686,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.tif',158,NULL,NULL),(10687,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.tif',158,NULL,NULL),(10688,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.tif',158,NULL,NULL),(10689,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.tif',158,NULL,NULL),(10690,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.tif',158,NULL,NULL),(10691,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.tif',158,NULL,NULL),(10692,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.tif',158,NULL,NULL),(10693,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.tif',158,NULL,NULL),(10694,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.tif',158,NULL,NULL),(10695,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.tif',158,NULL,NULL),(10696,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.tif',158,NULL,NULL),(10697,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.tif',158,NULL,NULL),(10698,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.tif',158,NULL,NULL),(10699,'18960-Letters.AFP.1.tif',158,NULL,NULL),(10700,'acifres.afp.1.tif',158,NULL,NULL),(10701,'15774-AFP_input-norwegian.afp.1.tif',158,NULL,NULL),(10702,'15774-AFP_input-norwegian.afp.11.tif',158,NULL,NULL),(10703,'15774-AFP_input-norwegian.afp.13.tif',158,NULL,NULL),(10704,'15774-AFP_input-norwegian.afp.15.tif',158,NULL,NULL),(10705,'15774-AFP_input-norwegian.afp.17.tif',158,NULL,NULL),(10706,'15774-AFP_input-norwegian.afp.19.tif',158,NULL,NULL),(10707,'15774-AFP_input-norwegian.afp.3.tif',158,NULL,NULL),(10708,'15774-AFP_input-norwegian.afp.5.tif',158,NULL,NULL),(10709,'15774-AFP_input-norwegian.afp.7.tif',158,NULL,NULL),(10710,'15774-AFP_input-norwegian.afp.9.tif',158,NULL,NULL),(10711,'UOFATC_VI_MC_AX.afp.3.tif',158,NULL,NULL),(10712,'18811-GOCA-fill.AFP.10.tif',158,NULL,NULL),(10713,'18811-GOCA-fill.AFP.11.tif',158,NULL,NULL),(10714,'18811-GOCA-fill.AFP.12.tif',158,NULL,NULL),(10715,'18811-GOCA-fill.AFP.13.tif',158,NULL,NULL),(10716,'18811-GOCA-fill.AFP.14.tif',158,NULL,NULL),(10717,'18811-GOCA-fill.AFP.15.tif',158,NULL,NULL),(10718,'18811-GOCA-fill.AFP.16.tif',158,NULL,NULL),(10719,'18811-GOCA-fill.AFP.19.tif',158,NULL,NULL),(10720,'18811-GOCA-fill.AFP.20.tif',158,NULL,NULL),(10721,'18811-GOCA-fill.AFP.3.tif',158,NULL,NULL),(10722,'18811-GOCA-fill.AFP.4.tif',158,NULL,NULL),(10723,'18811-GOCA-fill.AFP.5.tif',158,NULL,NULL),(10724,'18811-GOCA-fill.AFP.6.tif',158,NULL,NULL),(10725,'18811-GOCA-fill.AFP.7.tif',158,NULL,NULL),(10726,'18811-GOCA-fill.AFP.8.tif',158,NULL,NULL),(10727,'18811-GOCA-fill.AFP.9.tif',158,NULL,NULL),(10728,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.tif',158,NULL,NULL),(10729,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.tif',158,NULL,NULL),(10730,'17639-testfil.afp.1.tif',158,NULL,NULL),(10731,'621113386-01-18-2005.afp.1.tif',158,NULL,NULL),(10732,'645702207-10-25-2005.afp.1.tif',158,NULL,NULL),(10733,'12501-logo-1.afp.txt',158,NULL,30),(10734,'15005-French-and-box-chars.afp.txt',158,NULL,30),(10735,'15476-AFP-metatags.afp.txt',158,NULL,30),(10736,'17639-testfil.afp.txt',158,NULL,30),(10737,'621113386-01-18-2005.afp.txt',158,NULL,30),(10738,'645702207-10-25-2005.afp.txt',158,NULL,30),(10739,'acifres.afp.txt',158,NULL,30),(10740,'rla3a4.afp.txt',158,NULL,30),(10741,'afa.afp.txt',158,NULL,31),(10742,'17098-GoodDiagram.afp.txt',158,NULL,34),(10743,'TH-WORDwithLogoSig.doc.1.tif',159,NULL,NULL),(10744,'11515-checkboxes.doc.1.tif',159,NULL,NULL),(10745,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.1.tif',159,NULL,NULL),(10746,'13067-L_01_F_60930_EXTCOR_MORRIP5_U.doc.2.tif',159,NULL,NULL),(10747,'13801-wingding-bullets.doc.1.tif',159,NULL,NULL),(10748,'13802-font-change-after-field.doc.1.tif',159,NULL,NULL),(10749,'13803-1-appearing-before-date.doc.1.tif',159,NULL,NULL),(10750,'17829-test-drop-downs.XLS.1.tif',159,NULL,NULL),(10751,'17860-crash.xls.1.tif',159,NULL,NULL),(10752,'11083.doc.1.tif',159,NULL,NULL),(10753,'11083.doc.2.tif',159,NULL,NULL),(10754,'11083.doc.3.tif',159,NULL,NULL),(10755,'15197-table-grid-lines.doc.1.tif',159,NULL,NULL),(10756,'15197-table-grid-lines.doc.10.tif',159,NULL,NULL),(10757,'15197-table-grid-lines.doc.11.tif',159,NULL,NULL),(10758,'15197-table-grid-lines.doc.12.tif',159,NULL,NULL),(10759,'15197-table-grid-lines.doc.13.tif',159,NULL,NULL),(10760,'15197-table-grid-lines.doc.14.tif',159,NULL,NULL),(10761,'15197-table-grid-lines.doc.15.tif',159,NULL,NULL),(10762,'15197-table-grid-lines.doc.16.tif',159,NULL,NULL),(10763,'15197-table-grid-lines.doc.17.tif',159,NULL,NULL),(10764,'15197-table-grid-lines.doc.18.tif',159,NULL,NULL),(10765,'15197-table-grid-lines.doc.19.tif',159,NULL,NULL),(10766,'15197-table-grid-lines.doc.2.tif',159,NULL,NULL),(10767,'15197-table-grid-lines.doc.20.tif',159,NULL,NULL),(10768,'15197-table-grid-lines.doc.3.tif',159,NULL,NULL),(10769,'15197-table-grid-lines.doc.4.tif',159,NULL,NULL),(10770,'15197-table-grid-lines.doc.5.tif',159,NULL,NULL),(10771,'15197-table-grid-lines.doc.6.tif',159,NULL,NULL),(10772,'15197-table-grid-lines.doc.7.tif',159,NULL,NULL),(10773,'15197-table-grid-lines.doc.8.tif',159,NULL,NULL),(10774,'15197-table-grid-lines.doc.9.tif',159,NULL,NULL),(10775,'17501-Word 2002-Missing-Logo.DOC.2.tif',159,NULL,NULL),(10776,'17501-Word 2002-Missing-Logo.DOC.3.tif',159,NULL,NULL),(10777,'17501-Word 2002-Missing-Logo.DOC.4.tif',159,NULL,NULL),(10778,'17501-Word 2002-Missing-Logo.DOC.5.tif',159,NULL,NULL),(10779,'17501-Word 2002-Missing-Logo.DOC.6.tif',159,NULL,NULL),(10780,'17501-Word 2002-Missing-Logo.DOC.7.tif',159,NULL,NULL),(10781,'17501-Word 2002-Missing-Logo.DOC.8.tif',159,NULL,NULL),(10782,'18770-090dbba1dafdade6-1.0-1.xls.txt',159,NULL,29),(10783,'18770-jre-1.4-freeze.xls.txt',159,NULL,29),(10784,'12226-Empty_excel.xls.txt',159,NULL,30),(10785,'13270-NPE-BRU IMMS__944__test4.xls.txt',159,NULL,30),(10786,'13270-NPE-BRU IMMS__945__test5.xls.txt',159,NULL,30),(10787,'13270-NPE-BRU IMMS__946__test6.xls.txt',159,NULL,30),(10788,'13270-NPE-BRU IMMS__949__test9.xls.txt',159,NULL,30),(10789,'13270-NPE-BRU IMMS__950__test10.xls.txt',159,NULL,30),(10790,'13270-NPE-BRU IMMS__966__a6.xls.txt',159,NULL,30),(10791,'13270-NPE-BRU IMMS__967__a7.xls.txt',159,NULL,30),(10792,'13270-NPE-BRUSSELS CONVERSION__10830__test for voucher upload xls 3.12.xls.txt',159,NULL,30),(10793,'13270-NPE-MAN MTP INTERNAL INSTRUCTIONS__822__abc.xls.txt',159,NULL,30),(10794,'18974-Example-RasterMaster-Multiple-Sheets.xls.txt',159,NULL,30),(10795,'17420-Compliance Planning by Employee.page-not-found.xls.txt',159,NULL,31),(10796,'15961-twenty-screen-captures.xls.txt',159,NULL,32),(10797,'17724-MostComplexExcel.xls.txt',159,NULL,32),(10798,'17768-Table-and-diagram.xlsm.txt',159,NULL,32),(10799,'17966-Invoice3.xlsx.txt',159,NULL,32),(10800,'14067-password-to-read-equals-qa.xls.txt',159,NULL,33),(10801,'12593-created-by-outlook-AAR.rtf.txt',159,NULL,34),(10802,'~$artest.doc.txt',159,NULL,34),(10803,'17768-Table-and-diagram.xlsm.txt',159,NULL,20),(10804,'17966-Invoice3.xlsx.txt',159,NULL,20),(10805,'Word2007RTFSpec9.rtf.txt',159,NULL,20),(10806,'Word2007RTFSpec9.rtf.txt',159,NULL,21),(10807,'18770-090dbba1dafdade6-1.0-1.xls.0.txt',159,NULL,22),(10808,'18770-jre-1.4-freeze.xls.0.txt',159,NULL,22),(10915,'rla3a4.afp.1.tif',161,NULL,NULL),(10916,'18571-TEST2-Polish-currency.AFP.1.tif',161,NULL,NULL),(10917,'18571-TEST2-Polish-currency.AFP.2.tif',161,NULL,NULL),(10918,'18571-TEST2-Polish-currency.AFP.3.tif',161,NULL,NULL),(10919,'18571-TEST2-Polish-currency.AFP.4.tif',161,NULL,NULL),(10920,'18960-Letters.AFP.2.tif',161,NULL,NULL),(10921,'18960-Letters.AFP.3.tif',161,NULL,NULL),(10922,'uh220b.afp.1.tif',161,NULL,NULL),(10923,'15687-inversion.afp.2.tif',161,NULL,NULL),(10924,'15687-inversion.afp.3.tif',161,NULL,NULL),(10925,'15687-inversion.afp.4.tif',161,NULL,NULL),(10926,'15687-inversion.afp.5.tif',161,NULL,NULL),(10927,'15687-inversion.afp.6.tif',161,NULL,NULL),(10928,'a.afp.1.tif',161,NULL,NULL),(10929,'a.afp.10.tif',161,NULL,NULL),(10930,'a.afp.11.tif',161,NULL,NULL),(10931,'a.afp.12.tif',161,NULL,NULL),(10932,'a.afp.13.tif',161,NULL,NULL),(10933,'a.afp.14.tif',161,NULL,NULL),(10934,'a.afp.15.tif',161,NULL,NULL),(10935,'a.afp.16.tif',161,NULL,NULL),(10936,'a.afp.17.tif',161,NULL,NULL),(10937,'a.afp.18.tif',161,NULL,NULL),(10938,'a.afp.19.tif',161,NULL,NULL),(10939,'a.afp.2.tif',161,NULL,NULL),(10940,'a.afp.20.tif',161,NULL,NULL),(10941,'a.afp.3.tif',161,NULL,NULL),(10942,'a.afp.4.tif',161,NULL,NULL),(10943,'a.afp.5.tif',161,NULL,NULL),(10944,'a.afp.6.tif',161,NULL,NULL),(10945,'a.afp.7.tif',161,NULL,NULL),(10946,'a.afp.8.tif',161,NULL,NULL),(10947,'a.afp.9.tif',161,NULL,NULL),(10948,'P3.afp.1.tif',161,NULL,NULL),(10949,'P3.afp.10.tif',161,NULL,NULL),(10950,'P3.afp.13.tif',161,NULL,NULL),(10951,'P3.afp.4.tif',161,NULL,NULL),(10952,'P3.afp.5.tif',161,NULL,NULL),(10953,'P3.afp.7.tif',161,NULL,NULL),(10954,'12942-wrong-fonts.afp.1.tif',161,NULL,NULL),(10955,'15005-French-and-box-chars.afp.1.tif',161,NULL,NULL),(10956,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.13.tif',161,NULL,NULL),(10957,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.14.tif',161,NULL,NULL),(10958,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.17.tif',161,NULL,NULL),(10959,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.18.tif',161,NULL,NULL),(10960,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.3.tif',161,NULL,NULL),(10961,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.7.tif',161,NULL,NULL),(10962,'18690-TS2collect_helix01172013.PTn060.COLD_LOAD_FILE.AFP.9.tif',161,NULL,NULL),(10963,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.1.tif',161,NULL,NULL),(10964,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.11.tif',161,NULL,NULL),(10965,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.3.tif',161,NULL,NULL),(10966,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.5.tif',161,NULL,NULL),(10967,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.7.tif',161,NULL,NULL),(10968,'18690-TS2collect_helix102052013.PTi397.COLD_LOAD_FILE.AFP.9.tif',161,NULL,NULL),(10969,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.1.tif',161,NULL,NULL),(10970,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.11.tif',161,NULL,NULL),(10971,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.13.tif',161,NULL,NULL),(10972,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.3.tif',161,NULL,NULL),(10973,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.5.tif',161,NULL,NULL),(10974,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.7.tif',161,NULL,NULL),(10975,'18812-fr-TS2collect_helix03232013.PTi397.COLD_LOAD_FILE.AFP.9.tif',161,NULL,NULL),(10976,'18812-Sp-TS2collect_helix03262013.PTi397.COLD_LOAD_FILE.AFP.1.tif',161,NULL,NULL),(10977,'18960-Letters.AFP.1.tif',161,NULL,NULL),(10978,'acifres.afp.1.tif',161,NULL,NULL),(10979,'15774-AFP_input-norwegian.afp.1.tif',161,NULL,NULL),(10980,'15774-AFP_input-norwegian.afp.11.tif',161,NULL,NULL),(10981,'15774-AFP_input-norwegian.afp.13.tif',161,NULL,NULL),(10982,'15774-AFP_input-norwegian.afp.15.tif',161,NULL,NULL),(10983,'15774-AFP_input-norwegian.afp.17.tif',161,NULL,NULL),(10984,'15774-AFP_input-norwegian.afp.19.tif',161,NULL,NULL),(10985,'15774-AFP_input-norwegian.afp.3.tif',161,NULL,NULL),(10986,'15774-AFP_input-norwegian.afp.5.tif',161,NULL,NULL),(10987,'15774-AFP_input-norwegian.afp.7.tif',161,NULL,NULL),(10988,'15774-AFP_input-norwegian.afp.9.tif',161,NULL,NULL),(10989,'UOFATC_VI_MC_AX.afp.3.tif',161,NULL,NULL),(10990,'18811-GOCA-fill.AFP.10.tif',161,NULL,NULL),(10991,'18811-GOCA-fill.AFP.11.tif',161,NULL,NULL),(10992,'18811-GOCA-fill.AFP.12.tif',161,NULL,NULL),(10993,'18811-GOCA-fill.AFP.13.tif',161,NULL,NULL),(10994,'18811-GOCA-fill.AFP.14.tif',161,NULL,NULL),(10995,'18811-GOCA-fill.AFP.15.tif',161,NULL,NULL),(10996,'18811-GOCA-fill.AFP.16.tif',161,NULL,NULL),(10997,'18811-GOCA-fill.AFP.19.tif',161,NULL,NULL),(10998,'18811-GOCA-fill.AFP.20.tif',161,NULL,NULL),(10999,'18811-GOCA-fill.AFP.3.tif',161,NULL,NULL),(11000,'18811-GOCA-fill.AFP.4.tif',161,NULL,NULL),(11001,'18811-GOCA-fill.AFP.5.tif',161,NULL,NULL),(11002,'18811-GOCA-fill.AFP.6.tif',161,NULL,NULL),(11003,'18811-GOCA-fill.AFP.7.tif',161,NULL,NULL),(11004,'18811-GOCA-fill.AFP.8.tif',161,NULL,NULL),(11005,'18811-GOCA-fill.AFP.9.tif',161,NULL,NULL),(11006,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.2.tif',161,NULL,NULL),(11007,'18812-fr-fdr.stmtafp_od.cyc.28.032013.72.COLD_LOAD_FILE.AFP.6.tif',161,NULL,NULL),(11008,'17639-testfil.afp.1.tif',161,NULL,NULL),(11009,'621113386-01-18-2005.afp.1.tif',161,NULL,NULL),(11010,'645702207-10-25-2005.afp.1.tif',161,NULL,NULL),(11011,'12501-logo-1.afp.txt',161,NULL,30),(11012,'15005-French-and-box-chars.afp.txt',161,NULL,30),(11013,'15476-AFP-metatags.afp.txt',161,NULL,30),(11014,'17639-testfil.afp.txt',161,NULL,30),(11015,'621113386-01-18-2005.afp.txt',161,NULL,30),(11016,'645702207-10-25-2005.afp.txt',161,NULL,30),(11017,'acifres.afp.txt',161,NULL,30),(11018,'rla3a4.afp.txt',161,NULL,30),(11019,'afa.afp.txt',161,NULL,31),(11020,'17098-GoodDiagram.afp.txt',161,NULL,34);
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
INSERT INTO `pagetobug` VALUES (8660,92),(8692,91),(8693,91),(8694,91),(8695,91),(8696,91),(8697,91),(8698,91),(8699,91),(8700,91),(8701,91),(8702,91),(8703,91),(8704,91),(8705,91),(8706,91),(8707,91),(8708,91),(8709,91),(8710,91),(8711,91),(8712,91),(8713,91),(8714,91),(8715,91),(8716,91),(8717,92),(8718,92),(8719,92),(8720,92),(8721,92),(8722,92),(8723,92),(8724,92),(8725,92),(8726,92),(8727,92),(8728,93),(8729,93),(8730,93),(8731,93),(8732,93),(8733,93),(8734,93),(8735,93),(8736,93),(8737,93),(8738,93),(8739,93),(8740,93),(8741,93),(8742,93),(8743,93),(8744,93),(8745,93),(8746,94),(8747,94),(8748,94),(10408,99),(10409,99),(10410,99),(10411,100),(10412,100),(10413,100),(10414,100),(10415,100),(10416,100),(10417,100),(10418,100),(10419,100),(10420,100),(10421,100),(10422,100),(10423,100),(10424,100),(10425,100),(10426,100),(10427,100),(10428,100),(10429,100),(10430,100),(10431,101),(10432,101),(10433,101),(10434,101),(10435,101),(10436,101),(10437,101),(10644,92),(10676,91),(10677,91),(10678,91),(10679,91),(10680,91),(10681,91),(10682,91),(10683,91),(10684,91),(10685,91),(10686,91),(10687,91),(10688,91),(10689,91),(10690,91),(10691,91),(10692,91),(10693,91),(10694,91),(10695,91),(10696,91),(10697,91),(10698,91),(10699,91),(10700,91),(10701,92),(10702,92),(10703,92),(10704,92),(10705,92),(10706,92),(10707,92),(10708,92),(10709,92),(10710,92),(10711,92),(10712,93),(10713,93),(10714,93),(10715,93),(10716,93),(10717,93),(10718,93),(10719,93),(10720,93),(10721,93),(10722,93),(10723,93),(10724,93),(10725,93),(10726,93),(10727,93),(10728,93),(10729,93),(10730,98),(10731,98),(10732,98),(10752,99),(10753,99),(10754,99),(10755,100),(10756,100),(10757,100),(10758,100),(10759,100),(10760,100),(10761,100),(10762,100),(10763,100),(10764,100),(10765,100),(10766,100),(10767,100),(10768,100),(10769,100),(10770,100),(10771,100),(10772,100),(10773,100),(10774,100),(10775,101),(10776,101),(10777,101),(10778,101),(10779,101),(10780,101),(10781,101),(10922,92),(10954,91),(10955,91),(10956,91),(10957,91),(10958,91),(10959,91),(10960,91),(10961,91),(10962,91),(10963,91),(10964,91),(10965,91),(10966,91),(10967,91),(10968,91),(10969,91),(10970,91),(10971,91),(10972,91),(10973,91),(10974,91),(10975,91),(10976,91),(10977,91),(10978,91),(10979,92),(10980,92),(10981,92),(10982,92),(10983,92),(10984,92),(10985,92),(10986,92),(10987,92),(10988,92),(10989,92),(10990,93),(10991,93),(10992,93),(10993,93),(10994,93),(10995,93),(10996,93),(10997,93),(10998,93),(10999,93),(11000,93),(11001,93),(11002,93),(11003,93),(11004,93),(11005,93),(11006,93),(11007,93),(11008,98),(11009,98),(11010,98);
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
INSERT INTO `pagetodifference` VALUES (8653,96),(8654,97),(8655,97),(8656,97),(8657,97),(8658,97),(8659,97),(8660,97),(8660,100),(8661,98),(8662,98),(8663,98),(8664,98),(8665,98),(8666,98),(8667,98),(8668,98),(8669,98),(8670,98),(8671,98),(8672,98),(8673,98),(8674,98),(8675,98),(8676,98),(8677,98),(8678,98),(8679,98),(8680,98),(8681,98),(8682,98),(8683,98),(8684,98),(8685,98),(8686,98),(8687,98),(8688,98),(8689,98),(8690,98),(8691,98),(8692,99),(8693,99),(8694,99),(8695,99),(8696,99),(8697,99),(8698,99),(8699,99),(8700,99),(8701,99),(8702,99),(8703,99),(8704,99),(8705,99),(8706,99),(8707,99),(8708,99),(8709,99),(8710,99),(8711,99),(8712,99),(8713,99),(8714,99),(8715,99),(8716,99),(8717,100),(8718,100),(8719,100),(8720,100),(8721,100),(8722,100),(8723,100),(8724,100),(8725,100),(8726,100),(8727,100),(8728,101),(8729,101),(8730,101),(8731,101),(8732,101),(8733,101),(8734,101),(8735,101),(8736,101),(8737,101),(8738,101),(8739,101),(8740,101),(8741,101),(8742,101),(8743,101),(8744,101),(8745,101),(8746,102),(8747,102),(8748,102),(10399,103),(10400,98),(10401,98),(10402,98),(10403,98),(10404,98),(10405,98),(10406,98),(10407,98),(10408,104),(10409,104),(10410,104),(10411,105),(10412,105),(10413,105),(10414,105),(10415,105),(10416,105),(10417,105),(10418,105),(10419,105),(10420,105),(10421,105),(10422,105),(10423,105),(10424,105),(10425,105),(10426,105),(10427,105),(10428,105),(10429,105),(10430,105),(10431,106),(10432,106),(10433,106),(10434,106),(10435,106),(10436,106),(10437,106),(10637,96),(10638,97),(10639,97),(10640,97),(10641,97),(10642,97),(10643,97),(10644,97),(10644,100),(10645,98),(10646,98),(10647,98),(10648,98),(10649,98),(10650,98),(10651,98),(10652,98),(10653,98),(10654,98),(10655,98),(10656,98),(10657,98),(10658,98),(10659,98),(10660,98),(10661,98),(10662,98),(10663,98),(10664,98),(10665,98),(10666,98),(10667,98),(10668,98),(10669,98),(10670,98),(10671,98),(10672,98),(10673,98),(10674,98),(10675,98),(10676,99),(10677,99),(10678,99),(10679,99),(10680,99),(10681,99),(10682,99),(10683,99),(10684,99),(10685,99),(10686,99),(10687,99),(10688,99),(10689,99),(10690,99),(10691,99),(10692,99),(10693,99),(10694,99),(10695,99),(10696,99),(10697,99),(10698,99),(10699,99),(10700,99),(10701,100),(10702,100),(10703,100),(10704,100),(10705,100),(10706,100),(10707,100),(10708,100),(10709,100),(10710,100),(10711,100),(10712,101),(10713,101),(10714,101),(10715,101),(10716,101),(10717,101),(10718,101),(10719,101),(10720,101),(10721,101),(10722,101),(10723,101),(10724,101),(10725,101),(10726,101),(10727,101),(10728,101),(10729,101),(10730,102),(10731,102),(10732,102),(10743,103),(10744,98),(10745,98),(10746,98),(10747,98),(10748,98),(10749,98),(10750,98),(10751,98),(10752,104),(10753,104),(10754,104),(10755,105),(10756,105),(10757,105),(10758,105),(10759,105),(10760,105),(10761,105),(10762,105),(10763,105),(10764,105),(10765,105),(10766,105),(10767,105),(10768,105),(10769,105),(10770,105),(10771,105),(10772,105),(10773,105),(10774,105),(10775,106),(10776,106),(10777,106),(10778,106),(10779,106),(10780,106),(10781,106),(10915,96),(10916,97),(10917,97),(10918,97),(10919,97),(10920,97),(10921,97),(10922,97),(10922,100),(10923,98),(10924,98),(10925,98),(10926,98),(10927,98),(10928,98),(10929,98),(10930,98),(10931,98),(10932,98),(10933,98),(10934,98),(10935,98),(10936,98),(10937,98),(10938,98),(10939,98),(10940,98),(10941,98),(10942,98),(10943,98),(10944,98),(10945,98),(10946,98),(10947,98),(10948,98),(10949,98),(10950,98),(10951,98),(10952,98),(10953,98),(10954,99),(10955,99),(10956,99),(10957,99),(10958,99),(10959,99),(10960,99),(10961,99),(10962,99),(10963,99),(10964,99),(10965,99),(10966,99),(10967,99),(10968,99),(10969,99),(10970,99),(10971,99),(10972,99),(10973,99),(10974,99),(10975,99),(10976,99),(10977,99),(10978,99),(10979,100),(10980,100),(10981,100),(10982,100),(10983,100),(10984,100),(10985,100),(10986,100),(10987,100),(10988,100),(10989,100),(10990,101),(10991,101),(10992,101),(10993,101),(10994,101),(10995,101),(10996,101),(10997,101),(10998,101),(10999,101),(11000,101),(11001,101),(11002,101),(11003,101),(11004,101),(11005,101),(11006,101),(11007,101),(11008,102),(11009,102),(11010,102);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (1,'Java'),(2,'Native'),(3,'Unknown Platform');
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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `run`
--

LOCK TABLES `run` WRITE;
/*!40000 ALTER TABLE `run` DISABLE KEYS */;
INSERT INTO `run` VALUES (134,'13.5-Build2.1',1,4,11,1,8),(155,'test',23,2,19,NULL,NULL),(158,'13.5-Build2.1123',25,6,22,NULL,NULL),(159,'test',26,4,23,NULL,NULL),(161,'13.5-Build2.1',21,6,19,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version`
--

LOCK TABLES `version` WRITE;
/*!40000 ALTER TABLE `version` DISABLE KEYS */;
INSERT INTO `version` VALUES (1,'13.5',1),(2,'13.6',2),(3,'13.4.4.1',1),(21,'3',1),(22,'1',1),(23,'6.7b3',1),(24,'',1),(25,'12',1),(26,'13.5Build2',1),(27,'22',1);
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

-- Dump completed on 2013-07-10  9:52:28
