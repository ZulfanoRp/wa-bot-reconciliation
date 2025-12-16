-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2025 at 04:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `whatsapp_bot`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_activity`
--

CREATE TABLE `log_activity` (
  `log_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `response_result` text DEFAULT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recon_result`
--

CREATE TABLE `recon_result` (
  `rekon_id` int(11) NOT NULL,
  `traffic_id` int(11) NOT NULL,
  `partner_traffic` bigint(20) NOT NULL,
  `selisih` bigint(20) NOT NULL,
  `status_rekon` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `traffic_data`
--

CREATE TABLE `traffic_data` (
  `traffic_id` int(11) NOT NULL,
  `content_id` varchar(50) NOT NULL,
  `event_date` date NOT NULL,
  `traffic` bigint(20) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `traffic_data`
--

INSERT INTO `traffic_data` (`traffic_id`, `content_id`, `event_date`, `traffic`, `created_at`) VALUES
(1, 'cid_video_82055', '2025-08-13', 634, '2025-12-16 22:03:39'),
(2, 'cid_video_82055', '2025-08-31', 297, '2025-12-16 22:03:39'),
(3, 'cid_video_82059', '2025-08-11', 323, '2025-12-16 22:03:39'),
(4, 'cid_video_82061', '2025-08-04', 774, '2025-12-16 22:03:39'),
(5, 'cid_video_82055', '2025-08-01', 881, '2025-12-16 22:03:39'),
(6, 'cid_video_82055', '2025-08-24', 803, '2025-12-16 22:03:39'),
(7, 'cid_video_82055', '2025-08-30', 237, '2025-12-16 22:03:39'),
(8, 'cid_video_82057', '2025-08-25', 300, '2025-12-16 22:03:39'),
(9, 'cid_video_82059', '2025-08-11', 866, '2025-12-16 22:03:39'),
(10, 'cid_video_82055', '2025-08-19', 636, '2025-12-16 22:03:39'),
(11, 'cid_video_82061', '2025-08-04', 142, '2025-12-16 22:03:39'),
(12, 'cid_video_82061', '2025-08-13', 796, '2025-12-16 22:03:39'),
(13, 'cid_video_82055', '2025-08-11', 280, '2025-12-16 22:03:39'),
(14, 'cid_video_82055', '2025-08-26', 115, '2025-12-16 22:03:39'),
(15, 'cid_video_82061', '2025-08-06', 227, '2025-12-16 22:03:39'),
(16, 'cid_video_82059', '2025-08-27', 657, '2025-12-16 22:03:39'),
(17, 'cid_video_82061', '2025-08-06', 822, '2025-12-16 22:03:39'),
(18, 'cid_video_82059', '2025-08-25', 413, '2025-12-16 22:03:39'),
(19, 'cid_video_82055', '2025-08-22', 352, '2025-12-16 22:03:39'),
(20, 'cid_video_82061', '2025-08-12', 927, '2025-12-16 22:03:39'),
(21, 'cid_video_82061', '2025-08-28', 521, '2025-12-16 22:03:39'),
(22, 'cid_video_82061', '2025-08-21', 810, '2025-12-16 22:03:39'),
(23, 'cid_video_82061', '2025-08-31', 545, '2025-12-16 22:03:39'),
(24, 'cid_video_82055', '2025-08-24', 718, '2025-12-16 22:03:39'),
(25, 'cid_video_82061', '2025-08-07', 715, '2025-12-16 22:03:39'),
(26, 'cid_video_82055', '2025-08-11', 608, '2025-12-16 22:03:39'),
(27, 'cid_video_82059', '2025-08-11', 802, '2025-12-16 22:03:39'),
(28, 'cid_video_82059', '2025-08-02', 357, '2025-12-16 22:03:39'),
(29, 'cid_video_82055', '2025-08-24', 121, '2025-12-16 22:03:39'),
(30, 'cid_video_82055', '2025-08-22', 779, '2025-12-16 22:03:39'),
(31, 'cid_video_82061', '2025-08-10', 162, '2025-12-16 22:03:39'),
(32, 'cid_video_82055', '2025-08-17', 665, '2025-12-16 22:03:39'),
(33, 'cid_video_82055', '2025-08-26', 354, '2025-12-16 22:03:39'),
(34, 'cid_video_82061', '2025-08-31', 269, '2025-12-16 22:03:39'),
(35, 'cid_video_82055', '2025-08-18', 650, '2025-12-16 22:03:39'),
(36, 'cid_video_82061', '2025-08-05', 163, '2025-12-16 22:03:39'),
(37, 'cid_video_82055', '2025-08-04', 681, '2025-12-16 22:03:39'),
(38, 'cid_video_82061', '2025-08-04', 259, '2025-12-16 22:03:39'),
(39, 'cid_video_82059', '2025-08-08', 614, '2025-12-16 22:03:39'),
(40, 'cid_video_82061', '2025-08-11', 846, '2025-12-16 22:03:39'),
(41, 'cid_video_82059', '2025-08-29', 488, '2025-12-16 22:03:39'),
(42, 'cid_video_82061', '2025-08-19', 248, '2025-12-16 22:03:39'),
(43, 'cid_video_82061', '2025-08-19', 138, '2025-12-16 22:03:39'),
(44, 'cid_video_82059', '2025-08-29', 445, '2025-12-16 22:03:39'),
(45, 'cid_video_82061', '2025-08-23', 235, '2025-12-16 22:03:39'),
(46, 'cid_video_82061', '2025-08-06', 670, '2025-12-16 22:03:39'),
(47, 'cid_video_82055', '2025-08-17', 362, '2025-12-16 22:03:39'),
(48, 'cid_video_82057', '2025-08-25', 104, '2025-12-16 22:03:39'),
(49, 'cid_video_82055', '2025-08-21', 725, '2025-12-16 22:03:39'),
(50, 'cid_video_82055', '2025-08-09', 939, '2025-12-16 22:03:39'),
(51, 'cid_content_95409', '2025-08-03', 657, '2025-12-16 22:03:39'),
(52, 'cid_content_95410', '2025-08-17', 658, '2025-12-16 22:03:39'),
(53, 'cid_content_95409', '2025-08-23', 183, '2025-12-16 22:03:39'),
(54, 'cid_content_95409', '2025-08-12', 264, '2025-12-16 22:03:39'),
(55, 'cid_content_95408', '2025-08-05', 475, '2025-12-16 22:03:39'),
(56, 'cid_content_85566', '2025-08-31', 949, '2025-12-16 22:03:39'),
(57, 'cid_content_68738', '2025-08-05', 575, '2025-12-16 22:03:39'),
(58, 'cid_content_95410', '2025-08-22', 649, '2025-12-16 22:03:39'),
(59, 'cid_content_95408', '2025-08-30', 128, '2025-12-16 22:03:39'),
(60, 'cid_content_95409', '2025-08-14', 416, '2025-12-16 22:03:39'),
(61, 'cid_content_95408', '2025-08-15', 676, '2025-12-16 22:03:39'),
(62, 'cid_content_95408', '2025-08-28', 282, '2025-12-16 22:03:39'),
(63, 'cid_content_95409', '2025-08-16', 202, '2025-12-16 22:03:39'),
(64, 'cid_content_95408', '2025-08-04', 640, '2025-12-16 22:03:39'),
(65, 'cid_content_85567', '2025-08-23', 580, '2025-12-16 22:03:39'),
(66, 'cid_content_95409', '2025-08-09', 353, '2025-12-16 22:03:39'),
(67, 'cid_content_95408', '2025-08-19', 349, '2025-12-16 22:03:39'),
(68, 'cid_content_95409', '2025-08-30', 937, '2025-12-16 22:03:39'),
(69, 'cid_content_95409', '2025-08-15', 643, '2025-12-16 22:03:39'),
(70, 'cid_content_95409', '2025-08-20', 511, '2025-12-16 22:03:39'),
(71, 'cid_content_85567', '2025-08-02', 798, '2025-12-16 22:03:39'),
(72, 'cid_content_95408', '2025-08-16', 488, '2025-12-16 22:03:39'),
(73, 'cid_content_95408', '2025-08-06', 252, '2025-12-16 22:03:39'),
(74, 'cid_content_85567', '2025-08-22', 531, '2025-12-16 22:03:39'),
(75, 'cid_content_95408', '2025-08-10', 838, '2025-12-16 22:03:39'),
(76, 'cid_content_95408', '2025-08-31', 774, '2025-12-16 22:03:39'),
(77, 'cid_content_95408', '2025-08-06', 202, '2025-12-16 22:03:39'),
(78, 'cid_content_95409', '2025-08-12', 828, '2025-12-16 22:03:39'),
(79, 'cid_content_95409', '2025-08-16', 121, '2025-12-16 22:03:39'),
(80, 'cid_content_95408', '2025-08-13', 348, '2025-12-16 22:03:39'),
(81, 'cid_content_95409', '2025-08-01', 522, '2025-12-16 22:03:39'),
(82, 'cid_content_85566', '2025-08-05', 188, '2025-12-16 22:03:39'),
(83, 'cid_content_85566', '2025-08-06', 186, '2025-12-16 22:03:39'),
(84, 'cid_content_85566', '2025-08-10', 872, '2025-12-16 22:03:39'),
(85, 'cid_content_95408', '2025-08-28', 316, '2025-12-16 22:03:39'),
(86, 'cid_content_95409', '2025-08-16', 400, '2025-12-16 22:03:39'),
(87, 'cid_content_95408', '2025-08-21', 650, '2025-12-16 22:03:39'),
(88, 'cid_content_85566', '2025-08-21', 570, '2025-12-16 22:03:39'),
(89, 'cid_content_95408', '2025-08-11', 752, '2025-12-16 22:03:39'),
(90, 'cid_content_95409', '2025-08-22', 241, '2025-12-16 22:03:39'),
(91, 'cid_content_95408', '2025-08-12', 536, '2025-12-16 22:03:39'),
(92, 'cid_content_95409', '2025-08-22', 233, '2025-12-16 22:03:39'),
(93, 'cid_content_95409', '2025-08-30', 909, '2025-12-16 22:03:39'),
(94, 'cid_content_95408', '2025-08-16', 632, '2025-12-16 22:03:39'),
(95, 'cid_content_95409', '2025-08-16', 500, '2025-12-16 22:03:39'),
(96, 'cid_content_95408', '2025-08-25', 639, '2025-12-16 22:03:39'),
(97, 'cid_content_95408', '2025-08-25', 764, '2025-12-16 22:03:39'),
(98, 'cid_content_68738', '2025-08-12', 803, '2025-12-16 22:03:39'),
(99, 'cid_content_95408', '2025-08-22', 641, '2025-12-16 22:03:39'),
(100, 'cid_content_95408', '2025-08-01', 754, '2025-12-16 22:03:39'),
(101, 'cid_games_94836', '2025-08-05', 229, '2025-12-16 22:03:39'),
(102, 'cid_games_94836', '2025-08-27', 231, '2025-12-16 22:03:39'),
(103, 'cid_games_94836', '2025-08-03', 585, '2025-12-16 22:03:39'),
(104, 'cid_games_71500', '2025-08-02', 666, '2025-12-16 22:03:39'),
(105, 'cid_games_71500', '2025-08-19', 904, '2025-12-16 22:03:39'),
(106, 'cid_games_94836', '2025-08-16', 401, '2025-12-16 22:03:39'),
(107, 'cid_games_71500', '2025-08-06', 884, '2025-12-16 22:03:39'),
(108, 'cid_games_71500', '2025-08-25', 605, '2025-12-16 22:03:39'),
(109, 'cid_games_94836', '2025-08-26', 529, '2025-12-16 22:03:39'),
(110, 'cid_games_71500', '2025-08-13', 172, '2025-12-16 22:03:39'),
(111, 'cid_games_71500', '2025-08-05', 421, '2025-12-16 22:03:39'),
(112, 'cid_games_94836', '2025-08-14', 517, '2025-12-16 22:03:39'),
(113, 'cid_games_94836', '2025-08-31', 673, '2025-12-16 22:03:39'),
(114, 'cid_games_71500', '2025-08-13', 375, '2025-12-16 22:03:39'),
(115, 'cid_games_94836', '2025-08-20', 539, '2025-12-16 22:03:39'),
(116, 'cid_games_94836', '2025-08-31', 535, '2025-12-16 22:03:39'),
(117, 'cid_games_71500', '2025-08-11', 399, '2025-12-16 22:03:39'),
(118, 'cid_games_94836', '2025-08-12', 631, '2025-12-16 22:03:39'),
(119, 'cid_games_71500', '2025-08-25', 420, '2025-12-16 22:03:39'),
(120, 'cid_games_94836', '2025-08-28', 369, '2025-12-16 22:03:39'),
(121, 'cid_games_71500', '2025-08-26', 133, '2025-12-16 22:03:39'),
(122, 'cid_games_94836', '2025-08-20', 889, '2025-12-16 22:03:39'),
(123, 'cid_games_94836', '2025-08-09', 738, '2025-12-16 22:03:39'),
(124, 'cid_games_94836', '2025-08-12', 434, '2025-12-16 22:03:39'),
(125, 'cid_games_71500', '2025-08-12', 496, '2025-12-16 22:03:39'),
(126, 'cid_games_94836', '2025-08-08', 431, '2025-12-16 22:03:39'),
(127, 'cid_games_94836', '2025-08-16', 710, '2025-12-16 22:03:39'),
(128, 'cid_games_94836', '2025-08-18', 145, '2025-12-16 22:03:39'),
(129, 'cid_games_94836', '2025-08-22', 650, '2025-12-16 22:03:39'),
(130, 'cid_games_71500', '2025-08-31', 498, '2025-12-16 22:03:39'),
(131, 'cid_games_94836', '2025-08-25', 892, '2025-12-16 22:03:39'),
(132, 'cid_games_94836', '2025-08-28', 486, '2025-12-16 22:03:39'),
(133, 'cid_games_94836', '2025-08-01', 626, '2025-12-16 22:03:39'),
(134, 'cid_games_94836', '2025-08-21', 682, '2025-12-16 22:03:39'),
(135, 'cid_games_94836', '2025-08-21', 160, '2025-12-16 22:03:39'),
(136, 'cid_games_94836', '2025-08-08', 482, '2025-12-16 22:03:39'),
(137, 'cid_games_94836', '2025-08-28', 822, '2025-12-16 22:03:39'),
(138, 'cid_games_94836', '2025-08-12', 399, '2025-12-16 22:03:39'),
(139, 'cid_games_94836', '2025-08-23', 904, '2025-12-16 22:03:39'),
(140, 'cid_games_94836', '2025-08-01', 644, '2025-12-16 22:03:39'),
(141, 'cid_games_94836', '2025-08-29', 417, '2025-12-16 22:03:39'),
(142, 'cid_games_94836', '2025-08-22', 124, '2025-12-16 22:03:39'),
(143, 'cid_games_94836', '2025-08-15', 495, '2025-12-16 22:03:39'),
(144, 'cid_games_94836', '2025-08-05', 241, '2025-12-16 22:03:39'),
(145, 'cid_games_94836', '2025-08-29', 488, '2025-12-16 22:03:39'),
(146, 'cid_games_94836', '2025-08-18', 537, '2025-12-16 22:03:39'),
(147, 'cid_games_94836', '2025-08-07', 672, '2025-12-16 22:03:39'),
(148, 'cid_games_94836', '2025-08-18', 416, '2025-12-16 22:03:39'),
(149, 'cid_games_94836', '2025-08-19', 429, '2025-12-16 22:03:39'),
(150, 'cid_games_94836', '2025-08-01', 272, '2025-12-16 22:03:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `no_whatsapp` varchar(20) NOT NULL,
  `role` varchar(50) DEFAULT 'user',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `nama`, `no_whatsapp`, `role`, `created_at`) VALUES
(1, 'Admin Sistem', '6281234567890', 'admin', '2025-12-16 21:49:00');

-- --------------------------------------------------------

--
-- Table structure for table `whitelist`
--

CREATE TABLE `whitelist` (
  `whitelist_id` int(11) NOT NULL,
  `no_whatsapp` varchar(20) NOT NULL,
  `status` varchar(20) DEFAULT 'active',
  `user_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `whitelist`
