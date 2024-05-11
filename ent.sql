-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2024 at 03:04 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ent`
--

-- --------------------------------------------------------

--
-- Table structure for table `ent_cleaning_staff`
--

CREATE TABLE `ent_cleaning_staff` (
  `StaffID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Department` enum('Emergency Department','Gynaecology','Oncology','Neurology','Nephrology','Cardiology','Burn','Pedeatrics','Psychology','Physiotherapy','ENT','Deramatology') DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ent_doctor_staff`
--

CREATE TABLE `ent_doctor_staff` (
  `Doc_ID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ent_nursing_staff`
--

CREATE TABLE `ent_nursing_staff` (
  `NurseID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ent_patient`
--

CREATE TABLE `ent_patient` (
  `PatientID` int(11) DEFAULT NULL,
  `Doc_ID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Appointment_Status` enum('Schedueled','Completed','Canceled') DEFAULT 'Completed',
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ent_cleaning_staff`
--
ALTER TABLE `ent_cleaning_staff`
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `ent_doctor_staff`
--
ALTER TABLE `ent_doctor_staff`
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `ent_nursing_staff`
--
ALTER TABLE `ent_nursing_staff`
  ADD PRIMARY KEY (`NurseID`);

--
-- Indexes for table `ent_patient`
--
ALTER TABLE `ent_patient`
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ent_nursing_staff`
--
ALTER TABLE `ent_nursing_staff`
  MODIFY `NurseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ent_cleaning_staff`
--
ALTER TABLE `ent_cleaning_staff`
  ADD CONSTRAINT `ent_cleaning_staff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `hospital_management_system`.`cleaning_staff` (`StaffID`);

--
-- Constraints for table `ent_doctor_staff`
--
ALTER TABLE `ent_doctor_staff`
  ADD CONSTRAINT `ent_doctor_staff_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `hospital_management_system`.`doctor_staff` (`Doc_ID`);

--
-- Constraints for table `ent_nursing_staff`
--
ALTER TABLE `ent_nursing_staff`
  ADD CONSTRAINT `ent_nursing_staff_ibfk_1` FOREIGN KEY (`NurseID`) REFERENCES `hospital_management_system`.`nursing_staff` (`NurseID`);

--
-- Constraints for table `ent_patient`
--
ALTER TABLE `ent_patient`
  ADD CONSTRAINT `ent_patient_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `hospital_management_system`.`all_patients` (`PatientID`),
  ADD CONSTRAINT `ent_patient_ibfk_2` FOREIGN KEY (`Doc_ID`) REFERENCES `hospital_management_system`.`doctor_staff` (`Doc_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
