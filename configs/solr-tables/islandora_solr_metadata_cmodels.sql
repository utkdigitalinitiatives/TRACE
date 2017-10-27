-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 27, 2017 at 01:53 PM
-- Server version: 5.5.55-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `drupal7`
--

-- --------------------------------------------------------

--
-- Table structure for table `islandora_solr_metadata_cmodels`
--

DROP TABLE IF EXISTS `islandora_solr_metadata_cmodels`;
CREATE TABLE IF NOT EXISTS `islandora_solr_metadata_cmodels` (
  `configuration_id` int(11) NOT NULL COMMENT 'The ID of the configuration which this field belongs to',
  `cmodel` varchar(255) NOT NULL COMMENT 'The name of the content model assigned to this configuration'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that stores content models associated to...';

--
-- Dumping data for table `islandora_solr_metadata_cmodels`
--

INSERT INTO `islandora_solr_metadata_cmodels` (`configuration_id`, `cmodel`) VALUES
(3, 'islandora:binaryObjectCModel'),
(3, 'ir:citationCModel'),
(3, 'ir:thesisCModel');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
