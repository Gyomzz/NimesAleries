-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 21, 2021 at 02:51 PM
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
-- Database: `NimesaleriesCart`
--

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `teaser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `id_parent_id` int DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `id_parent_id`, `name`, `ordering`) VALUES
(1, NULL, 'Chien', 1),
(2, NULL, 'Chat', 2),
(3, NULL, 'Oiseau', 5),
(4, NULL, 'Tera', 3),
(5, NULL, 'Aqua', 4),
(7, 1, 'Alimentation pour chien', NULL),
(8, 1, 'Couchage', NULL),
(9, 1, 'Soin et Hygiene', NULL),
(10, 1, 'Jouets pour chien', NULL),
(11, 1, 'Transport & Sécurité', NULL),
(12, 1, 'Gamelles & distributeurs', NULL),
(13, 2, 'Alimentation pour chat', NULL),
(14, 2, 'Couchage pour chat', NULL),
(16, 2, 'Soin & Hygiène', NULL),
(17, 2, 'Jouets pour chat', NULL),
(18, 2, 'Transport & Sécurité', NULL),
(19, 2, 'Gamelles & distributeurs', NULL),
(20, 3, 'Alimentation pour oiseau', NULL),
(21, 3, 'Voliere', NULL),
(22, 3, 'Poule & basse-cours', NULL),
(23, 3, 'Caisse de transport', NULL),
(24, 5, 'Alimentation poisson', NULL),
(25, 5, 'Aquarium', NULL),
(26, 4, 'Terrarium', NULL),
(27, 4, 'Accessoires pour terrarium', NULL),
(28, 5, 'Décoration aquarium', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211217211857', '2021-12-17 22:19:02', 199),
('DoctrineMigrations\\Version20211217212117', '2021-12-17 22:21:23', 123),
('DoctrineMigrations\\Version20211218152234', '2021-12-18 16:22:40', 41),
('DoctrineMigrations\\Version20211218163757', '2021-12-18 17:39:03', 81),
('DoctrineMigrations\\Version20211218163956', '2021-12-18 17:40:01', 50);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `validity_date` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `status`, `created_at`, `updated_at`, `validity_date`, `user_id`) VALUES
(14, 'cart', '2021-12-18 17:45:17', '2021-12-18 18:09:54', '2021-12-18 18:09:54', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `order_ref_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `product_id`, `order_ref_id`, `quantity`) VALUES
(41, 1, 14, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `id_categorie_id` int NOT NULL,
  `mark` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `price` double DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `stock` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_categorie_id`, `mark`, `name`, `description`, `price`, `active`, `image`, `created_at`, `stock`) VALUES
(1, 7, NULL, 'Royal Canin Croquettes', 'Royal Canin Maxi Adulte sont des croquettes pour les gros chiens.', 25, 1, 'royal-canin-6195558d3f8a1.jpg', '2021-12-06', NULL),
(2, 7, NULL, 'Bonies 200g Saumon', 'Récompense entre les repas.', 3, 1, 'BoniesSaumon200g-619561f51b079.jpg', '2021-07-11', 50),
(3, 7, NULL, 'Croquette pour chien senior', 'MultiFit Senior est une nourriture sèche et équilibrée spécialement adaptée aux besoins des chiens plus âgés.', 10, 1, 'MultifitChienSenior-619562957c0c2.jpg', '2021-02-13', NULL),
(4, 7, NULL, 'Os a macher', 'Produit naturel séché â l\'air, en-cas pour chien.', 6, 1, 'PremiereOsAMacher-619562db0c69e.jpg', '2021-01-22', NULL),
(5, 8, NULL, 'Couchette Donut', 'La couchette Donut est un coussin confortable en peluche.', 10, 1, 'fitfunCouchetteDonut-6195633e8beb5.jpg', '2021-09-26', NULL),
(6, 8, NULL, 'Tapis basique', 'Tapis pour chien.', 9, 1, 'AnioneTapisBasicS-6195636d7997d.jpg', '2021-05-19', NULL),
(7, 8, NULL, 'Coussin Caisse de transport', 'Coussin pour les caisses de transport pour chien', 8, 1, 'AnioneCoussinCaisseTransport-6195639fd4ddc.jpg', '2021-02-17', NULL),
(8, 10, NULL, 'Petit Cochon', 'Jouet en latex pour chien', 4, 1, 'AnionePetitCochon-619563e7511a1.jpg', '2021-10-20', NULL),
(9, 10, NULL, 'Balle en corde', 'Balle pour chien', 7, 1, 'AnioneBalleSurCorde-619564084a43d.jpg', '2021-11-20', NULL),
(10, 9, NULL, 'Collier de protection', 'Collier de protection pour éviter que le chien se morde.', 16, 1, 'TakeCareCollierDeProtection-6195643fe332c.jpg', NULL, NULL),
(11, 9, NULL, 'Pince coupe griffe', 'Pince pour couper les griffes de votre chien.', 11, 1, 'PinceCoupeGriffe-6195646b7941e.jpg', '2021-02-06', NULL),
(12, 9, NULL, 'Peigne anti-puces', 'Un peigne pour enlever les puces.', 9, 1, 'PeigneAntiPuce-6195649a76b7b.jpg', '2021-08-06', NULL),
(13, 12, NULL, 'Lid - 16 Oz And 32 Oz', 'Stiffness of left knee, not elsewhere classified', 24, 0, NULL, '2021-03-11', NULL),
(14, 23, NULL, 'Wine - Ruffino Chianti', 'Other disorders of bone development and growth, left ulna', 39, 1, NULL, '2021-02-01', NULL),
(15, 13, NULL, 'Wine - Tribal Sauvignon', 'Problems related to unwanted pregnancy', 44, 1, NULL, '2020-12-18', NULL),
(16, 20, NULL, 'Extract - Raspberry', 'Activity, building and construction', 46, 1, NULL, '2021-04-20', NULL),
(17, 12, NULL, 'Mudslide', 'Gestational proteinuria, third trimester', 37, 1, NULL, '2021-08-19', NULL),
(18, 18, NULL, 'Salt - Seasoned', 'Matern care for oth or susp poor fetl grth, 1st tri, oth', 8, 1, NULL, '2021-01-23', NULL),
(19, 16, NULL, 'Bagel - Everything Presliced', 'Oth disp fx of upper end unsp humer, subs for fx w malunion', 15, 0, NULL, '2020-12-25', NULL),
(20, 23, NULL, 'Clam - Cherrystone', 'Toxic effect of benzene, assault, subsequent encounter', 44, 1, NULL, '2021-06-15', NULL),
(21, 20, NULL, 'Ocean Spray ', 'Subluxation of tarsometatarsal joint of unsp foot, sequela', 18, 1, NULL, '2021-09-02', NULL),
(22, 8, NULL, 'Pasta - Penne, Rigate, Dry', 'Burn first degree of unsp single finger except thumb, sqla', 40, 1, NULL, NULL, NULL),
(23, 8, NULL, 'Cheese - Cheddar, Medium', 'Aqueous misdirection, unspecified eye', 11, 1, NULL, '2021-05-28', NULL),
(24, 25, NULL, 'Cheese - Comte', 'Animl-ridr or occ of anml-drn veh inj in clsn w nonmtr veh', 40, 1, NULL, '2021-04-07', NULL),
(25, 8, NULL, 'Pork - Ham, Virginia', 'Sltr-haris Type I physl fx upr end unsp fibula, 7thD', 4, 0, NULL, '2021-05-26', NULL),
(26, 18, NULL, 'Tomato - Peeled Italian Canned', 'Congenital shortening of lower limb', 48, 0, NULL, '2021-09-03', NULL),
(27, 26, NULL, 'Cookie - Oatmeal', 'Subluxation of left scapula, sequela', 31, 0, NULL, '2021-06-04', NULL),
(28, 17, NULL, 'Flour - All Purpose', 'Abscess of bursa, left ankle and foot', 35, 1, NULL, '2021-04-24', NULL),
(29, 27, NULL, 'Tomato - Peeled Italian', 'Burn of unspecified degree of unspecified shoulder, sequela', 26, 0, NULL, '2021-08-19', NULL),
(30, 21, NULL, 'Iced Tea - Lemon, 340ml', 'Subluxation of tarsal joint of unspecified foot, sequela', 37, 0, NULL, '2021-05-31', NULL),
(32, 17, NULL, 'Bread - Multigrain Oval', 'Inj extensor musc/fasc/tend l idx fngr at wrs/hnd lv, subs', 22, 1, NULL, NULL, NULL),
(33, 12, NULL, 'Melon - Honey Dew', 'Open angle with borderline findings, low risk, unsp eye', 38, 1, NULL, '2021-07-13', NULL),
(34, 26, NULL, 'Cocktail Napkin Blue', 'Oth lack of expected normal physiol development in childhood', 15, 1, NULL, '2021-03-28', NULL),
(35, 9, NULL, 'Wine - Shiraz Wolf Blass Premium', 'Foreign body in penis, sequela', 39, 1, NULL, '2021-09-14', NULL),
(36, 21, NULL, 'Ginger - Pickled', 'Postproc hemorrhage of an endo sys org following a procedure', 45, 1, NULL, NULL, NULL),
(37, 12, NULL, 'Flour - Masa De Harina Mexican', 'Person outsd hv veh inj in clsn w nonmtr veh in traf, sqla', 27, 0, NULL, '2021-05-08', NULL),
(38, 20, NULL, 'Salmon Steak - Cohoe 8 Oz', 'Poisoning by unspecified general anesthetics, undetermined', 29, 0, NULL, '2021-03-31', NULL),
(39, 20, NULL, 'Plaintain', 'Breakdown of balloon (counterpulsation) device, sequela', 33, 0, NULL, '2021-11-05', NULL),
(40, 14, NULL, 'Wine - Fat Bastard Merlot', 'Unspecified spacecraft accident injuring occupant, sequela', 17, 1, NULL, '2021-10-17', NULL),
(41, 21, NULL, 'Wine - Sogrape Mateus Rose', 'Dorsalgia', 45, 1, NULL, NULL, NULL),
(42, 19, NULL, 'Muffin Hinge 117n', 'Sex chromosome abnormality, female phenotype, unspecified', 37, 0, NULL, '2021-08-19', NULL),
(43, 17, NULL, 'Sugar - Monocystal / Rock', 'Inj ulnar artery at wrist and hand level of left arm, subs', 21, 1, NULL, '2021-07-05', NULL),
(44, 18, NULL, 'Pork - Sausage, Medium', 'Unsp inj extn musc/fasc/tend r idx fngr at wrs/hnd lv, sqla', 13, 1, NULL, '2021-09-24', NULL),
(45, 7, NULL, 'Wine - Mas Chicet Rose, Vintage', 'Doubling of uterus w doubling of cervix and vagina w/o obst', 3, 1, NULL, '2021-04-22', NULL),
(46, 26, NULL, 'Pork - Ground', 'Methylenetetrahydrofolate reductase deficiency', 36, 0, NULL, '2021-05-24', NULL),
(47, 18, NULL, 'Apple - Delicious, Red', 'Puncture wound w/o foreign body of right ear, subs encntr', 33, 0, NULL, NULL, NULL),
(48, 11, NULL, 'Cheese - Sheep Milk', 'Collapsed vertebra, NEC, lumbosacral region, init', 10, 1, NULL, '2021-07-19', NULL),
(49, 23, NULL, 'Kellogs Special K Cereal', 'Staphylococcal arthritis, ankle and foot', 6, 1, NULL, '2021-11-13', NULL),
(50, 16, NULL, 'Trout - Hot Smkd, Dbl Fillet', 'Other foreign object in trachea causing other injury', 25, 0, NULL, '2021-04-16', NULL),
(51, 14, NULL, 'Cheese - Cheddar, Mild', 'Oth abnormal findings in specimens from oth org/tiss', 13, 0, NULL, '2021-01-26', NULL),
(52, 18, NULL, 'Cheese - Brie, Cups 125g', 'War operation involving other effects of nuclear weapons', 46, 1, NULL, '2020-12-11', NULL),
(53, 20, NULL, 'Hot Choc Vending', 'Displ transverse fx shaft of unsp rad, 7thR', 44, 0, NULL, '2021-03-16', NULL),
(54, 24, NULL, 'Miini Cheesecak', 'Fall same lev from slip/trip w strike against oth object', 36, 1, NULL, NULL, NULL),
(55, 12, NULL, 'Juice - Apple 284ml', 'Oth comp fol infusion, transfuse and theraputc injection', 18, 1, NULL, '2021-03-13', NULL),
(56, 24, NULL, 'Apples - Spartan', 'Pasngr in pk-up/van injured in nonclsn trnsp acc nontraf', 21, 1, NULL, '2021-01-02', NULL),
(57, 9, NULL, 'Beer - Maudite', 'Ulcerative (chronic) proctitis with unsp complications', 22, 1, NULL, '2021-09-28', NULL),
(58, 23, NULL, 'Chips - Assorted', 'Merkel cell carcinoma of right ear and external auric canal', 3, 0, NULL, NULL, NULL),
(59, 26, NULL, 'Lamb - Leg, Boneless', 'Monoarthritis, not elsewhere classified, shoulder', 12, 0, NULL, '2021-07-26', NULL),
(60, 21, NULL, 'Pepper - Green Thai', 'Displaced bimalleolar fracture of unspecified lower leg', 12, 0, NULL, '2021-09-13', NULL),
(61, 23, NULL, 'Shrimp - Baby, Cold Water', 'Disp fx of prox phalanx of r idx fngr, 7thP', 5, 1, NULL, '2021-03-25', NULL),
(63, 17, NULL, 'Chocolate - White', 'Strain of unspecified Achilles tendon, sequela', 19, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `name`, `first_name`, `birthday`, `address`, `gender`) VALUES
(1, 'adminco@power.com', '[\"ROLE_ADMIN\"]', '$2y$13$vn.IFvHHkb0nbYrQxl4eqeOi6U76RllEKIsRMNWBn3HJ64NEEK0cC', 'Admin', 'Nistrator', '1990-10-21', 'Chez moi', 'M'),
(2, 'user@user.com', '[\"ROLE_ADMIN\"]', '$2y$13$aOHuvdPbir5HJdfcVt6pneSE/iCmthd4GVsvHpxkJobvg1vyCo94a', 'user', 'user', '1901-01-01', 'UserUser', 'M');

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
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_52EA1F094584665A` (`product_id`),
  ADD KEY `IDX_52EA1F09E238517C` (`order_ref_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD9F34925F` (`id_categorie_id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FK_64C19C1F24F7657` FOREIGN KEY (`id_parent_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_52EA1F094584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_52EA1F09E238517C` FOREIGN KEY (`order_ref_id`) REFERENCES `order` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD9F34925F` FOREIGN KEY (`id_categorie_id`) REFERENCES `category` (`id`);

--
-- Constraints for table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;