-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2024 at 12:20 PM
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
-- Database: `storyclash_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `feeds`
--

CREATE TABLE `feeds` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feeds`
--

INSERT INTO `feeds` (`id`, `name`) VALUES
(1, 'Feed 1'),
(2, 'Feed 2'),
(3, 'Feed 3'),
(4, 'Feed 4'),
(20, 'Feed 20');

-- --------------------------------------------------------

--
-- Table structure for table `feeds_instagram_sources`
--

CREATE TABLE `feeds_instagram_sources` (
  `feed_id` int(11) NOT NULL,
  `instagram_source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feeds_instagram_sources`
--

INSERT INTO `feeds_instagram_sources` (`feed_id`, `instagram_source_id`) VALUES
(20, 19),
(20, 20),
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `feeds_tiktok_sources`
--

CREATE TABLE `feeds_tiktok_sources` (
  `feed_id` int(11) NOT NULL,
  `tiktok_source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feeds_tiktok_sources`
--

INSERT INTO `feeds_tiktok_sources` (`feed_id`, `tiktok_source_id`) VALUES
(20, 19),
(20, 20),
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8);

-- --------------------------------------------------------

--
-- Table structure for table `instagram_sources`
--

CREATE TABLE `instagram_sources` (
  `id` int(11) NOT NULL,
  `fan_count` int(11) NOT NULL CHECK (`fan_count` >= 0),
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `instagram_sources`
--

INSERT INTO `instagram_sources` (`id`, `fan_count`, `name`) VALUES
(1, 1000, 'Instagram Source 1'),
(2, 2000, 'Instagram Source 2'),
(3, 3000, 'Instagram Source 3'),
(4, 4000, 'Instagram Source 4'),
(5, 5000, 'Instagram Source 5'),
(6, 6000, 'Instagram Source 6'),
(7, 7000, 'Instagram Source 7'),
(8, 8000, 'Instagram Source 8'),
(19, 19000, 'Instagram Source 19'),
(20, 20000, 'Instagram Source 20');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `feed_id` int(11) NOT NULL,
  `url` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `feed_id`, `url`) VALUES
(1, 20, 'http://example.com/post11112973412983728'),
(2, 20, 'http://example.com/post11212973412983728'),
(3, 20, 'http://example.com/post11312973412983728'),
(4, 20, 'http://example.com/post11412973412983728'),
(5, 20, 'http://example.com/post11512973412983728'),
(6, 3, 'http://example.com/post41'),
(7, 3, 'http://example.com/post42'),
(8, 3, 'http://example.com/post43'),
(9, 3, 'http://example.com/post44'),
(10, 3, 'http://example.com/post45'),
(11, 4, 'http://example.com/post51'),
(12, 4, 'http://example.com/post52'),
(13, 4, 'http://example.com/post53'),
(14, 4, 'http://example.com/post54'),
(15, 4, 'http://example.com/post55'),
(16, 4, 'http://example.com/post56'),
(17, 4, 'http://example.com/post57'),
(18, 4, 'http://example.com/post58'),
(19, 4, 'http://example.com/post59'),
(20, 4, 'http://example.com/post60');

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
-- Dumping data for table `tiktok_sources`
--

INSERT INTO `tiktok_sources` (`id`, `fan_count`, `name`) VALUES
(1, 500, 'TikTok Source 1'),
(2, 1000, 'TikTok Source 2'),
(3, 1500, 'TikTok Source 3'),
(4, 2000, 'TikTok Source 4'),
(5, 2500, 'TikTok Source 5'),
(6, 3000, 'TikTok Source 6'),
(7, 3500, 'TikTok Source 7'),
(8, 4000, 'TikTok Source 8'),
(19, 9500, 'TikTok Source 19'),
(20, 10000, 'TikTok Source 20');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `instagram_sources`
--
ALTER TABLE `instagram_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tiktok_sources`
--
ALTER TABLE `tiktok_sources`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
