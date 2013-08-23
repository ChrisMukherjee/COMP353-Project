CREATE DATABASE  IF NOT EXISTS `hospital` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hospital`;
-- MySQL dump 10.13  Distrib 5.6.12, for Win64 (x86_64)
--
-- Host: localhost    Database: hospital
-- ------------------------------------------------------
-- Server version	5.6.12-log

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
-- Temporary table structure for view `alltechnicians`
--

DROP TABLE IF EXISTS `alltechnicians`;
/*!50001 DROP VIEW IF EXISTS `alltechnicians`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `alltechnicians` (
  `staffID` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `specialization` tinyint NOT NULL,
  `overtimeHours` tinyint NOT NULL
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
INSERT INTO `doctor` VALUES (4,'Dentist',2,5),(9,'Cardiologists',7,6),(15,'Dermatologist',3,2),(16,'Neurologists',2,4),(18,'Radiologists',6,8),(22,'Pediatrics',2,3),(23,'Physicians',8,7),(24,'Venereologists‎',4,4),(27,'Surgeon',6,6),(28,'Surgeon',8,4),(29,'Surgeon',9,2),(38,'Surgeon',2,5),(39,'Pediatrics',2,1);
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `doctor_patient`
--

DROP TABLE IF EXISTS `doctor_patient`;
/*!50001 DROP VIEW IF EXISTS `doctor_patient`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `doctor_patient` (
  `DoctorID` tinyint NOT NULL,
  `DoctorName` tinyint NOT NULL,
  `ServiceNB` tinyint NOT NULL,
  `Service` tinyint NOT NULL,
  `Patient Name` tinyint NOT NULL,
  `AssistantID` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `roomNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
-- Temporary table structure for view `int_res_schedule`
--

