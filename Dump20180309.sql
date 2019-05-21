CREATE DATABASE  IF NOT EXISTS `smart sweet co` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `smart sweet co`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smart sweet co
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(10) unsigned zerofill NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (0000000001,'1'),(0000000041,'20');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conveyor_section`
--

DROP TABLE IF EXISTS `conveyor_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conveyor_section` (
  `id` int(10) unsigned zerofill NOT NULL,
  `section` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conveyor_section`
--

LOCK TABLES `conveyor_section` WRITE;
/*!40000 ALTER TABLE `conveyor_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `conveyor_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(10) unsigned zerofill NOT NULL,
  `username` varchar(256) COLLATE utf8_bin NOT NULL,
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `email` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `nationality` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `sex` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `age` int(10) unsigned DEFAULT NULL,
  `occupation` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `balance` decimal(38,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (0000000041,'456','18467','123','123456','465','123',NULL,NULL,'123',500.00);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `customer_id` int(10) unsigned NOT NULL,
  `order` int(11) NOT NULL,
  `address1` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `address2` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `street` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `district` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `city` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `county` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `country` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `customer_address_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_path`
--

DROP TABLE IF EXISTS `customer_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_path` (
  `customer_id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `section` int(10) NOT NULL,
  PRIMARY KEY (`customer_id`,`time`),
  CONSTRAINT `customer_path_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_path`
--

LOCK TABLES `customer_path` WRITE;
/*!40000 ALTER TABLE `customer_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_purchase_log`
--

DROP TABLE IF EXISTS `customer_purchase_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_purchase_log` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `quantity` int(10) NOT NULL,
  `price` decimal(38,2) unsigned NOT NULL,
  `state` varchar(256) COLLATE utf8_bin NOT NULL DEFAULT 'PENDING',
  PRIMARY KEY (`id`,`time`,`product_id`,`customer_id`),
  KEY `customer_purchase_log_customer_id_fk_idx` (`customer_id`),
  CONSTRAINT `customer_purchase_log_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customer_purchase_log_product_id_fk` FOREIGN KEY (`id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_purchase_log`
--

LOCK TABLES `customer_purchase_log` WRITE;
/*!40000 ALTER TABLE `customer_purchase_log` DISABLE KEYS */;
INSERT INTO `customer_purchase_log` VALUES (0000000001,0000000041,'2018-03-09 17:07:14','1',2,3.00,'Pending'),(0000000002,0000000041,'2018-03-09 17:23:48','2',5,10.00,'PENDING');
/*!40000 ALTER TABLE `customer_purchase_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(10) unsigned zerofill NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (0000026500,'12'),(0000019169,'22'),(0000006334,'44'),(0000000041,'555'),(0000000001,'Customer Service Assistant123'),(0000018467,'Test');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_permission_list`
--

DROP TABLE IF EXISTS `group_permission_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permission_list` (
  `group_id` int(10) unsigned zerofill NOT NULL,
  `permission_list_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`group_id`,`permission_list_id`),
  KEY `group_permission_list_permission_id_fk_idx` (`permission_list_id`),
  CONSTRAINT `group_permission_list_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_permission_list_permission_id_fk` FOREIGN KEY (`permission_list_id`) REFERENCES `permission_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_permission_list`
--

LOCK TABLES `group_permission_list` WRITE;
/*!40000 ALTER TABLE `group_permission_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_permission_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `invoice_customer_id_fk_idx` (`customer_id`),
  CONSTRAINT `invoice_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membership_card`
--

DROP TABLE IF EXISTS `membership_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `membership_card` (
  `id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `status` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`),
  CONSTRAINT `membership_card_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membership_card`
--

LOCK TABLES `membership_card` WRITE;
/*!40000 ALTER TABLE `membership_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `membership_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_list`
--

DROP TABLE IF EXISTS `permission_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission_list` (
  `id` int(10) unsigned zerofill NOT NULL,
  `permission` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission_UNIQUE` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_list`
--

LOCK TABLES `permission_list` WRITE;
/*!40000 ALTER TABLE `permission_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(10) unsigned zerofill NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `description` varchar(256) COLLATE utf8_bin DEFAULT NULL,
  `weight` decimal(13,5) unsigned NOT NULL,
  `category_id` int(10) unsigned zerofill NOT NULL,
  `price` decimal(38,2) unsigned NOT NULL,
  `stock` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_category_id_fk_idx` (`category_id`),
  CONSTRAINT `product_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (0000000001,'20','1',1.00000,0000000001,1.00,1),(0000000002,'2','2',2.00000,0000000001,2.00,2),(0000000041,'5','5b',5.00000,0000000041,5.38,17),(0000006334,'5','5',5.00000,0000000001,5.00,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_group`
--

DROP TABLE IF EXISTS `promotion_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_group` (
  `source_id` int(10) unsigned zerofill NOT NULL,
  `reward_id` int(10) unsigned zerofill NOT NULL,
  `start_time` datetime NOT NULL,
  `finish_time` datetime NOT NULL,
  PRIMARY KEY (`source_id`,`reward_id`),
  KEY `promotion_group_reward_id_fk_idx` (`reward_id`),
  CONSTRAINT `promotion_group_reward_id_fk` FOREIGN KEY (`reward_id`) REFERENCES `promotion_reward` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promotion_group_source_id_fk` FOREIGN KEY (`source_id`) REFERENCES `promotion_source` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_group`
--

LOCK TABLES `promotion_group` WRITE;
/*!40000 ALTER TABLE `promotion_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_reward`
--

DROP TABLE IF EXISTS `promotion_reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_reward` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned zerofill NOT NULL,
  `quantity` decimal(38,2) unsigned NOT NULL,
  `discount` decimal(10,5) unsigned NOT NULL,
  `promotion_unit_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`,`product_id`,`quantity`,`discount`,`promotion_unit_id`),
  KEY `promotion_reward_product_id_fk_idx` (`product_id`),
  KEY `promotion_reward_promotion_unit_id_fk_idx` (`promotion_unit_id`),
  CONSTRAINT `promotion_reward_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `promotion_reward_promotion_unit_id_fk` FOREIGN KEY (`promotion_unit_id`) REFERENCES `promotion_unit` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_reward`
--

LOCK TABLES `promotion_reward` WRITE;
/*!40000 ALTER TABLE `promotion_reward` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_source`
--

DROP TABLE IF EXISTS `promotion_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_source` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `product_id` int(10) unsigned zerofill NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`,`product_id`,`quantity`),
  KEY `product_source_product_id_fk_idx` (`product_id`),
  CONSTRAINT `product_source_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_source`
--

LOCK TABLES `promotion_source` WRITE;
/*!40000 ALTER TABLE `promotion_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_unit`
--

DROP TABLE IF EXISTS `promotion_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promotion_unit` (
  `id` int(10) unsigned zerofill NOT NULL,
  `unit` varchar(45) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unit_UNIQUE` (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_unit`
--

LOCK TABLES `promotion_unit` WRITE;
/*!40000 ALTER TABLE `promotion_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack_dimension`
--

DROP TABLE IF EXISTS `rack_dimension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack_dimension` (
  `rack` int(10) unsigned NOT NULL,
  `column` int(10) unsigned NOT NULL,
  `row` int(10) unsigned NOT NULL,
  `x` int(10) NOT NULL,
  `y` int(10) NOT NULL,
  `z` int(10) NOT NULL,
  PRIMARY KEY (`rack`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack_dimension`
--

LOCK TABLES `rack_dimension` WRITE;
/*!40000 ALTER TABLE `rack_dimension` DISABLE KEYS */;
/*!40000 ALTER TABLE `rack_dimension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rack_product`
--

DROP TABLE IF EXISTS `rack_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rack_product` (
  `rack` int(10) unsigned NOT NULL,
  `column` int(10) unsigned NOT NULL,
  `row` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned zerofill NOT NULL,
  `price` decimal(38,2) NOT NULL,
  PRIMARY KEY (`rack`,`column`,`row`),
  KEY `rack_product_product_id_fk_idx` (`product_id`),
  CONSTRAINT `rack_product_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rack_product_rack_fk` FOREIGN KEY (`rack`) REFERENCES `rack_dimension` (`rack`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rack_product`
--

LOCK TABLES `rack_product` WRITE;
/*!40000 ALTER TABLE `rack_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `rack_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resupply_log`
--

DROP TABLE IF EXISTS `resupply_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resupply_log` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `staff_id` int(10) unsigned zerofill NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int(10) unsigned zerofill NOT NULL,
  `quantity` int(10) unsigned zerofill NOT NULL,
  `price` decimal(11,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resupply_log_staff_id_fk_idx` (`staff_id`),
  KEY `resupply_log_product_id_fk_idx` (`product_id`),
  CONSTRAINT `resupply_log_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resupply_log_staff_id_fk` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resupply_log`
--

LOCK TABLES `resupply_log` WRITE;
/*!40000 ALTER TABLE `resupply_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `resupply_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_category`
--

DROP TABLE IF EXISTS `rfid_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_category` (
  `id` int(10) unsigned zerofill NOT NULL,
  `category` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_category`
--

LOCK TABLES `rfid_category` WRITE;
/*!40000 ALTER TABLE `rfid_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `rfid_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_membership_card`
--

DROP TABLE IF EXISTS `rfid_membership_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_membership_card` (
  `rfid_tag_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `membership_card_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`rfid_tag_id`),
  KEY `rfid_membership_card_membership_card_id_fk_idx` (`membership_card_id`),
  CONSTRAINT `rfid_membership_card_membership_card_id_fk` FOREIGN KEY (`membership_card_id`) REFERENCES `membership_card` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rfid_membership_card_rfid_tag_id_fk` FOREIGN KEY (`rfid_tag_id`) REFERENCES `rfid_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_membership_card`
--

LOCK TABLES `rfid_membership_card` WRITE;
/*!40000 ALTER TABLE `rfid_membership_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `rfid_membership_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_product`
--

DROP TABLE IF EXISTS `rfid_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_product` (
  `rfid_tag_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `product_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`rfid_tag_id`),
  KEY `rfid_product_product_id_fk_idx` (`product_id`),
  CONSTRAINT `rfid_product_product_id_fk` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rfid_product_rfid_tag_id_fk` FOREIGN KEY (`rfid_tag_id`) REFERENCES `rfid_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_product`
--

LOCK TABLES `rfid_product` WRITE;
/*!40000 ALTER TABLE `rfid_product` DISABLE KEYS */;
INSERT INTO `rfid_product` VALUES ('20',0000000041);
/*!40000 ALTER TABLE `rfid_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_product_path`
--

DROP TABLE IF EXISTS `rfid_product_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_product_path` (
  `rfid_tag_id` varchar(256) COLLATE utf8_bin NOT NULL,
  `conveyor_section_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`rfid_tag_id`),
  KEY `rfid_product_path_conveyor_section_id_fk_idx` (`rfid_tag_id`),
  KEY `rfid_product_path_conveyor_section_id_fk` (`conveyor_section_id`),
  CONSTRAINT `rfid_product_path_conveyor_section_id_fk` FOREIGN KEY (`conveyor_section_id`) REFERENCES `conveyor_section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rfid_product_path_rfid_tag_id_fk` FOREIGN KEY (`rfid_tag_id`) REFERENCES `rfid_tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_product_path`
--

LOCK TABLES `rfid_product_path` WRITE;
/*!40000 ALTER TABLE `rfid_product_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `rfid_product_path` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rfid_tag`
--

DROP TABLE IF EXISTS `rfid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rfid_tag` (
  `id` varchar(256) COLLATE utf8_bin NOT NULL,
  `category` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rfid_tag_category_id_fk_idx` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rfid_tag`
--

LOCK TABLES `rfid_tag` WRITE;
/*!40000 ALTER TABLE `rfid_tag` DISABLE KEYS */;
INSERT INTO `rfid_tag` VALUES ('20','product');
/*!40000 ALTER TABLE `rfid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `id` int(10) unsigned zerofill NOT NULL,
  `username` varchar(256) COLLATE utf8_bin NOT NULL,
  `password` varchar(256) COLLATE utf8_bin NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(256) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `duty` varchar(256) COLLATE utf8_bin NOT NULL,
  `salary` decimal(38,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (0000000001,'master','master','master account','12345678','master','master',0.00),(0000000041,'2','','2','2','2','2',2.00),(0000018467,'3','','3','3','3','3',3.00);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_duty`
--

DROP TABLE IF EXISTS `staff_duty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_duty` (
  `id` int(10) unsigned zerofill NOT NULL,
  `name` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_duty`
--

LOCK TABLES `staff_duty` WRITE;
/*!40000 ALTER TABLE `staff_duty` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_duty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_group`
--

DROP TABLE IF EXISTS `staff_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_group` (
  `id` int(10) unsigned zerofill NOT NULL,
  `group_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`,`group_id`),
  KEY `staff_group_group_id_fk_idx` (`group_id`),
  CONSTRAINT `staff_group_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff_group_id_fk` FOREIGN KEY (`id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_group`
--

LOCK TABLES `staff_group` WRITE;
/*!40000 ALTER TABLE `staff_group` DISABLE KEYS */;
INSERT INTO `staff_group` VALUES (0000000001,0000000001),(0000000041,0000000001);
/*!40000 ALTER TABLE `staff_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_group_permission_list`
--

DROP TABLE IF EXISTS `staff_group_permission_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_group_permission_list` (
  `group_id` int(10) unsigned zerofill NOT NULL,
  `permission` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`group_id`,`permission`),
  CONSTRAINT `staff_group_permission_list_group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_group_permission_list`
--

LOCK TABLES `staff_group_permission_list` WRITE;
/*!40000 ALTER TABLE `staff_group_permission_list` DISABLE KEYS */;
INSERT INTO `staff_group_permission_list` VALUES (0000000041,'-customer.profile.add'),(0000000041,'-customer.profile.edit'),(0000000041,'-customer.view'),(0000000041,'customer.balance.edit'),(0000000041,'customer.balance.view'),(0000000041,'customer.discount.add'),(0000000041,'customer.discount.del'),(0000000041,'customer.payment.view'),(0000019169,'-customer.discount.edit'),(0000019169,'customer.balance.edit'),(0000019169,'customer.balance.view'),(0000019169,'customer.discount.add'),(0000026500,'-customer.balance.edit'),(0000026500,'customer.balance.view'),(0000026500,'customer.discount.add');
/*!40000 ALTER TABLE `staff_group_permission_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_permission_list`
--

DROP TABLE IF EXISTS `staff_permission_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_permission_list` (
  `id` int(10) unsigned zerofill NOT NULL,
  `permission_list_id` int(10) unsigned zerofill NOT NULL,
  PRIMARY KEY (`id`,`permission_list_id`),
  KEY `staff_permission_list_permission_list_id_fk_idx` (`permission_list_id`),
  CONSTRAINT `staff_permission_list_id_fk` FOREIGN KEY (`id`) REFERENCES `staff` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `staff_permission_list_permission_list_id_fk` FOREIGN KEY (`permission_list_id`) REFERENCES `permission_list` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_permission_list`
--

LOCK TABLES `staff_permission_list` WRITE;
/*!40000 ALTER TABLE `staff_permission_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_permission_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_user_permission_list`
--

DROP TABLE IF EXISTS `staff_user_permission_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff_user_permission_list` (
  `id` int(10) unsigned zerofill NOT NULL,
  `permission` varchar(256) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`,`permission`),
  CONSTRAINT `staff_permission_user_list_id_fk` FOREIGN KEY (`id`) REFERENCES `staff` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_user_permission_list`
--

LOCK TABLES `staff_user_permission_list` WRITE;
/*!40000 ALTER TABLE `staff_user_permission_list` DISABLE KEYS */;
INSERT INTO `staff_user_permission_list` VALUES (0000000001,'customer.discount.edit'),(0000000001,'customer.discount.view'),(0000000001,'customer.information.view'),(0000000001,'customer.payment.auth.process'),(0000000001,'customer.payment.auth.view');
/*!40000 ALTER TABLE `staff_user_permission_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-09 23:31:51
