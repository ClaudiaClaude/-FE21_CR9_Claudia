-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2021 at 05:51 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr9_famazon_claudia`
--
CREATE DATABASE IF NOT EXISTS `cr9_famazon_claudia` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr9_famazon_claudia`;

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_ID` int(11) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `zip` varchar(30) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_ID`, `address`, `zip`, `city`, `country`) VALUES
(1, 'Wallensteinplatz 1', '1200', 'Vienna', 'Austria'),
(2, 'Clemens-Hofbauer-platz 10', '1170', 'Vienna', 'Austria'),
(3, 'Lichtensteinstrasse 126', '1090', 'Vienna', 'Austria'),
(4, 'Karlsplatz 10', '1010', 'Vienna', 'Austria'),
(5, 'Hernalser hauptstrasse 23', '1170', 'Vienna', 'Austria'),
(6, 'Linke Winzeile 345', '1050', 'Vienna', 'Austria'),
(7, 'Rechte Winzeile 3', '1050', 'Vienna', 'Austria'),
(8, 'Vohburggasse', '1210', 'Vienna', 'Austria'),
(9, 'SCS-Strasse', '2334', 'Vösendorf', 'Austria');

-- --------------------------------------------------------

--
-- Table structure for table `bank_info`
--

CREATE TABLE `bank_info` (
  `bank_info_ID` int(11) NOT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_account` int(11) DEFAULT NULL,
  `iban` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_info`
--

INSERT INTO `bank_info` (`bank_info_ID`, `bank_name`, `bank_account`, `iban`) VALUES
(1, 'Bank Austria', 1, 'WTW246546546543654654'),
(2, 'Erste Bank', 215, 'WUT5465465654'),
(3, 'Raffaisen Bank', 111, 'WHY63546549651'),
(4, 'Bank Austria', 255444, 'WTW0000077773654654'),
(5, 'Bank Austria', 334444, 'WTW0000088883654654'),
(6, 'Bank Austria', 666444, 'WTW0000099993654654'),
(7, 'Raffaisen Bank', 335555, 'WTW000008005555'),
(8, 'Raffaisen Bank', 334506, 'WTW00000888000654'),
(9, 'Raffaisen Bank', 255444, 'WTW000008800051654');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `contact_ID` int(11) NOT NULL,
  `phone_num` int(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`contact_ID`, `phone_num`, `email`) VALUES
(1, 35244622, 'mydummyemail@wtw.com'),
(2, 36644622, 'myotheremail@wtw.com'),
(3, 37744622, 'mythirdemail@wtw.com');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_ID` int(11) NOT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `fk_contact_ID` int(11) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_payment_info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_ID`, `first_name`, `last_name`, `fk_contact_ID`, `fk_address`, `fk_payment_info`) VALUES
(1, 'John', 'Doe', 1, 1, 1),
(2, 'Jane', 'Doe', 2, 2, 2),
(3, 'Marta', 'Rossi', 2, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_ID` int(11) NOT NULL,
  `total` int(11) DEFAULT NULL,
  `fk_order_items_ID` int(11) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_ID`, `total`, `fk_order_items_ID`, `fk_customer_ID`) VALUES
(1, 400, 1, 3),
(2, 40, 2, 1),
(3, 60, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_items_ID` int(11) NOT NULL,
  `product_quantity` int(11) DEFAULT NULL,
  `fk_product_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_items_ID`, `product_quantity`, `fk_product_ID`) VALUES
(1, 1, 9),
(2, 4, 4),
(3, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `payment_info_ID` int(11) NOT NULL,
  `fk_payment_add` int(11) DEFAULT NULL,
  `fk_bank_info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`payment_info_ID`, `fk_payment_add`, `fk_bank_info`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_ID` int(11) NOT NULL,
  `product_name` varchar(30) DEFAULT NULL,
  `brand` varchar(30) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `fk_seller` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_ID`, `product_name`, `brand`, `price`, `fk_seller`) VALUES
(1, 'LED Lamp', 'Philips', 25, 2),
(2, 'Cooler LED LAMP', 'Samsung', 30, 1),
(3, 'Greatest LED Lamp', 'Huawei', 40, 3),
(4, 'Normal Razor', 'Philips', 10, 1),
(5, 'Cooler Razor', 'Samsung', 25, 2),
(6, 'Greates Razor', 'Huawei', 50, 3),
(7, 'Tablet', 'Samsung', 150, 1),
(8, 'New Gen Tablet', 'Samsung', 250, 2),
(9, 'Greatest new gen Tablet', 'Huawei', 400, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `seller_ID` int(11) NOT NULL,
  `seller_name` varchar(30) DEFAULT NULL,
  `fk_contact_ID` int(11) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_payment_info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sellers`
--

INSERT INTO `sellers` (`seller_ID`, `seller_name`, `fk_contact_ID`, `fk_address`, `fk_payment_info`) VALUES
(1, 'YourShop', 1, 4, 4),
(2, 'TheBestShop', 2, 5, 5),
(3, 'TheGreatesShop', 3, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `shipment_ID` int(11) NOT NULL,
  `fk_order_ID` int(11) DEFAULT NULL,
  `fk_ship_comp_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`shipment_ID`, `fk_order_ID`, `fk_ship_comp_ID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `shipping_companies`
--

CREATE TABLE `shipping_companies` (
  `shipping_company_ID` int(11) NOT NULL,
  `ship_company_name` varchar(30) DEFAULT NULL,
  `fk_contact_ID` int(11) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_payment_info` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shipping_companies`
--

INSERT INTO `shipping_companies` (`shipping_company_ID`, `ship_company_name`, `fk_contact_ID`, `fk_address`, `fk_payment_info`) VALUES
(1, 'We Ship', 1, 7, 7),
(2, 'Also Shipping', 2, 8, 8),
(3, 'Best Shippers', 3, 9, 9);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_ID` int(11) NOT NULL,
  `fk_order_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_ID`, `fk_order_ID`) VALUES
