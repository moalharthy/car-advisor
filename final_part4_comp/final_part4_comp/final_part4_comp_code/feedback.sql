-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2024 at 05:47 PM
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
-- Database: `feedback2`
--

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) DEFAULT NULL,
  `experience` varchar(255) NOT NULL,
  `age` varchar(20) NOT NULL,
  `comments` text DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `news` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `name`, `country`, `experience`, `age`, `comments`, `rating`, `news`) VALUES
(1, 'Mohammed Alharthy', 'Oman', 'excellent', '18to65', 'good', 10, ''),
(2, 'Mohammed Alharthy', 'Oman', 'excellent', '18to65', 'good', 10, ''),
(3, 'Mohammed Alharthy', 'Oman', 'excellent', '18to65', 'good', 10, ''),
(4, 'Mohammed Alharthy', 'Oman', 'excellent', '18to65', '', 10, ''),
(5, 'ali', 'usa', 'good', '18to65', 'good', 8, ''),
(6, 'ali', 'usa', 'good', 'under18', 'good', 8, ''),
(7, 'Mohammed Alharthy', 'Oman', 'excellent', '18to65', 'good', 6, ''),
(8, 'ahmed', 'Oman', 'excellent', '18to65', 'nice', 8, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
