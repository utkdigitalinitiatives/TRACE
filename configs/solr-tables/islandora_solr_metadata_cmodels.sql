-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 14, 2016 at 04:07 PM
-- Server version: 5.5.52-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drupal`
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
(1, 'islandora:collectionCModel'),
(1, 'islandora:sp_basic_image'),
(1, 'islandora:pageCModel'),
(1, 'islandora:sp_pdf'),
(1, 'islandora:compoundCModel'),
(2, 'islandora:sp_large_image_cmodel'),
(1, 'islandora:sp-audioCModel'),
(2, 'islandora:bookCModel');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
