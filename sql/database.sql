-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2024 at 12:30 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `storyclash`
--

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feeds_instagram_sources`
--

CREATE TABLE `feeds_instagram_sources` (
  `feed_id` int(11) NOT NULL,
  `instagram_source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `feeds_tiktok_sources`
--

CREATE TABLE `feeds_tiktok_sources` (
  `feed_id` int(11) NOT NULL,
  `tiktok_source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instagram_sources`
--

CREATE TABLE `instagram_sources` (
  `id` int(11) NOT NULL,
  `fan_count` int(11) NOT NULL CHECK (`fan_count` >= 0),
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `url` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tiktok_sources`
--

CREATE TABLE `tiktok_sources` (
  `id` int(11) NOT NULL,
  `fan_count` int(11) NOT NULL CHECK (`fan_count` >= 0),
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `feeds`
--
ALTER TABLE `feeds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feeds_instagram_sources`
--
ALTER TABLE `feeds_instagram_sources`
  ADD KEY `feed_id` (`feed_id`),
  ADD KEY `instagram_source_id` (`instagram_source_id`);

--
-- Indexes for table `feeds_tiktok_sources`
--
ALTER TABLE `feeds_tiktok_sources`
  ADD KEY `feed_id` (`feed_id`),
  ADD KEY `tiktok_source_id` (`tiktok_source_id`);

--
-- Indexes for table `instagram_sources`
--
ALTER TABLE `instagram_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feed_id` (`feed_id`);

--
-- Indexes for table `tiktok_sources`
--
ALTER TABLE `tiktok_sources`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `feeds`
--
ALTER TABLE `feeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instagram_sources`
--
ALTER TABLE `instagram_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tiktok_sources`
--
ALTER TABLE `tiktok_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `feeds_instagram_sources`
--
ALTER TABLE `feeds_instagram_sources`
  ADD CONSTRAINT `feeds_instagram_sources_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  ADD CONSTRAINT `feeds_instagram_sources_ibfk_2` FOREIGN KEY (`instagram_source_id`) REFERENCES `instagram_sources` (`id`);

--
-- Constraints for table `feeds_tiktok_sources`
--
ALTER TABLE `feeds_tiktok_sources`
  ADD CONSTRAINT `feeds_tiktok_sources_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`),
  ADD CONSTRAINT `feeds_tiktok_sources_ibfk_2` FOREIGN KEY (`tiktok_source_id`) REFERENCES `tiktok_sources` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`feed_id`) REFERENCES `feeds` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
