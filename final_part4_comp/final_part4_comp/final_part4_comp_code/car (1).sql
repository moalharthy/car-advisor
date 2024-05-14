-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 05:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consulting`
--

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

CREATE TABLE `car` (
  `category` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `transmission` varchar(50) DEFAULT NULL,
  `price` varchar(50) DEFAULT NULL,
  `class` varchar(50) DEFAULT NULL,
  `cname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`category`, `country`, `transmission`, `price`, `class`, `cname`) VALUES
('ECONOMY', 'JAPAN', 'Automatic', 'Medium', 'none', 'Toyota camry'),
('ECONOMY', 'JAPAN', 'Automatic', 'Medium', 'custom', 'Corolla'),
('ECONOMY', 'JAPAN', 'Automatic', 'Medium', 'none', 'Honda Civic'),
('ECONOMY', 'GERMANY', 'Manual', 'Medium', 'custom', 'Volkswagen Golf'),
('ECONOMY', 'USA', 'Automatic', 'Medium', 'none', 'Chevrolet Spark'),
('ECONOMY', 'GERMANY', 'Manual', 'Medium', 'custom', 'BMW 3 Series'),
('LUXURY', 'GERMANY', 'Automatic', 'High', 'classic', 'Mercedes S-Class'),
('LUXURY', 'GERMANY', 'Automatic', 'High', 'collectors', 'BMW 7 Series'),
('LUXURY', 'GERMANY', 'Automatic', 'High', 'classic', 'Audi A8'),
('LUXURY', 'GERMANY', 'Automatic', 'High', 'collectors', 'Porsche Panamera'),
('LUXURY', 'GERMANY', 'Automatic', 'High', 'classic', 'Mercedes E-Class'),
('OFF_ROAD', 'GERMANY', 'Manual', 'High', 'collectors', 'Wrangler'),
('OFF_ROAD', 'USA', 'Automatic', 'High', 'classic', 'Jeep Grand Cherokee'),
('OFF_ROAD', 'JAPAN', 'Automatic', 'High', 'collectors', 'Toyota Land Cruiser'),
('OFF_ROAD', 'JAPAN', 'Automatic', 'High', 'classic', 'Nissan Xterra'),
('OFF_ROAD', 'USA', 'Automatic', 'High', 'collectors', 'Ford Bronco'),
('SPORT', 'USA', 'Manual', 'low', 'classic', 'Mustang'),
('SPORT', 'USA', 'Manual', 'low', 'classic', 'Mustang'),
('SPORT', 'JAPAN', 'Manual', 'Medium', 'collectors', 'Subaru WRX'),
('SPORT', 'USA', 'Manual', 'Medium', 'classic', 'Chevrolet Camaro'),
('SPORT', 'JAPAN', 'Manual', 'Medium', 'collectors', 'Mazda MX-5'),
('SPORT', 'USA', 'Manual', 'Medium', 'classic', 'Ford Mustang'),
('SUV', 'USA', 'Automatic', 'Medium', 'custom', 'Ford Explorer'),
('SUV', 'JAPAN', 'Automatic', 'Medium', 'none', 'Toyota RAV4'),
('SUV', 'USA', 'Automatic', 'Medium', 'custom', 'Jeep Cherokee'),
('SUV', 'USA', 'Automatic', 'Medium', 'none', 'Chevrolet Tahoe'),
('SUV', 'USA', 'Automatic', 'Medium', 'custom', 'Honda CR-V'),
('Trucks', 'USA', 'Automatic', 'High', 'none', 'F-150'),
('Trucks', 'USA', 'Automatic', 'High', 'custom', 'Chevrolet Silverado'),
('Trucks', 'USA', 'Automatic', 'High', 'none', 'Ram 1500'),
('Trucks', 'USA', 'Automatic', 'High', 'custom', 'GMC Sierra'),
('Trucks', 'USA', 'Automatic', 'High', 'none', 'Toyota Tundra');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
