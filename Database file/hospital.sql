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
  CONSTRAINT `fk_Facility_Director` FOREIGN KEY (`directorID`) REFERENCES `director` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facility_Admistrators1` FOREIGN KEY (`seniorAdminID1`) REFERENCES `administrators` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Facility_Admistrators2` FOREIGN KEY (`seniorAdminID2`) REFERENCES `administrators` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
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
  CONSTRAINT `fk_Schedule_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Services` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Patients` FOREIGN KEY (`patientsID`) REFERENCES `patients` (`patientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ScheduledServices_Staff1` FOREIGN KEY (`assistantID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledservices`
--

LOCK TABLES `scheduledservices` WRITE;
/*!40000 ALTER TABLE `scheduledservices` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Palliative','Steve',98000.0000,0,'pass123'),(2,'Palliative','Ben',98000.0000,0,'pass123'),(3,'Palliative','John',16.0000,0,'pass123'),(4,'Palliative','Karim',40000.0000,0,'pass123'),(5,'Childrens','Cheng',125000.0000,0,'pass123'),(6,'Childrens','Chris',98000.0000,0,'pass123'),(7,'Childrens','Alex',98000.0000,0,'pass123'),(8,'Childrens','Sarah',18.0000,0,'pass123'),(9,'Childrens','Sam',42000.0000,0,'pass123'),(10,'Surgical','Sora',125000.0000,0,'pass123'),(11,'Surgical','Ramzi',98000.0000,0,'pass123'),(12,'Surgical','Rayan',98000.0000,0,'pass123'),(13,'Surgical','Danny',17.0000,0,'pass123'),(14,'Surgical','Jude',16.0000,0,'pass123'),(15,'Palliative','Cami',44000.0000,0,'pass123'),(16,'Palliative','Jayna',46000.0000,0,'pass123'),(17,'Palliative','Alida',24.5000,0,'pass123'),(18,'Palliative','Sharri',0.0000,0,'pass123'),(19,'Palliative','Manuela',27.7500,0,'pass123'),(20,'Childrens','Neville',24.5000,0,'pass123'),(21,'Childrens','Lu',24.5000,0,'pass123'),(22,'Childrens','Zofia',44000.0000,0,'pass123'),(23,'Childrens','Liane',0.0000,0,'pass123'),(24,'Childrens','Gema',0.0000,0,'pass123'),(25,'Surgical','Elliot',24.5000,0,'pass123'),(26,'Surgical','Charles',27.2500,0,'pass123'),(27,'Surgical','Lettie',0.0000,0,'pass123'),(28,'Surgical','Denice',44000.0000,0,'pass123'),(29,'Surgical','Arcelia',0.0000,0,'pass123'),(30,'Palliative','Joe',125000.0000,0,'pass123');
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
/*!40000 ALTER TABLE `technicians` ENABLE KEYS */;
UNLOCK TABLES;

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
  PRIMARY KEY (`staffID`),
  CONSTRAINT `fk_WorkHours_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workhours`
--

LOCK TABLES `workhours` WRITE;
/*!40000 ALTER TABLE `workhours` DISABLE KEYS */;
/*!40000 ALTER TABLE `workhours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-19 15:19:34
