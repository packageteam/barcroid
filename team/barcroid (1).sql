-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2015 at 07:32 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `barcroid`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE IF NOT EXISTS `brand` (
`brand_id` int(10) NOT NULL,
  `brand_details` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_details`) VALUES
(1, 'Palmolive'),
(2, 'Silver Swan'),
(3, 'Oishi'),
(4, 'Dove'),
(5, 'Whisper'),
(6, 'Datu Puti'),
(7, 'Creamsilk');

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE IF NOT EXISTS `budget` (
`budget_id` int(30) NOT NULL,
  `budget_amnt` bigint(20) NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory`
--
CREATE TABLE IF NOT EXISTS `inventory` (
`items_id` int(50)
,`items_name` varchar(30)
,`items_unit` varchar(20)
,`items_price` float
,`items_stock` bigint(30)
,`brand_details` varchar(50)
,`location_details` varchar(30)
);
-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE IF NOT EXISTS `items` (
`items_id` int(50) NOT NULL,
  `items_name` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `items_brand` int(10) NOT NULL,
  `items_unit` varchar(20) COLLATE utf8_general_mysql500_ci NOT NULL,
  `items_price` float NOT NULL,
  `items_location` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL,
  `items_stock` bigint(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_brand`, `items_unit`, `items_price`, `items_location`, `items_stock`) VALUES
(1, 'Shampoo Pink', 1, '5 g', 6, '1', 900),
(2, 'Shampoo Pink', 1, '1 bottle', 250, '1', 900),
(3, 'Conditioner Pink', 1, '5 g ', 6, '1', 900),
(4, 'Conditioner Pink', 1, '1 bottle', 390, '1', 892),
(5, 'Soy Sauce', 2, '10 g', 20, '1', 900),
(6, 'Soy Sauce ', 2, '1 L', 300, '1', 900),
(7, 'Spicy', 3, '1 pack', 30, '1', 900),
(8, 'Spicy ', 3, 'small', 7.5, '1', 855);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemtotal`
--
CREATE TABLE IF NOT EXISTS `itemtotal` (
`total` double
,`customer_id` int(5)
);
-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
`location_id` int(10) NOT NULL,
  `location_details` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `location_details`) VALUES
(1, 'Lane 1 '),
(2, 'Lane 2');

-- --------------------------------------------------------

--
-- Table structure for table `temporary`
--

CREATE TABLE IF NOT EXISTS `temporary` (
`id` int(10) NOT NULL,
  `customer_id` int(5) NOT NULL,
  `item` int(45) NOT NULL,
  `qty` int(30) NOT NULL,
  `date` date NOT NULL,
  `status` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `temporary`
--

INSERT INTO `temporary` (`id`, `customer_id`, `item`, `qty`, `date`, `status`) VALUES
(2, 2, 8, 45, '2015-10-06', 1),
(3, 2, 4, 4, '2015-10-06', 1);

-- --------------------------------------------------------

--
-- Stand-in structure for view `temporaryview`
--
CREATE TABLE IF NOT EXISTS `temporaryview` (
`id` int(10)
,`customer_id` int(5)
,`qty` int(30)
,`status` int(5)
,`date` date
,`items_id` int(50)
,`items_name` varchar(30)
,`items_unit` varchar(20)
,`items_price` float
,`items_stock` bigint(30)
,`brand_details` varchar(50)
,`location_details` varchar(30)
);
-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
`trans_id` int(100) NOT NULL,
  `trans_cashier` int(5) NOT NULL,
  `trans_customer` int(5) NOT NULL,
  `trans_date` date NOT NULL,
  `trans_total` bigint(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`user_id` int(100) NOT NULL,
  `user_name` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_username` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_password` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_contact` varchar(13) COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_address` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `user_type` int(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `user_username`, `user_password`, `user_contact`, `user_address`, `user_type`) VALUES
(1, 'Nikki Monique Daug', 'kinkin', 'd02c566d72e6c1627684f570049c9f60', '09069748094', 'El Salvador', 2),
(2, 'Danica Pacana', 'danica', 'b63c10a6673b1c06b05bdce235ab85f5', '09876543212', 'Balulang', 1),
(3, 'Shaira Ohay', 'shaii', '198a4d579048a787de00aa31c03c186f', '12345678901', 'Patag', 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `userview`
--
CREATE TABLE IF NOT EXISTS `userview` (
`user_id` int(100)
,`user_name` text
,`user_username` varchar(50)
,`user_contact` varchar(13)
,`user_address` text
,`type_details` varchar(30)
);
-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE IF NOT EXISTS `user_type` (
`type_id` int(5) NOT NULL,
  `type_details` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`type_id`, `type_details`) VALUES
(1, 'Normal User'),
(2, 'Cashier');

-- --------------------------------------------------------

--
-- Structure for view `inventory`
--
DROP TABLE IF EXISTS `inventory`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `inventory` AS select `i`.`items_id` AS `items_id`,`i`.`items_name` AS `items_name`,`i`.`items_unit` AS `items_unit`,`i`.`items_price` AS `items_price`,`i`.`items_stock` AS `items_stock`,`b`.`brand_details` AS `brand_details`,`l`.`location_details` AS `location_details` from ((`items` `i` left join `brand` `b` on((`i`.`items_brand` = `b`.`brand_id`))) left join `location` `l` on((`i`.`items_location` = `l`.`location_id`)));

-- --------------------------------------------------------

--
-- Structure for view `itemtotal`
--
DROP TABLE IF EXISTS `itemtotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemtotal` AS select (`t`.`qty` * `t`.`items_price`) AS `total`,`t`.`customer_id` AS `customer_id` from (`temporaryview` `t` left join `userview` `u` on((`u`.`user_id` = `t`.`customer_id`)));

-- --------------------------------------------------------

--
-- Structure for view `temporaryview`
--
DROP TABLE IF EXISTS `temporaryview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `temporaryview` AS select `t`.`id` AS `id`,`t`.`customer_id` AS `customer_id`,`t`.`qty` AS `qty`,`t`.`status` AS `status`,`t`.`date` AS `date`,`i`.`items_id` AS `items_id`,`i`.`items_name` AS `items_name`,`i`.`items_unit` AS `items_unit`,`i`.`items_price` AS `items_price`,`i`.`items_stock` AS `items_stock`,`i`.`brand_details` AS `brand_details`,`i`.`location_details` AS `location_details` from (`temporary` `t` left join `inventory` `i` on((`i`.`items_id` = `t`.`item`)));

-- --------------------------------------------------------

--
-- Structure for view `userview`
--
DROP TABLE IF EXISTS `userview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userview` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,`u`.`user_username` AS `user_username`,`u`.`user_contact` AS `user_contact`,`u`.`user_address` AS `user_address`,`t`.`type_details` AS `type_details` from (`user` `u` left join `user_type` `t` on((`u`.`user_type` = `t`.`type_id`)));

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
 ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `budget`
--
ALTER TABLE `budget`
 ADD PRIMARY KEY (`budget_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`items_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `temporary`
--
ALTER TABLE `temporary`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
 ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
 ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
MODIFY `budget_id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `items_id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `temporary`
--
ALTER TABLE `temporary`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
MODIFY `trans_id` int(100) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_type`
--
ALTER TABLE `user_type`
MODIFY `type_id` int(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
