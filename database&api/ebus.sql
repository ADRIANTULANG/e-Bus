-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 14, 2022 at 02:11 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebus`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(100) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_username` varchar(100) NOT NULL,
  `admin_password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_id`, `admin_name`, `admin_username`, `admin_password`) VALUES
(1, 'Sean', 'admin', 'pass');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus`
--

CREATE TABLE `tbl_bus` (
  `bus_id` int(100) NOT NULL,
  `bus_plate_number` varchar(100) NOT NULL,
  `bus_driver_id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bus`
--

INSERT INTO `tbl_bus` (`bus_id`, `bus_plate_number`, `bus_driver_id`) VALUES
(1, 'EA123', '1'),
(2, 'TB123', '2'),
(5, 'AS897', '2'),
(6, 'HK554', '3'),
(14, 'XZ009', '4'),
(15, 'JI999', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bus_points`
--

CREATE TABLE `tbl_bus_points` (
  `p_id` int(100) NOT NULL,
  `p_address_name` varchar(100) NOT NULL,
  `p_latitude` varchar(100) NOT NULL DEFAULT '0.0',
  `p_longitude` varchar(100) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_bus_points`
--

INSERT INTO `tbl_bus_points` (`p_id`, `p_address_name`, `p_latitude`, `p_longitude`) VALUES
(1, 'Agora Terminal', '8.489677955600268', '124.65754937119932'),
(2, 'Bulua Terminal', '8.511882423698806', '124.62372126795518'),
(3, 'Initao Bus Station', '8.495475581826536', '124.30329142756696'),
(4, 'Manolo Fortich Bus Station', '8.367546046581834', '124.86583202419835'),
(5, 'Laguindingan Bus Station', '8.5712044643985', '124.44779174016757'),
(6, 'Naawan Bus Station', '8.432084310506427', '124.29054900116705'),
(7, 'Iligan - Cagayan Bus Station', '8.399978331317541', '124.29284398736493'),
(8, 'Tambo Gerona Bus Station', '8.253480590874629', '124.26085422265035'),
(9, 'Iligan Integrated Bus and Jeepney Terminal', '8.241808635207132', '124.26068371940033'),
(10, 'Malaybalay City Bus Terminal, Pabillaran Street, Malaybalay, Bukidnon', '8.1480483', '125.1331723'),
(11, 'Dipolog City Bus Terminal, Dipolog, Zamboanga del Norte', '8.5777508', '123.33932060000001'),
(12, 'Bus Terminal of Digos City, Digos City, Davao del Sur, Davao', '6.7387114', '125.3661848'),
(13, 'Bus terminal zamboanga city, Zamboanga, Zamboanga del Sur', '6.9214424', '122.07902669999999'),
(14, 'Dapitan City Bus Terminal, Don Francisco Mercado Street, Dapitan, Zamboanga del Norte', '8.6601623', '123.4220818'),
(15, 'Oroquieta City Bus Terminal, Oroquieta City, Misamis Occidental', '8.492809', '123.79808729999999');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conductor`
--

CREATE TABLE `tbl_conductor` (
  `con_id` int(100) NOT NULL,
  `con_name` varchar(100) NOT NULL,
  `con_username` varchar(100) NOT NULL,
  `con_pass` varchar(100) NOT NULL,
  `con_bus_id` varchar(100) NOT NULL DEFAULT '-'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_conductor`
--

INSERT INTO `tbl_conductor` (`con_id`, `con_name`, `con_username`, `con_pass`, `con_bus_id`) VALUES
(1, 'Jhon Doe', 'conductor', 'pass', '2'),
(2, 'Kick Buttowski', 'kick', 'butt', '1'),
(3, 'Mickey Mouse', 'mickey', 'mouse', '6'),
(4, 'Minnie Mouse', 'minnie', 'mouse', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_driver`
--

CREATE TABLE `tbl_driver` (
  `driver_id` int(100) NOT NULL,
  `driver_name` varchar(100) NOT NULL,
  `isDriving` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_driver`
--

INSERT INTO `tbl_driver` (`driver_id`, `driver_name`, `isDriving`) VALUES
(1, 'Mang Canor', '0'),
(2, 'Mang Peter', '0'),
(3, 'Mang Doming', '0'),
(4, 'Mang Tomas', '0'),
(5, 'Mang Carlos', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_fare_per_kilometers`
--

CREATE TABLE `tbl_fare_per_kilometers` (
  `fare_id` int(100) NOT NULL,
  `fare_amount` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_fare_per_kilometers`
--

INSERT INTO `tbl_fare_per_kilometers` (`fare_id`, `fare_amount`) VALUES
(1, '4.6');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_monetization_percentage`
--

CREATE TABLE `tbl_monetization_percentage` (
  `precentage_id` int(100) NOT NULL,
  `percentage_value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_monetization_percentage`
--

INSERT INTO `tbl_monetization_percentage` (`precentage_id`, `percentage_value`) VALUES
(1, '0.06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_passenger`
--

CREATE TABLE `tbl_passenger` (
  `pas_id` int(100) NOT NULL,
  `pas_name` varchar(100) NOT NULL,
  `pas_username` varchar(100) NOT NULL,
  `pas_password` varchar(100) NOT NULL,
  `pas_balance` varchar(100) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_passenger`
--

INSERT INTO `tbl_passenger` (`pas_id`, `pas_name`, `pas_username`, `pas_password`, `pas_balance`) VALUES
(1, 'Adrian Benedict Tulang', 'passenger', 'pass', '500.00'),
(2, 'Luther Fabella Dagsang', 'luther', 'dagsang', '0.0'),
(3, 'Noel Bulan', 'noel', 'bulan', '0.0'),
(4, 'Sean Geoffrey Caare', 'sean', 'caare', '0.0'),
(5, 'Shielrow Abastillas', 'shielrow', 'abastillas', '0.0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transactions`
--

CREATE TABLE `tbl_transactions` (
  `trans_id` int(100) NOT NULL,
  `trans_pass_id` varchar(100) NOT NULL DEFAULT '-',
  `trans_scannedBy_con_id` varchar(100) NOT NULL DEFAULT '-',
  `trans_origin_id` varchar(100) NOT NULL,
  `trans_destination_id` varchar(100) NOT NULL,
  `trans_fare_amount` varchar(100) NOT NULL DEFAULT '0',
  `trans_date_created` date NOT NULL,
  `trans_status` varchar(100) NOT NULL DEFAULT 'Valid'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_transactions`
--

INSERT INTO `tbl_transactions` (`trans_id`, `trans_pass_id`, `trans_scannedBy_con_id`, `trans_origin_id`, `trans_destination_id`, `trans_fare_amount`, `trans_date_created`, `trans_status`) VALUES
(1, '1', '1', '2', '3', '150.00', '2022-09-12', 'Invalid'),
(2, '1', '1', '2', '5', '200.00', '2022-09-12', 'Invalid'),
(3, '1', '1', '2', '6', '130.00', '2022-09-12', 'Invalid'),
(4, '1', '1', '2', '7', '100.00', '2022-09-12', 'Invalid'),
(5, '1', '1', '2', '3', '400', '2022-09-12', 'Invalid'),
(6, '1', '1', '2', '14', '400', '2022-09-13', 'Invalid'),
(7, '-', '1', '2', '6', '169.85', '2022-09-13', 'Invalid'),
(8, '-', '1', '2', '5', '92.08', '2022-09-13', 'Invalid'),
(9, '-', '1', '2', '3', '158.96', '2022-09-13', 'Invalid'),
(10, '1', '-', '2', '6', '173.62', '2022-09-14', 'Valid'),
(11, '1', '-', '2', '8', '226.50', '2022-09-14', 'Valid'),
(12, '1', '-', '2', '8', '226.50', '2022-09-14', 'Valid'),
(13, '1', '-', '1', '10', '297.79', '2022-09-14', 'Valid'),
(14, '-', '1', '1', '4', '122.65', '2022-09-14', 'Invalid'),
(15, '1', '-', '3', '2', '162.50', '2022-09-14', 'Valid');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_useraccount`
--

CREATE TABLE `tbl_useraccount` (
  `user_id` int(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `usertype` varchar(100) NOT NULL,
  `createAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `account_id` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_useraccount`
--

INSERT INTO `tbl_useraccount` (`user_id`, `username`, `password`, `usertype`, `createAt`, `account_id`) VALUES
(3, 'passenger', 'pass', 'Passenger', '2022-09-11 11:33:53', '1'),
(4, 'admin', 'pass', 'Admin', '2022-09-11 11:35:32', '1'),
(5, 'conductor', 'pass', 'Conductor', '2022-09-11 11:37:26', '1'),
(6, 'kick', 'butt', 'Conductor', '2022-09-11 11:37:26', '2'),
(7, 'mickey', 'mouse', 'Conductor', '2022-09-11 15:24:51', '3'),
(8, 'minnie', 'mouse', 'Conductor', '2022-09-11 15:26:44', '4'),
(9, 'luther', 'dagsang', 'Passenger', '2022-09-14 09:28:31', '2'),
(10, 'noel', 'bulan', 'Passenger', '2022-09-14 09:29:35', '3'),
(11, 'sean', 'caare', 'Passenger', '2022-09-14 09:29:59', '4'),
(12, 'shielrow', 'abastillas', 'Passenger', '2022-09-14 09:30:35', '5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_bus`
--
ALTER TABLE `tbl_bus`
  ADD PRIMARY KEY (`bus_id`);

--
-- Indexes for table `tbl_bus_points`
--
ALTER TABLE `tbl_bus_points`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `tbl_conductor`
--
ALTER TABLE `tbl_conductor`
  ADD PRIMARY KEY (`con_id`);

--
-- Indexes for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `tbl_fare_per_kilometers`
--
ALTER TABLE `tbl_fare_per_kilometers`
  ADD PRIMARY KEY (`fare_id`);

--
-- Indexes for table `tbl_monetization_percentage`
--
ALTER TABLE `tbl_monetization_percentage`
  ADD PRIMARY KEY (`precentage_id`);

--
-- Indexes for table `tbl_passenger`
--
ALTER TABLE `tbl_passenger`
  ADD PRIMARY KEY (`pas_id`);

--
-- Indexes for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `tbl_useraccount`
--
ALTER TABLE `tbl_useraccount`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_bus`
--
ALTER TABLE `tbl_bus`
  MODIFY `bus_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_bus_points`
--
ALTER TABLE `tbl_bus_points`
  MODIFY `p_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_conductor`
--
ALTER TABLE `tbl_conductor`
  MODIFY `con_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_driver`
--
ALTER TABLE `tbl_driver`
  MODIFY `driver_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_fare_per_kilometers`
--
ALTER TABLE `tbl_fare_per_kilometers`
  MODIFY `fare_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_monetization_percentage`
--
ALTER TABLE `tbl_monetization_percentage`
  MODIFY `precentage_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_passenger`
--
ALTER TABLE `tbl_passenger`
  MODIFY `pas_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_transactions`
--
ALTER TABLE `tbl_transactions`
  MODIFY `trans_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tbl_useraccount`
--
ALTER TABLE `tbl_useraccount`
  MODIFY `user_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
