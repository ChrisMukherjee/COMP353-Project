-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2013 at 04:13 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hospital`
--
CREATE DATABASE IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `hospital`;

-- --------------------------------------------------------

--
-- Table structure for table `administrators`
--

CREATE TABLE IF NOT EXISTS `administrators` (
  `staffID` int(11) NOT NULL,
  `isSeniorAdmin` tinyint(1) NOT NULL DEFAULT '0',
  `Schedule` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `director`
--

CREATE TABLE IF NOT EXISTS `director` (
  `staffID` int(11) NOT NULL,
  `Schedule` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_Director_staff1_idx` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE IF NOT EXISTS `doctor` (
  `staffID` int(11) NOT NULL,
  `specialty` varchar(45) NOT NULL,
  `visits` int(11) NOT NULL DEFAULT '0',
  `operations` int(11) NOT NULL DEFAULT '0',
  `Schedule` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`),
  KEY `fk_Doctor_Staff1_idx` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE IF NOT EXISTS `facility` (
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  `directorID` int(11) DEFAULT NULL,
  `seniorAdminID1` int(11) DEFAULT NULL,
  `seniorAdminID2` int(11) DEFAULT NULL,
  PRIMARY KEY (`unitName`),
  KEY `fk_Facility_Director1_idx` (`directorID`),
  KEY `fk_Facility_Admistrators1_idx` (`seniorAdminID1`),
  KEY `fk_Facility_Admistrators2_idx` (`seniorAdminID2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `facility`
--

INSERT INTO `facility` (`unitName`, `directorID`, `seniorAdminID1`, `seniorAdminID2`) VALUES
('Palliative', NULL, NULL, NULL),
('Childrens', NULL, NULL, NULL),
('Surgical', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `interns`
--

CREATE TABLE IF NOT EXISTS `interns` (
  `staffID` int(11) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '40000',
  `numYears` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`),
  KEY `fk_Interns_Doctor1_idx` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nurse-patient services`
--

CREATE TABLE IF NOT EXISTS `nurse-patient services` (
  `Nurses_staffID` int(11) NOT NULL,
  `Services_serviceID` int(11) NOT NULL,
  `Patients_patientsID` int(11) NOT NULL,
  KEY `fk_Nurse-Patient Services_Services1_idx` (`Services_serviceID`),
  KEY `fk_Nurse-Patient Services_Patients1_idx` (`Patients_patientsID`),
  KEY `fk_Nurse-Patient Services_Nurses` (`Nurses_staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nurses`
--

CREATE TABLE IF NOT EXISTS `nurses` (
  `staffID` int(11) NOT NULL,
  `isShiftSupervisor` tinyint(1) NOT NULL DEFAULT '0',
  `overtimeHours` int(11) DEFAULT NULL,
  `parttimeHours` int(11) DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE IF NOT EXISTS `patients` (
  `patientsID` int(11) NOT NULL AUTO_INCREMENT,
  `Patients_Name` varchar(45) NOT NULL,
  `Specific_Unit` varchar(45) NOT NULL,
  `Medicare_Card` int(11) NOT NULL,
  `Hospital_Card` varchar(45) NOT NULL,
  `roomNb` int(11) NOT NULL,
  PRIMARY KEY (`patientsID`),
  UNIQUE KEY `idPatients_UNIQUE` (`patientsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `residents`
--

CREATE TABLE IF NOT EXISTS `residents` (
  `staffID` int(11) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '42000',
  `numYears` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`staffID`),
  KEY `fk_Residents_Doctor1_idx` (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `serviceID` int(11) NOT NULL AUTO_INCREMENT,
  `serviceName` varchar(45) NOT NULL,
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  PRIMARY KEY (`serviceID`),
  UNIQUE KEY `serviceID_UNIQUE` (`serviceID`),
  KEY `fk_Services_Facility1_idx` (`unitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  `name` varchar(45) NOT NULL,
  `salary` int(11) NOT NULL,
  `numYears` int(11) NOT NULL DEFAULT '0',
  `password` varchar(45) NOT NULL DEFAULT 'pass123',
  PRIMARY KEY (`staffID`),
  UNIQUE KEY `staffID_UNIQUE` (`staffID`),
  KEY `fk_staff_facility1_idx` (`unitName`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11113 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `unitName`, `name`, `salary`, `numYears`, `password`) VALUES
(11111, 'Childrens', 'Tim', 231, 12, '111110'),
(11112, 'Childrens', 'Joe', 212, 12, '111120');

-- --------------------------------------------------------

--
-- Table structure for table `supplies`
--

CREATE TABLE IF NOT EXISTS `supplies` (
  `supplyID` int(11) NOT NULL,
  `category` enum('medical','nonmedical','nutritional') NOT NULL,
  `name` varchar(45) NOT NULL,
  `subcategory` varchar(45) NOT NULL,
  `stock` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  `unitName` enum('Palliative','Childrens','Surgical') NOT NULL,
  PRIMARY KEY (`supplyID`),
  KEY `fk_Supplies_Facility1_idx` (`unitName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `technicians`
--

CREATE TABLE IF NOT EXISTS `technicians` (
  `staffID` int(11) NOT NULL,
  `specialization` enum('pediatric','x-ray','computer','blood work','sterilization') NOT NULL,
  `overtimeHours` int(11) DEFAULT NULL,
  `Schedule` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `administrators`
--
ALTER TABLE `administrators`
  ADD CONSTRAINT `fk_Admistrators_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `director`
--
ALTER TABLE `director`
  ADD CONSTRAINT `fk_Director_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `fk_Doctor_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `facility`
--
ALTER TABLE `facility`
  ADD CONSTRAINT `fk_Facility_Admistrators1` FOREIGN KEY (`seniorAdminID1`) REFERENCES `administrators` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Facility_Admistrators2` FOREIGN KEY (`seniorAdminID2`) REFERENCES `administrators` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Facility_Director` FOREIGN KEY (`directorID`) REFERENCES `director` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `interns`
--
ALTER TABLE `interns`
  ADD CONSTRAINT `fk_Interns_Doctor` FOREIGN KEY (`staffID`) REFERENCES `doctor` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nurse-patient services`
--
ALTER TABLE `nurse-patient services`
  ADD CONSTRAINT `fk_Nurse-Patient Services_Nurses` FOREIGN KEY (`Nurses_staffID`) REFERENCES `nurses` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Nurse-Patient Services_Patients` FOREIGN KEY (`Patients_patientsID`) REFERENCES `patients` (`patientsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Nurse-Patient Services_Services` FOREIGN KEY (`Services_serviceID`) REFERENCES `services` (`serviceID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `nurses`
--
ALTER TABLE `nurses`
  ADD CONSTRAINT `fk_Nurses_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `residents`
--
ALTER TABLE `residents`
  ADD CONSTRAINT `fk_Residents_Doctor` FOREIGN KEY (`staffID`) REFERENCES `doctor` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `fk_Services_Facility1` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_Staff_Facility` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `supplies`
--
ALTER TABLE `supplies`
  ADD CONSTRAINT `fk_Supplies_Facility1` FOREIGN KEY (`unitName`) REFERENCES `facility` (`unitName`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `technicians`
--
ALTER TABLE `technicians`
  ADD CONSTRAINT `fk_Technicians_Staff` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