--

INSERT INTO `whitelist` (`whitelist_id`, `no_whatsapp`, `status`, `user_id`, `created_at`) VALUES
(1, '6281234567890', 'active', 1, '2025-12-16 21:50:38'),
(2, '6289876543210', 'inactive', 1, '2025-12-16 21:50:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `fk_log_user` (`user_id`);

--
-- Indexes for table `recon_result`
--
ALTER TABLE `recon_result`
  ADD PRIMARY KEY (`rekon_id`),
  ADD KEY `fk_rekon_traffic` (`traffic_id`);

--
-- Indexes for table `traffic_data`
--
ALTER TABLE `traffic_data`
  ADD PRIMARY KEY (`traffic_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`whitelist_id`),
  ADD KEY `fk_whitelist_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_activity`
--
ALTER TABLE `log_activity`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recon_result`
--
ALTER TABLE `recon_result`
  MODIFY `rekon_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `traffic_data`
--
ALTER TABLE `traffic_data`
  MODIFY `traffic_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `whitelist`
--
ALTER TABLE `whitelist`
  MODIFY `whitelist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_activity`
--
ALTER TABLE `log_activity`
  ADD CONSTRAINT `fk_log_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `recon_result`
--
ALTER TABLE `recon_result`
  ADD CONSTRAINT `fk_rekon_traffic` FOREIGN KEY (`traffic_id`) REFERENCES `traffic_data` (`traffic_id`) ON DELETE CASCADE;

--
-- Constraints for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD CONSTRAINT `fk_whitelist_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