(1, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `wishlist_ID` int(11) NOT NULL,
  `wishlist_name` varchar(30) DEFAULT NULL,
  `fk_product_ID` int(11) DEFAULT NULL,
  `fk_customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`wishlist_ID`, `wishlist_name`, `fk_product_ID`, `fk_customer_ID`) VALUES
(1, 'Wish List', 9, 1),
(2, 'Wish List', 1, 2),
(3, 'Wish List', 4, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_ID`);

--
-- Indexes for table `bank_info`
--
ALTER TABLE `bank_info`
  ADD PRIMARY KEY (`bank_info_ID`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`contact_ID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_ID`),
  ADD KEY `fk_contact_ID` (`fk_contact_ID`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_payment_info` (`fk_payment_info`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_ID`),
  ADD KEY `fk_order_items_ID` (`fk_order_items_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_items_ID`),
  ADD KEY `fk_product_ID` (`fk_product_ID`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`payment_info_ID`),
  ADD KEY `fk_payment_add` (`fk_payment_add`),
  ADD KEY `fk_bank_info` (`fk_bank_info`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `fk_seller` (`fk_seller`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_ID`),
  ADD KEY `fk_contact_ID` (`fk_contact_ID`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_payment_info` (`fk_payment_info`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`shipment_ID`),
  ADD KEY `fk_order_ID` (`fk_order_ID`),
  ADD KEY `fk_ship_comp_ID` (`fk_ship_comp_ID`);

--
-- Indexes for table `shipping_companies`
--
ALTER TABLE `shipping_companies`
  ADD PRIMARY KEY (`shipping_company_ID`),
  ADD KEY `fk_contact_ID` (`fk_contact_ID`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_payment_info` (`fk_payment_info`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_ID`),
  ADD KEY `fk_order_ID` (`fk_order_ID`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`wishlist_ID`),
  ADD KEY `fk_product_ID` (`fk_product_ID`),
  ADD KEY `fk_customer_ID` (`fk_customer_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `bank_info`
--
ALTER TABLE `bank_info`
  MODIFY `bank_info_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `contact_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_items_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `payment_info_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `shipment_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `shipping_companies`
--
ALTER TABLE `shipping_companies`
  MODIFY `shipping_company_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `wishlist_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`fk_contact_ID`) REFERENCES `contacts` (`contact_ID`),
  ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`fk_address`) REFERENCES `addresses` (`address_ID`),
  ADD CONSTRAINT `customers_ibfk_3` FOREIGN KEY (`fk_payment_info`) REFERENCES `payment_info` (`payment_info_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`fk_order_items_ID`) REFERENCES `order_items` (`order_items_ID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customers` (`customer_ID`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`fk_product_ID`) REFERENCES `products` (`product_ID`);

--
-- Constraints for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD CONSTRAINT `payment_info_ibfk_1` FOREIGN KEY (`fk_payment_add`) REFERENCES `addresses` (`address_ID`),
  ADD CONSTRAINT `payment_info_ibfk_2` FOREIGN KEY (`fk_bank_info`) REFERENCES `bank_info` (`bank_info_ID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`fk_seller`) REFERENCES `sellers` (`seller_ID`);

--
-- Constraints for table `sellers`
--
ALTER TABLE `sellers`
  ADD CONSTRAINT `sellers_ibfk_1` FOREIGN KEY (`fk_contact_ID`) REFERENCES `contacts` (`contact_ID`),
  ADD CONSTRAINT `sellers_ibfk_2` FOREIGN KEY (`fk_address`) REFERENCES `addresses` (`address_ID`),
  ADD CONSTRAINT `sellers_ibfk_3` FOREIGN KEY (`fk_payment_info`) REFERENCES `payment_info` (`payment_info_ID`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`fk_order_ID`) REFERENCES `orders` (`order_ID`),
  ADD CONSTRAINT `shipments_ibfk_2` FOREIGN KEY (`fk_ship_comp_ID`) REFERENCES `shipping_companies` (`shipping_company_ID`);

--
-- Constraints for table `shipping_companies`
--
ALTER TABLE `shipping_companies`
  ADD CONSTRAINT `shipping_companies_ibfk_1` FOREIGN KEY (`fk_contact_ID`) REFERENCES `contacts` (`contact_ID`),
  ADD CONSTRAINT `shipping_companies_ibfk_2` FOREIGN KEY (`fk_address`) REFERENCES `addresses` (`address_ID`),
  ADD CONSTRAINT `shipping_companies_ibfk_3` FOREIGN KEY (`fk_payment_info`) REFERENCES `payment_info` (`payment_info_ID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`fk_order_ID`) REFERENCES `orders` (`order_ID`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`fk_product_ID`) REFERENCES `products` (`product_ID`),
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`fk_customer_ID`) REFERENCES `customers` (`customer_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
