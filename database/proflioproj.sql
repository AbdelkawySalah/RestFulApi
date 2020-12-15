-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2020 at 11:09 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `proflioproj`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `article_Title` varchar(100) NOT NULL,
  `article_shortdec` varchar(300) NOT NULL,
  `article_Details` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `article_Title`, `article_shortdec`, `article_Details`, `image`, `category_id`, `user_id`) VALUES
(25, 'Hosam Hsaan Fotbal', 'Hossam hassan is good fotbal player Hossam hassan is good fotbal player', 'Hossam hassan is good fotbal player Hossam hassan is good fotbal player Hossam hassan is good fotbal player Hossam hassan is good fotbal player ', 'hosam.jpeg', 27, 1),
(26, 'Mohamed abo Trika egypt player', 'Abou Tarika very good palyer in egypt  Abou Tarika very good palyer in egypt  ', 'Abou Tarika very good palyer in egypt Abou Tarika very good palyer in egypt Abou Tarika very good palyer in egypt Abou Tarika very good palyer in egypt Abou Tarika very good palyer in egypt Abou Tarika very good palyer in egypt ', '220px-Aboutrika2011.jpg', 27, 1),
(27, 'shikabal palyer with more problem', 'Mahoud shikabal palyer with more problem', 'Mahoud shikabal palyer with more problem Mahoud shikabal palyer with more problem Mahoud shikabal palyer with more problem Mahoud shikabal palyer with more problem Mahoud shikabal palyer with more problem Mahoud shikabal palyer with more problem ', 'shika.jpeg', 27, 1),
(28, 'Mohamed zidan player in egypt', 'zidan player in egypt zidan player in egypt ', 'zidan player in egypt zidan player in egypt zidan player in egypt zidan player in egypt zidan player in egypt zidan player in egypt zidan player in egypt zidan player in egypt ', 'zidan.jpeg', 27, 1),
(29, 'train station in menoufia', 'train station in menoufia train station in menoufiatrain station in menoufia', 'train station in menoufiatrain station in menoufiatrain station in menoufiatrain station in menoufiatrain station in menoufia', 'wer.jpeg', 28, 1),
(30, 'roads station in menoufia', 'roads station in menoufia', 'train station in menoufia', 'aad.jpeg', 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `img` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `linkname` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `img`, `icon`, `linkname`, `user_id`) VALUES
(26, 'Home', '', '', 'index', 1),
(27, 'Sports', '', '', 'Sports', 1),
(28, 'Socitey', 'API.JPG', 'Socitey', 'Socitey', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`) VALUES
(1, 'ahmed@yahoo.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
