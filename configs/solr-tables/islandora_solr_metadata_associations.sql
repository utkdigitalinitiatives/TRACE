-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2016 at 01:41 PM
-- Server version: 5.5.53-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.20

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
-- Table structure for table `islandora_solr_metadata_associations`
--

DROP TABLE IF EXISTS `islandora_solr_metadata_associations`;
CREATE TABLE IF NOT EXISTS `islandora_solr_metadata_associations` (
  `configuration_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID given to each association',
  `configuration_name` varchar(255) NOT NULL COMMENT 'The name of the configuration which this field belongs to',
  `description_field` varchar(255) DEFAULT NULL COMMENT 'The field name as indexed in Solr to be used for displaying description metadata',
  `description_label` varchar(255) DEFAULT NULL COMMENT 'The label for the description metadata',
  `machine_name` varchar(255) NOT NULL COMMENT 'The machine readable name for this association',
  `description_data` longblob COMMENT 'A serialized array of name value pairs that store extra description field settings.',
  PRIMARY KEY (`configuration_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Table that stores saved configuration names.' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `islandora_solr_metadata_associations`
--

INSERT INTO `islandora_solr_metadata_associations` (`configuration_id`, `configuration_name`, `description_field`, `description_label`, `machine_name`, `description_data`) VALUES
(3, 'trace_mods', NULL, NULL, 'tracemods', 0x4e3b);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
