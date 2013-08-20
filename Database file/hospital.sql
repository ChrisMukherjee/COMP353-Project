CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.6.12-enterprise-commercial-advanced

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
-- Table structure for table `administrators`
--

DROP TABLE IF EXISTS `administrators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administrators` (
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `fk_Admistrators_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrators`
--

LOCK TABLES `administrators` WRITE;
/*!40000 ALTER TABLE `administrators` DISABLE KEYS */;
INSERT INTO `administrators` VALUES (1),(2),(6),(7),(11),(12);
/*!40000 ALTER TABLE `administrators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `allstaff`
--

DROP TABLE IF EXISTS `allstaff`;
/*!50001 DROP VIEW IF EXISTS `allstaff`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `allstaff` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_Director_staff1_idx` (`staffID`),
  CONSTRAINT `fk_Director_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
INSERT INTO `director` VALUES (5),(10),(30);
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctor` (
  `staffID` int(11) NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `visits` int(11) NOT NULL DEFAULT '0',
  `operations` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`),
  KEY `fk_Doctor_Staff1_idx` (`staffID`),
  CONSTRAINT `fk_Doctor_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (4,'Dentist',2,5),(9,'Cardiologists',7,6),(15,'Dermatologist',3,2),(16,'Neurologists',2,4),(18,'Radiologists',6,8),(22,'Pediatrics',2,3),(23,'Physicians',8,7),(24,'Venereologists‎',4,4),(27,'Surgeon',6,6),(28,'Surgeon',8,4),(29,'Surgeon',9,2);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facility` (
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  `directorID` int(11) DEFAULT NULL,
  `seniorAdminID1` int(11) DEFAULT NULL,
  `seniorAdminID2` int(11) DEFAULT NULL,
  PRIMARY KEY (`unitName`),
  KEY `fk_Facility_Director1_idx` (`directorID`),
  KEY `fk_Facility_Admistrators1_idx` (`seniorAdminID1`),
  KEY `fk_Facility_Admistrators2_idx` (`seniorAdminID2`),
  CONSTRAINT `fk_Facility_Admistrators1` FOREIGN KEY (`seniorAdminID1`) REFERENCES `administrators` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facility_Admistrators2` FOREIGN KEY (`seniorAdminID2`) REFERENCES `administrators` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facility_Director` FOREIGN KEY (`directorID`) REFERENCES `director` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES ('Palliative',30,1,2),('Childrens',5,6,7),('Surgical',10,11,12);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interns`
--

DROP TABLE IF EXISTS `interns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interns` (
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_Interns_Doctor1_idx` (`staffID`),
  CONSTRAINT `fk_Interns_Doctor` FOREIGN KEY (`staffID`) REFERENCES `doctor` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interns`
--

LOCK TABLES `interns` WRITE;
/*!40000 ALTER TABLE `interns` DISABLE KEYS */;
INSERT INTO `interns` VALUES (4);
/*!40000 ALTER TABLE `interns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurses`
--

DROP TABLE IF EXISTS `nurses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nurses` (
  `staffID` int(11) NOT NULL,
  `isShiftSupervisor` tinyint(1) NOT NULL DEFAULT '0',
  `overtimeHours` int(11) DEFAULT NULL,
  `parttimeHours` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `fk_Nurses_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurses`
--

LOCK TABLES `nurses` WRITE;
/*!40000 ALTER TABLE `nurses` DISABLE KEYS */;
INSERT INTO `nurses` VALUES (17,0,0,0),(19,1,0,0),(20,0,0,0),(21,0,0,0),(25,0,0,0),(26,1,0,0);
/*!40000 ALTER TABLE `nurses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nutritional`
--

DROP TABLE IF EXISTS `nutritional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nutritional` (
  `supplyID` int(11) NOT NULL,
  `purchaseDate` date NOT NULL,
  PRIMARY KEY (`supplyID`),
  CONSTRAINT `fk_Nutritional_Supplies1` FOREIGN KEY (`supplyID`) REFERENCES `supplies` (`supplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nutritional`
--

LOCK TABLES `nutritional` WRITE;
/*!40000 ALTER TABLE `nutritional` DISABLE KEYS */;
INSERT INTO `nutritional` VALUES (13,'2013-08-19'),(14,'2013-08-19'),(15,'2013-08-19'),(16,'2013-08-19'),(17,'2013-08-19'),(18,'2013-08-19');
/*!40000 ALTER TABLE `nutritional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patients` (
  `patientID` int(11) NOT NULL AUTO_INCREMENT,
  `patientName` varchar(45) NOT NULL,
  `medicareCard` int(11) NOT NULL,
  `medicationsTreatmentsEtc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `idPatients_UNIQUE` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Arletta',892187382,'In a coma'),(2,'Bertie',891673820,'Is too flexible'),(3,'Irene',891871763,'Is a hurricane'),(4,'Stephani',651265283,'Broken skull'),(5,'Peter',934087262,'Thinks hes peterpan'),(6,'Verda',891227634,'Loves nutella'),(7,'Tuan',435820234,'Is weird'),(8,'Sheron',27362784,'Sees in binary'),(9,'Zora',718394628,'Missing butt cheek'),(10,'Jessie',554283491,'Errectile disfunction');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residents`
--

DROP TABLE IF EXISTS `residents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `residents` (
  `staffID` int(11) NOT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_Residents_Doctor1_idx` (`staffID`),
  CONSTRAINT `fk_Residents_Doctor` FOREIGN KEY (`staffID`) REFERENCES `doctor` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residents`
--

LOCK TABLES `residents` WRITE;
/*!40000 ALTER TABLE `residents` DISABLE KEYS */;
INSERT INTO `residents` VALUES (9),(15),(16),(22),(28);
/*!40000 ALTER TABLE `residents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduledservices`
--

DROP TABLE IF EXISTS `scheduledservices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduledservices` (
  `staffID` int(11) NOT NULL,
  `assistantID` int(11) DEFAULT NULL,
  `serviceID` int(11) NOT NULL,
  `patientsID` int(11) NOT NULL,
  `date` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `roomNumber` varchar(15) NOT NULL,
  KEY `fk_Schedule_Staff1_idx` (`staffID`),
  KEY `fk_Schedule_Services1_idx` (`serviceID`),
  KEY `fk_Schedule_Patients1_idx` (`patientsID`),
  KEY `fk_ScheduledServices_Staff1_idx` (`assistantID`),
  CONSTRAINT `fk_ScheduledServices_Staff1` FOREIGN KEY (`assistantID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Patients` FOREIGN KEY (`patientsID`) REFERENCES `patients` (`patientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Services` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledservices`
--

LOCK TABLES `scheduledservices` WRITE;
/*!40000 ALTER TABLE `scheduledservices` DISABLE KEYS */;
INSERT INTO `scheduledservices` VALUES (1,2,3,4,'2013-08-08','06:00:00','07:00:00','12'),(3,4,1,1,'2013-08-19','06:00:00','07:00:00','12'),(1,4,1,1,'2013-08-19','06:00:00','07:00:00','12'),(5,9,4,3,'2013-08-20','07:00:00','08:00:00','4'),(7,9,4,3,'2013-08-20','08:00:00','09:00:00','3'),(8,9,4,2,'2013-08-20','08:00:00','09:00:00','4'),(18,15,5,8,'2013-08-20','08:00:00','09:00:00','4'),(27,22,5,9,'2013-08-20','08:00:00','09:00:00','7'),(29,22,5,9,'2013-08-23','08:00:00','09:00:00','2'),(24,16,6,9,'2013-08-23','08:00:00','09:00:00','8'),(24,16,2,9,'2013-08-23','08:00:00','09:00:00','8');
/*!40000 ALTER TABLE `scheduledservices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `serviceID` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(45) NOT NULL,
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  `cost` decimal(19,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`serviceID`),
  UNIQUE KEY `serviceID_UNIQUE` (`serviceID`),
  KEY `fk_Services_Facility1_idx` (`unitName`),
  CONSTRAINT `fk_Services_Facility` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'nutrition','Palliative',10.0000),(2,'bathing','Palliative',25.0000),(3,'exercise','Palliative',100.0000),(4,'checkup','Childrens',10.0000),(5,'prescription','Childrens',50.0000),(6,'operation','Childrens',100.0000),(7,'follow up exam','Surgical',10.0000),(8,'surgery','Surgical',75.0000),(9,'recovery','Surgical',100.0000);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  `name` varchar(45) NOT NULL,
  `salary` decimal(19,4) NOT NULL,
  `numYears` int(11) NOT NULL DEFAULT '0',
  `password` varchar(45) NOT NULL DEFAULT 'pass123',
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `staffID_UNIQUE` (`staffID`),
  KEY `fk_staff_facility1_idx` (`unitName`),
  CONSTRAINT `fk_Staff_Facility` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Palliative','Steve',98000.0000,0,'pass123'),(2,'Palliative','Ben',98000.0000,0,'pass123'),(3,'Palliative','John',16.0000,0,'pass123'),(4,'Palliative','Karim',40000.0000,0,'pass123'),(5,'Childrens','Cheng',125000.0000,0,'pass123'),(6,'Childrens','Chris',98000.0000,0,'pass123'),(7,'Childrens','Alex',98000.0000,0,'pass123'),(8,'Childrens','Sarah',18.0000,0,'pass123'),(9,'Childrens','Sam',42000.0000,0,'pass123'),(10,'Surgical','Sora',125000.0000,0,'pass123'),(11,'Surgical','Ramzi',98000.0000,0,'pass123'),(12,'Surgical','Rayan',98000.0000,0,'pass123'),(13,'Surgical','Danny',17.0000,0,'pass123'),(14,'Surgical','Jude',16.0000,0,'pass123'),(15,'Palliative','Cami',44000.0000,0,'pass123'),(16,'Palliative','Jayna',46000.0000,0,'pass123'),(17,'Palliative','Alida',24.5000,0,'pass123'),(18,'Palliative','Sharri',0.0000,0,'pass123'),(19,'Palliative','Manuela',27.7500,0,'pass123'),(20,'Childrens','Neville',24.5000,0,'pass123'),(21,'Childrens','Lu',24.5000,0,'pass123'),(22,'Childrens','Zofia',44000.0000,0,'pass123'),(23,'Childrens','Liane',0.0000,0,'pass123'),(24,'Childrens','Gema',0.0000,0,'pass123'),(25,'Surgical','Elliot',24.5000,0,'pass123'),(26,'Surgical','Charles',27.2500,0,'pass123'),(27,'Surgical','Lettie',0.0000,0,'pass123'),(28,'Surgical','Denice',44000.0000,0,'pass123'),(29,'Surgical','Arcelia',0.0000,0,'pass123'),(30,'Palliative','Joe',125000.0000,0,'pass123'),(31,'Surgical','Xavier',18.5000,0,'pass123');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplies`
--

DROP TABLE IF EXISTS `supplies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplies` (
  `supplyID` int(11) NOT NULL,
  `category` enum('medical','nonmedical','nutritional') NOT NULL,
  `subcategory` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `cost` decimal(19,4) NOT NULL,
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  PRIMARY KEY (`supplyID`),
  KEY `fk_Supplies_Facility1_idx` (`unitName`),
  CONSTRAINT `fk_Supplies_Facility1` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplies`
--

LOCK TABLES `supplies` WRITE;
/*!40000 ALTER TABLE `supplies` DISABLE KEYS */;
INSERT INTO `supplies` VALUES (1,'medical','medications','anti-inflammatory',2,10,13.0000,'Palliative'),(2,'medical','surgical equipment','injection needles',6,10,16.0000,'Palliative'),(3,'medical','medications','anti-psychotics',2,10,15.0000,'Childrens'),(4,'medical','supporting devices','wheelchairs',7,10,76.0000,'Childrens'),(5,'medical','medications','pain-killers',3,10,21.0000,'Surgical'),(6,'medical','surgical equipment','surgical staplers',2,10,52.0000,'Surgical'),(7,'nonmedical','administrative supplies','phones',7,10,23.0000,'Palliative'),(8,'nonmedical','basic patient materials','robes',4,10,10.0000,'Palliative'),(9,'nonmedical','administrative supplies','pencils',3,10,1.0000,'Childrens'),(10,'nonmedical','basic patient materials','pillows cases',7,10,12.0000,'Childrens'),(11,'nonmedical','administrative supplies','pens',8,10,2.0000,'Surgical'),(12,'nonmedical','basic patient materials','sheets',3,10,18.0000,'Surgical'),(13,'nutritional','fruit','apple',3,10,2.0000,'Palliative'),(14,'nutritional','vegetables','lettus',5,10,3.0000,'Palliative'),(15,'nutritional','cereal','corn pops',6,10,4.0000,'Childrens'),(16,'nutritional','fruit','pear',7,10,1.0000,'Childrens'),(17,'nutritional','cereal','frosted flakes',3,10,2.0000,'Surgical'),(18,'nutritional','vegetables','mushrooms',9,10,3.0000,'Surgical');
/*!40000 ALTER TABLE `supplies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplyroomstock`
--

DROP TABLE IF EXISTS `supplyroomstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplyroomstock` (
  `supplyID` int(11) NOT NULL,
  `roomFloor` int(11) NOT NULL,
  PRIMARY KEY (`supplyID`),
  KEY `fk_Medications_Supplies1_idx` (`supplyID`),
  CONSTRAINT `fk_Medications_Supplies1` FOREIGN KEY (`supplyID`) REFERENCES `supplies` (`supplyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplyroomstock`
--

LOCK TABLES `supplyroomstock` WRITE;
/*!40000 ALTER TABLE `supplyroomstock` DISABLE KEYS */;
INSERT INTO `supplyroomstock` VALUES (1,1),(2,2),(3,1),(4,2),(5,1),(6,1),(7,2),(8,1),(9,2),(10,1),(11,1),(12,1);
/*!40000 ALTER TABLE `supplyroomstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technicians`
--

DROP TABLE IF EXISTS `technicians`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technicians` (
  `staffID` int(11) NOT NULL,
  `specialization` enum('pediatric','x-ray','computer','blood work','sterilization') NOT NULL,
  `overtimeHours` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `fk_Technicians_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technicians`
--

LOCK TABLES `technicians` WRITE;
/*!40000 ALTER TABLE `technicians` DISABLE KEYS */;
INSERT INTO `technicians` VALUES (3,'pediatric',0),(8,'computer',0),(13,'blood work',0),(14,'sterilization',0),(31,'x-ray',0);
/*!40000 ALTER TABLE `technicians` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `viewadmin`
--

DROP TABLE IF EXISTS `viewadmin`;
/*!50001 DROP VIEW IF EXISTS `viewadmin`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewadmin` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewdirectors`
--

DROP TABLE IF EXISTS `viewdirectors`;
/*!50001 DROP VIEW IF EXISTS `viewdirectors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewdirectors` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewdoctors`
--

DROP TABLE IF EXISTS `viewdoctors`;
/*!50001 DROP VIEW IF EXISTS `viewdoctors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewdoctors` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL,
  `specialty` tinyint NOT NULL,
  `visits` tinyint NOT NULL,
  `operations` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewinterns`
--

DROP TABLE IF EXISTS `viewinterns`;
/*!50001 DROP VIEW IF EXISTS `viewinterns`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewinterns` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL,
  `specialty` tinyint NOT NULL,
  `visits` tinyint NOT NULL,
  `operations` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewonlydoctors`
--

DROP TABLE IF EXISTS `viewonlydoctors`;
/*!50001 DROP VIEW IF EXISTS `viewonlydoctors`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewonlydoctors` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL,
  `specialty` tinyint NOT NULL,
  `visits` tinyint NOT NULL,
  `operations` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `viewresidents`
--

DROP TABLE IF EXISTS `viewresidents`;
/*!50001 DROP VIEW IF EXISTS `viewresidents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewresidents` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `unitName` tinyint NOT NULL,
  `salary` tinyint NOT NULL,
  `numYears` tinyint NOT NULL,
  `specialty` tinyint NOT NULL,
  `visits` tinyint NOT NULL,
  `operations` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `workhours`
--

DROP TABLE IF EXISTS `workhours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workhours` (
  `staffID` int(11) NOT NULL,
  `date` date NOT NULL,
  `shiftStart` time NOT NULL,
  `shiftEnd` time NOT NULL,
  KEY `fk_WorkHours_Staff` (`staffID`),
  CONSTRAINT `fk_WorkHours_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workhours`
--

LOCK TABLES `workhours` WRITE;
/*!40000 ALTER TABLE `workhours` DISABLE KEYS */;
INSERT INTO `workhours` VALUES (17,'2013-08-19','06:00:00','18:00:00'),(19,'2013-08-19','06:00:00','18:00:00'),(20,'2013-08-19','06:00:00','18:00:00'),(21,'2013-08-19','06:00:00','18:00:00'),(25,'2013-08-19','06:00:00','18:00:00'),(26,'2013-08-19','06:00:00','18:00:00'),(17,'2013-08-20','06:00:00','18:00:00'),(19,'2013-08-21','06:00:00','18:00:00'),(20,'2013-08-20','06:00:00','18:00:00'),(21,'2013-08-21','06:00:00','18:00:00'),(25,'2013-08-20','06:00:00','18:00:00'),(26,'2013-08-21','06:00:00','18:00:00'),(17,'2013-08-22','06:00:00','18:00:00'),(19,'2013-08-23','06:00:00','18:00:00'),(20,'2013-08-22','06:00:00','18:00:00'),(21,'2013-08-23','06:00:00','18:00:00'),(25,'2013-08-22','06:00:00','18:00:00'),(26,'2013-08-23','06:00:00','18:00:00');
/*!40000 ALTER TABLE `workhours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `allstaff`
--

/*!50001 DROP TABLE IF EXISTS `allstaff`*/;
/*!50001 DROP VIEW IF EXISTS `allstaff`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `allstaff` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears` from `staff`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewadmin`
--

/*!50001 DROP TABLE IF EXISTS `viewadmin`*/;
/*!50001 DROP VIEW IF EXISTS `viewadmin`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewadmin` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears` from `staff` where `staff`.`staffID` in (select `administrators`.`staffID` from `administrators`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewdirectors`
--

/*!50001 DROP TABLE IF EXISTS `viewdirectors`*/;
/*!50001 DROP VIEW IF EXISTS `viewdirectors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewdirectors` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears` from `staff` where `staff`.`staffID` in (select `director`.`staffID` from `director`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewdoctors`
--

/*!50001 DROP TABLE IF EXISTS `viewdoctors`*/;
/*!50001 DROP VIEW IF EXISTS `viewdoctors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewdoctors` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears`,`doctor`.`specialty` AS `specialty`,`doctor`.`visits` AS `visits`,`doctor`.`operations` AS `operations` from (`staff` join `doctor` on((`doctor`.`staffID` = `staff`.`staffID`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewinterns`
--

/*!50001 DROP TABLE IF EXISTS `viewinterns`*/;
/*!50001 DROP VIEW IF EXISTS `viewinterns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewinterns` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears`,`doctor`.`specialty` AS `specialty`,`doctor`.`visits` AS `visits`,`doctor`.`operations` AS `operations` from (`staff` join `doctor` on((`doctor`.`staffID` = `staff`.`staffID`))) where `doctor`.`staffID` in (select `interns`.`staffID` from `interns`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewonlydoctors`
--

/*!50001 DROP TABLE IF EXISTS `viewonlydoctors`*/;
/*!50001 DROP VIEW IF EXISTS `viewonlydoctors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewonlydoctors` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears`,`doctor`.`specialty` AS `specialty`,`doctor`.`visits` AS `visits`,`doctor`.`operations` AS `operations` from (`staff` join `doctor` on((`doctor`.`staffID` = `staff`.`staffID`))) where ((not(`doctor`.`staffID` in (select `residents`.`staffID` from `residents`))) and (not(`doctor`.`staffID` in (select `interns`.`staffID` from `interns`))))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `viewresidents`
--

/*!50001 DROP TABLE IF EXISTS `viewresidents`*/;
/*!50001 DROP VIEW IF EXISTS `viewresidents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewresidents` AS (select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`staff`.`unitName` AS `unitName`,`staff`.`salary` AS `salary`,`staff`.`numYears` AS `numYears`,`doctor`.`specialty` AS `specialty`,`doctor`.`visits` AS `visits`,`doctor`.`operations` AS `operations` from (`staff` join `doctor` on((`doctor`.`staffID` = `staff`.`staffID`))) where `doctor`.`staffID` in (select `residents`.`staffID` from `residents`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-19 19:50:33
