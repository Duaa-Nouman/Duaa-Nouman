-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 07:30 AM
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
-- Database: `nephrology_department`
--

-- --------------------------------------------------------

--
-- Table structure for table `nephrology_cleaning_staff`
--

CREATE TABLE `nephrology_cleaning_staff` (
  `StaffID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Department` enum('Emergency Department','Gynaecology','Oncology','Neurology','Nephrology','Cardiology','Burn','Pedeatrics','Psychology','Physiotherapy','ENT','Deramatology') DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nephrology_doctor_staff`
--

CREATE TABLE `nephrology_doctor_staff` (
  `Doc_ID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nephrology_nursing_staff`
--

CREATE TABLE `nephrology_nursing_staff` (
  `NurseID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nephrology_patient`
--

CREATE TABLE `nephrology_patient` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `np1_ward`
--

CREATE TABLE `np1_ward` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Bed_No` int(11) DEFAULT NULL,
  `Surgery_Date` datetime DEFAULT NULL,
  `Surgery_Status` enum('Schedueled','Completed','Canceled') DEFAULT 'Schedueled',
  `Patient_Condition` varchar(100) DEFAULT 'Without Complications'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `np2_ward`
--

CREATE TABLE `np2_ward` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Bed_No` int(11) DEFAULT NULL,
  `Surgery_Date` datetime DEFAULT NULL,
  `Surgery_Status` enum('Schedueled','Completed','Canceled') DEFAULT 'Schedueled',
  `Patient_Condition` varchar(100) DEFAULT 'With Complications'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `np3_ward`
--

CREATE TABLE `np3_ward` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Bed_No` int(11) DEFAULT NULL,
  `Surgery_Date` datetime DEFAULT NULL,
  `Surgery_Status` enum('Schedueled','Completed','Canceled') DEFAULT 'Completed',
  `Patient_Condition` varchar(100) DEFAULT 'Without Complications'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `np_hdu_ward`
--

CREATE TABLE `np_hdu_ward` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Bed_No` int(11) DEFAULT NULL,
  `Surgery_Date` datetime DEFAULT NULL,
  `Surgery_Status` enum('Schedueled','Completed','Canceled') DEFAULT 'Completed',
  `Patient_Condition` varchar(100) DEFAULT 'With Extreme Complications'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `nephrology_cleaning_staff`
--
ALTER TABLE `nephrology_cleaning_staff`
  ADD KEY `StaffID` (`StaffID`);

--
-- Indexes for table `nephrology_doctor_staff`
--
ALTER TABLE `nephrology_doctor_staff`
  ADD PRIMARY KEY (`Doc_ID`);

--
-- Indexes for table `nephrology_nursing_staff`
--
ALTER TABLE `nephrology_nursing_staff`
  ADD PRIMARY KEY (`NurseID`);

--
-- Indexes for table `nephrology_patient`
--
ALTER TABLE `nephrology_patient`
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `np1_ward`
--
ALTER TABLE `np1_ward`
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `np2_ward`
--
ALTER TABLE `np2_ward`
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `np3_ward`
--
ALTER TABLE `np3_ward`
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `np_hdu_ward`
--
ALTER TABLE `np_hdu_ward`
  ADD KEY `PatientID` (`PatientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `nephrology_doctor_staff`
--
ALTER TABLE `nephrology_doctor_staff`
  MODIFY `Doc_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nephrology_nursing_staff`
--
ALTER TABLE `nephrology_nursing_staff`
  MODIFY `NurseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `nephrology_cleaning_staff`
--
ALTER TABLE `nephrology_cleaning_staff`
  ADD CONSTRAINT `nephrology_cleaning_staff_ibfk_1` FOREIGN KEY (`StaffID`) REFERENCES `hospital_management_system`.`cleaning_staff` (`StaffID`);

--
-- Constraints for table `nephrology_doctor_staff`
--
ALTER TABLE `nephrology_doctor_staff`
  ADD CONSTRAINT `nephrology_doctor_staff_ibfk_1` FOREIGN KEY (`Doc_ID`) REFERENCES `hospital_management_system`.`doctor_staff` (`Doc_ID`);

--
-- Constraints for table `nephrology_nursing_staff`
--
ALTER TABLE `nephrology_nursing_staff`
  ADD CONSTRAINT `nephrology_nursing_staff_ibfk_1` FOREIGN KEY (`NurseID`) REFERENCES `hospital_management_system`.`nursing_staff` (`NurseID`);

--
-- Constraints for table `nephrology_patient`
--
ALTER TABLE `nephrology_patient`
  ADD CONSTRAINT `nephrology_patient_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `hospital_management_system`.`all_patients` (`PatientID`);

--
-- Constraints for table `np1_ward`
--
ALTER TABLE `np1_ward`
  ADD CONSTRAINT `np1_ward_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `hospital_management_system`.`all_patients` (`PatientID`);

--
-- Constraints for table `np2_ward`
--
ALTER TABLE `np2_ward`
  ADD CONSTRAINT `np2_ward_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `hospital_management_system`.`all_patients` (`PatientID`);

--
-- Constraints for table `np3_ward`
--
ALTER TABLE `np3_ward`
  ADD CONSTRAINT `np3_ward_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `hospital_management_system`.`all_patients` (`PatientID`);

--
-- Constraints for table `np_hdu_ward`
--
ALTER TABLE `np_hdu_ward`
  ADD CONSTRAINT `np_hdu_ward_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `hospital_management_system`.`all_patients` (`PatientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
