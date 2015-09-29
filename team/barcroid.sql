-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2015 at 06:11 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_details`) VALUES
(1, 'Palmolive'),
(2, 'Silver Swan');

-- --------------------------------------------------------

--
-- Table structure for table `budget`
--

CREATE TABLE IF NOT EXISTS `budget` (
`budget_id` int(30) NOT NULL,
  `budget_amnt` bigint(20) NOT NULL,
  `customer_id` int(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `budget`
--

INSERT INTO `budget` (`budget_id`, `budget_amnt`, `customer_id`) VALUES
(1, 600, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `inventory`
--
CREATE TABLE IF NOT EXISTS `inventory` (
`items_id` int(50)
,`items_name` varchar(30)
,`items_unit` varchar(20)
,`items_price` float
,`items_stock` varchar(30)
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
  `items_stock` varchar(30) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name`, `items_brand`, `items_unit`, `items_price`, `items_location`, `items_stock`) VALUES
(1, 'Shampoo', 1, '5g', 6, '1', '300'),
(2, 'Soap', 1, '20g', 30, '2', '90'),
(3, 'Soy Sauce', 2, '1 L', 50, '2', '800');

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
-- Table structure for table `quantity`
--

CREATE TABLE IF NOT EXISTS `quantity` (
`qty_id` int(11) NOT NULL,
  `qty_customer_id` int(11) NOT NULL,
  `qty_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
`trans_id` int(100) NOT NULL,
  `trans_cashier` int(5) NOT NULL,
  `trans_customer` int(5) NOT NULL,
  `trans_date` date NOT NULL,
  `trans_total` bigint(30) NOT NULL,
  `trans_budgetedamnt` float NOT NULL,
  `trans_item` int(5) NOT NULL,
  `trans_qty` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `trans_cashier`, `trans_customer`, `trans_date`, `trans_total`, `trans_budgetedamnt`, `trans_item`, `trans_qty`) VALUES
(1, 1, 2, '2015-09-16', 500, 600, 1, 5),
(2, 1, 2, '2015-09-16', 500, 600, 2, 8),
(3, 1, 2, '2015-09-16', 500, 600, 2, 10);

-- --------------------------------------------------------

--
-- Stand-in structure for view `transactionview`
--
CREATE TABLE IF NOT EXISTS `transactionview` (
`trans_id` int(100)
,`trans_date` date
,`trans_total` bigint(30)
,`trans_budgetedamnt` float
,`trans_qty` int(11)
,`cashier_id` int(100)
,`cashier_name` text
,`customer_id` int(100)
,`customer_name` text
,`items_id` int(50)
,`items_name` varchar(30)
,`items_price` float
,`items_unit` varchar(20)
,`location_details` varchar(30)
,`items_stock` varchar(30)
,`brand_details` varchar(50)
);
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
-- Structure for view `transactionview`
--
DROP TABLE IF EXISTS `transactionview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `transactionview` AS select `t`.`trans_id` AS `trans_id`,`t`.`trans_date` AS `trans_date`,`t`.`trans_total` AS `trans_total`,`t`.`trans_budgetedamnt` AS `trans_budgetedamnt`,`t`.`trans_qty` AS `trans_qty`,`u`.`user_id` AS `cashier_id`,`u`.`user_name` AS `cashier_name`,`v`.`user_id` AS `customer_id`,`v`.`user_name` AS `customer_name`,`i`.`items_id` AS `items_id`,`i`.`items_name` AS `items_name`,`i`.`items_price` AS `items_price`,`i`.`items_unit` AS `items_unit`,`i`.`location_details` AS `location_details`,`i`.`items_stock` AS `items_stock`,`i`.`brand_details` AS `brand_details` from (((`transaction` `t` left join `userview` `u` on((`t`.`trans_cashier` = `u`.`user_id`))) left join `inventory` `i` on((`t`.`trans_item` = `i`.`items_id`))) left join `userview` `v` on((`t`.`trans_customer` = `v`.`user_id`)));

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
-- Indexes for table `quantity`
--
ALTER TABLE `quantity`
 ADD PRIMARY KEY (`qty_id`);

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
MODIFY `brand_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `budget`
--
ALTER TABLE `budget`
MODIFY `budget_id` int(30) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
MODIFY `items_id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
MODIFY `location_id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `quantity`
--
ALTER TABLE `quantity`
MODIFY `qty_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
MODIFY `trans_id` int(100) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
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
