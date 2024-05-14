-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2024 at 07:00 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `x31`
--

-- --------------------------------------------------------

--
-- Table structure for table `car_calculations`
--

CREATE TABLE `car_calculations` (
  `calculation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `car_name` varchar(100) NOT NULL,
  `purchase_price` decimal(10,2) NOT NULL,
  `age_details` int(11) NOT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `calculation_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `car_calculations`
--

INSERT INTO `car_calculations` (`calculation_id`, `user_id`, `car_name`, `purchase_price`, `age_details`, `discount`, `calculation_date`) VALUES
(1, 1, 'Toyota Camry', 25000.00, 70, 500.00, '2024-05-05 13:30:00'),
(2, 2, 'Honda Civic', 22000.00, 27, 0.00, '2024-05-05 13:30:00'),
(3, 3, 'Ford Mustang', 35000.00, 65, 999.99, '2024-05-05 13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback_text` text NOT NULL,
  `submission_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`feedback_id`, `user_id`, `feedback_text`, `submission_date`) VALUES
(1, 1, 'Great website, very informative.', '2024-05-05 13:30:00'),
(2, 2, 'The questionnaire was easy to use.', '2024-05-05 13:30:00'),
(3, 3, 'The car calculations were accurate.', '2024-05-05 13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `fun_scores`
--

CREATE TABLE `fun_scores` (
  `score_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `game_score` int(11) NOT NULL,
  `completion_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fun_scores`
--

INSERT INTO `fun_scores` (`score_id`, `user_id`, `game_score`, `completion_time`) VALUES
(1, 1, 100, '2024-05-05 13:30:00'),
(2, 2, 80, '2024-05-05 13:30:00'),
(3, 3, 90, '2024-05-05 13:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `PASSWORD` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `PASSWORD`) VALUES
(1, 'Mohammed Al Riyam', 's138985@student.squ.edu.om', 'zr3ing.com'),
(2, 'Mohammed AL Harthy', 's138970@student.squ.edu.om', 'harthiiiiiiii.009'),
(3, 'Mohammed AL Tamami', 's141612@student.squ.edu.om', 'suiiiiiiiiiiiiii');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `car_calculations`
--
ALTER TABLE `car_calculations`
  ADD PRIMARY KEY (`calculation_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `fun_scores`
--
ALTER TABLE `fun_scores`
  ADD PRIMARY KEY (`score_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `car_calculations`
--
ALTER TABLE `car_calculations`
  MODIFY `calculation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fun_scores`
--
ALTER TABLE `fun_scores`
  MODIFY `score_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_calculations`
--
ALTER TABLE `car_calculations`
  ADD CONSTRAINT `car_calculations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `fun_scores`
--
ALTER TABLE `fun_scores`
  ADD CONSTRAINT `fun_scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
