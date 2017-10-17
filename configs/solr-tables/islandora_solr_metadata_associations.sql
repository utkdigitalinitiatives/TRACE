-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 07, 2017 at 03:46 PM
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
(3, 'trace_mods', 'utk_mods_etd_abstract_ms', 'Abstract', 'tracemods', 0x613a313a7b733a31303a227472756e636174696f6e223b613a353a7b733a31353a227472756e636174696f6e5f74797065223b733a32313a2273657061726174655f76616c75655f6f7074696f6e223b733a31303a226d61785f6c656e677468223b733a313a2230223b733a393a22776f72645f73616665223b693a303b733a383a22656c6c6970736973223b693a303b733a31393a226d696e5f776f7264736166655f6c656e677468223b733a313a2231223b7d7d);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