DROP TABLE IF EXISTS `int_res_schedule`;
/*!50001 DROP VIEW IF EXISTS `int_res_schedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `int_res_schedule` (
  `StaffID` tinyint NOT NULL,
  `StaffName` tinyint NOT NULL,
  `Patient Name` tinyint NOT NULL,
  `Service` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `roomNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `interns` VALUES (4),(38),(39);
/*!40000 ALTER TABLE `interns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `nurse_patients`
--

DROP TABLE IF EXISTS `nurse_patients`;
/*!50001 DROP VIEW IF EXISTS `nurse_patients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `nurse_patients` (
  `Staff` tinyint NOT NULL,
  `StaffName` tinyint NOT NULL,
  `UnitName` tinyint NOT NULL,
  `Patient Name` tinyint NOT NULL,
  `Service` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `roomNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
INSERT INTO `nurses` VALUES (17,0,0,0),(19,1,0,0),(20,0,0,0),(21,0,0,0),(25,0,0,0),(26,1,0,0),(32,0,0,0),(33,1,0,0),(34,0,0,0),(35,0,0,0),(36,0,0,0),(37,1,0,0);
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
  `Comments` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`patientID`),
  UNIQUE KEY `idPatients_UNIQUE` (`patientID`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'Arletta Hemingford',892187382,'In a coma'),(2,'Bert Ernie',891673820,'Is too flexible'),(3,'Irene Sandy',891871763,'Is a hurricane'),(4,'Stephani Gwen',651265283,'Broken skull'),(5,'Peter Piper',934087262,'Thinks hes peterpan'),(6,'Verda Smith',891227634,'Loves nutella'),(7,'Jim Morton',435820234,'Is weird'),(8,'Sheldon Cooper',273627844,'Sees in binary'),(9,'Zora Zeeten',718394628,'Missing butt cheek'),(10,'Jessie James',554283491,'Errectile disfunction'),(11,'Axel Ramos',812767635,'Cras interdum. Nunc sollicitudin commodo'),(12,'Tamekah Doyle',610641038,'semper auctor. Mauris vel'),(13,'Devin Taylor',105982543,'gravida. Aliquam'),(14,'Prescott Contreras',468009430,'dictum. Proin eget odio. Aliquam'),(15,'Wang Yang',156768481,'ac sem ut dolor dapibus gravida.'),(16,'Madeline Saunders',441138093,'et libero. Proin mi. Aliquam gravida'),(17,'Travis Serrano',801496249,'mauris sit amet lorem semper'),(18,'Aquila Wiley',181401444,'feugiat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),(19,'Kiona Page',989593607,'ultrices posuere cubilia'),(20,'Sierra Henry',837397387,'elementum, lorem ut aliquam iaculis,'),(21,'Florence Kemp',610584209,'Donec non justo. Proin non massa non ante bibendum'),(22,'Bree Haney',836929931,'sagittis placerat.'),(23,'Mufutau Morse',742358833,'diam. Duis mi enim, condimentum eget, volutpat ornare, facilisis'),(24,'Nasim Hendricks',919552223,'mi eleifend'),(25,'Bernard Gould',914548813,'imperdiet dictum magna. Ut tincidunt'),(26,'Carly Wilson',752358780,'nulla.'),(27,'Kerry Sykes',599429087,'vitae sodales nisi magna sed dui.'),(28,'Fitzgerald Weaver',573037838,'Donec'),(29,'Howard Kirk',302657717,'id, blandit at, nisi.'),(30,'Hermione Green',670989616,'mollis lectus pede et risus. Quisque libero lacus, varius'),(31,'Constance Olson',214856047,'arcu. Curabitur ut odio vel'),(32,'Raya Russell',559226176,'egestas blandit. Nam nulla magna, malesuada vel, convallis in,'),(33,'Lois Kaufman',241619183,'penatibus et magnis dis parturient montes, nascetur'),(34,'Finn Clemons',608198098,'lorem, eget mollis lectus pede et risus. Quisque libero'),(35,'Dai Faulkner',928303957,'auctor ullamcorper, nisl arcu iaculis'),(36,'Brynne Horn',908536106,'diam luctus lobortis. Class aptent taciti sociosqu ad'),(37,'Simon Woodard',810120736,'nunc sit amet metus. Aliquam erat volutpat. Nulla facilisis. Suspendisse'),(38,'Hunter Franklin',766415307,'sagittis. Nullam vitae diam. Proin dolor. Nulla semper'),(39,'Virginia Peters',319274221,'dictum mi,'),(40,'Carson Burns',643603140,'ullamcorper. Duis cursus, diam at pretium'),(41,'Rhona Gilliam',360922226,'dis parturient montes, nascetur ridiculus mus.'),(42,'Valentine Cabrera',183999113,'accumsan sed, facilisis vitae, orci.'),(43,'Irene Potts',623474840,'hendrerit. Donec'),(44,'Lewis Beasley',785331950,'vulputate mauris sagittis placerat. Cras dictum ultricies ligula.'),(45,'Carl Finch',137579874,'id'),(46,'Autumn Hill',536987093,'et magnis dis parturient montes,'),(47,'Yoko Fernandez',524691701,'adipiscing.'),(48,'Quinlan Padilla',802189947,'est arcu ac orci.'),(49,'Kaitlin Morales',550883276,'sit amet diam eu dolor egestas rhoncus. Proin nisl sem,'),(50,'Phelan Rutledge',660365296,'erat volutpat. Nulla dignissim. Maecenas ornare'),(51,'Gisela Mcleod',968033394,'gravida nunc sed pede. Cum sociis'),(52,'Martena Lewis',184471780,'eleifend, nunc risus varius orci, in consequat'),(53,'Palmer Wilkinson',846610385,'neque sed'),(54,'Fiona Mathews',896808043,'Quisque varius.'),(55,'Avye Pitts',254616977,'aliquet odio. Etiam ligula'),(56,'Brian Sampson',634586001,'Phasellus'),(57,'Lucy Rollins',889073896,'lectus rutrum urna, nec luctus'),(58,'Avram Malone',617509750,'magna tellus faucibus leo, in lobortis tellus justo sit amet'),(59,'Skyler Bernard',292931402,'turpis.'),(60,'Grant Saunders',117996568,'aliquam eros'),(61,'Zachary Clarke',663694865,'magna. Duis dignissim tempor'),(62,'Wayne Schmidt',244882342,'est. Nunc laoreet lectus quis massa. Mauris'),(63,'Amela Marks',220785176,'accumsan sed, facilisis vitae, orci. Phasellus dapibus quam quis'),(64,'Stephen Suarez',733022549,'eu sem.'),(65,'Portia Whitney',489792561,'orci luctus et'),(66,'Vaughan Boyer',319399170,'eleifend egestas.'),(67,'Kaye Palmer',130378483,'In'),(68,'Herrod Robles',632851235,'ut, pellentesque eget,'),(69,'Yen Morris',693232734,'faucibus ut, nulla.'),(70,'Chelsea Alexander',530797204,'aliquet, metus urna convallis erat, eget tincidunt'),(71,'Cody Wynn',689147783,'dolor dolor, tempus'),(72,'Scott Warner',529206698,'magnis dis parturient montes, nascetur'),(73,'Zoe Woodward',134973062,'sed dictum'),(74,'Bruce Soto',929921715,'semper auctor. Mauris'),(75,'Scarlet Merrill',899384609,'sed, est.'),(76,'Dominic Lyons',980941619,'vehicula et, rutrum eu,'),(77,'Kane Blake',711579837,'erat. Etiam vestibulum massa rutrum magna. Cras convallis convallis dolor.'),(78,'Kiayada Johnson',515990966,'lorem ut aliquam iaculis, lacus pede sagittis augue, eu tempor'),(79,'Burke Huff',196364954,'tristique'),(80,'Reuben Morrison',203585078,'ac, eleifend vitae, erat. Vivamus nisi. Mauris'),(81,'Drake Snow',198016634,'fames ac turpis egestas. Aliquam fringilla cursus purus.'),(82,'Veda Osborne',147693018,'quam. Pellentesque'),(83,'Hollee Osborn',137086010,'non, luctus sit amet, faucibus ut, nulla.'),(84,'Ivan Schroeder',912805996,'Suspendisse'),(85,'Guy Navarro',571661020,'ipsum primis in faucibus orci luctus et ultrices posuere'),(86,'Demetrius Vincent',168268059,'consequat dolor vitae dolor. Donec fringilla.'),(87,'Dana Hopper',237213115,'ac turpis egestas. Fusce'),(88,'Tucker Woodward',667570084,'rutrum urna, nec luctus felis purus ac tellus. Suspendisse'),(89,'Hamish Byers',176848719,'non nisi. Aenean eget metus.'),(90,'Joan Vega',757980420,'dis parturient montes, nascetur ridiculus mus. Aenean'),(91,'Lilah Cooley',628961756,'Nunc pulvinar arcu et pede. Nunc'),(92,'Nita Calderon',353487592,'tellus. Suspendisse'),(93,'Price Lloyd',976440273,'interdum'),(94,'Ria Woodard',818604973,'id, mollis nec, cursus'),(95,'Nigel Gould',513004243,'interdum libero'),(96,'Dahlia Medina',449430645,'lacus. Cras interdum. Nunc sollicitudin commodo'),(97,'Ethan Sims',847283349,'Nunc ullamcorper, velit in aliquet lobortis, nisi nibh lacinia'),(98,'Jamal Rice',836940840,'enim. Sed nulla ante, iaculis nec, eleifend non,'),(99,'Barrett Cantu',951254352,'vulputate, risus'),(100,'Cecilia Middleton',883456621,'Nunc pulvinar arcu et pede.'),(101,'Theodore Davidson',164344851,'sit amet, risus. Donec nibh'),(102,'Jordan Wall',283066824,'et netus et malesuada fames ac turpis'),(103,'Rae Owens',768829240,'quam quis diam. Pellentesque habitant morbi'),(104,'Penelope Kidd',756605161,'non, luctus sit amet, faucibus ut, nulla. Cras eu tellus'),(105,'Kibo Cote',176316303,'Aliquam vulputate ullamcorper magna. Sed eu'),(106,'Acton Holloway',727347276,'feugiat nec,'),(107,'Hedley Price',590639699,'posuere at, velit. Cras lorem lorem, luctus'),(108,'Cruz Cook',377773411,'facilisis facilisis,'),(109,'Amber Finley',504739377,'Aliquam vulputate ullamcorper magna. Sed eu eros. Nam consequat dolor'),(110,'Zelda Hurst',167902553,'Donec egestas. Duis ac arcu.');
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
  `serviceNb` int(11) NOT NULL AUTO_INCREMENT,
  `staffID` int(11) NOT NULL,
  `assistantID` int(11) NOT NULL,
  `serviceID` int(11) NOT NULL,
  `patientsID` int(11) NOT NULL,
  `date` date NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `roomNumber` varchar(15) NOT NULL,
  PRIMARY KEY (`serviceNb`),
  UNIQUE KEY `serviceNb_UNIQUE` (`serviceNb`),
  KEY `fk_Schedule_Staff1_idx` (`staffID`),
  KEY `fk_Schedule_Services1_idx` (`serviceID`),
  KEY `fk_Schedule_Patients1_idx` (`patientsID`),
  KEY `fk_ScheduledServices_Staff1_idx` (`assistantID`),
  CONSTRAINT `fk_ScheduledServices_Staff1` FOREIGN KEY (`assistantID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Patients` FOREIGN KEY (`patientsID`) REFERENCES `patients` (`patientID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Services` FOREIGN KEY (`serviceID`) REFERENCES `services` (`serviceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduledservices`
--

LOCK TABLES `scheduledservices` WRITE;
/*!40000 ALTER TABLE `scheduledservices` DISABLE KEYS */;
INSERT INTO `scheduledservices` VALUES (1,3,4,1,1,'2013-08-19','06:00:00','07:00:00','1'),(2,17,4,1,1,'2013-08-20','07:00:00','07:30:00','2'),(3,19,4,1,1,'2013-08-20','07:00:00','07:30:00','2'),(4,20,4,1,1,'2013-08-20','07:00:00','07:30:00','2'),(5,21,4,1,1,'2013-08-20','07:00:00','07:30:00','2'),(6,5,9,4,3,'2013-08-20','07:00:00','08:00:00','4'),(7,7,9,4,3,'2013-08-20','08:00:00','09:00:00','3'),(8,8,9,4,2,'2013-08-21','08:00:00','09:00:00','4'),(9,18,15,5,8,'2013-08-20','08:00:00','09:00:00','4'),(10,27,22,5,9,'2013-08-20','08:00:00','09:00:00','7'),(11,29,22,5,9,'2013-08-22','08:00:00','09:00:00','2'),(12,24,39,6,9,'2013-08-23','08:00:00','09:00:00','8'),(13,24,22,2,9,'2013-08-23','08:00:00','09:00:00','8'),(14,32,38,4,3,'2013-08-20','09:00:00','19:30:00','3'),(15,33,22,5,7,'2013-08-23','07:00:00','09:00:00','4'),(16,34,39,6,2,'2013-08-20','09:00:00','11:15:00','3'),(17,35,28,7,8,'2013-08-23','09:30:00','14:00:00','7'),(18,36,38,8,9,'2013-08-20','07:00:00','09:00:00','2'),(19,37,39,9,3,'2013-08-23','07:00:00','20:00:00','1'),(20,25,38,2,10,'2013-08-20','07:00:00','07:30:00','1'),(21,26,16,3,10,'2013-08-23','10:30:00','14:30:00','7'),(22,13,36,5,3,'2013-04-05','07:00:00','00:00:00','1'),(23,7,20,1,31,'2013-04-05','07:30:00','00:00:00','3'),(24,17,25,1,80,'2013-04-05','08:00:00','11:30:00','6'),(25,13,2,2,92,'2008-01-13','07:30:00','11:30:00','2'),(26,23,34,1,98,'2012-02-13','09:30:00','17:30:00','2'),(27,12,14,1,18,'2013-04-05','09:00:00','11:30:00','8'),(28,35,18,2,34,'2013-04-05','08:00:00','15:30:00','4'),(29,13,36,6,92,'2013-04-05','09:00:00','10:00:00','7'),(30,30,28,2,40,'2006-08-13','00:00:00','11:30:00','6'),(31,30,18,8,94,'2004-11-13','08:30:00','11:30:00','7'),(32,19,6,4,19,'2009-01-12','00:00:00','12:00:00','6'),(33,35,5,1,52,'2013-04-05','08:30:00','10:00:00','8'),(34,5,13,7,7,'2013-04-05','00:00:00','11:30:00','1'),(35,30,22,1,1,'2013-04-05','00:00:00','10:00:00','5'),(36,37,2,7,16,'2013-04-05','09:30:00','17:30:00','8'),(37,21,12,3,21,'2013-04-05','07:30:00','17:30:00','7'),(38,36,11,9,56,'2010-02-12','09:00:00','11:30:00','2'),(39,12,2,4,103,'2013-04-05','08:00:00','10:00:00','2'),(40,10,32,6,62,'2013-04-05','07:30:00','17:30:00','1'),(41,23,6,4,58,'2013-04-05','09:00:00','12:00:00','1'),(42,36,33,7,96,'2013-04-05','07:30:00','16:00:00','4'),(43,2,10,9,23,'2012-10-13','07:00:00','17:30:00','6'),(44,20,17,6,43,'2011-09-12','07:30:00','12:00:00','1'),(45,22,24,4,36,'2013-04-05','08:00:00','16:00:00','2'),(46,37,7,1,67,'2010-10-12','08:30:00','17:30:00','7'),(47,16,6,6,79,'2013-04-05','07:30:00','10:00:00','7'),(48,9,26,6,19,'2013-04-05','08:00:00','11:30:00','3'),(49,20,7,3,59,'2013-04-05','00:00:00','00:00:00','8'),(50,4,3,7,42,'2013-04-05','08:00:00','15:30:00','6'),(51,9,22,1,103,'2013-04-05','09:30:00','11:30:00','5'),(52,10,19,6,48,'2013-04-05','09:00:00','12:00:00','7'),(53,1,38,9,48,'2011-04-12','08:00:00','10:00:00','8'),(54,4,22,9,74,'2013-04-05','09:30:00','16:00:00','2'),(55,19,39,9,85,'2009-12-13','00:00:00','16:00:00','5'),(56,16,39,7,92,'2002-03-13','07:00:00','12:00:00','2'),(57,39,28,7,3,'2013-04-05','08:00:00','00:00:00','7'),(58,12,19,5,80,'2013-04-05','07:30:00','16:00:00','7'),(59,6,7,5,51,'2013-04-05','00:00:00','00:00:00','7'),(60,18,22,9,99,'2013-04-05','08:00:00','16:00:00','3'),(61,31,34,2,66,'2013-04-05','00:00:00','15:30:00','1'),(62,27,33,1,107,'2013-04-05','07:30:00','17:30:00','6'),(63,36,14,8,29,'2013-04-05','09:00:00','16:00:00','8'),(64,8,29,9,89,'2013-04-05','09:30:00','17:30:00','7'),(65,9,35,2,57,'2013-04-05','08:00:00','15:30:00','8'),(66,31,12,2,97,'2013-04-05','07:30:00','12:00:00','8'),(67,26,11,9,71,'2013-04-05','07:30:00','17:30:00','7'),(68,35,12,7,109,'2007-12-13','00:00:00','12:00:00','2'),(69,3,33,6,100,'2013-04-05','07:30:00','00:00:00','3'),(70,39,7,9,34,'2003-03-13','07:00:00','15:30:00','7'),(71,29,8,7,81,'2013-04-05','07:30:00','11:30:00','8'),(72,9,31,6,83,'2013-04-05','00:00:00','11:30:00','3'),(73,38,16,1,84,'2013-04-05','07:30:00','12:00:00','7'),(74,32,23,7,13,'2013-04-05','09:00:00','00:00:00','7'),(75,33,8,8,93,'2010-06-12','08:30:00','00:00:00','2'),(76,23,30,6,99,'2007-11-13','09:30:00','17:30:00','5'),(77,11,26,3,13,'2010-03-13','08:00:00','16:00:00','3'),(78,22,7,7,73,'2012-10-12','09:30:00','15:30:00','7'),(79,27,12,8,91,'2010-05-13','07:00:00','12:00:00','6'),(80,13,26,9,41,'2013-04-05','09:30:00','00:00:00','1'),(81,7,23,4,15,'2013-04-05','07:30:00','16:00:00','5'),(82,13,36,3,91,'2013-04-05','00:00:00','10:00:00','8'),(83,29,1,7,63,'2012-07-12','00:00:00','00:00:00','4'),(84,17,25,8,19,'2013-04-05','07:00:00','11:30:00','4'),(85,10,21,2,92,'2012-03-12','09:00:00','11:30:00','4'),(86,39,39,3,95,'2013-04-05','08:00:00','12:00:00','1'),(87,15,27,6,17,'2013-04-05','07:30:00','10:00:00','1'),(88,15,31,7,12,'2013-04-05','07:00:00','16:00:00','1'),(89,29,25,4,66,'2013-04-05','09:00:00','16:00:00','6'),(90,23,26,1,97,'2013-04-05','08:30:00','00:00:00','1'),(91,34,2,2,95,'2012-06-12','07:00:00','17:30:00','3'),(92,30,4,9,69,'2013-04-05','09:00:00','12:00:00','1'),(93,15,5,8,88,'2013-04-05','07:00:00','12:00:00','7'),(94,10,18,7,101,'2008-08-13','09:30:00','10:00:00','3'),(95,17,27,9,87,'2006-07-13','00:00:00','11:30:00','3'),(96,25,25,4,13,'2013-04-05','08:00:00','17:30:00','3'),(97,11,2,3,97,'2013-04-05','09:00:00','16:00:00','6'),(98,1,31,8,79,'2013-04-05','08:30:00','17:30:00','2'),(99,35,9,4,36,'2013-04-05','00:00:00','15:30:00','4'),(100,33,6,6,110,'2004-01-13','07:00:00','12:00:00','4'),(101,33,3,4,20,'2013-04-05','07:00:00','10:00:00','3'),(102,26,4,2,6,'2013-04-05','00:00:00','16:00:00','8'),(103,37,6,5,57,'2010-02-12','08:30:00','17:30:00','4'),(104,14,22,3,16,'2013-04-05','00:00:00','17:30:00','5'),(105,33,33,7,4,'2001-12-13','08:00:00','00:00:00','8'),(106,5,29,7,26,'2013-04-05','07:00:00','11:30:00','8'),(107,37,14,7,76,'2013-04-05','07:30:00','00:00:00','8'),(108,3,32,3,81,'2013-04-05','00:00:00','00:00:00','8'),(109,24,26,9,49,'2008-03-13','07:00:00','15:30:00','7'),(110,2,9,8,30,'2013-04-05','07:00:00','15:30:00','5'),(111,32,9,3,82,'2005-08-13','08:30:00','16:00:00','5'),(112,23,29,5,60,'2002-08-13','09:00:00','12:00:00','4'),(113,4,31,2,50,'2013-04-05','08:00:00','00:00:00','8'),(114,32,21,3,39,'2010-11-13','09:00:00','17:30:00','6'),(115,35,6,7,81,'2002-06-13','09:30:00','00:00:00','4'),(116,13,29,9,62,'2002-11-13','00:00:00','12:00:00','5'),(117,12,13,7,17,'2011-09-12','09:00:00','11:30:00','8'),(118,24,4,9,36,'2010-04-12','09:00:00','10:00:00','1'),(119,33,2,7,49,'2013-04-05','08:00:00','17:30:00','2'),(120,11,33,3,63,'2009-03-12','08:30:00','16:00:00','6'),(121,20,6,5,47,'2001-12-13','08:00:00','17:30:00','2');
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
  `cost` decimal(19,2) NOT NULL DEFAULT '0.00',
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
INSERT INTO `services` VALUES (1,'Nutrition','Palliative',10.00),(2,'Bathing','Palliative',25.00),(3,'Exercise','Palliative',100.00),(4,'Checkup','Childrens',10.00),(5,'Prescription','Childrens',50.00),(6,'Operation','Childrens',100.00),(7,'Follow-up exam','Surgical',10.00),(8,'Surgery','Surgical',75.00),(9,'Recovery','Surgical',100.00);
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `serviceschedule`
--

