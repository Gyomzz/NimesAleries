-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 02, 2021 at 10:50 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `NimesaleriesClean`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teaser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id`, `title`, `image`, `ordering`, `description`, `teaser`) VALUES
(7, 'Nouveau compagnon', 'nouveaucompagnon-6194ea94bf41b.jpg', NULL, NULL, NULL),
(8, 'ImageCarou', 'imagecarou-61a3642edd05c.jpg', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int DEFAULT NULL,
  `id_parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `ordering`, `id_parent_id`) VALUES
(1, 'Chien', 1, NULL),
(2, 'Chat', 2, NULL),
(3, 'Oiseau', 5, NULL),
(4, 'Tera', 3, NULL),
(5, 'Aqua', 4, NULL),
(7, 'Alimentation pour chien', NULL, 1),
(8, 'Couchage', NULL, 1),
(9, 'Soin et Hygiene', NULL, 1),
(10, 'Jouets pour chien', NULL, 1),
(11, 'Transport & Sécurité', NULL, 1),
(12, 'Gamelles & distributeurs', NULL, 1),
(13, 'Alimentation pour chat', NULL, 2),
(14, 'Couchage pour chat', NULL, 2),
(16, 'Soin & Hygiène', NULL, 2),
(17, 'Jouets pour chat', NULL, 2),
(18, 'Transport & Sécurité', NULL, 2),
(19, 'Gamelles & distributeurs', NULL, 2),
(20, 'Alimentation pour oiseau', NULL, 3),
(21, 'Voliere', NULL, 3),
(22, 'Poule & basse-cours', NULL, 3),
(23, 'Caisse de transport', NULL, 3),
(24, 'Alimentation poisson', NULL, 5),
(25, 'Aquarium', NULL, 5),
(26, 'Terrarium', NULL, 4),
(27, 'Accessoires pour terrarium', NULL, 4),
(28, 'Décoration aquarium', NULL, 5);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211110115526', '2021-11-10 12:55:37', 53),
('DoctrineMigrations\\Version20211110120011', '2021-11-10 13:00:21', 70),
('DoctrineMigrations\\Version20211111104940', '2021-11-11 11:49:47', 146),
('DoctrineMigrations\\Version20211111105751', '2021-11-11 11:57:57', 125),
('DoctrineMigrations\\Version20211111110348', '2021-11-11 12:03:53', 486),
('DoctrineMigrations\\Version20211111112651', '2021-11-11 12:26:59', 384),
('DoctrineMigrations\\Version20211113220946', '2021-11-13 23:09:58', 237),
('DoctrineMigrations\\Version20211114225348', '2021-11-14 23:54:14', 83),
('DoctrineMigrations\\Version20211116142525', '2021-11-16 15:25:35', 231),
('DoctrineMigrations\\Version20211116145150', '2021-11-16 15:51:57', 245),
('DoctrineMigrations\\Version20211116213057', '2021-11-16 22:31:07', 83),
('DoctrineMigrations\\Version20211116213147', '2021-11-16 22:31:53', 79),
('DoctrineMigrations\\Version20211117133021', '2021-11-17 14:30:29', 153);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `id_user_id` int NOT NULL,
  `status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivery_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validity_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `id_user_id`, `status`, `payment_method`, `created_at`, `delivery_address`, `validity_date`) VALUES
(1, 6, 'delivered', 'cb', NULL, NULL, NULL),
(2, 2, 'accepted', 'paypal', NULL, NULL, NULL),
(3, 67, 'delivered', 'paypal', NULL, NULL, NULL),
(4, 65, 'accepted', 'paypal', NULL, NULL, NULL),
(5, 103, 'in preparation', 'cb', NULL, NULL, NULL),
(6, 43, 'in preparation', 'cb', NULL, NULL, NULL),
(7, 52, NULL, NULL, NULL, NULL, NULL),
(8, 4, NULL, NULL, NULL, NULL, NULL),
(9, 7, 'in preparation', 'paypal', NULL, NULL, NULL),
(10, 43, 'delivered', 'paypal', NULL, NULL, NULL),
(11, 14, 'delivered', 'paypal', NULL, NULL, NULL),
(12, 36, 'delivered', 'paypal', NULL, NULL, NULL),
(13, 47, 'delivered', 'cb', NULL, NULL, NULL),
(14, 14, 'delivered', 'paypal', NULL, NULL, NULL),
(15, 9, 'in preparation', 'paypal', NULL, NULL, NULL),
(16, 34, 'accepted', 'cb', NULL, NULL, NULL),
(17, 43, 'accepted', 'paypal', NULL, NULL, NULL),
(18, 42, NULL, NULL, NULL, NULL, NULL),
(19, 46, 'delivered', 'cb', NULL, NULL, NULL),
(20, 50, 'delivered', 'cb', NULL, NULL, NULL),
(21, 30, 'in preparation', 'cb', NULL, NULL, NULL),
(22, 21, 'delivered', 'cb', NULL, NULL, NULL),
(23, 11, 'in preparation', 'paypal', NULL, NULL, NULL),
(24, 23, NULL, NULL, NULL, NULL, NULL),
(25, 27, NULL, NULL, NULL, NULL, NULL),
(26, 4, 'in preparation', 'cb', NULL, NULL, NULL),
(27, 27, 'in preparation', 'paypal', NULL, NULL, NULL),
(28, 3, 'accepted', 'cb', NULL, NULL, NULL),
(29, 13, NULL, NULL, NULL, NULL, NULL),
(30, 15, 'in preparation', 'paypal', NULL, NULL, NULL),
(31, 47, 'in preparation', 'paypal', NULL, NULL, NULL),
(32, 11, NULL, NULL, NULL, NULL, NULL),
(33, 45, NULL, NULL, NULL, NULL, NULL),
(34, 9, 'accepted', 'paypal', NULL, NULL, NULL),
(35, 27, 'delivered', 'paypal', NULL, NULL, NULL),
(36, 26, 'delivered', 'cb', NULL, NULL, NULL),
(37, 5, 'in preparation', 'cb', NULL, NULL, NULL),
(38, 35, 'delivered', 'paypal', NULL, NULL, NULL),
(39, 24, 'accepted', 'cb', NULL, NULL, NULL),
(40, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(41, 11, 'delivered', 'cb', NULL, NULL, NULL),
(42, 25, NULL, NULL, NULL, NULL, NULL),
(43, 31, 'in preparation', 'cb', NULL, NULL, NULL),
(44, 2, 'in preparation', 'paypal', NULL, NULL, NULL),
(45, 46, 'in preparation', 'cb', NULL, NULL, NULL),
(46, 31, 'in preparation', 'cb', NULL, NULL, NULL),
(47, 18, 'delivered', 'cb', NULL, NULL, NULL),
(48, 35, 'in preparation', 'cb', NULL, NULL, NULL),
(49, 12, NULL, NULL, NULL, NULL, NULL),
(50, 31, 'in preparation', 'paypal', NULL, NULL, NULL),
(51, 30, 'accepted', 'cb', NULL, NULL, NULL),
(52, 17, 'accepted', 'cb', NULL, NULL, NULL),
(53, 1, 'accepted', 'cb', NULL, NULL, NULL),
(54, 7, 'accepted', 'paypal', NULL, NULL, NULL),
(55, 21, 'delivered', 'cb', NULL, NULL, NULL),
(56, 8, NULL, NULL, NULL, NULL, NULL),
(57, 32, 'delivered', 'cb', NULL, NULL, NULL),
(58, 18, 'in preparation', 'paypal', NULL, NULL, NULL),
(59, 24, 'accepted', 'cb', NULL, NULL, NULL),
(60, 7, 'delivered', 'paypal', NULL, NULL, NULL),
(61, 47, 'in preparation', 'paypal', NULL, NULL, NULL),
(62, 28, 'in preparation', 'paypal', NULL, NULL, NULL),
(63, 15, 'delivered', 'cb', NULL, NULL, NULL),
(64, 3, 'in preparation', 'paypal', NULL, NULL, NULL),
(65, 36, 'in preparation', 'cb', NULL, NULL, NULL),
(66, 17, NULL, NULL, NULL, NULL, NULL),
(67, 40, 'in preparation', 'paypal', NULL, NULL, NULL),
(68, 6, NULL, NULL, NULL, NULL, NULL),
(69, 25, 'accepted', 'cb', NULL, NULL, NULL),
(70, 6, 'in preparation', 'paypal', NULL, NULL, NULL),
(71, 9, 'accepted', 'cb', NULL, NULL, NULL),
(72, 5, 'delivered', 'paypal', NULL, NULL, NULL),
(73, 3, 'accepted', 'paypal', NULL, NULL, NULL),
(74, 48, NULL, NULL, NULL, NULL, NULL),
(75, 39, 'in preparation', 'paypal', NULL, NULL, NULL),
(76, 41, 'accepted', 'paypal', NULL, NULL, NULL),
(77, 6, 'accepted', 'paypal', NULL, NULL, NULL),
(78, 10, 'delivered', 'paypal', NULL, NULL, NULL),
(79, 4, NULL, NULL, NULL, NULL, NULL),
(80, 30, 'delivered', 'cb', NULL, NULL, NULL),
(81, 37, 'delivered', 'cb', NULL, NULL, NULL),
(82, 46, 'in preparation', 'cb', NULL, NULL, NULL),
(83, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(84, 38, 'delivered', 'cb', NULL, NULL, NULL),
(85, 7, 'delivered', 'cb', NULL, NULL, NULL),
(86, 11, 'delivered', 'paypal', NULL, NULL, NULL),
(87, 10, 'accepted', 'paypal', NULL, NULL, NULL),
(88, 40, 'delivered', 'cb', NULL, NULL, NULL),
(89, 20, NULL, NULL, NULL, NULL, NULL),
(90, 14, 'accepted', 'cb', NULL, NULL, NULL),
(91, 44, 'accepted', 'cb', NULL, NULL, NULL),
(92, 28, 'delivered', 'paypal', NULL, NULL, NULL),
(93, 23, 'accepted', 'cb', NULL, NULL, NULL),
(94, 28, 'delivered', 'cb', NULL, NULL, NULL),
(95, 10, 'in preparation', 'cb', NULL, NULL, NULL),
(96, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(97, 26, 'in preparation', 'paypal', NULL, NULL, NULL),
(98, 26, 'delivered', 'cb', NULL, NULL, NULL),
(99, 34, 'in preparation', 'paypal', NULL, NULL, NULL),
(100, 42, 'accepted', 'cb', NULL, NULL, NULL),
(101, 30, NULL, NULL, NULL, NULL, NULL),
(102, 32, 'accepted', 'paypal', NULL, NULL, NULL),
(103, 45, 'accepted', 'cb', NULL, NULL, NULL),
(104, 49, 'accepted', 'paypal', NULL, NULL, NULL),
(105, 40, NULL, NULL, NULL, NULL, NULL),
(106, 2, 'accepted', 'cb', NULL, NULL, NULL),
(107, 32, 'accepted', 'paypal', NULL, NULL, NULL),
(108, 50, 'in preparation', 'cb', NULL, NULL, NULL),
(109, 11, 'accepted', 'paypal', NULL, NULL, NULL),
(110, 41, 'accepted', 'cb', NULL, NULL, NULL),
(111, 42, 'accepted', 'paypal', NULL, NULL, NULL),
(112, 14, 'delivered', 'cb', NULL, NULL, NULL),
(113, 48, 'in preparation', 'paypal', NULL, NULL, NULL),
(114, 17, NULL, NULL, NULL, NULL, NULL),
(115, 4, 'accepted', 'paypal', NULL, NULL, NULL),
(116, 26, 'accepted', 'paypal', NULL, NULL, NULL),
(117, 32, 'in preparation', 'cb', NULL, NULL, NULL),
(118, 8, 'delivered', 'cb', NULL, NULL, NULL),
(119, 45, 'accepted', 'cb', NULL, NULL, NULL),
(120, 43, 'accepted', 'paypal', NULL, NULL, NULL),
(121, 50, NULL, NULL, NULL, NULL, NULL),
(122, 47, 'delivered', 'cb', NULL, NULL, NULL),
(123, 10, 'in preparation', 'paypal', NULL, NULL, NULL),
(124, 4, 'delivered', 'paypal', NULL, NULL, NULL),
(125, 22, NULL, NULL, NULL, NULL, NULL),
(126, 2, 'in preparation', 'paypal', NULL, NULL, NULL),
(127, 36, NULL, NULL, NULL, NULL, NULL),
(128, 48, NULL, NULL, NULL, NULL, NULL),
(129, 35, NULL, NULL, NULL, NULL, NULL),
(130, 26, 'accepted', 'cb', NULL, NULL, NULL),
(131, 46, 'accepted', 'cb', NULL, NULL, NULL),
(132, 44, 'accepted', 'cb', NULL, NULL, NULL),
(133, 22, 'delivered', 'cb', NULL, NULL, NULL),
(134, 50, NULL, NULL, NULL, NULL, NULL),
(135, 5, 'delivered', 'cb', NULL, NULL, NULL),
(136, 5, 'accepted', 'paypal', NULL, NULL, NULL),
(137, 13, 'delivered', 'paypal', NULL, NULL, NULL),
(138, 25, 'in preparation', 'paypal', NULL, NULL, NULL),
(139, 15, 'accepted', 'cb', NULL, NULL, NULL),
(140, 23, 'delivered', 'paypal', NULL, NULL, NULL),
(141, 25, NULL, NULL, NULL, NULL, NULL),
(142, 35, 'delivered', 'paypal', NULL, NULL, NULL),
(143, 50, 'in preparation', 'cb', NULL, NULL, NULL),
(144, 4, 'delivered', 'paypal', NULL, NULL, NULL),
(145, 48, 'delivered', 'paypal', NULL, NULL, NULL),
(146, 40, 'in preparation', 'cb', NULL, NULL, NULL),
(147, 5, 'in preparation', 'paypal', NULL, NULL, NULL),
(148, 4, 'accepted', 'paypal', NULL, NULL, NULL),
(149, 22, 'delivered', 'paypal', NULL, NULL, NULL),
(150, 42, 'delivered', 'paypal', NULL, NULL, NULL),
(151, 35, 'delivered', 'paypal', NULL, NULL, NULL),
(152, 12, NULL, NULL, NULL, NULL, NULL),
(153, 42, 'in preparation', 'paypal', NULL, NULL, NULL),
(154, 11, NULL, NULL, NULL, NULL, NULL),
(155, 4, NULL, NULL, NULL, NULL, NULL),
(156, 31, 'accepted', 'paypal', NULL, NULL, NULL),
(157, 6, 'in preparation', 'cb', NULL, NULL, NULL),
(158, 29, 'accepted', 'cb', NULL, NULL, NULL),
(159, 36, 'accepted', 'paypal', NULL, NULL, NULL),
(160, 23, 'in preparation', 'cb', NULL, NULL, NULL),
(161, 29, 'accepted', 'paypal', NULL, NULL, NULL),
(162, 18, 'in preparation', 'paypal', NULL, NULL, NULL),
(163, 1, NULL, NULL, NULL, NULL, NULL),
(164, 14, 'in preparation', 'cb', NULL, NULL, NULL),
(165, 7, 'in preparation', 'paypal', NULL, NULL, NULL),
(166, 44, 'in preparation', 'paypal', NULL, NULL, NULL),
(167, 9, 'accepted', 'cb', NULL, NULL, NULL),
(168, 38, NULL, NULL, NULL, NULL, NULL),
(169, 16, NULL, NULL, NULL, NULL, NULL),
(170, 31, NULL, NULL, NULL, NULL, NULL),
(171, 39, 'delivered', 'paypal', NULL, NULL, NULL),
(172, 23, 'delivered', 'cb', NULL, NULL, NULL),
(173, 7, 'accepted', 'cb', NULL, NULL, NULL),
(174, 33, 'in preparation', 'cb', NULL, NULL, NULL),
(175, 2, 'in preparation', 'cb', NULL, NULL, NULL),
(176, 41, 'delivered', 'paypal', NULL, NULL, NULL),
(177, 49, 'delivered', 'cb', NULL, NULL, NULL),
(178, 31, NULL, NULL, NULL, NULL, NULL),
(179, 16, 'accepted', 'cb', NULL, NULL, NULL),
(180, 41, NULL, NULL, NULL, NULL, NULL),
(181, 30, 'delivered', 'paypal', NULL, NULL, NULL),
(182, 10, 'in preparation', 'paypal', NULL, NULL, NULL),
(183, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(184, 44, NULL, NULL, NULL, NULL, NULL),
(185, 27, 'in preparation', 'cb', NULL, NULL, NULL),
(186, 42, 'accepted', 'cb', NULL, NULL, NULL),
(187, 43, 'in preparation', 'paypal', NULL, NULL, NULL),
(188, 7, 'in preparation', 'paypal', NULL, NULL, NULL),
(189, 27, 'delivered', 'paypal', NULL, NULL, NULL),
(190, 40, 'accepted', 'cb', NULL, NULL, NULL),
(191, 36, 'delivered', 'cb', NULL, NULL, NULL),
(192, 7, 'delivered', 'cb', NULL, NULL, NULL),
(193, 19, 'delivered', 'paypal', NULL, NULL, NULL),
(194, 39, 'delivered', 'paypal', NULL, NULL, NULL),
(195, 40, NULL, NULL, NULL, NULL, NULL),
(196, 49, 'in preparation', 'paypal', NULL, NULL, NULL),
(197, 12, NULL, NULL, NULL, NULL, NULL),
(198, 34, 'in preparation', 'cb', NULL, NULL, NULL),
(199, 6, 'accepted', 'paypal', NULL, NULL, NULL),
(200, 15, 'delivered', 'paypal', NULL, NULL, NULL),
(201, 24, 'accepted', 'cb', NULL, NULL, NULL),
(202, 33, 'accepted', 'cb', NULL, NULL, NULL),
(203, 50, 'accepted', 'cb', NULL, NULL, NULL),
(204, 45, 'accepted', 'cb', NULL, NULL, NULL),
(205, 25, NULL, NULL, NULL, NULL, NULL),
(206, 14, 'accepted', 'cb', NULL, NULL, NULL),
(207, 1, 'in preparation', 'paypal', NULL, NULL, NULL),
(208, 18, 'accepted', 'cb', NULL, NULL, NULL),
(209, 30, NULL, NULL, NULL, NULL, NULL),
(210, 20, 'accepted', 'cb', NULL, NULL, NULL),
(211, 43, 'accepted', 'paypal', NULL, NULL, NULL),
(212, 35, NULL, NULL, NULL, NULL, NULL),
(213, 5, 'accepted', 'paypal', NULL, NULL, NULL),
(214, 29, 'delivered', 'cb', NULL, NULL, NULL),
(215, 20, 'delivered', 'paypal', NULL, NULL, NULL),
(216, 12, NULL, NULL, NULL, NULL, NULL),
(217, 48, NULL, NULL, NULL, NULL, NULL),
(218, 5, 'delivered', 'cb', NULL, NULL, NULL),
(219, 34, 'delivered', 'cb', NULL, NULL, NULL),
(220, 46, 'accepted', 'paypal', NULL, NULL, NULL),
(221, 42, NULL, NULL, NULL, NULL, NULL),
(222, 9, 'accepted', 'paypal', NULL, NULL, NULL),
(223, 15, 'in preparation', 'cb', NULL, NULL, NULL),
(224, 17, 'in preparation', 'cb', NULL, NULL, NULL),
(225, 20, 'in preparation', 'paypal', NULL, NULL, NULL),
(226, 33, 'accepted', 'cb', NULL, NULL, NULL),
(227, 2, NULL, NULL, NULL, NULL, NULL),
(228, 29, 'accepted', 'cb', NULL, NULL, NULL),
(229, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(230, 38, 'accepted', 'cb', NULL, NULL, NULL),
(231, 31, 'delivered', 'cb', NULL, NULL, NULL),
(232, 17, 'delivered', 'cb', NULL, NULL, NULL),
(233, 50, 'accepted', 'paypal', NULL, NULL, NULL),
(234, 36, 'accepted', 'paypal', NULL, NULL, NULL),
(235, 31, 'delivered', 'cb', NULL, NULL, NULL),
(236, 23, 'in preparation', 'cb', NULL, NULL, NULL),
(237, 33, 'in preparation', 'paypal', NULL, NULL, NULL),
(238, 6, 'in preparation', 'paypal', NULL, NULL, NULL),
(239, 4, 'accepted', 'paypal', NULL, NULL, NULL),
(240, 43, 'in preparation', 'cb', NULL, NULL, NULL),
(241, 37, 'accepted', 'paypal', NULL, NULL, NULL),
(242, 49, 'delivered', 'cb', NULL, NULL, NULL),
(243, 17, 'accepted', 'cb', NULL, NULL, NULL),
(244, 33, 'in preparation', 'cb', NULL, NULL, NULL),
(245, 43, 'delivered', 'paypal', NULL, NULL, NULL),
(246, 1, 'in preparation', 'paypal', NULL, NULL, NULL),
(247, 46, 'delivered', 'paypal', NULL, NULL, NULL),
(248, 27, 'accepted', 'cb', NULL, NULL, NULL),
(249, 12, 'in preparation', 'paypal', NULL, NULL, NULL),
(250, 15, NULL, NULL, NULL, NULL, NULL),
(251, 42, 'in preparation', 'paypal', NULL, NULL, NULL),
(252, 41, NULL, NULL, NULL, NULL, NULL),
(253, 11, 'accepted', 'cb', NULL, NULL, NULL),
(254, 36, 'in preparation', 'paypal', NULL, NULL, NULL),
(255, 48, NULL, NULL, NULL, NULL, NULL),
(256, 45, 'accepted', 'cb', NULL, NULL, NULL),
(257, 38, 'in preparation', 'cb', NULL, NULL, NULL),
(258, 32, 'accepted', 'cb', NULL, NULL, NULL),
(259, 21, 'in preparation', 'paypal', NULL, NULL, NULL),
(260, 7, 'accepted', 'paypal', NULL, NULL, NULL),
(261, 33, 'accepted', 'paypal', NULL, NULL, NULL),
(262, 40, 'in preparation', 'paypal', NULL, NULL, NULL),
(263, 10, 'delivered', 'paypal', NULL, NULL, NULL),
(264, 38, 'in preparation', 'cb', NULL, NULL, NULL),
(265, 24, 'in preparation', 'cb', NULL, NULL, NULL),
(266, 17, 'accepted', 'cb', NULL, NULL, NULL),
(267, 41, 'delivered', 'cb', NULL, NULL, NULL),
(268, 28, 'in preparation', 'paypal', NULL, NULL, NULL),
(269, 7, 'accepted', 'paypal', NULL, NULL, NULL),
(270, 50, NULL, NULL, NULL, NULL, NULL),
(271, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(272, 46, 'accepted', 'cb', NULL, NULL, NULL),
(273, 8, 'in preparation', 'cb', NULL, NULL, NULL),
(274, 48, 'delivered', 'paypal', NULL, NULL, NULL),
(275, 17, 'accepted', 'paypal', NULL, NULL, NULL),
(276, 3, 'accepted', 'paypal', NULL, NULL, NULL),
(277, 16, 'in preparation', 'paypal', NULL, NULL, NULL),
(278, 17, 'accepted', 'paypal', NULL, NULL, NULL),
(279, 26, 'delivered', 'paypal', NULL, NULL, NULL),
(280, 26, 'in preparation', 'cb', NULL, NULL, NULL),
(281, 13, NULL, NULL, NULL, NULL, NULL),
(282, 43, NULL, NULL, NULL, NULL, NULL),
(283, 27, 'accepted', 'paypal', NULL, NULL, NULL),
(284, 12, NULL, NULL, NULL, NULL, NULL),
(285, 45, 'accepted', 'paypal', NULL, NULL, NULL),
(286, 42, NULL, NULL, NULL, NULL, NULL),
(287, 35, 'delivered', 'cb', NULL, NULL, NULL),
(288, 15, 'delivered', 'cb', NULL, NULL, NULL),
(289, 3, 'accepted', 'paypal', NULL, NULL, NULL),
(290, 49, NULL, NULL, NULL, NULL, NULL),
(291, 28, 'accepted', 'cb', NULL, NULL, NULL),
(292, 40, 'accepted', 'paypal', NULL, NULL, NULL),
(293, 40, NULL, NULL, NULL, NULL, NULL),
(294, 41, 'delivered', 'paypal', NULL, NULL, NULL),
(295, 44, 'accepted', 'paypal', NULL, NULL, NULL),
(296, 23, NULL, NULL, NULL, NULL, NULL),
(297, 3, 'accepted', 'cb', NULL, NULL, NULL),
(298, 46, 'in preparation', 'cb', NULL, NULL, NULL),
(299, 44, 'accepted', 'cb', NULL, NULL, NULL),
(300, 4, 'delivered', 'cb', NULL, NULL, NULL),
(301, 20, 'in preparation', 'cb', NULL, NULL, NULL),
(302, 13, 'in preparation', 'cb', NULL, NULL, NULL),
(303, 49, 'delivered', 'paypal', NULL, NULL, NULL),
(304, 36, 'accepted', 'paypal', NULL, NULL, NULL),
(305, 31, 'delivered', 'paypal', NULL, NULL, NULL),
(306, 45, NULL, NULL, NULL, NULL, NULL),
(307, 1, NULL, NULL, NULL, NULL, NULL),
(308, 14, NULL, NULL, NULL, NULL, NULL),
(309, 17, NULL, NULL, NULL, NULL, NULL),
(310, 5, 'delivered', 'cb', NULL, NULL, NULL),
(311, 19, 'accepted', 'paypal', NULL, NULL, NULL),
(312, 1, 'delivered', 'paypal', NULL, NULL, NULL),
(313, 30, 'in preparation', 'paypal', NULL, NULL, NULL),
(314, 15, 'accepted', 'cb', NULL, NULL, NULL),
(315, 9, 'in preparation', 'cb', NULL, NULL, NULL),
(316, 35, NULL, NULL, NULL, NULL, NULL),
(317, 18, 'accepted', 'cb', NULL, NULL, NULL),
(318, 28, 'in preparation', 'paypal', NULL, NULL, NULL),
(319, 42, NULL, NULL, NULL, NULL, NULL),
(320, 31, NULL, NULL, NULL, NULL, NULL),
(321, 21, 'in preparation', 'cb', NULL, NULL, NULL),
(322, 29, 'delivered', 'paypal', NULL, NULL, NULL),
(323, 26, 'accepted', 'paypal', NULL, NULL, NULL),
(324, 30, 'in preparation', 'cb', NULL, NULL, NULL),
(325, 21, NULL, NULL, NULL, NULL, NULL),
(326, 10, NULL, NULL, NULL, NULL, NULL),
(327, 12, NULL, NULL, NULL, NULL, NULL),
(328, 7, NULL, NULL, NULL, NULL, NULL),
(329, 46, 'delivered', 'cb', NULL, NULL, NULL),
(330, 18, 'in preparation', 'cb', NULL, NULL, NULL),
(331, 39, 'delivered', 'paypal', NULL, NULL, NULL),
(332, 8, NULL, NULL, NULL, NULL, NULL),
(333, 10, 'in preparation', 'cb', NULL, NULL, NULL),
(334, 40, 'in preparation', 'cb', NULL, NULL, NULL),
(335, 32, 'delivered', 'paypal', NULL, NULL, NULL),
(336, 19, NULL, NULL, NULL, NULL, NULL),
(337, 26, 'accepted', 'paypal', NULL, NULL, NULL),
(338, 41, NULL, NULL, NULL, NULL, NULL),
(339, 42, 'accepted', 'paypal', NULL, NULL, NULL),
(340, 37, 'accepted', 'cb', NULL, NULL, NULL),
(341, 19, 'delivered', 'paypal', NULL, NULL, NULL),
(342, 47, 'in preparation', 'paypal', NULL, NULL, NULL),
(343, 16, NULL, NULL, NULL, NULL, NULL),
(344, 30, 'accepted', 'paypal', NULL, NULL, NULL),
(345, 26, 'in preparation', 'paypal', NULL, NULL, NULL),
(346, 10, 'delivered', 'paypal', NULL, NULL, NULL),
(347, 48, 'delivered', 'cb', NULL, NULL, NULL),
(348, 27, 'in preparation', 'paypal', NULL, NULL, NULL),
(349, 8, 'delivered', 'cb', NULL, NULL, NULL),
(350, 12, 'delivered', 'paypal', NULL, NULL, NULL),
(351, 10, 'delivered', 'paypal', NULL, NULL, NULL),
(352, 12, 'accepted', 'cb', NULL, NULL, NULL),
(353, 11, NULL, NULL, NULL, NULL, NULL),
(354, 1, 'accepted', 'cb', NULL, NULL, NULL),
(355, 47, 'in preparation', 'cb', NULL, NULL, NULL),
(356, 45, NULL, NULL, NULL, NULL, NULL),
(357, 23, 'accepted', 'paypal', NULL, NULL, NULL),
(358, 45, 'accepted', 'paypal', NULL, NULL, NULL),
(359, 9, 'delivered', 'cb', NULL, NULL, NULL),
(360, 6, NULL, NULL, NULL, NULL, NULL),
(361, 25, NULL, NULL, NULL, NULL, NULL),
(362, 28, NULL, NULL, NULL, NULL, NULL),
(363, 18, 'delivered', 'paypal', NULL, NULL, NULL),
(364, 35, 'delivered', 'paypal', NULL, NULL, NULL),
(365, 40, 'delivered', 'paypal', NULL, NULL, NULL),
(366, 4, NULL, NULL, NULL, NULL, NULL),
(367, 23, NULL, NULL, NULL, NULL, NULL),
(368, 30, NULL, NULL, NULL, NULL, NULL),
(369, 14, NULL, NULL, NULL, NULL, NULL),
(370, 22, 'in preparation', 'cb', NULL, NULL, NULL),
(371, 40, 'in preparation', 'cb', NULL, NULL, NULL),
(372, 32, 'in preparation', 'paypal', NULL, NULL, NULL),
(373, 41, NULL, NULL, NULL, NULL, NULL),
(374, 19, 'in preparation', 'cb', NULL, NULL, NULL),
(375, 44, 'in preparation', 'cb', NULL, NULL, NULL),
(376, 30, 'in preparation', 'cb', NULL, NULL, NULL),
(377, 34, 'delivered', 'paypal', NULL, NULL, NULL),
(378, 6, 'accepted', 'paypal', NULL, NULL, NULL),
(379, 33, 'delivered', 'paypal', NULL, NULL, NULL),
(380, 1, 'in preparation', 'cb', NULL, NULL, NULL),
(381, 48, 'in preparation', 'paypal', NULL, NULL, NULL),
(382, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(383, 41, 'in preparation', 'paypal', NULL, NULL, NULL),
(384, 29, 'delivered', 'paypal', NULL, NULL, NULL),
(385, 4, 'in preparation', 'cb', NULL, NULL, NULL),
(386, 41, 'accepted', 'cb', NULL, NULL, NULL),
(387, 7, 'in preparation', 'cb', NULL, NULL, NULL),
(388, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(389, 27, 'delivered', 'cb', NULL, NULL, NULL),
(390, 2, NULL, NULL, NULL, NULL, NULL),
(391, 28, 'accepted', 'cb', NULL, NULL, NULL),
(392, 1, 'in preparation', 'cb', NULL, NULL, NULL),
(393, 18, 'delivered', 'cb', NULL, NULL, NULL),
(394, 43, 'in preparation', 'cb', NULL, NULL, NULL),
(395, 3, NULL, NULL, NULL, NULL, NULL),
(396, 12, 'in preparation', 'paypal', NULL, NULL, NULL),
(397, 28, 'accepted', 'cb', NULL, NULL, NULL),
(398, 37, 'delivered', 'cb', NULL, NULL, NULL),
(399, 41, 'accepted', 'cb', NULL, NULL, NULL),
(400, 15, 'delivered', 'cb', NULL, NULL, NULL),
(401, 50, 'delivered', 'paypal', NULL, NULL, NULL),
(402, 36, 'in preparation', 'paypal', NULL, NULL, NULL),
(403, 35, 'delivered', 'cb', NULL, NULL, NULL),
(404, 9, NULL, NULL, NULL, NULL, NULL),
(405, 48, 'delivered', 'paypal', NULL, NULL, NULL),
(406, 35, NULL, NULL, NULL, NULL, NULL),
(407, 34, 'in preparation', 'paypal', NULL, NULL, NULL),
(408, 44, 'accepted', 'cb', NULL, NULL, NULL),
(409, 48, 'delivered', 'paypal', NULL, NULL, NULL),
(410, 18, 'in preparation', 'paypal', NULL, NULL, NULL),
(411, 42, 'delivered', 'cb', NULL, NULL, NULL),
(412, 35, NULL, NULL, NULL, NULL, NULL),
(413, 13, NULL, NULL, NULL, NULL, NULL),
(414, 15, 'accepted', 'cb', NULL, NULL, NULL),
(415, 48, 'delivered', 'cb', NULL, NULL, NULL),
(416, 36, 'delivered', 'paypal', NULL, NULL, NULL),
(417, 24, 'accepted', 'paypal', NULL, NULL, NULL),
(418, 40, 'accepted', 'cb', NULL, NULL, NULL),
(419, 36, 'delivered', 'cb', NULL, NULL, NULL),
(420, 35, 'accepted', 'cb', NULL, NULL, NULL),
(421, 41, 'accepted', 'paypal', NULL, NULL, NULL),
(422, 2, 'delivered', 'cb', NULL, NULL, NULL),
(423, 27, 'in preparation', 'cb', NULL, NULL, NULL),
(424, 2, 'delivered', 'paypal', NULL, NULL, NULL),
(425, 2, 'accepted', 'paypal', NULL, NULL, NULL),
(426, 5, NULL, NULL, NULL, NULL, NULL),
(427, 14, NULL, NULL, NULL, NULL, NULL),
(428, 44, NULL, NULL, NULL, NULL, NULL),
(429, 21, 'accepted', 'paypal', NULL, NULL, NULL),
(430, 29, 'accepted', 'cb', NULL, NULL, NULL),
(431, 2, 'accepted', 'paypal', NULL, NULL, NULL),
(432, 39, 'accepted', 'cb', NULL, NULL, NULL),
(433, 38, 'delivered', 'cb', NULL, NULL, NULL),
(434, 8, NULL, NULL, NULL, NULL, NULL),
(435, 1, 'accepted', 'paypal', NULL, NULL, NULL),
(436, 39, 'in preparation', 'cb', NULL, NULL, NULL),
(437, 41, 'in preparation', 'cb', NULL, NULL, NULL),
(438, 31, 'in preparation', 'cb', NULL, NULL, NULL),
(439, 11, NULL, NULL, NULL, NULL, NULL),
(440, 46, 'accepted', 'paypal', NULL, NULL, NULL),
(441, 24, 'accepted', 'paypal', NULL, NULL, NULL),
(442, 19, 'delivered', 'cb', NULL, NULL, NULL),
(443, 9, 'delivered', 'cb', NULL, NULL, NULL),
(444, 31, NULL, NULL, NULL, NULL, NULL),
(445, 41, NULL, NULL, NULL, NULL, NULL),
(446, 22, 'in preparation', 'paypal', NULL, NULL, NULL),
(447, 36, 'in preparation', 'paypal', NULL, NULL, NULL),
(448, 9, 'delivered', 'paypal', NULL, NULL, NULL),
(449, 15, 'accepted', 'cb', NULL, NULL, NULL),
(450, 9, 'in preparation', 'cb', NULL, NULL, NULL),
(451, 38, 'in preparation', 'cb', NULL, NULL, NULL),
(452, 23, NULL, NULL, NULL, NULL, NULL),
(453, 30, 'delivered', 'cb', NULL, NULL, NULL),
(454, 17, 'in preparation', 'paypal', NULL, NULL, NULL),
(455, 19, 'accepted', 'paypal', NULL, NULL, NULL),
(456, 6, NULL, NULL, NULL, NULL, NULL),
(457, 20, NULL, NULL, NULL, NULL, NULL),
(458, 6, NULL, NULL, NULL, NULL, NULL),
(459, 7, NULL, NULL, NULL, NULL, NULL),
(460, 41, NULL, NULL, NULL, NULL, NULL),
(461, 31, 'accepted', 'cb', NULL, NULL, NULL),
(462, 11, 'in preparation', 'paypal', NULL, NULL, NULL),
(463, 42, 'delivered', 'cb', NULL, NULL, NULL),
(464, 4, 'accepted', 'cb', NULL, NULL, NULL),
(465, 42, NULL, NULL, NULL, NULL, NULL),
(466, 30, 'in preparation', 'cb', NULL, NULL, NULL),
(467, 40, 'accepted', 'cb', NULL, NULL, NULL),
(468, 31, 'in preparation', 'cb', NULL, NULL, NULL),
(469, 27, 'delivered', 'cb', NULL, NULL, NULL),
(470, 20, 'delivered', 'paypal', NULL, NULL, NULL),
(471, 6, NULL, NULL, NULL, NULL, NULL),
(472, 44, NULL, NULL, NULL, NULL, NULL),
(473, 19, 'delivered', 'paypal', NULL, NULL, NULL),
(474, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(475, 38, 'in preparation', 'cb', NULL, NULL, NULL),
(476, 5, 'in preparation', 'cb', NULL, NULL, NULL),
(477, 19, 'in preparation', 'paypal', NULL, NULL, NULL),
(478, 22, NULL, NULL, NULL, NULL, NULL),
(479, 20, 'delivered', 'cb', NULL, NULL, NULL),
(480, 20, 'delivered', 'paypal', NULL, NULL, NULL),
(481, 2, 'delivered', 'paypal', NULL, NULL, NULL),
(482, 2, 'accepted', 'paypal', NULL, NULL, NULL),
(483, 39, 'in preparation', 'paypal', NULL, NULL, NULL),
(484, 10, 'delivered', 'paypal', NULL, NULL, NULL),
(485, 33, 'delivered', 'cb', NULL, NULL, NULL),
(486, 46, 'accepted', 'paypal', NULL, NULL, NULL),
(487, 12, NULL, NULL, NULL, NULL, NULL),
(488, 48, 'in preparation', 'paypal', NULL, NULL, NULL),
(489, 35, 'in preparation', 'cb', NULL, NULL, NULL),
(490, 1, NULL, NULL, NULL, NULL, NULL),
(491, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(492, 13, 'accepted', 'cb', NULL, NULL, NULL),
(493, 42, 'accepted', 'paypal', NULL, NULL, NULL),
(494, 49, 'delivered', 'cb', NULL, NULL, NULL),
(495, 4, 'delivered', 'paypal', NULL, NULL, NULL),
(496, 12, 'delivered', 'cb', NULL, NULL, NULL),
(497, 21, 'delivered', 'paypal', NULL, NULL, NULL),
(498, 20, NULL, NULL, NULL, NULL, NULL),
(499, 23, 'delivered', 'cb', NULL, NULL, NULL),
(500, 1, NULL, NULL, NULL, NULL, NULL),
(501, 12, 'delivered', 'paypal', NULL, NULL, NULL),
(502, 34, 'delivered', 'paypal', NULL, NULL, NULL),
(503, 25, 'in preparation', 'cb', NULL, NULL, NULL),
(504, 28, NULL, NULL, NULL, NULL, NULL),
(505, 12, NULL, NULL, NULL, NULL, NULL),
(506, 21, 'accepted', 'cb', NULL, NULL, NULL),
(507, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(508, 5, 'in preparation', 'paypal', NULL, NULL, NULL),
(509, 50, 'in preparation', 'cb', NULL, NULL, NULL),
(510, 10, 'delivered', 'cb', NULL, NULL, NULL),
(511, 44, NULL, NULL, NULL, NULL, NULL),
(512, 37, 'delivered', 'paypal', NULL, NULL, NULL),
(513, 14, NULL, NULL, NULL, NULL, NULL),
(514, 37, 'delivered', 'paypal', NULL, NULL, NULL),
(515, 47, NULL, NULL, NULL, NULL, NULL),
(516, 19, 'delivered', 'cb', NULL, NULL, NULL),
(517, 7, NULL, NULL, NULL, NULL, NULL),
(518, 50, 'delivered', 'cb', NULL, NULL, NULL),
(519, 45, 'accepted', 'cb', NULL, NULL, NULL),
(520, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(521, 44, NULL, NULL, NULL, NULL, NULL),
(522, 19, 'delivered', 'paypal', NULL, NULL, NULL),
(523, 30, 'in preparation', 'cb', NULL, NULL, NULL),
(524, 30, NULL, NULL, NULL, NULL, NULL),
(525, 30, 'in preparation', 'paypal', NULL, NULL, NULL),
(526, 4, 'accepted', 'cb', NULL, NULL, NULL),
(527, 12, 'accepted', 'paypal', NULL, NULL, NULL),
(528, 4, NULL, NULL, NULL, NULL, NULL),
(529, 18, NULL, NULL, NULL, NULL, NULL),
(530, 4, 'in preparation', 'paypal', NULL, NULL, NULL),
(531, 12, NULL, NULL, NULL, NULL, NULL),
(532, 14, 'in preparation', 'cb', NULL, NULL, NULL),
(533, 9, 'delivered', 'cb', NULL, NULL, NULL),
(534, 33, 'accepted', 'paypal', NULL, NULL, NULL),
(535, 40, 'accepted', 'paypal', NULL, NULL, NULL),
(536, 10, 'delivered', 'cb', NULL, NULL, NULL),
(537, 39, 'accepted', 'paypal', NULL, NULL, NULL),
(538, 12, NULL, NULL, NULL, NULL, NULL),
(539, 23, 'delivered', 'paypal', NULL, NULL, NULL),
(540, 4, 'delivered', 'paypal', NULL, NULL, NULL),
(541, 46, NULL, NULL, NULL, NULL, NULL),
(542, 24, 'delivered', 'cb', NULL, NULL, NULL),
(543, 29, 'in preparation', 'paypal', NULL, NULL, NULL),
(544, 33, 'delivered', 'paypal', NULL, NULL, NULL),
(545, 15, 'in preparation', 'paypal', NULL, NULL, NULL),
(546, 2, 'delivered', 'cb', NULL, NULL, NULL),
(547, 32, 'accepted', 'paypal', NULL, NULL, NULL),
(548, 9, 'accepted', 'cb', NULL, NULL, NULL),
(549, 40, 'delivered', 'cb', NULL, NULL, NULL),
(550, 21, 'delivered', 'cb', NULL, NULL, NULL),
(551, 7, 'accepted', 'paypal', NULL, NULL, NULL),
(552, 31, 'in preparation', 'paypal', NULL, NULL, NULL),
(553, 33, 'accepted', 'cb', NULL, NULL, NULL),
(554, 43, NULL, NULL, NULL, NULL, NULL),
(555, 3, NULL, NULL, NULL, NULL, NULL),
(556, 2, 'accepted', 'paypal', NULL, NULL, NULL),
(557, 33, 'delivered', 'paypal', NULL, NULL, NULL),
(558, 7, 'in preparation', 'paypal', NULL, NULL, NULL),
(559, 15, 'delivered', 'cb', NULL, NULL, NULL),
(560, 5, NULL, NULL, NULL, NULL, NULL),
(561, 6, 'in preparation', 'cb', NULL, NULL, NULL),
(562, 33, NULL, NULL, NULL, NULL, NULL),
(563, 27, NULL, NULL, NULL, NULL, NULL),
(564, 27, NULL, NULL, NULL, NULL, NULL),
(565, 28, 'delivered', 'paypal', NULL, NULL, NULL),
(566, 10, 'in preparation', 'cb', NULL, NULL, NULL),
(567, 8, 'delivered', 'cb', NULL, NULL, NULL),
(568, 4, 'delivered', 'cb', NULL, NULL, NULL),
(569, 34, NULL, NULL, NULL, NULL, NULL),
(570, 1, NULL, NULL, NULL, NULL, NULL),
(571, 19, 'delivered', 'cb', NULL, NULL, NULL),
(572, 34, 'accepted', 'paypal', NULL, NULL, NULL),
(573, 7, 'accepted', 'cb', NULL, NULL, NULL),
(574, 24, 'in preparation', 'cb', NULL, NULL, NULL),
(575, 44, 'delivered', 'paypal', NULL, NULL, NULL),
(576, 18, 'accepted', 'paypal', NULL, NULL, NULL),
(577, 12, 'delivered', 'cb', NULL, NULL, NULL),
(578, 29, 'delivered', 'paypal', NULL, NULL, NULL),
(579, 3, 'accepted', 'paypal', NULL, NULL, NULL),
(580, 36, 'in preparation', 'paypal', NULL, NULL, NULL),
(581, 29, 'accepted', 'cb', NULL, NULL, NULL),
(582, 9, NULL, NULL, NULL, NULL, NULL),
(583, 44, NULL, NULL, NULL, NULL, NULL),
(584, 18, NULL, NULL, NULL, NULL, NULL),
(585, 2, NULL, NULL, NULL, NULL, NULL),
(586, 8, 'in preparation', 'cb', NULL, NULL, NULL),
(587, 34, 'in preparation', 'cb', NULL, NULL, NULL),
(588, 39, 'accepted', 'cb', NULL, NULL, NULL),
(589, 38, 'accepted', 'cb', NULL, NULL, NULL),
(590, 1, 'accepted', 'cb', NULL, NULL, NULL),
(591, 46, 'delivered', 'cb', NULL, NULL, NULL),
(592, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(593, 3, NULL, NULL, NULL, NULL, NULL),
(594, 26, NULL, NULL, NULL, NULL, NULL),
(595, 39, 'accepted', 'paypal', NULL, NULL, NULL),
(596, 39, 'accepted', 'paypal', NULL, NULL, NULL),
(597, 50, 'in preparation', 'paypal', NULL, NULL, NULL),
(598, 9, NULL, NULL, NULL, NULL, NULL),
(599, 12, 'in preparation', 'paypal', NULL, NULL, NULL),
(600, 8, 'accepted', 'paypal', NULL, NULL, NULL),
(601, 24, NULL, NULL, NULL, NULL, NULL),
(602, 2, 'in preparation', 'cb', NULL, NULL, NULL),
(603, 21, NULL, NULL, NULL, NULL, NULL),
(604, 13, 'in preparation', 'paypal', NULL, NULL, NULL),
(605, 25, NULL, NULL, NULL, NULL, NULL),
(606, 4, 'in preparation', 'cb', NULL, NULL, NULL),
(607, 16, 'accepted', 'cb', NULL, NULL, NULL),
(608, 49, 'accepted', 'cb', NULL, NULL, NULL),
(609, 23, 'delivered', 'paypal', NULL, NULL, NULL),
(610, 9, 'delivered', 'paypal', NULL, NULL, NULL),
(611, 32, 'in preparation', 'paypal', NULL, NULL, NULL),
(612, 3, 'delivered', 'cb', NULL, NULL, NULL),
(613, 50, 'delivered', 'cb', NULL, NULL, NULL),
(614, 16, 'accepted', 'cb', NULL, NULL, NULL),
(615, 5, 'delivered', 'paypal', NULL, NULL, NULL),
(616, 11, 'in preparation', 'paypal', NULL, NULL, NULL),
(617, 15, 'delivered', 'paypal', NULL, NULL, NULL),
(618, 48, 'accepted', 'cb', NULL, NULL, NULL),
(619, 29, 'delivered', 'paypal', NULL, NULL, NULL),
(620, 11, 'in preparation', 'paypal', NULL, NULL, NULL),
(621, 27, NULL, NULL, NULL, NULL, NULL),
(622, 24, 'in preparation', 'paypal', NULL, NULL, NULL),
(623, 40, NULL, NULL, NULL, NULL, NULL),
(624, 40, 'accepted', 'paypal', NULL, NULL, NULL),
(625, 38, 'in preparation', 'cb', NULL, NULL, NULL),
(626, 37, 'in preparation', 'paypal', NULL, NULL, NULL),
(627, 46, 'accepted', 'paypal', NULL, NULL, NULL),
(628, 2, 'in preparation', 'paypal', NULL, NULL, NULL),
(629, 6, 'in preparation', 'cb', NULL, NULL, NULL),
(630, 19, 'in preparation', 'paypal', NULL, NULL, NULL),
(631, 1, 'delivered', 'paypal', NULL, NULL, NULL),
(632, 17, NULL, NULL, NULL, NULL, NULL),
(633, 39, 'in preparation', 'paypal', NULL, NULL, NULL),
(634, 28, 'in preparation', 'cb', NULL, NULL, NULL),
(635, 1, 'delivered', 'cb', NULL, NULL, NULL),
(636, 20, 'in preparation', 'paypal', NULL, NULL, NULL),
(637, 33, 'delivered', 'paypal', NULL, NULL, NULL),
(638, 14, 'in preparation', 'paypal', NULL, NULL, NULL),
(639, 39, NULL, NULL, NULL, NULL, NULL),
(640, 17, 'accepted', 'paypal', NULL, NULL, NULL),
(641, 15, 'delivered', 'paypal', NULL, NULL, NULL),
(642, 48, NULL, NULL, NULL, NULL, NULL),
(643, 26, 'in preparation', 'paypal', NULL, NULL, NULL),
(644, 20, 'delivered', 'cb', NULL, NULL, NULL),
(645, 4, 'delivered', 'cb', NULL, NULL, NULL),
(646, 50, 'in preparation', 'cb', NULL, NULL, NULL),
(647, 1, 'delivered', 'paypal', NULL, NULL, NULL),
(648, 12, NULL, NULL, NULL, NULL, NULL),
(649, 18, 'in preparation', 'paypal', NULL, NULL, NULL),
(650, 39, 'accepted', 'cb', NULL, NULL, NULL),
(651, 41, 'delivered', 'paypal', NULL, NULL, NULL),
(652, 36, NULL, NULL, NULL, NULL, NULL),
(653, 48, NULL, NULL, NULL, NULL, NULL),
(654, 4, 'in preparation', 'paypal', NULL, NULL, NULL),
(655, 24, 'accepted', 'cb', NULL, NULL, NULL),
(656, 31, NULL, NULL, NULL, NULL, NULL),
(657, 28, NULL, NULL, NULL, NULL, NULL),
(658, 24, 'in preparation', 'paypal', NULL, NULL, NULL),
(659, 32, 'accepted', 'paypal', NULL, NULL, NULL),
(660, 13, 'accepted', 'cb', NULL, NULL, NULL),
(661, 13, 'delivered', 'paypal', NULL, NULL, NULL),
(662, 16, 'in preparation', 'paypal', NULL, NULL, NULL),
(663, 4, 'in preparation', 'paypal', NULL, NULL, NULL),
(664, 45, 'in preparation', 'cb', NULL, NULL, NULL),
(665, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(666, 41, 'delivered', 'paypal', NULL, NULL, NULL),
(667, 29, NULL, NULL, NULL, NULL, NULL),
(668, 32, NULL, NULL, NULL, NULL, NULL),
(669, 21, 'in preparation', 'cb', NULL, NULL, NULL),
(670, 24, 'in preparation', 'cb', NULL, NULL, NULL),
(671, 45, 'delivered', 'paypal', NULL, NULL, NULL),
(672, 21, NULL, NULL, NULL, NULL, NULL),
(673, 16, 'accepted', 'paypal', NULL, NULL, NULL),
(674, 33, 'accepted', 'cb', NULL, NULL, NULL),
(675, 17, 'accepted', 'paypal', NULL, NULL, NULL),
(676, 7, 'in preparation', 'cb', NULL, NULL, NULL),
(677, 29, 'delivered', 'cb', NULL, NULL, NULL),
(678, 42, 'accepted', 'paypal', NULL, NULL, NULL),
(679, 22, 'in preparation', 'paypal', NULL, NULL, NULL),
(680, 40, NULL, NULL, NULL, NULL, NULL),
(681, 37, 'delivered', 'paypal', NULL, NULL, NULL),
(682, 45, 'accepted', 'cb', NULL, NULL, NULL),
(683, 5, 'accepted', 'cb', NULL, NULL, NULL),
(684, 47, 'in preparation', 'cb', NULL, NULL, NULL),
(685, 7, 'accepted', 'cb', NULL, NULL, NULL),
(686, 10, 'accepted', 'paypal', NULL, NULL, NULL),
(687, 22, NULL, NULL, NULL, NULL, NULL),
(688, 15, 'delivered', 'cb', NULL, NULL, NULL),
(689, 5, 'in preparation', 'cb', NULL, NULL, NULL),
(690, 25, 'delivered', 'paypal', NULL, NULL, NULL),
(691, 18, 'accepted', 'paypal', NULL, NULL, NULL),
(692, 26, 'delivered', 'cb', NULL, NULL, NULL),
(693, 2, 'accepted', 'paypal', NULL, NULL, NULL),
(694, 21, NULL, NULL, NULL, NULL, NULL),
(695, 34, 'delivered', 'paypal', NULL, NULL, NULL),
(696, 31, 'in preparation', 'paypal', NULL, NULL, NULL),
(697, 47, 'delivered', 'paypal', NULL, NULL, NULL),
(698, 32, 'accepted', 'paypal', NULL, NULL, NULL),
(699, 26, 'delivered', 'cb', NULL, NULL, NULL),
(700, 47, 'in preparation', 'paypal', NULL, NULL, NULL),
(701, 4, 'in preparation', 'cb', NULL, NULL, NULL),
(702, 5, NULL, NULL, NULL, NULL, NULL),
(703, 13, NULL, NULL, NULL, NULL, NULL),
(704, 13, NULL, NULL, NULL, NULL, NULL),
(705, 30, 'delivered', 'cb', NULL, NULL, NULL),
(706, 11, NULL, NULL, NULL, NULL, NULL),
(707, 14, 'in preparation', 'paypal', NULL, NULL, NULL),
(708, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(709, 42, 'delivered', 'paypal', NULL, NULL, NULL),
(710, 29, 'in preparation', 'cb', NULL, NULL, NULL),
(711, 39, 'accepted', 'paypal', NULL, NULL, NULL),
(712, 3, 'delivered', 'cb', NULL, NULL, NULL),
(713, 26, 'accepted', 'paypal', NULL, NULL, NULL),
(714, 13, NULL, NULL, NULL, NULL, NULL),
(715, 36, 'in preparation', 'cb', NULL, NULL, NULL),
(716, 3, 'accepted', 'paypal', NULL, NULL, NULL),
(717, 26, 'delivered', 'paypal', NULL, NULL, NULL),
(718, 20, 'in preparation', 'cb', NULL, NULL, NULL),
(719, 39, NULL, NULL, NULL, NULL, NULL),
(720, 14, 'accepted', 'cb', NULL, NULL, NULL),
(721, 24, NULL, NULL, NULL, NULL, NULL),
(722, 45, 'accepted', 'cb', NULL, NULL, NULL),
(723, 41, NULL, NULL, NULL, NULL, NULL),
(724, 39, NULL, NULL, NULL, NULL, NULL),
(725, 11, NULL, NULL, NULL, NULL, NULL),
(726, 22, 'delivered', 'cb', NULL, NULL, NULL),
(727, 49, 'accepted', 'cb', NULL, NULL, NULL),
(728, 31, 'in preparation', 'cb', NULL, NULL, NULL),
(729, 1, 'delivered', 'paypal', NULL, NULL, NULL),
(730, 16, 'accepted', 'cb', NULL, NULL, NULL),
(731, 22, 'accepted', 'cb', NULL, NULL, NULL),
(732, 26, 'in preparation', 'cb', NULL, NULL, NULL),
(733, 44, 'in preparation', 'paypal', NULL, NULL, NULL),
(734, 46, 'delivered', 'paypal', NULL, NULL, NULL),
(735, 14, 'delivered', 'cb', NULL, NULL, NULL),
(736, 19, 'accepted', 'cb', NULL, NULL, NULL),
(737, 50, NULL, NULL, NULL, NULL, NULL),
(738, 14, 'accepted', 'cb', NULL, NULL, NULL),
(739, 31, 'in preparation', 'paypal', NULL, NULL, NULL),
(740, 39, 'in preparation', 'cb', NULL, NULL, NULL),
(741, 12, 'in preparation', 'cb', NULL, NULL, NULL),
(742, 30, 'in preparation', 'paypal', NULL, NULL, NULL),
(743, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(744, 9, 'in preparation', 'paypal', NULL, NULL, NULL),
(745, 14, 'in preparation', 'cb', NULL, NULL, NULL),
(746, 9, 'in preparation', 'cb', NULL, NULL, NULL),
(747, 8, 'accepted', 'paypal', NULL, NULL, NULL),
(748, 5, NULL, NULL, NULL, NULL, NULL),
(749, 20, 'delivered', 'paypal', NULL, NULL, NULL),
(750, 15, NULL, NULL, NULL, NULL, NULL),
(751, 33, 'in preparation', 'paypal', NULL, NULL, NULL),
(752, 49, 'accepted', 'cb', NULL, NULL, NULL),
(753, 7, 'in preparation', 'cb', NULL, NULL, NULL),
(754, 12, NULL, NULL, NULL, NULL, NULL),
(755, 31, 'in preparation', 'paypal', NULL, NULL, NULL),
(756, 3, NULL, NULL, NULL, NULL, NULL),
(757, 32, 'in preparation', 'paypal', NULL, NULL, NULL),
(758, 15, 'delivered', 'paypal', NULL, NULL, NULL),
(759, 3, 'accepted', 'paypal', NULL, NULL, NULL),
(760, 42, NULL, NULL, NULL, NULL, NULL),
(761, 44, 'delivered', 'cb', NULL, NULL, NULL),
(762, 1, NULL, NULL, NULL, NULL, NULL),
(763, 10, 'in preparation', 'cb', NULL, NULL, NULL),
(764, 26, 'accepted', 'paypal', NULL, NULL, NULL),
(765, 11, 'in preparation', 'paypal', NULL, NULL, NULL),
(766, 6, 'in preparation', 'cb', NULL, NULL, NULL),
(767, 35, NULL, NULL, NULL, NULL, NULL),
(768, 14, NULL, NULL, NULL, NULL, NULL),
(769, 40, NULL, NULL, NULL, NULL, NULL),
(770, 1, 'in preparation', 'paypal', NULL, NULL, NULL),
(771, 32, 'delivered', 'cb', NULL, NULL, NULL),
(772, 31, NULL, NULL, NULL, NULL, NULL),
(773, 3, 'in preparation', 'cb', NULL, NULL, NULL),
(774, 23, 'delivered', 'paypal', NULL, NULL, NULL),
(775, 43, NULL, NULL, NULL, NULL, NULL),
(776, 9, 'accepted', 'paypal', NULL, NULL, NULL),
(777, 29, 'delivered', 'paypal', NULL, NULL, NULL),
(778, 25, 'in preparation', 'cb', NULL, NULL, NULL),
(779, 8, 'in preparation', 'paypal', NULL, NULL, NULL),
(780, 43, 'in preparation', 'cb', NULL, NULL, NULL),
(781, 24, NULL, NULL, NULL, NULL, NULL),
(782, 23, NULL, NULL, NULL, NULL, NULL),
(783, 35, NULL, NULL, NULL, NULL, NULL),
(784, 5, NULL, NULL, NULL, NULL, NULL),
(785, 47, 'accepted', 'paypal', NULL, NULL, NULL),
(786, 46, NULL, NULL, NULL, NULL, NULL),
(787, 50, NULL, NULL, NULL, NULL, NULL),
(788, 11, 'in preparation', 'paypal', NULL, NULL, NULL),
(789, 5, 'accepted', 'paypal', NULL, NULL, NULL),
(790, 16, NULL, NULL, NULL, NULL, NULL),
(791, 9, 'delivered', 'cb', NULL, NULL, NULL),
(792, 35, NULL, NULL, NULL, NULL, NULL),
(793, 34, NULL, NULL, NULL, NULL, NULL),
(794, 49, 'accepted', 'paypal', NULL, NULL, NULL),
(795, 48, NULL, NULL, NULL, NULL, NULL),
(796, 23, 'in preparation', 'cb', NULL, NULL, NULL),
(797, 37, 'in preparation', 'cb', NULL, NULL, NULL),
(798, 2, 'delivered', 'cb', NULL, NULL, NULL),
(799, 16, 'accepted', 'cb', NULL, NULL, NULL),
(800, 23, 'in preparation', 'paypal', NULL, NULL, NULL),
(801, 41, NULL, NULL, NULL, NULL, NULL),
(802, 43, NULL, NULL, NULL, NULL, NULL),
(803, 41, 'accepted', 'paypal', NULL, NULL, NULL),
(804, 6, 'accepted', 'paypal', NULL, NULL, NULL),
(805, 18, 'accepted', 'paypal', NULL, NULL, NULL),
(806, 10, 'in preparation', 'cb', NULL, NULL, NULL),
(807, 29, NULL, NULL, NULL, NULL, NULL),
(808, 16, 'delivered', 'paypal', NULL, NULL, NULL),
(809, 44, 'accepted', 'paypal', NULL, NULL, NULL),
(810, 46, 'accepted', 'paypal', NULL, NULL, NULL),
(811, 48, 'delivered', 'cb', NULL, NULL, NULL),
(812, 33, NULL, NULL, NULL, NULL, NULL),
(813, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(814, 2, 'delivered', 'cb', NULL, NULL, NULL),
(815, 10, 'accepted', 'paypal', NULL, NULL, NULL),
(816, 42, 'in preparation', 'cb', NULL, NULL, NULL),
(817, 47, 'accepted', 'cb', NULL, NULL, NULL),
(818, 26, 'accepted', 'cb', NULL, NULL, NULL),
(819, 40, 'accepted', 'cb', NULL, NULL, NULL),
(820, 11, 'delivered', 'paypal', NULL, NULL, NULL),
(821, 47, 'delivered', 'paypal', NULL, NULL, NULL),
(822, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(823, 32, NULL, NULL, NULL, NULL, NULL),
(824, 10, NULL, NULL, NULL, NULL, NULL),
(825, 4, 'delivered', 'cb', NULL, NULL, NULL),
(826, 43, NULL, NULL, NULL, NULL, NULL),
(827, 25, NULL, NULL, NULL, NULL, NULL),
(828, 33, 'accepted', 'cb', NULL, NULL, NULL),
(829, 18, 'accepted', 'cb', NULL, NULL, NULL),
(830, 45, NULL, NULL, NULL, NULL, NULL),
(831, 21, 'in preparation', 'paypal', NULL, NULL, NULL),
(832, 43, 'delivered', 'paypal', NULL, NULL, NULL),
(833, 35, 'accepted', 'paypal', NULL, NULL, NULL),
(834, 42, 'in preparation', 'paypal', NULL, NULL, NULL),
(835, 33, 'delivered', 'cb', NULL, NULL, NULL),
(836, 40, NULL, NULL, NULL, NULL, NULL),
(837, 14, 'accepted', 'paypal', NULL, NULL, NULL),
(838, 44, 'in preparation', 'cb', NULL, NULL, NULL),
(839, 14, NULL, NULL, NULL, NULL, NULL),
(840, 4, 'accepted', 'cb', NULL, NULL, NULL),
(841, 50, 'in preparation', 'cb', NULL, NULL, NULL),
(842, 4, NULL, NULL, NULL, NULL, NULL),
(843, 21, NULL, NULL, NULL, NULL, NULL),
(844, 22, 'delivered', 'cb', NULL, NULL, NULL),
(845, 3, NULL, NULL, NULL, NULL, NULL),
(846, 41, 'in preparation', 'cb', NULL, NULL, NULL),
(847, 16, NULL, NULL, NULL, NULL, NULL),
(848, 48, NULL, NULL, NULL, NULL, NULL),
(849, 42, NULL, NULL, NULL, NULL, NULL),
(850, 33, 'accepted', 'cb', NULL, NULL, NULL),
(851, 42, 'accepted', 'paypal', NULL, NULL, NULL),
(852, 47, 'delivered', 'paypal', NULL, NULL, NULL),
(853, 11, 'accepted', 'cb', NULL, NULL, NULL),
(854, 40, 'accepted', 'cb', NULL, NULL, NULL),
(855, 29, 'accepted', 'cb', NULL, NULL, NULL),
(856, 31, 'accepted', 'paypal', NULL, NULL, NULL),
(857, 19, 'delivered', 'paypal', NULL, NULL, NULL),
(858, 5, 'accepted', 'cb', NULL, NULL, NULL),
(859, 46, 'in preparation', 'paypal', NULL, NULL, NULL),
(860, 11, 'accepted', 'paypal', NULL, NULL, NULL),
(861, 12, 'accepted', 'paypal', NULL, NULL, NULL),
(862, 36, 'in preparation', 'paypal', NULL, NULL, NULL),
(863, 2, NULL, NULL, NULL, NULL, NULL),
(864, 18, 'in preparation', 'cb', NULL, NULL, NULL),
(865, 14, 'accepted', 'cb', NULL, NULL, NULL),
(866, 2, 'in preparation', 'cb', NULL, NULL, NULL),
(867, 8, 'delivered', 'cb', NULL, NULL, NULL),
(868, 4, 'in preparation', 'paypal', NULL, NULL, NULL),
(869, 31, 'in preparation', 'cb', NULL, NULL, NULL),
(870, 48, 'accepted', 'paypal', NULL, NULL, NULL),
(871, 6, 'delivered', 'cb', NULL, NULL, NULL),
(872, 45, 'in preparation', 'paypal', NULL, NULL, NULL),
(873, 3, 'accepted', 'cb', NULL, NULL, NULL),
(874, 45, 'delivered', 'paypal', NULL, NULL, NULL),
(875, 13, 'in preparation', 'cb', NULL, NULL, NULL),
(876, 40, 'accepted', 'paypal', NULL, NULL, NULL),
(877, 47, NULL, NULL, NULL, NULL, NULL),
(878, 36, 'accepted', 'paypal', NULL, NULL, NULL),
(879, 50, 'delivered', 'paypal', NULL, NULL, NULL),
(880, 27, 'delivered', 'paypal', NULL, NULL, NULL),
(881, 25, 'delivered', 'paypal', NULL, NULL, NULL),
(882, 17, NULL, NULL, NULL, NULL, NULL),
(883, 2, 'accepted', 'cb', NULL, NULL, NULL),
(884, 49, 'delivered', 'paypal', NULL, NULL, NULL),
(885, 22, NULL, NULL, NULL, NULL, NULL),
(886, 30, 'in preparation', 'cb', NULL, NULL, NULL),
(887, 1, NULL, NULL, NULL, NULL, NULL),
(888, 23, 'in preparation', 'cb', NULL, NULL, NULL),
(889, 3, NULL, NULL, NULL, NULL, NULL),
(890, 39, 'in preparation', 'paypal', NULL, NULL, NULL),
(891, 47, 'in preparation', 'cb', NULL, NULL, NULL),
(892, 20, NULL, NULL, NULL, NULL, NULL),
(893, 41, 'delivered', 'paypal', NULL, NULL, NULL),
(894, 8, 'accepted', 'cb', NULL, NULL, NULL),
(895, 2, NULL, NULL, NULL, NULL, NULL),
(896, 1, 'accepted', 'cb', NULL, NULL, NULL),
(897, 38, NULL, NULL, NULL, NULL, NULL),
(898, 31, NULL, NULL, NULL, NULL, NULL),
(899, 20, 'delivered', 'cb', NULL, NULL, NULL),
(900, 35, 'accepted', 'cb', NULL, NULL, NULL),
(901, 3, NULL, NULL, NULL, NULL, NULL),
(902, 2, NULL, NULL, NULL, NULL, NULL),
(903, 48, 'delivered', 'paypal', NULL, NULL, NULL),
(904, 15, 'accepted', 'cb', NULL, NULL, NULL),
(905, 44, 'accepted', 'paypal', NULL, NULL, NULL),
(906, 47, 'accepted', 'paypal', NULL, NULL, NULL),
(907, 29, 'delivered', 'paypal', NULL, NULL, NULL),
(908, 12, 'accepted', 'cb', NULL, NULL, NULL),
(909, 39, 'in preparation', 'paypal', NULL, NULL, NULL),
(910, 13, NULL, NULL, NULL, NULL, NULL),
(911, 36, NULL, NULL, NULL, NULL, NULL),
(912, 1, NULL, NULL, NULL, NULL, NULL),
(913, 38, NULL, NULL, NULL, NULL, NULL),
(914, 49, 'accepted', 'paypal', NULL, NULL, NULL),
(915, 28, 'in preparation', 'paypal', NULL, NULL, NULL),
(916, 22, NULL, NULL, NULL, NULL, NULL),
(917, 4, 'in preparation', 'paypal', NULL, NULL, NULL),
(918, 2, NULL, NULL, NULL, NULL, NULL),
(919, 15, 'delivered', 'paypal', NULL, NULL, NULL),
(920, 14, NULL, NULL, NULL, NULL, NULL),
(921, 44, NULL, NULL, NULL, NULL, NULL),
(922, 20, 'delivered', 'cb', NULL, NULL, NULL),
(923, 45, 'accepted', 'paypal', NULL, NULL, NULL),
(924, 23, 'in preparation', 'cb', NULL, NULL, NULL),
(925, 5, 'in preparation', 'paypal', NULL, NULL, NULL),
(926, 27, 'in preparation', 'cb', NULL, NULL, NULL),
(927, 34, 'in preparation', 'paypal', NULL, NULL, NULL),
(928, 3, NULL, NULL, NULL, NULL, NULL),
(929, 14, 'in preparation', 'paypal', NULL, NULL, NULL),
(930, 31, 'delivered', 'cb', NULL, NULL, NULL),
(931, 23, 'accepted', 'paypal', NULL, NULL, NULL),
(932, 44, NULL, NULL, NULL, NULL, NULL),
(933, 49, 'delivered', 'paypal', NULL, NULL, NULL),
(934, 44, NULL, NULL, NULL, NULL, NULL),
(935, 6, 'delivered', 'paypal', NULL, NULL, NULL),
(936, 35, NULL, NULL, NULL, NULL, NULL),
(937, 38, 'accepted', 'paypal', NULL, NULL, NULL),
(938, 37, 'in preparation', 'cb', NULL, NULL, NULL),
(939, 33, 'accepted', 'paypal', NULL, NULL, NULL),
(940, 39, 'in preparation', 'paypal', NULL, NULL, NULL),
(941, 42, 'in preparation', 'cb', NULL, NULL, NULL),
(942, 23, 'in preparation', 'paypal', NULL, NULL, NULL),
(943, 40, 'accepted', 'paypal', NULL, NULL, NULL),
(944, 30, NULL, NULL, NULL, NULL, NULL),
(945, 20, 'in preparation', 'cb', NULL, NULL, NULL),
(946, 22, 'in preparation', 'cb', NULL, NULL, NULL),
(947, 24, 'in preparation', 'cb', NULL, NULL, NULL),
(948, 14, 'in preparation', 'cb', NULL, NULL, NULL),
(949, 12, 'delivered', 'cb', NULL, NULL, NULL),
(950, 21, 'in preparation', 'paypal', NULL, NULL, NULL),
(951, 18, NULL, NULL, NULL, NULL, NULL),
(952, 3, 'accepted', 'cb', NULL, NULL, NULL),
(953, 45, 'in preparation', 'cb', NULL, NULL, NULL),
(954, 18, NULL, NULL, NULL, NULL, NULL),
(955, 50, 'in preparation', 'cb', NULL, NULL, NULL),
(956, 4, 'accepted', 'paypal', NULL, NULL, NULL),
(957, 40, NULL, NULL, NULL, NULL, NULL),
(958, 7, NULL, NULL, NULL, NULL, NULL),
(959, 41, 'delivered', 'cb', NULL, NULL, NULL),
(960, 28, 'delivered', 'paypal', NULL, NULL, NULL),
(961, 27, 'in preparation', 'cb', NULL, NULL, NULL),
(962, 28, 'delivered', 'cb', NULL, NULL, NULL),
(963, 6, 'delivered', 'cb', NULL, NULL, NULL),
(964, 25, 'delivered', 'cb', NULL, NULL, NULL),
(965, 2, 'in preparation', 'paypal', NULL, NULL, NULL),
(966, 28, 'delivered', 'cb', NULL, NULL, NULL),
(967, 27, 'delivered', 'cb', NULL, NULL, NULL),
(968, 3, NULL, NULL, NULL, NULL, NULL),
(969, 4, 'delivered', 'cb', NULL, NULL, NULL),
(970, 35, 'in preparation', 'cb', NULL, NULL, NULL),
(971, 17, 'delivered', 'paypal', NULL, NULL, NULL),
(972, 22, 'in preparation', 'cb', NULL, NULL, NULL),
(973, 1, 'in preparation', 'cb', NULL, NULL, NULL),
(974, 39, NULL, NULL, NULL, NULL, NULL),
(975, 18, 'accepted', 'paypal', NULL, NULL, NULL),
(976, 34, 'accepted', 'cb', NULL, NULL, NULL),
(977, 6, 'accepted', 'cb', NULL, NULL, NULL),
(978, 21, 'in preparation', 'cb', NULL, NULL, NULL),
(979, 33, 'delivered', 'cb', NULL, NULL, NULL),
(980, 8, 'accepted', 'cb', NULL, NULL, NULL),
(981, 11, NULL, NULL, NULL, NULL, NULL),
(982, 44, 'accepted', 'paypal', NULL, NULL, NULL),
(983, 11, 'accepted', 'paypal', NULL, NULL, NULL),
(984, 24, 'delivered', 'paypal', NULL, NULL, NULL),
(985, 21, 'delivered', 'cb', NULL, NULL, NULL),
(986, 49, 'delivered', 'paypal', NULL, NULL, NULL),
(987, 22, 'in preparation', 'cb', NULL, NULL, NULL),
(988, 37, 'accepted', 'cb', NULL, NULL, NULL),
(989, 1, 'delivered', 'cb', NULL, NULL, NULL),
(990, 24, 'accepted', 'cb', NULL, NULL, NULL),
(991, 26, 'delivered', 'cb', NULL, NULL, NULL),
(992, 15, NULL, NULL, NULL, NULL, NULL),
(993, 6, 'accepted', 'cb', NULL, NULL, NULL),
(994, 50, NULL, NULL, NULL, NULL, NULL),
(995, 24, 'delivered', 'paypal', NULL, NULL, NULL),
(996, 16, NULL, NULL, NULL, NULL, NULL),
(997, 26, 'accepted', 'cb', NULL, NULL, NULL),
(998, 41, 'in preparation', 'cb', NULL, NULL, NULL),
(999, 44, 'in preparation', 'cb', NULL, NULL, NULL),
(1000, 31, 'accepted', 'cb', NULL, NULL, NULL),
(1001, 38, 'in preparation', 'paypal', NULL, NULL, NULL),
(1002, 34, 'accepted', 'paypal', NULL, NULL, NULL),
(1003, 17, 'accepted', 'cb', NULL, NULL, NULL),
(1004, 23, 'accepted', 'paypal', NULL, NULL, NULL),
(1005, 6, 'in preparation', 'paypal', NULL, NULL, NULL),
(1006, 31, 'delivered', 'cb', NULL, NULL, NULL),
(1007, 9, 'in preparation', 'cb', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders_product`
--

