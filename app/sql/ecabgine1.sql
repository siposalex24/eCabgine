-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 24, 2021 at 08:24 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecabgine1`
--

-- --------------------------------------------------------

--
-- Table structure for table `analysis`
--

DROP TABLE IF EXISTS `analysis`;
CREATE TABLE IF NOT EXISTS `analysis` (
  `id_analysis` int(4) NOT NULL AUTO_INCREMENT,
  `analysis_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id_analysis`),
  KEY `analysis_name` (`analysis_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `analysis`
--

INSERT INTO `analysis` (`id_analysis`, `analysis_name`) VALUES
(4, 'Acid Uric'),
(3, 'ASAT, ALAT, Bilirubina'),
(8, 'Examen sumar de urina'),
(2, 'Glicemie'),
(6, 'Hemoleucograma+trombociti'),
(5, 'Ionograma'),
(7, 'IP, INR, TQ, APTT'),
(9, 'Test de toleranta la glucoza p'),
(1, 'Uree, creatinina');

-- --------------------------------------------------------

--
-- Table structure for table `cabinet`
--

DROP TABLE IF EXISTS `cabinet`;
CREATE TABLE IF NOT EXISTS `cabinet` (
  `id_cabinet` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `tax_identification_code` varchar(10) NOT NULL,
  `trade_register_number` varchar(15) NOT NULL,
  `IBAN` varchar(13) NOT NULL,
  PRIMARY KEY (`id_cabinet`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabinet`
--

INSERT INTO `cabinet` (`id_cabinet`, `name`, `address`, `telephone`, `email`, `tax_identification_code`, `trade_register_number`, `IBAN`) VALUES
(1, 'Gine3', 'str. Short Martin no. 18', '0364812623', 'gine3@office.com', 'Ro123456', 'J12/123456/2000', 'RO4231BCR1781');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id_city` int(4) NOT NULL AUTO_INCREMENT,
  `id_county` int(4) NOT NULL,
  `city` varchar(50) NOT NULL,
  PRIMARY KEY (`id_city`),
  KEY `id_judet` (`id_county`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id_city`, `id_county`, `city`) VALUES
(1, 1, 'Cluj-Napoca'),
(2, 2, 'Alba-Iulia');

-- --------------------------------------------------------

--
-- Table structure for table `consult`
--

DROP TABLE IF EXISTS `consult`;
CREATE TABLE IF NOT EXISTS `consult` (
  `id_consult` int(4) NOT NULL AUTO_INCREMENT,
  `id_user` int(4) NOT NULL,
  `id_patient` int(4) NOT NULL,
  `date` datetime NOT NULL,
  `last_period` date NOT NULL,
  `climax` tinyint(4) NOT NULL,
  `menstrual_cycle` text NOT NULL,
  `births` int(2) NOT NULL,
  `abortions` int(2) NOT NULL,
  `antecedents` text NOT NULL,
  `consult_reason` varchar(100) DEFAULT NULL,
  `observations` text,
  `id_exam` int(4) NOT NULL,
  `diagnostic` varchar(100) NOT NULL,
  `recommendations` text,
  `id_anal` int(4) NOT NULL,
  `treatment` text NOT NULL,
  PRIMARY KEY (`id_consult`),
  KEY `id_user` (`id_user`),
  KEY `id_patient` (`id_patient`),
  KEY `id_exam` (`id_exam`),
  KEY `id_anal` (`id_anal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consult`
--

INSERT INTO `consult` (`id_consult`, `id_user`, `id_patient`, `date`, `last_period`, `climax`, `menstrual_cycle`, `births`, `abortions`, `antecedents`, `consult_reason`, `observations`, `id_exam`, `diagnostic`, `recommendations`, `id_anal`, `treatment`) VALUES
(1, 1, 1, '2021-01-13 00:10:22', '2021-01-09', 1, 'no', 1, 0, 'No', 'edad', 'dada', 0, '', 'da', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `consult_analysis`
--

DROP TABLE IF EXISTS `consult_analysis`;
CREATE TABLE IF NOT EXISTS `consult_analysis` (
  `id_anal` int(4) NOT NULL AUTO_INCREMENT,
  `id_analyses` int(4) NOT NULL,
  `id_consult` int(11) NOT NULL,
  PRIMARY KEY (`id_anal`),
  UNIQUE KEY `id_analysis` (`id_analyses`),
  KEY `id_alalysis` (`id_analyses`),
  KEY `id_consult` (`id_consult`),
  KEY `id_analysis_2` (`id_analyses`),
  KEY `id_analysis_3` (`id_analyses`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `consult_analysis`
--

INSERT INTO `consult_analysis` (`id_anal`, `id_analyses`, `id_consult`) VALUES
(1, 1, 1),
(3, 2, 1),
(4, 3, 1),
(5, 4, 1),
(6, 5, 1),
(7, 6, 1),
(8, 7, 1),
(9, 8, 1),
(10, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `consult_examinations`
--

DROP TABLE IF EXISTS `consult_examinations`;
CREATE TABLE IF NOT EXISTS `consult_examinations` (
  `id_exam` int(4) NOT NULL AUTO_INCREMENT,
  `id_examination` int(4) NOT NULL,
  `id_consult` int(4) NOT NULL,
  `price` int(5) NOT NULL,
  PRIMARY KEY (`id_exam`),
  KEY `id_examination` (`id_examination`),
  KEY `id_analysis` (`id_consult`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
CREATE TABLE IF NOT EXISTS `county` (
  `id_county` int(4) NOT NULL AUTO_INCREMENT,
  `county` varchar(30) NOT NULL,
  PRIMARY KEY (`id_county`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `county`
--

INSERT INTO `county` (`id_county`, `county`) VALUES
(1, 'Cluj'),
(2, 'Alba');

-- --------------------------------------------------------

--
-- Table structure for table `examinations`
--

DROP TABLE IF EXISTS `examinations`;
CREATE TABLE IF NOT EXISTS `examinations` (
  `id_examination` int(4) NOT NULL AUTO_INCREMENT,
  `examination_name` varchar(30) NOT NULL,
  `price` int(5) NOT NULL,
  PRIMARY KEY (`id_examination`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id_invoice` int(4) NOT NULL,
  `series` varchar(3) NOT NULL,
  `number` int(5) NOT NULL,
  `date` date NOT NULL,
  `id_cabinet` int(4) NOT NULL,
  `id_patient` int(4) NOT NULL,
  `id_consult` int(4) NOT NULL,
  `id_exam` int(4) NOT NULL,
  PRIMARY KEY (`id_invoice`),
  KEY `id_cabinet` (`id_cabinet`),
  KEY `id_consult` (`id_consult`),
  KEY `id_patient` (`id_patient`),
  KEY `id_exam` (`id_exam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medical_letter`
--

DROP TABLE IF EXISTS `medical_letter`;
CREATE TABLE IF NOT EXISTS `medical_letter` (
  `id_letter` int(4) NOT NULL AUTO_INCREMENT,
  `id_patient` int(4) NOT NULL,
  `id_consult` int(4) NOT NULL,
  `id_user` int(4) NOT NULL,
  `id_cabinet` int(4) NOT NULL,
  PRIMARY KEY (`id_letter`),
  KEY `id_patient` (`id_patient`),
  KEY `id_consult` (`id_consult`),
  KEY `id_user` (`id_user`),
  KEY `id_cabinet` (`id_cabinet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
CREATE TABLE IF NOT EXISTS `patients` (
  `id_patient` int(4) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `identification_number` varchar(13) NOT NULL,
  `date_of_birth` date NOT NULL,
  `id_county` int(4) DEFAULT NULL,
  `id_city` int(4) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `ocuppation` varchar(20) DEFAULT NULL,
  `job` varchar(30) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `civil_status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_patient`),
  KEY `id_county` (`id_county`) USING BTREE,
  KEY `id_city` (`id_city`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id_patient`, `first_name`, `last_name`, `identification_number`, `date_of_birth`, `id_county`, `id_city`, `address`, `ocuppation`, `job`, `telephone`, `email`, `civil_status`) VALUES
(1, 'Maria', 'Pop', '2751123192128', '1975-11-23', 1, 1, 'str. lalelelor nr 2. ap. 12', 'seller', 'seller', '0364812623', 'mariapop@yahoo.com', 1),
(2, 'Lazar', 'Marian', '1234567891234', '1992-02-03', 1, 1, 'Strada Ciresilor Nr. 1', 'Muncitor', 'Portar', '0748989898', 'lazar.marian@yahoo.com', 1),
(3, 'Jason', 'Medeiros', '9876543210123', '1975-10-20', 2, 2, 'Strada Berii Nr. 6', 'Muncitor', 'Inginer', '0743757575', 'mrjmedeiros@gmail.com', 1),
(5, 'alexandru', 'vasilache', '1925524603121', '2021-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'fafafafada', 'gsagfagfs', '123456789123', '2021-02-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'sfsfs', 'fsfsfs', '2342424242424', '2021-02-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'dadada', 'dadadadada', '2131312313213', '2021-02-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'ahahaha', 'afewqdfwda', '213131313132', '2021-05-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'hr5thetherwertw', 'hweterfeffre', '1231313131313', '2021-05-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'sgsfsfsfsgs', 'fsfsfsfsf', '2424242426345', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'dgdgdegdgs', 'hdgdgsfs', '4525252542525', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `title` varchar(15) NOT NULL,
  `signature` blob,
  `is_admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `firstname`, `lastname`, `title`, `signature`, `is_admin`) VALUES
(1, 'doctor@gmail.com', '$2y$10$w.0LrU7Jcemf4rktajdJuOJtgKen0nUxcyecYbOGFOQru87IQrWKK', 'Ion', 'Pop', 'Dr', '', NULL);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `city`
--
ALTER TABLE `city`
  ADD CONSTRAINT `city_ibfk_1` FOREIGN KEY (`id_county`) REFERENCES `county` (`id_county`);

--
-- Constraints for table `consult_analysis`
--
ALTER TABLE `consult_analysis`
  ADD CONSTRAINT `consult_analysis_ibfk_3` FOREIGN KEY (`id_consult`) REFERENCES `consult` (`id_consult`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `consult_analysis_ibfk_4` FOREIGN KEY (`id_analyses`) REFERENCES `analysis` (`id_analysis`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `consult_examinations`
--
ALTER TABLE `consult_examinations`
  ADD CONSTRAINT `consult_examinations_ibfk_1` FOREIGN KEY (`id_examination`) REFERENCES `examinations` (`id_examination`),
  ADD CONSTRAINT `consult_examinations_ibfk_2` FOREIGN KEY (`id_consult`) REFERENCES `consult` (`id_consult`);

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`id_cabinet`) REFERENCES `cabinet` (`id_cabinet`),
  ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`id_consult`) REFERENCES `consult` (`id_consult`);

--
-- Constraints for table `medical_letter`
--
ALTER TABLE `medical_letter`
  ADD CONSTRAINT `medical_letter_ibfk_2` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`id_patient`),
  ADD CONSTRAINT `medical_letter_ibfk_3` FOREIGN KEY (`id_cabinet`) REFERENCES `cabinet` (`id_cabinet`),
  ADD CONSTRAINT `medical_letter_ibfk_4` FOREIGN KEY (`id_consult`) REFERENCES `consult` (`id_consult`);

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_ibfk_2` FOREIGN KEY (`id_city`) REFERENCES `city` (`id_city`),
  ADD CONSTRAINT `patients_ibfk_3` FOREIGN KEY (`id_county`) REFERENCES `county` (`id_county`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
