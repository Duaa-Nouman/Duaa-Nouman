-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 07:06 AM
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
-- Database: `hospital_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `all_patients`
--

CREATE TABLE `all_patients` (
  `PatientID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Catagorey` enum('In Patient','Out Patient') DEFAULT NULL,
  `InsuranceID` varchar(20) DEFAULT NULL,
  `AdmissionDate` datetime DEFAULT NULL,
  `DischargeDate` datetime DEFAULT NULL,
  `MedicalHistory` text DEFAULT NULL,
  `Department` enum('Emergency Department','Gynaecology','Oncology','Neurology','Nephrology','Cardiology','Burn','Pedeatrics','Psychology','Physiotherapy','ENT','Deramatology') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `AppointmentID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `Doc_ID` int(11) DEFAULT NULL,
  `AppointmentDateTime` datetime DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `Status` enum('Scheduled','Cancelled','Completed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cleaning_staff`
--

CREATE TABLE `cleaning_staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Department` enum('Emergency Department','Gynaecology','Oncology','Neurology','Nephrology','Cardiology','Burn','Pedeatrics','Psychology','Physiotherapy','ENT','Deramatology') DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor_staff`
--

CREATE TABLE `doctor_staff` (
  `Doc_ID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Department` enum('Emergency Department','Gynaecology','Oncology','Neurology','Nephrology','Cardiology','Burn','Pedeatrics','Psychology','Physiotherapy','ENT','Deramatology') DEFAULT NULL,
  `Consultation_Fee` int(11) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_ward`
--

CREATE TABLE `general_ward` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `Progress` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `icu_ward`
--

CREATE TABLE `icu_ward` (
  `PatientID` int(11) DEFAULT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `Gender` enum('Male','Female','Other') DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `PatientStatus` enum('Critical','More Critical','Most Critical') DEFAULT NULL,
  `Progress` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `InvoiceID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `BillingDate` datetime DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  `Status` enum('Pending','Paid') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `labtests`
--

CREATE TABLE `labtests` (
  `TestID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `TestName` varchar(100) DEFAULT NULL,
  `TestDate` datetime DEFAULT NULL,
  `Results` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicalrecords`
--

CREATE TABLE `medicalrecords` (
  `RecordID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `Diagnosis` text DEFAULT NULL,
  `TreatmentPlan` text DEFAULT NULL,
  `Medications` text DEFAULT NULL,
  `LabResults` text DEFAULT NULL,
  `ProgressNotes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medications`
--

CREATE TABLE `medications` (
  `MedicationID` int(11) NOT NULL,
  `MedicationName` varchar(100) DEFAULT NULL,
  `Manufacturer` varchar(100) DEFAULT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `StockQuantity` int(11) DEFAULT NULL,
  `UnitPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nursing_staff`
--

CREATE TABLE `nursing_staff` (
  `NurseID` int(11) NOT NULL,
  `FirstName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `Department` enum('Emergency Department','Gynaecology','Oncology','Neurology','Nephrology','Cardiology','Burn','Pedeatrics','Psychology','Physiotherapy','ENT','Deramatology') DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacyorders`
--

CREATE TABLE `pharmacyorders` (
  `OrderID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `MedicationID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL,
  `Status` enum('Pending','Dispensed','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qualityreports`
--

CREATE TABLE `qualityreports` (
  `ReportID` int(11) NOT NULL,
  `ReportDate` date DEFAULT NULL,
  `Value` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `radiologyorders`
--

CREATE TABLE `radiologyorders` (
  `OrderID` int(11) NOT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Results` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `all_patients`
--
ALTER TABLE `all_patients`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`AppointmentID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `Doc_ID` (`Doc_ID`);

--
-- Indexes for table `cleaning_staff`
--
ALTER TABLE `cleaning_staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `doctor_staff`
--
ALTER TABLE `doctor_staff`
  ADD PRIMARY KEY (`Doc_ID`);

--
-- Indexes for table `general_ward`
--
ALTER TABLE `general_ward`
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `icu_ward`
--
ALTER TABLE `icu_ward`
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`InvoiceID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `labtests`
--
ALTER TABLE `labtests`
  ADD PRIMARY KEY (`TestID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD PRIMARY KEY (`RecordID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- Indexes for table `medications`
--
ALTER TABLE `medications`
  ADD PRIMARY KEY (`MedicationID`);

--
-- Indexes for table `nursing_staff`
--
ALTER TABLE `nursing_staff`
  ADD PRIMARY KEY (`NurseID`);

--
-- Indexes for table `pharmacyorders`
--
ALTER TABLE `pharmacyorders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `PatientID` (`PatientID`),
  ADD KEY `MedicationID` (`MedicationID`);

--
-- Indexes for table `qualityreports`
--
ALTER TABLE `qualityreports`
  ADD PRIMARY KEY (`ReportID`);

--
-- Indexes for table `radiologyorders`
--
ALTER TABLE `radiologyorders`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `PatientID` (`PatientID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `all_patients`
--
ALTER TABLE `all_patients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `AppointmentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cleaning_staff`
--
ALTER TABLE `cleaning_staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_staff`
--
ALTER TABLE `doctor_staff`
  MODIFY `Doc_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `InvoiceID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `labtests`
--
ALTER TABLE `labtests`
  MODIFY `TestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicalrecords`
--
ALTER TABLE `medicalrecords`
  MODIFY `RecordID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medications`
--
ALTER TABLE `medications`
  MODIFY `MedicationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nursing_staff`
--
ALTER TABLE `nursing_staff`
  MODIFY `NurseID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pharmacyorders`
--
ALTER TABLE `pharmacyorders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `qualityreports`
--
ALTER TABLE `qualityreports`
  MODIFY `ReportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `radiologyorders`
--
ALTER TABLE `radiologyorders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`Doc_ID`) REFERENCES `doctor_staff` (`Doc_ID`);

--
-- Constraints for table `general_ward`
--
ALTER TABLE `general_ward`
  ADD CONSTRAINT `general_ward_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`);

--
-- Constraints for table `icu_ward`
--
ALTER TABLE `icu_ward`
  ADD CONSTRAINT `icu_ward_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`);

--
-- Constraints for table `labtests`
--
ALTER TABLE `labtests`
  ADD CONSTRAINT `labtests_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`);

--
-- Constraints for table `medicalrecords`
--
ALTER TABLE `medicalrecords`
  ADD CONSTRAINT `medicalrecords_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`);

--
-- Constraints for table `pharmacyorders`
--
ALTER TABLE `pharmacyorders`
  ADD CONSTRAINT `pharmacyorders_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`),
  ADD CONSTRAINT `pharmacyorders_ibfk_2` FOREIGN KEY (`MedicationID`) REFERENCES `medications` (`MedicationID`);

--
-- Constraints for table `radiologyorders`
--
ALTER TABLE `radiologyorders`
  ADD CONSTRAINT `radiologyorders_ibfk_1` FOREIGN KEY (`PatientID`) REFERENCES `all_patients` (`PatientID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
