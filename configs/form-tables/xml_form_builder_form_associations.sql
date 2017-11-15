-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 15, 2017 at 08:44 AM
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
-- Table structure for table `xml_form_builder_form_associations`
--

DROP TABLE IF EXISTS `xml_form_builder_form_associations`;
CREATE TABLE IF NOT EXISTS `xml_form_builder_form_associations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_model` varchar(128) DEFAULT NULL COMMENT 'The name of the content model.',
  `form_name` varchar(128) DEFAULT NULL COMMENT 'The name of the stored form.',
  `dsid` varchar(128) DEFAULT NULL COMMENT 'The datastream ID of the metadata to be edited.',
  `title_field` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT 'The form field for the object’s label.',
  `transform` varchar(128) DEFAULT NULL COMMENT 'An XSL transform for setting the Fedora object’s Dublin Core metadata datastream.',
  `self_transform` varchar(128) DEFAULT NULL COMMENT 'A xsl transform for setting the Fedora Object’s Dublin Core metadata datastream.',
  `template` mediumtext COMMENT 'A sample metadata file used to prepopulate the form on ingest.',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table is used to store associations between XML Form...' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `xml_form_builder_form_associations`
--

INSERT INTO `xml_form_builder_form_associations` (`id`, `content_model`, `form_name`, `dsid`, `title_field`, `transform`, `self_transform`, `template`) VALUES
(1, 'islandora:compoundCModel', 'Datasets', 'MODS', 'a:2:{i:0;s:9:"titleInfo";i:1;s:5:"title";}', 'mods_to_dc.xsl', 'UTK_binary_post_process.xsl', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