DROP TABLE IF EXISTS `serviceschedule`;
/*!50001 DROP VIEW IF EXISTS `serviceschedule`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `serviceschedule` (
  `DoctorID` tinyint NOT NULL,
  `ServiceNB` tinyint NOT NULL,
  `Service` tinyint NOT NULL,
  `Patient Name` tinyint NOT NULL,
  `AssistantID` tinyint NOT NULL,
  `date` tinyint NOT NULL,
  `startTime` tinyint NOT NULL,
  `endTime` tinyint NOT NULL,
  `roomNumber` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

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
  `salary` decimal(19,2) NOT NULL,
  `numYears` int(11) NOT NULL DEFAULT '0',
  `password` varchar(45) NOT NULL DEFAULT 'pass123',
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `staffID_UNIQUE` (`staffID`),
  KEY `fk_staff_facility1_idx` (`unitName`),
  CONSTRAINT `fk_Staff_Facility` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (1,'Palliative','Dylan Nelson',98000.00,0,'pass123'),(2,'Palliative','Nehru Perkins',98000.00,0,'pass123'),(3,'Palliative','Cole Kaufman',16.00,3,'pass123'),(4,'Palliative','Sydney Banks',0.00,0,'pass123'),(5,'Childrens','Rana Matthews',125000.00,0,'pass123'),(6,'Childrens','Griffith Alford',98000.00,0,'pass123'),(7,'Childrens','Richard Maddox',98000.00,0,'pass123'),(8,'Childrens','Urielle Heath',18.00,5,'pass123'),(9,'Childrens','Anjolie Hickman',0.00,1,'pass123'),(10,'Surgical','Nigel Wheeler',125000.00,0,'pass123'),(11,'Surgical','Deborah Harding',98000.00,0,'pass123'),(12,'Surgical','Xanthus Dejesus',98000.00,0,'pass123'),(13,'Surgical','Talon Day',17.00,7,'pass123'),(14,'Surgical','Mari Williams',16.00,3,'pass123'),(15,'Palliative','Velma Thomas',0.00,2,'pass123'),(16,'Palliative','Iliana Crosby',0.00,3,'pass123'),(17,'Palliative','Kyla Burnett',24.50,0,'pass123'),(18,'Palliative','Vaughan Riley',0.00,7,'pass123'),(19,'Palliative','Lucian Sandoval',24.50,0,'pass123'),(20,'Childrens','Rinah Harrell',24.50,0,'pass123'),(21,'Childrens','Harrison Church',24.50,0,'pass123'),(22,'Childrens','Herman Coleman',0.00,2,'pass123'),(23,'Childrens','Oprah Gamble',0.00,4,'pass123'),(24,'Childrens','Leslie Rodriguez',0.00,8,'pass123'),(25,'Surgical','Patience Foley',24.50,0,'pass123'),(26,'Surgical','Patrick Yates',24.50,0,'pass123'),(27,'Surgical','Murphy Pearson',0.00,7,'pass123'),(28,'Surgical','Cynthia May',0.00,2,'pass123'),(29,'Surgical','Vivien Stanley',0.00,5,'pass123'),(30,'Palliative','Kim Stevens',125000.00,0,'pass123'),(31,'Surgical','Quamar William',18.50,2,'pass123'),(32,'Palliative','Baker Galloway',24.50,0,'pass123'),(33,'Palliative','Beau Andrews',24.50,0,'pass123'),(34,'Childrens','Beck Parker',24.50,0,'pass123'),(35,'Childrens','Samuel Todd',24.50,0,'pass123'),(36,'Surgical','Beatrice Cummings',24.50,0,'pass123'),(37,'Surgical','Aubrey Kemp',24.50,0,'pass123'),(38,'Surgical','Hilary Russo',0.00,0,'pass123'),(39,'Childrens','Rowan Yates',0.00,0,'pass123');
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
-- Temporary table structure for view `viewpatients`
--

DROP TABLE IF EXISTS `viewpatients`;
/*!50001 DROP VIEW IF EXISTS `viewpatients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `viewpatients` (
  `patientName` tinyint NOT NULL,
  `medicareCard` tinyint NOT NULL,
  `comments` tinyint NOT NULL
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
INSERT INTO `workhours` VALUES (17,'2013-08-19','06:00:00','18:00:00'),(19,'2013-08-19','06:00:00','18:00:00'),(20,'2013-08-19','06:00:00','18:00:00'),(21,'2013-08-19','06:00:00','18:00:00'),(25,'2013-08-19','06:00:00','18:00:00'),(26,'2013-08-19','06:00:00','18:00:00'),(17,'2013-08-20','06:00:00','18:00:00'),(19,'2013-08-21','06:00:00','18:00:00'),(20,'2013-08-20','06:00:00','18:00:00'),(21,'2013-08-21','06:00:00','18:00:00'),(25,'2013-08-20','06:00:00','18:00:00'),(26,'2013-08-21','06:00:00','18:00:00'),(17,'2013-08-22','06:00:00','18:00:00'),(19,'2013-08-23','06:00:00','18:00:00'),(20,'2013-08-22','06:00:00','18:00:00'),(21,'2013-08-23','06:00:00','18:00:00'),(25,'2013-08-22','06:00:00','18:00:00'),(26,'2013-08-23','06:00:00','18:00:00'),(31,'2013-08-19','08:00:00','15:30:00'),(31,'2013-08-20','08:00:00','15:30:00'),(31,'2013-08-21','08:00:00','15:30:00'),(31,'2013-08-22','08:00:00','15:30:00'),(31,'2013-08-23','08:00:00','15:30:00'),(14,'2013-08-19','08:00:00','15:30:00'),(14,'2013-08-20','08:00:00','15:30:00'),(14,'2013-08-21','08:00:00','15:30:00'),(14,'2013-08-22','08:00:00','15:30:00'),(14,'2013-08-23','08:00:00','15:30:00'),(13,'2013-08-19','08:00:00','15:30:00'),(13,'2013-08-20','08:00:00','15:30:00'),(13,'2013-08-21','08:00:00','15:30:00'),(13,'2013-08-22','08:00:00','15:30:00'),(13,'2013-08-23','08:00:00','15:30:00'),(3,'2013-08-19','08:00:00','15:30:00'),(3,'2013-08-20','08:00:00','15:30:00'),(3,'2013-08-21','08:00:00','15:30:00'),(3,'2013-08-22','08:00:00','15:30:00'),(3,'2013-08-23','08:00:00','15:30:00'),(8,'2013-08-19','08:00:00','15:30:00'),(8,'2013-08-20','08:00:00','15:30:00'),(8,'2013-08-21','08:00:00','15:30:00'),(8,'2013-08-22','08:00:00','15:30:00'),(8,'2013-08-23','08:00:00','15:30:00');
/*!40000 ALTER TABLE `workhours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `alltechnicians`
--

/*!50001 DROP TABLE IF EXISTS `alltechnicians`*/;
/*!50001 DROP VIEW IF EXISTS `alltechnicians`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `alltechnicians` AS select `staff`.`staffID` AS `staffID`,`staff`.`name` AS `name`,`technicians`.`specialization` AS `specialization`,`technicians`.`overtimeHours` AS `overtimeHours` from (`staff` join `technicians` on((`staff`.`staffID` = `technicians`.`staffID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_patient`
--

/*!50001 DROP TABLE IF EXISTS `doctor_patient`*/;
/*!50001 DROP VIEW IF EXISTS `doctor_patient`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_patient` AS (select `doctor`.`staffID` AS `DoctorID`,`staff`.`name` AS `DoctorName`,`scheduledservices`.`serviceNb` AS `ServiceNB`,`services`.`serviceName` AS `Service`,`patients`.`patientName` AS `Patient Name`,`scheduledservices`.`assistantID` AS `AssistantID`,`scheduledservices`.`date` AS `date`,`scheduledservices`.`startTime` AS `startTime`,`scheduledservices`.`endTime` AS `endTime`,`scheduledservices`.`roomNumber` AS `roomNumber` from ((((`scheduledservices` join `doctor` on((`doctor`.`staffID` = `scheduledservices`.`staffID`))) join `staff` on((`staff`.`staffID` = `scheduledservices`.`staffID`))) join `services` on((`services`.`serviceID` = `scheduledservices`.`serviceID`))) join `patients` on((`patients`.`patientID` = `scheduledservices`.`patientsID`))) order by `doctor`.`staffID`,`scheduledservices`.`date`,`scheduledservices`.`startTime`) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `int_res_schedule`
--

/*!50001 DROP TABLE IF EXISTS `int_res_schedule`*/;
/*!50001 DROP VIEW IF EXISTS `int_res_schedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `int_res_schedule` AS (select `staff`.`staffID` AS `StaffID`,`staff`.`name` AS `StaffName`,`patients`.`patientName` AS `Patient Name`,`services`.`serviceName` AS `Service`,`scheduledservices`.`date` AS `date`,`scheduledservices`.`startTime` AS `startTime`,`scheduledservices`.`endTime` AS `endTime`,`scheduledservices`.`roomNumber` AS `roomNumber` from (((`scheduledservices` join `staff` on((`staff`.`staffID` = `scheduledservices`.`assistantID`))) join `services` on((`services`.`serviceID` = `scheduledservices`.`serviceID`))) join `patients` on((`patients`.`patientID` = `scheduledservices`.`patientsID`))) order by `staff`.`staffID`,`scheduledservices`.`date`,`scheduledservices`.`startTime`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `nurse_patients`
--

/*!50001 DROP TABLE IF EXISTS `nurse_patients`*/;
/*!50001 DROP VIEW IF EXISTS `nurse_patients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `nurse_patients` AS (select `staff`.`staffID` AS `Staff`,`staff`.`name` AS `StaffName`,`staff`.`unitName` AS `UnitName`,`patients`.`patientName` AS `Patient Name`,`services`.`serviceName` AS `Service`,`scheduledservices`.`date` AS `date`,`scheduledservices`.`startTime` AS `startTime`,`scheduledservices`.`endTime` AS `endTime`,`scheduledservices`.`roomNumber` AS `roomNumber` from ((((`scheduledservices` join `nurses` on((`nurses`.`staffID` = `scheduledservices`.`staffID`))) join `staff` on((`staff`.`staffID` = `nurses`.`staffID`))) join `services` on((`services`.`serviceID` = `scheduledservices`.`serviceID`))) join `patients` on((`patients`.`patientID` = `scheduledservices`.`patientsID`))) order by `scheduledservices`.`date`,`scheduledservices`.`startTime`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `serviceschedule`
--

/*!50001 DROP TABLE IF EXISTS `serviceschedule`*/;
/*!50001 DROP VIEW IF EXISTS `serviceschedule`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `serviceschedule` AS (select `doctor`.`staffID` AS `DoctorID`,`scheduledservices`.`serviceNb` AS `ServiceNB`,`services`.`serviceName` AS `Service`,`patients`.`patientName` AS `Patient Name`,`scheduledservices`.`assistantID` AS `AssistantID`,`scheduledservices`.`date` AS `date`,`scheduledservices`.`startTime` AS `startTime`,`scheduledservices`.`endTime` AS `endTime`,`scheduledservices`.`roomNumber` AS `roomNumber` from (((`scheduledservices` join `doctor` on((`doctor`.`staffID` = `scheduledservices`.`staffID`))) join `services` on((`services`.`serviceID` = `scheduledservices`.`serviceID`))) join `patients` on((`patients`.`patientID` = `scheduledservices`.`patientsID`)))) */
/*!50002 WITH CASCADED CHECK OPTION */;
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
-- Final view structure for view `viewpatients`
--

/*!50001 DROP TABLE IF EXISTS `viewpatients`*/;
/*!50001 DROP VIEW IF EXISTS `viewpatients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `viewpatients` AS (select `patients`.`patientName` AS `patientName`,`patients`.`medicareCard` AS `medicareCard`,`patients`.`Comments` AS `comments` from `patients`) */;
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

-- Dump completed on 2013-08-23  1:43:31
