-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: ls-870fd08a895fb478555deefb6f7fcec6fee8565a.c9wqedbgghdx.ap-south-1.rds.amazonaws.com    Database: dairy
-- ------------------------------------------------------
-- Server version	5.6.51-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Dealer_TM_mapping_table`
--

DROP TABLE IF EXISTS `Dealer_TM_mapping_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dealer_TM_mapping_table` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `createdby` varchar(255) DEFAULT NULL,
  `createdon` datetime DEFAULT NULL,
  `isactive` varchar(255) DEFAULT NULL,
  `modifiedby` varchar(255) DEFAULT NULL,
  `modifiedon` datetime DEFAULT NULL,
  `PARZA` varchar(255) DEFAULT NULL,
  `kunnr` varchar(255) DEFAULT NULL,
  `parvw` varchar(255) DEFAULT NULL,
  `pernr` varchar(255) DEFAULT NULL,
  `spart` varchar(255) DEFAULT NULL,
  `vkorg` varchar(255) DEFAULT NULL,
  `vtweg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dealer_TM_mapping_table`
--

LOCK TABLES `Dealer_TM_mapping_table` WRITE;
/*!40000 ALTER TABLE `Dealer_TM_mapping_table` DISABLE KEYS */;
INSERT INTO `Dealer_TM_mapping_table` VALUES (1,'Admin','2022-02-22 11:25:36','Y',NULL,NULL,NULL,'FD1884',NULL,'203442','47','AG01',NULL),(2,'Admin','2022-02-22 12:34:40','Y',NULL,NULL,NULL,'FD1885',NULL,'203442','47','AG01',NULL),(3,'Admin','2022-02-22 12:44:34','Y',NULL,NULL,NULL,'FD1885',NULL,'203442','47','AG01',NULL),(4,'ADMIN','2022-02-23 19:25:48','Y',NULL,NULL,NULL,'DDFG',NULL,'undefined','47','AG01',NULL),(5,'ADMIN','2022-02-24 05:56:35','Y',NULL,NULL,NULL,'FD3003',NULL,'GI-107315','47','AG01',NULL),(6,'ADMIN','2022-02-25 09:07:05','Y',NULL,NULL,NULL,'FD3005',NULL,'GI-107315','47','AG01',NULL);
/*!40000 ALTER TABLE `Dealer_TM_mapping_table` ENABLE KEYS */;
UNLOCK TABLES;
