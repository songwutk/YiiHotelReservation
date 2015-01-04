-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 04, 2015 at 12:47 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `res`
--
CREATE DATABASE IF NOT EXISTS `res` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `res`;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` bigint(20) NOT NULL COMMENT 'เลขที่ห้อง',
  `datefrom` date NOT NULL COMMENT 'เข้าพัก',
  `numberofnights` smallint(6) NOT NULL COMMENT 'คืนที่พัก',
  `dateto` date NOT NULL COMMENT 'คืนห้อง',
  `onlinepayment` int(11) NOT NULL COMMENT 'ชำระเงิน Online',
  `confirmreservation` int(11) NOT NULL COMMENT 'ยืนยันการจอง',
  `roomsavailable` int(11) NOT NULL COMMENT 'ห้องว่าง',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ข้อมูลการจอง' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`id`, `roomid`, `datefrom`, `numberofnights`, `dateto`, `onlinepayment`, `confirmreservation`, `roomsavailable`) VALUES
(1, 101, '2015-01-04', 5, '2015-01-09', 500, 1, 2),
(2, 102, '2015-01-04', 2, '2015-01-06', 500, 1, 2),
(3, 101, '2015-01-03', 1, '2015-01-04', 500, 1, 1),
(4, 101, '2015-01-05', 1, '2015-01-06', 500, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservationdetails`
--

CREATE TABLE IF NOT EXISTS `reservationdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationid` int(11) NOT NULL COMMENT 'รหัสรายการ',
  `title` varchar(15) NOT NULL COMMENT 'คำนำหน้าชื่อ',
  `firstname` varchar(255) NOT NULL COMMENT 'ชื่อ',
  `lastname` varchar(255) NOT NULL COMMENT 'นามสกุล',
  `contactnumber` varchar(20) CHARACTER SET latin1 NOT NULL COMMENT 'เบอร์ติดต่อ',
  `emailaddress` varchar(255) CHARACTER SET latin1 NOT NULL COMMENT 'Email',
  `postaddress` varchar(255) NOT NULL COMMENT 'ที่อยู่ทางไปรษณีย์',
  `city` varchar(255) NOT NULL COMMENT 'จังหวัด',
  `county` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL COMMENT 'ประเทศ',
  `postcode` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'รหัสไปรษณีย์',
  `otherinfo` varchar(255) NOT NULL COMMENT 'ข้อมูลเสริม',
  PRIMARY KEY (`id`),
  KEY `reservationid` (`reservationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='รายละเอียดการจอง' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `reservationdetails`
--

INSERT INTO `reservationdetails` (`id`, `reservationid`, `title`, `firstname`, `lastname`, `contactnumber`, `emailaddress`, `postaddress`, `city`, `county`, `country`, `postcode`, `otherinfo`) VALUES
(1, 1, 'นาย', 'ทรงวุฒิ', 'กาญจนโกศัย', '083-949-5153', 'songwutk@gmail.com', '169/9 ถ.ร่องซ้อ', 'ในเวียง', 'เมือง ', 'แพร่', '54000', 'แปะก่อนนะ'),
(2, 2, 'นาย', 'พิสูทธิ์', 'สุริยะวงศ์', '083-949-5154', 'qingxi.cartoon@gmail.com', '169/9 ถ.ร่องซ้อ', 'ในเวียง', 'เมือง', 'แพร่', '54000', ''),
(3, 3, 'น.ส', 'สุภาพ', 'สุริยะวงศ์', '08-5242-2255', 'maenongc@gmail.com', '169/9 ถ.ร่องซ้อ', 'ในเวียง', 'เมือง', 'แพร่', '54000', '');

-- --------------------------------------------------------

--
-- Table structure for table `roomcharge`
--

CREATE TABLE IF NOT EXISTS `roomcharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` int(11) NOT NULL COMMENT 'เลขที่ห้อง',
  `price` int(11) NOT NULL COMMENT 'ราคา',
  PRIMARY KEY (`id`),
  KEY `roomid` (`roomid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='อัตราค่าที่พัก' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roomcharge`
--

INSERT INTO `roomcharge` (`id`, `roomid`, `price`) VALUES
(1, 101, 500),
(2, 102, 500);

-- --------------------------------------------------------

--
-- Table structure for table `roomdetails`
--

CREATE TABLE IF NOT EXISTS `roomdetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roomid` int(11) NOT NULL COMMENT 'เลขที่ห้อง',
  `description` varchar(128) NOT NULL COMMENT 'ข้อมูลเสริม',
  PRIMARY KEY (`id`),
  KEY `roomid` (`roomid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ข้อมูลห้อง' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `roomdetails`
--

INSERT INTO `roomdetails` (`id`, `roomid`, `description`) VALUES
(1, 101, 'เตียงคู่'),
(2, 102, 'เตียงคู่');

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE IF NOT EXISTS `roomtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(128) NOT NULL COMMENT 'ประเภท',
  `quantity` int(11) NOT NULL COMMENT 'จำนวน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='ประเภทห้อง' AUTO_INCREMENT=103 ;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`id`, `description`, `quantity`) VALUES
(101, 'ห้องธรรมดา ชั้น 1', 2),
(102, 'ห้องธรรมดา ชั้น 2', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservationdetails`
--
ALTER TABLE `reservationdetails`
  ADD CONSTRAINT `reservationdetails_ibfk_3` FOREIGN KEY (`reservationid`) REFERENCES `reservation` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roomcharge`
--
ALTER TABLE `roomcharge`
  ADD CONSTRAINT `roomcharge_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `roomtype` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roomdetails`
--
ALTER TABLE `roomdetails`
  ADD CONSTRAINT `roomdetails_ibfk_1` FOREIGN KEY (`roomid`) REFERENCES `roomtype` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