CREATE TABLE `orders_product` (
  `id` int NOT NULL,
  `id_order_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_product_product`
--

CREATE TABLE `orders_product_product` (
  `orders_product_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `id_categorie_id` int NOT NULL,
  `mark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `stock` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_categorie_id`, `mark`, `name`, `description`, `price`, `active`, `image`, `created_at`, `stock`) VALUES
(1, 7, 'Proplan', 'Royal Canin Croquettes chien Maxi Adulte 4 kg', 'Royal Canin Maxi Adulte sont des croquettes pour les gros chiens.', 25, 1, 'royal-canin-6195558d3f8a1.jpg', '2021-12-06', NULL),
(2, 7, 'Premiere', 'Bonies 200g Saumon', 'Récompense entre les repas.', 3, 1, 'BoniesSaumon200g-619561f51b079.jpg', '2021-07-11', 50),
(3, 7, 'Multifit', 'Croquette pour chien senior', 'MultiFit Senior est une nourriture sèche et équilibrée spécialement adaptée aux besoins des chiens plus âgés.', 10, 1, 'MultifitChienSenior-619562957c0c2.jpg', '2021-02-13', NULL),
(4, 7, 'Premiere', 'Os a macher', 'Produit naturel séché â l\'air, en-cas pour chien.', 6, 1, 'PremiereOsAMacher-619562db0c69e.jpg', '2021-01-22', NULL),
(5, 8, 'FitFun', 'Couchette Donut', 'La couchette Donut est un coussin confortable en peluche.', 10, 1, 'fitfunCouchetteDonut-6195633e8beb5.jpg', '2021-09-26', NULL),
(6, 8, 'Anione', 'Tapis basique', 'Tapis pour chien.', 9, 1, 'AnioneTapisBasicS-6195636d7997d.jpg', '2021-05-19', NULL),
(7, 8, 'Anione', 'Coussin Caisse de transport', 'Coussin pour les caisses de transport pour chien', 8, 1, 'AnioneCoussinCaisseTransport-6195639fd4ddc.jpg', '2021-02-17', NULL),
(8, 10, 'Anione', 'Petit Cochon', 'Jouet en latex pour chien', 4, 1, 'AnionePetitCochon-619563e7511a1.jpg', '2021-10-20', NULL),
(9, 10, 'Anione', 'Balle en corde', 'Balle pour chien', 7, 1, 'AnioneBalleSurCorde-619564084a43d.jpg', '2021-11-20', NULL),
(10, 9, 'Take Care', 'Collier de protection', 'Collier de protection pour éviter que le chien se morde.', 16, 1, 'TakeCareCollierDeProtection-6195643fe332c.jpg', NULL, NULL),
(11, 9, 'Take Care', 'Pince coupe griffe', 'Pince pour couper les griffes de votre chien.', 11, 1, 'PinceCoupeGriffe-6195646b7941e.jpg', '2021-02-06', NULL),
(12, 9, 'Take Care', 'Peigne anti-puces', 'Un peigne pour enlever les puces.', 9, 1, 'PeigneAntiPuce-6195649a76b7b.jpg', '2021-08-06', NULL),
(13, 12, 'Amlodipine Besylate', 'Lid - 16 Oz And 32 Oz', 'Stiffness of left knee, not elsewhere classified', 24, 0, NULL, '2021-03-11', NULL),
(14, 23, 'Meijer', 'Wine - Ruffino Chianti', 'Other disorders of bone development and growth, left ulna', 39, 1, NULL, '2021-02-01', NULL),
(15, 13, 'wal zan 150', 'Wine - Tribal Sauvignon', 'Problems related to unwanted pregnancy', 44, 1, NULL, '2020-12-18', NULL),
(16, 20, 'Benazepril Hydrochloride', 'Extract - Raspberry', 'Activity, building and construction', 46, 1, NULL, '2021-04-20', NULL),
(17, 12, 'Hydroxyzine Pamoate', 'Mudslide', 'Gestational proteinuria, third trimester', 37, 1, NULL, '2021-08-19', NULL),
(18, 18, 'Topamax', 'Salt - Seasoned', 'Matern care for oth or susp poor fetl grth, 1st tri, oth', 8, 1, NULL, '2021-01-23', NULL),
(19, 16, 'KERANIQUE For Women Hair Regrowth Treatment', 'Bagel - Everything Presliced', 'Oth disp fx of upper end unsp humer, subs for fx w malunion', 15, 0, NULL, '2020-12-25', NULL),
(20, 23, 'Theophylline', 'Clam - Cherrystone', 'Toxic effect of benzene, assault, subsequent encounter', 44, 1, NULL, '2021-06-15', NULL),
(21, 20, 'Gabapentin', 'Ocean Spray - Kiwi Strawberry', 'Subluxation of tarsometatarsal joint of unsp foot, sequela', 18, 1, NULL, '2021-09-02', NULL),
(22, 8, 'Oxaliplatin', 'Pasta - Penne, Rigate, Dry', 'Burn first degree of unsp single finger except thumb, sqla', 40, 1, NULL, NULL, NULL),
(23, 8, 'SOMAVERT', 'Cheese - Cheddar, Medium', 'Aqueous misdirection, unspecified eye', 11, 1, NULL, '2021-05-28', NULL),
(24, 25, 'Ativan', 'Cheese - Comte', 'Animl-ridr or occ of anml-drn veh inj in clsn w nonmtr veh', 40, 1, NULL, '2021-04-07', NULL),
(25, 8, 'Arsenicum Cerebrum', 'Pork - Ham, Virginia', 'Sltr-haris Type I physl fx upr end unsp fibula, 7thD', 4, 0, NULL, '2021-05-26', NULL),
(26, 18, 'Care', 'Tomato - Peeled Italian Canned', 'Congenital shortening of lower limb', 48, 0, NULL, '2021-09-03', NULL),
(27, 26, 'RESILIENCE LIFT', 'Cookie - Oatmeal', 'Subluxation of left scapula, sequela', 31, 0, NULL, '2021-06-04', NULL),
(28, 17, 'AMOXICILLIN', 'Flour - All Purpose', 'Abscess of bursa, left ankle and foot', 35, 1, NULL, '2021-04-24', NULL),
(29, 27, 'Quetiapine Fumarate', 'Tomato - Peeled Italian Canned', 'Burn of unspecified degree of unspecified shoulder, sequela', 26, 0, NULL, '2021-08-19', NULL),
(30, 21, 'LBEL EFFET PARFAIT', 'Iced Tea - Lemon, 340ml', 'Subluxation of tarsal joint of unspecified foot, sequela', 37, 0, NULL, '2021-05-31', NULL),
(32, 17, 'TERCONAZOLE', 'Bread - Multigrain Oval', 'Inj extensor musc/fasc/tend l idx fngr at wrs/hnd lv, subs', 22, 1, NULL, NULL, NULL),
(33, 12, 'Haloperidol', 'Melon - Honey Dew', 'Open angle with borderline findings, low risk, unsp eye', 38, 1, NULL, '2021-07-13', NULL),
(34, 26, 'Striant', 'Cocktail Napkin Blue', 'Oth lack of expected normal physiol development in childhood', 15, 1, NULL, '2021-03-28', NULL),
(35, 9, 'Astragalus e rad. 1%', 'Wine - Shiraz Wolf Blass Premium', 'Foreign body in penis, sequela', 39, 1, NULL, '2021-09-14', NULL),
(36, 21, 'Cold-EEZE', 'Ginger - Pickled', 'Postproc hemorrhage of an endo sys org following a procedure', 45, 1, NULL, NULL, NULL),
(37, 12, 'Haran 40 (Number 78)', 'Flour - Masa De Harina Mexican', 'Person outsd hv veh inj in clsn w nonmtr veh in traf, sqla', 27, 0, NULL, '2021-05-08', NULL),
(38, 20, 'Lisinopril', 'Salmon Steak - Cohoe 8 Oz', 'Poisoning by unspecified general anesthetics, undetermined', 29, 0, NULL, '2021-03-31', NULL),
(39, 20, 'Guaifenesin', 'Plaintain', 'Breakdown of balloon (counterpulsation) device, sequela', 33, 0, NULL, '2021-11-05', NULL),
(40, 14, 'Amlodipine Besylate', 'Wine - Fat Bastard Merlot', 'Unspecified spacecraft accident injuring occupant, sequela', 17, 1, NULL, '2021-10-17', NULL),
(41, 21, 'Nicorette', 'Wine - Sogrape Mateus Rose', 'Dorsalgia', 45, 1, NULL, NULL, NULL),
(42, 19, 'Warfarin Sodium', 'Muffin Hinge 117n', 'Sex chromosome abnormality, female phenotype, unspecified', 37, 0, NULL, '2021-08-19', NULL),
(43, 17, 'Black Birch', 'Sugar - Monocystal / Rock', 'Inj ulnar artery at wrist and hand level of left arm, subs', 21, 1, NULL, '2021-07-05', NULL),
(44, 18, 'Lexapro', 'Pork - Sausage, Medium', 'Unsp inj extn musc/fasc/tend r idx fngr at wrs/hnd lv, sqla', 13, 1, NULL, '2021-09-24', NULL),
(45, 7, 'Cepacol', 'Wine - Mas Chicet Rose, Vintage', 'Doubling of uterus w doubling of cervix and vagina w/o obst', 3, 1, NULL, '2021-04-22', NULL),
(46, 26, 'Rabeprazole Sodium', 'Pork - Ground', 'Methylenetetrahydrofolate reductase deficiency', 36, 0, NULL, '2021-05-24', NULL),
(47, 18, 'Olanzapine', 'Apple - Delicious, Red', 'Puncture wound w/o foreign body of right ear, subs encntr', 33, 0, NULL, NULL, NULL),
(48, 11, 'Daytime', 'Cheese - Sheep Milk', 'Collapsed vertebra, NEC, lumbosacral region, init', 10, 1, NULL, '2021-07-19', NULL),
(49, 23, 'JUNIPERUS ASHEI POLLEN', 'Kellogs Special K Cereal', 'Staphylococcal arthritis, ankle and foot', 6, 1, NULL, '2021-11-13', NULL),
(50, 16, 'Berry Hand Sanitizer with vitamin E and aloe', 'Trout - Hot Smkd, Dbl Fillet', 'Other foreign object in trachea causing other injury', 25, 0, NULL, '2021-04-16', NULL),
(51, 14, 'Meperidine Hydrochloride', 'Cheese - Cheddar, Mild', 'Oth abnormal findings in specimens from oth org/tiss', 13, 0, NULL, '2021-01-26', NULL),
(52, 18, 'Prednisolone Acetate', 'Cheese - Brie, Cups 125g', 'War operation involving other effects of nuclear weapons', 46, 1, NULL, '2020-12-11', NULL),
(53, 20, 'Topcare Cold Head Congestion', 'Hot Choc Vending', 'Displ transverse fx shaft of unsp rad, 7thR', 44, 0, NULL, '2021-03-16', NULL),
(54, 24, 'Lidocaine Hydrochloride and Epinephrine', 'Cake - Miini Cheesecake Cherry', 'Fall same lev from slip/trip w strike against oth object', 36, 1, NULL, NULL, NULL),
(55, 12, 'Trimethobenzamide Hydrochloride', 'Juice - Apple 284ml', 'Oth comp fol infusion, transfuse and theraputc injection', 18, 1, NULL, '2021-03-13', NULL),
(56, 24, 'Ciprofloxacin', 'Apples - Spartan', 'Pasngr in pk-up/van injured in nonclsn trnsp acc nontraf', 21, 1, NULL, '2021-01-02', NULL),
(57, 9, 'Flumazenil', 'Beer - Maudite', 'Ulcerative (chronic) proctitis with unsp complications', 22, 1, NULL, '2021-09-28', NULL),
(58, 23, 'Namenda', 'Chips - Assorted', 'Merkel cell carcinoma of right ear and external auric canal', 3, 0, NULL, NULL, NULL),
(59, 26, 'Clinpro 5000', 'Lamb - Leg, Boneless', 'Monoarthritis, not elsewhere classified, shoulder', 12, 0, NULL, '2021-07-26', NULL),
(60, 21, 'Phenazopyridine Hydrochloride', 'Pepper - Green Thai', 'Displaced bimalleolar fracture of unspecified lower leg', 12, 0, NULL, '2021-09-13', NULL),
(61, 23, 'Tosowoong Mens Booster Repair Skin', 'Shrimp - Baby, Cold Water', 'Disp fx of prox phalanx of r idx fngr, 7thP', 5, 1, NULL, '2021-03-25', NULL),
(63, 17, 'Cyclobenzaprine Hydrochloride', 'Chocolate - White', 'Strain of unspecified Achilles tendon, sequela', 19, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_orders`
--

CREATE TABLE `product_orders` (
  `product_id` int NOT NULL,
  `orders_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_orders`
--

INSERT INTO `product_orders` (`product_id`, `orders_id`) VALUES
(5, 14),
(5, 140),
(5, 161),
(5, 162),
(7, 848),
(8, 236),
(8, 385),
(10, 239),
(12, 542),
(14, 103),
(14, 557),
(15, 391),
(16, 268),
(17, 750),
(17, 976),
(18, 34),
(19, 39),
(19, 799),
(20, 400),
(23, 802),
(24, 101),
(24, 717),
(26, 155),
(27, 308),
(30, 350),
(33, 807),
(33, 824),
(35, 447),
(36, 455),
(36, 852),
(37, 34),
(38, 309),
(38, 324),
(39, 253),
(40, 335),
(46, 917),
(47, 88),
(48, 852),
(49, 39),
(50, 227),
(50, 846),
(50, 959),
(51, 47),
(52, 197),
(53, 259),
(54, 437),
(57, 506),
(58, 913),
(59, 684),
(59, 966),
(60, 545),
(61, 42),
(61, 479);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(1, 3, '5G64uUd3ts8VdhN3O7Q8', '6aO0uckQeVbQZGToobNIxzqaYZ0KoKmxP5XK6ca7lj8=', '2021-11-17 14:51:38', '2021-11-17 15:51:38'),
(2, 6, 'UcjTJ262Gvi45QkQcPNI', 'qVFRm9hCy6p9bHuEe9+bThhPmP80teHaGPe0/XLV8Xo=', '2021-11-17 14:53:06', '2021-11-17 15:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `first_name`, `birthday`, `address`, `gender`) VALUES
(1, 'adminco@power.com', '[\"ROLE_ADMIN\"]', '$2y$13$vn.IFvHHkb0nbYrQxl4eqeOi6U76RllEKIsRMNWBn3HJ64NEEK0cC', 'Admin', 'Nistrator', '1990-10-21', 'Chez moi', 'M'),
(2, 'user@user.com', '[\"ROLE_ADMIN\"]', '$2y$13$aOHuvdPbir5HJdfcVt6pneSE/iCmthd4GVsvHpxkJobvg1vyCo94a', 'user', 'user', '1901-01-01', 'UserUser', 'M'),
(3, 'user@userru.urs', '[]', '$2y$13$r9YvSr51SRA9yxFCz2jA7uPy83m0spC6Ggu1VvkPBRE8klvYPzvRu', 'user', 'gui', '1901-01-01', 'qfa', 'M'),
(4, 'testForm@form.co', '[\"ROLE_USER\", \"ROLE_ADMIN\"]', '$2y$13$DmnqndYoYPSJT7bB33F5TOPPZtEE4F9yclnHPx40DtK16wWYtB3zq', 'Formco', NULL, NULL, NULL, NULL),
(5, 'test42@42s.com', '[]', '$2y$13$lfTRsg0jr1l.sxgjiPnzSeRweGIbtus9/7ktm0e5j8jA7fSw72U0m', 'totoot', 'gilles', '1901-01-01', '123 rue des bois', 'M'),
(6, 'gmillet@stagiaire-humanbooster.com', '[]', '$2y$13$HwbwEEi1Sbv/XhyMLohIJe5bjeHW9W5p4PdK4hQSwZMFwWsJPCDJ6', 'Millet', 'Guillaume', '1997-04-01', 'Chez moi', 'M'),
(7, 'sgiacomozzo0@cnet.com', NULL, 'V2cH3nq', 'Gérald', 'aipsgrave0', NULL, NULL, 'Male'),
(8, 'zkupka1@usnews.com', NULL, 'qYRtIC', 'Laurène', 'fboorer1', NULL, NULL, 'Male'),
(9, 'acashin2@mysql.com', NULL, 'E2yJa0bh', 'Håkan', 'tpridden2', NULL, NULL, 'Male'),
(10, 'acoggings3@weather.com', NULL, 'bfxbLHrz4F', 'Dorothée', 'twebland3', NULL, NULL, 'Male'),
(11, 'rminchindon4@cisco.com', NULL, 'Doit07', 'Illustrée', 'lambrosini4', NULL, NULL, 'Female'),
(12, 'claba5@tmall.com', NULL, 'f1N4Xi', 'Yè', 'hkeavy5', NULL, NULL, 'Female'),
(13, 'dpooly6@last.fm', NULL, 'tSXlMSdIj6z', 'Wá', 'lleblanc6', NULL, NULL, 'Female'),
(14, 'asketchley7@webeden.co.uk', NULL, 'ctBARH43', 'Célestine', 'sfrancais7', NULL, NULL, 'Male'),
(15, 'rgarmston8@indiegogo.com', NULL, 'mt0037', 'Cinéma', 'mkineton8', NULL, NULL, 'Male'),
(16, 'lgeistmann9@amazon.de', NULL, 'kgfCR3Btw8', 'Dafnée', 'jpaolicchi9', NULL, NULL, 'Male'),
(17, 'mbavina@japanpost.jp', NULL, 'BN7zW1AMH', 'Mélina', 'sbroadisa', NULL, NULL, 'Male'),
(18, 'mkrookb@ehow.com', NULL, 'uBJtxxj', 'Angélique', 'chuorticb', NULL, NULL, 'Male'),
(19, 'rtokellc@sina.com.cn', NULL, 'eiwA3gt', 'Måns', 'ccallawayc', NULL, NULL, 'Female'),
(20, 'vaskind@home.pl', NULL, 'CsU78sV9EvRI', 'Mylène', 'vsintond', NULL, NULL, 'Male'),
(21, 'ssimpere@twitter.com', NULL, 'sks9lTjdV', 'Mélodie', 'kwabye', NULL, NULL, 'Female'),
(22, 'akopmanf@wufoo.com', NULL, 'OZBXCuHB', 'Marlène', 'bkuhlef', NULL, NULL, 'Male'),
(23, 'spenwrightg@wufoo.com', NULL, 'F9gq8xp6oZ', 'Méghane', 'ldowleyg', NULL, NULL, 'Female'),
(24, 'crozyckih@ibm.com', NULL, 'aww0Eopm1OUM', 'Célia', 'dkeasyh', NULL, NULL, 'Female'),
(25, 'jtomblingi@bloglovin.com', NULL, 'fagKDlJqH', 'Tú', 'hfachei', NULL, NULL, 'Male'),
(26, 'tleallej@ihg.com', NULL, 'Gotsb40', 'Cinéma', 'mbecerroj', NULL, NULL, 'Male'),
(27, 'agetcliffk@nationalgeographic.com', NULL, 'tVNUb7RVYJ4', 'Kévina', 'nbossonk', NULL, NULL, 'Female'),
(28, 'chugginsl@etsy.com', NULL, 'gm5iHNJwj', 'Naéva', 'vcrottaghl', NULL, NULL, 'Female'),
(29, 'nyerbornm@patch.com', NULL, '675IMjfO4t1', 'Françoise', 'lvictorym', NULL, NULL, 'Female'),
(30, 'evairown@psu.edu', NULL, '3qt3F8PjVRGt', 'Stévina', 'destickn', NULL, NULL, 'Female'),
(31, 'rbidwello@joomla.org', NULL, 'Xe6J5B6', 'Irène', 'edanyo', NULL, NULL, 'Female'),
(32, 'cbalstonep@pinterest.com', NULL, 'DOAGwT6lNUG', 'Anaïs', 'mbonevantp', NULL, NULL, 'Female'),
(33, 'eneeveq@ucoz.ru', NULL, '3KUrLDRG', 'Alizée', 'wkirlinq', NULL, NULL, 'Male'),
(34, 'dginsier@nature.com', NULL, '7EZkCaru6', 'Faîtes', 'avankeevr', NULL, NULL, 'Female'),
(35, 'rstovolds@bloomberg.com', NULL, 'tGbnzMzIFu', 'Thérèsa', 'jberneys', NULL, NULL, 'Female'),
(36, 'jpersittt@vkontakte.ru', NULL, '1z6d5J4', 'Crééz', 'ahaggast', NULL, NULL, 'Female'),
(37, 'hphillimoreu@java.com', NULL, 'bA1zicbhWw', 'Angélique', 'rpietericku', NULL, NULL, 'Male'),
(38, 'aformbyv@newyorker.com', NULL, 'w206eLej', 'Maïlys', 'tdightonv', NULL, NULL, 'Male'),
(39, 'mkevanew@xinhuanet.com', NULL, 'Coe9eeoY', 'Lyséa', 'efairhamw', NULL, NULL, 'Female'),
(40, 'mwindx@pbs.org', NULL, 'V5eLSTDEn', 'Dà', 'ecarrx', NULL, NULL, 'Female'),
(41, 'nruthveny@java.com', NULL, 'eZTDWPGY', 'Solène', 'mcruttendeny', NULL, NULL, 'Male'),
(42, 'eoverelz@nasa.gov', NULL, 'yFkcqa', 'Maëlann', 'rlunneyz', NULL, NULL, 'Female'),
(43, 'dyurevich10@spotify.com', NULL, 'ZBvIb8bE', 'Valérie', 'abalassa10', NULL, NULL, 'Female'),
(44, 'nedy11@oakley.com', NULL, 'RCy8Dv1MQEE8', 'Marylène', 'oraymen11', NULL, NULL, 'Female'),
(45, 'lmaddaford12@google.de', NULL, 'WPL4tgg', 'Vénus', 'mosgorby12', NULL, NULL, 'Female'),
(46, 'kmcevay13@hud.gov', NULL, 'fD5S0IDiaSA', 'Josée', 'ktunnacliffe13', NULL, NULL, 'Female'),
(47, 'fmotten14@creativecommons.org', NULL, 'Oz0OfHBVC', 'Lucrèce', 'rchritchley14', NULL, NULL, 'Male'),
(48, 'cbirkhead15@nps.gov', NULL, 'Ma5O6njF6NfR', 'Gisèle', 'atynemouth15', NULL, NULL, 'Male'),
(49, 'kgiamuzzo16@joomla.org', NULL, 'UcLzYNe4', 'Françoise', 'cwarrener16', NULL, NULL, 'Male'),
(50, 'kdyzart17@businessinsider.com', NULL, 'M5FX5p', 'Eugénie', 'fmelbourn17', NULL, NULL, 'Male'),
(51, 'csussams18@rakuten.co.jp', NULL, 'vSF4y3WH', 'Judicaël', 'ogrinyov18', NULL, NULL, 'Male'),
(52, 'jthebes19@t.co', NULL, 'myIQgUp4l', 'Régine', 'awalkey19', NULL, NULL, 'Female'),
(53, 'kthickett1a@ocn.ne.jp', NULL, 'cCdWtdSMOiMQ', 'Rachèle', 'aduckitt1a', NULL, NULL, 'Male'),
(54, 'arounsivall1b@ft.com', NULL, 'aDqx2oW', 'Simplifiés', 'gskyrm1b', NULL, NULL, 'Male'),
(55, 'trobard1c@zdnet.com', NULL, 'omxhs7Qax', 'Lén', 'mpeggram1c', NULL, NULL, 'Female'),
(56, 'cwarlawe1d@spiegel.de', NULL, 'VGZuZQf4X7', 'Lài', 'wbunker1d', NULL, NULL, 'Female'),
(57, 'mokynsillaghe1e@nsw.gov.au', NULL, 'M9cziB', 'Eléa', 'ndeluna1e', NULL, NULL, 'Female'),
(58, 'ariseborough1f@paginegialle.it', NULL, 'lTZ9F5FmAmPj', 'Fèi', 'gtender1f', NULL, NULL, 'Female'),
(59, 'hgerding1g@alibaba.com', NULL, 'OQET1LW', 'Ráo', 'dhurrell1g', NULL, NULL, 'Male'),
(60, 'palyutin1h@surveymonkey.com', NULL, 'aYpZJVMZi2', 'Yóu', 'nallington1h', NULL, NULL, 'Male'),
(61, 'weverix1i@dedecms.com', NULL, 'cnzgWt3ACJw4', 'Noëlla', 'jleftley1i', NULL, NULL, 'Female'),
(62, 'ftollady1j@businessinsider.com', NULL, 'mJbZey2FK', 'Gaïa', 'gtring1j', NULL, NULL, 'Male'),
(63, 'jsheepy1k@tinypic.com', NULL, 'kiiDYwKvzIv', 'Ráo', 'fdengate1k', NULL, NULL, 'Male'),
(64, 'iraittie1l@dyndns.org', NULL, 'dqy8HuOs', 'Jú', 'bbadby1l', NULL, NULL, 'Female'),
(65, 'rstrood1m@paginegialle.it', NULL, 'MwLk8KHI', 'Maëlann', 'fbithany1m', NULL, NULL, 'Female'),
(66, 'lcoyne1n@google.co.jp', NULL, 'EMfdACgtaU', 'Torbjörn', 'wsimeoni1n', NULL, NULL, 'Male'),
(67, 'edavidovsky1o@cnbc.com', NULL, 'UcjeF2PQlG8', 'Joséphine', 'cmacneillie1o', NULL, NULL, 'Female'),
(68, 'kgatecliffe1p@wired.com', NULL, 'lHYHN6X', 'Nuó', 'sarmatys1p', NULL, NULL, 'Male'),
(69, 'ttaffrey1q@hostgator.com', NULL, 'OmqPWPwuy9lM', 'Océane', 'fburd1q', NULL, NULL, 'Male'),
(70, 'kmorton1r@hugedomains.com', NULL, 'ft2LJET', 'Béatrice', 'krobinette1r', NULL, NULL, 'Female'),
(71, 'amccaughren1s@chron.com', NULL, 'dze5lIO16y2', 'Gaïa', 'sfeacham1s', NULL, NULL, 'Male'),
(72, 'mtewkesberry1t@ucla.edu', NULL, 'P5dEh71', 'Yóu', 'msquire1t', NULL, NULL, 'Female'),
(73, 'ceaglen1u@earthlink.net', NULL, 'xgCuhOA', 'Marie-hélène', 'sector1u', NULL, NULL, 'Female'),
(74, 'ocale1v@delicious.com', NULL, 'm1loEQ', 'Méghane', 'rbeckensall1v', NULL, NULL, 'Male'),
(75, 'remblem1w@craigslist.org', NULL, 'QAoNujB7fLXn', 'Séréna', 'wlago1w', NULL, NULL, 'Male'),
(76, 'htoke1x@wikia.com', NULL, 'M51QYKepP8', 'Séréna', 'mstandeven1x', NULL, NULL, 'Male'),
(77, 'omilbourn1y@globo.com', NULL, 'IabAaSh', 'Méthode', 'dsangster1y', NULL, NULL, 'Male'),
(78, 'chollow1z@biglobe.ne.jp', NULL, 's72DLIrc4', 'Andréa', 'ghalgarth1z', NULL, NULL, 'Male'),
(79, 'gcracie20@sfgate.com', NULL, 'LgJ3DLaC', 'Yú', 'fbraniff20', NULL, NULL, 'Male'),
(80, 'lclynmans21@apple.com', NULL, 'u1DCzLv5MMql', 'Léandre', 'rbutner21', NULL, NULL, 'Female'),
(81, 'lklyner22@mapy.cz', NULL, 'oSP8rFqdo8c', 'Léone', 'jgilchrest22', NULL, NULL, 'Female'),
(82, 'fmessent23@digg.com', NULL, '7rbGQZ', 'Lorène', 'oklaesson23', NULL, NULL, 'Male'),
(83, 'amckenney24@cargocollective.com', NULL, 'pTYp2eF', 'Méthode', 'gspellsworth24', NULL, NULL, 'Male'),
(84, 'bhartington25@unblog.fr', NULL, 'iac11GawI', 'Léonore', 'wickeringill25', NULL, NULL, 'Male'),
(85, 'ncannam26@illinois.edu', NULL, 'uTwtqt', 'Anaëlle', 'dgorey26', NULL, NULL, 'Male'),
(86, 'apressnell27@nba.com', NULL, 'gq0YYzQdLhQS', 'Mén', 'hgladdin27', NULL, NULL, 'Female'),
(87, 'apeizer28@latimes.com', NULL, 'JqKXIpHKgz', 'Angélique', 'bhelmke28', NULL, NULL, 'Male'),
(88, 'mlambeth29@deliciousdays.com', NULL, 'eNLZVy2z', 'Stévina', 'mmargetson29', NULL, NULL, 'Female'),
(89, 'dmixhel2a@e-recht24.de', NULL, '3nHksCuZGis', 'Zhì', 'rtopliss2a', NULL, NULL, 'Female'),
(90, 'dgaucher2b@networksolutions.com', NULL, 'vSGhTbtG', 'Néhémie', 'lhinchon2b', NULL, NULL, 'Female'),
(91, 'yredmain2c@sphinn.com', NULL, 'XrxpxZD8nK4', 'Salomé', 'tfaulkner2c', NULL, NULL, 'Male'),
(92, 'ttrencher2d@google.ca', NULL, 'pkvdzLTLbD', 'Görel', 'amcgaughie2d', NULL, NULL, 'Female'),
(93, 'sbarthrop2e@army.mil', NULL, 'lEJlRsEHq', 'Eléa', 'adobrowlski2e', NULL, NULL, 'Female'),
(94, 'jcannavan2f@phpbb.com', NULL, 'Oh2FH8PO', 'Marie-françoise', 'csibyllina2f', NULL, NULL, 'Female'),
(95, 'gtomeo2g@oaic.gov.au', NULL, 'mjnNKhb', 'Amélie', 'vcantillion2g', NULL, NULL, 'Male'),
(96, 'ckarpman2h@hibu.com', NULL, 'Ha92EagNjh', 'Alizée', 'dunwin2h', NULL, NULL, 'Female'),
(97, 'dlavigne2i@scribd.com', NULL, 'zJc2BKsbC', 'Dù', 'bkornas2i', NULL, NULL, 'Female'),
(98, 'rplaide2j@admin.ch', NULL, 'JvS79kRHF', 'Lyséa', 'jkensitt2j', NULL, NULL, 'Male'),
(99, 'lwratten2k@economist.com', NULL, 'bDEO2qjO', 'Chloé', 'eharmant2k', NULL, NULL, 'Male'),
(100, 'wkennard2l@ezinearticles.com', NULL, 'JHhvcovE5ZH6', 'Yáo', 'sward2l', NULL, NULL, 'Female'),
(101, 'umatuszkiewicz2m@nps.gov', NULL, 'iXaHPfM', 'Eloïse', 'tklishin2m', NULL, NULL, 'Female'),
(102, 'ltoye2n@themeforest.net', NULL, 'AEga2h', 'Miléna', 'malgie2n', NULL, NULL, 'Female'),
(103, 'alunbech2o@berkeley.edu', NULL, 'gYXrk5', 'Pål', 'fgeipel2o', NULL, NULL, 'Female'),
(104, 'eplewman2p@51.la', NULL, 'ZN4f3X', 'Michèle', 'keymer2p', NULL, NULL, 'Male'),
(105, 'tdealey2q@cargocollective.com', NULL, 'iSfPvRQWsLZb', 'Andrée', 'pgruczka2q', NULL, NULL, 'Male'),
(106, 'boscallan2r@cmu.edu', NULL, 'R5BYbXv0Q', 'Gwenaëlle', 'bhamerton2r', NULL, NULL, 'Female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_64C19C1F24F7657` (`id_parent_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E52FFDEE79F37AE5` (`id_user_id`);

--
-- Indexes for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_223F76D6DD4481AD` (`id_order_id`);

--
-- Indexes for table `orders_product_product`
--
ALTER TABLE `orders_product_product`
  ADD PRIMARY KEY (`orders_product_id`,`product_id`),
  ADD KEY `IDX_A6E5B64620467FDD` (`orders_product_id`),
  ADD KEY `IDX_A6E5B6464584665A` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD9F34925F` (`id_categorie_id`);

--
-- Indexes for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`product_id`,`orders_id`),
  ADD KEY `IDX_8753BC4A4584665A` (`product_id`),
  ADD KEY `IDX_8753BC4ACFFE9AD6` (`orders_id`);

--
-- Indexes for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1008;

--
-- AUTO_INCREMENT for table `orders_product`
--
ALTER TABLE `orders_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1F24F7657` FOREIGN KEY (`id_parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK_E52FFDEE79F37AE5` FOREIGN KEY (`id_user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `FK_223F76D6DD4481AD` FOREIGN KEY (`id_order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `orders_product_product`
--
ALTER TABLE `orders_product_product`
  ADD CONSTRAINT `FK_A6E5B64620467FDD` FOREIGN KEY (`orders_product_id`) REFERENCES `orders_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A6E5B6464584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD9F34925F` FOREIGN KEY (`id_categorie_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `FK_8753BC4A4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8753BC4ACFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
