-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: dbsym
-- ------------------------------------------------------
-- Server version	5.7.16

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
-- Table structure for table `FD_quotation`
--

DROP TABLE IF EXISTS `FD_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FD_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `FD_quotation_id` varchar(45) NOT NULL,
  `amount` double DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `nic` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`FD_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FD_quotation`
--

LOCK TABLES `FD_quotation` WRITE;
/*!40000 ALTER TABLE `FD_quotation` DISABLE KEYS */;
INSERT INTO `FD_quotation` VALUES (1,'B76VHmEpBYFaHs0nGlo-Yfa1zZKvJgjp',1000,5,'2016-11-07','900074468v','Mr','rrrugjhl','cghj','hama@gmail.com','0123456789','htygj');
/*!40000 ALTER TABLE `FD_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aditional_covers`
--

DROP TABLE IF EXISTS `aditional_covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aditional_covers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_name` varchar(45) DEFAULT NULL,
  `cover_description` varchar(45) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aditional_covers`
--

LOCK TABLES `aditional_covers` WRITE;
/*!40000 ALTER TABLE `aditional_covers` DISABLE KEYS */;
/*!40000 ALTER TABLE `aditional_covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cover_types`
--

DROP TABLE IF EXISTS `cover_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cover_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cover_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cover_types`
--

LOCK TABLES `cover_types` WRITE;
/*!40000 ALTER TABLE `cover_types` DISABLE KEYS */;
INSERT INTO `cover_types` VALUES (1,'3rd Party'),(2,'Full Insurance');
/*!40000 ALTER TABLE `cover_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equation_keys`
--

DROP TABLE IF EXISTS `equation_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equation_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `variable` varchar(45) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equation_keys`
--

LOCK TABLES `equation_keys` WRITE;
/*!40000 ALTER TABLE `equation_keys` DISABLE KEYS */;
/*!40000 ALTER TABLE `equation_keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fuel_types`
--

DROP TABLE IF EXISTS `fuel_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fuel_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_types`
--

LOCK TABLES `fuel_types` WRITE;
/*!40000 ALTER TABLE `fuel_types` DISABLE KEYS */;
INSERT INTO `fuel_types` VALUES (1,'Petrol'),(2,'Diesel'),(3,'Hybrid'),(4,'Electric'),(5,'PHEV'),(6,'JUST LOW');
/*!40000 ALTER TABLE `fuel_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `graphic_info`
--

DROP TABLE IF EXISTS `graphic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `graphic_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) DEFAULT NULL,
  `tooltip_msg` varchar(500) DEFAULT NULL,
  `graphic_info` varchar(500) DEFAULT NULL,
  `insurance_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `graphic_info_fk1_idx` (`insurance_type_id`),
  CONSTRAINT `graphic_info_fk1` FOREIGN KEY (`insurance_type_id`) REFERENCES `insurance_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `graphic_info`
--

LOCK TABLES `graphic_info` WRITE;
/*!40000 ALTER TABLE `graphic_info` DISABLE KEYS */;
INSERT INTO `graphic_info` VALUES (1,NULL,'msg1','cards@2x.png',1),(2,NULL,'msg2','ecosystem@2x.png',1),(3,NULL,'msg3','accounting@2x.png',1),(4,NULL,'msg4','globe@2x.png',1),(5,NULL,'msg5','powerful@2x.png',1);
/*!40000 ALTER TABLE `graphic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_info`
--

DROP TABLE IF EXISTS `group_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_quotation_id` varchar(45) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `passport` varchar(45) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`travel_quotation_id`,`order_no`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_info`
--

LOCK TABLES `group_info` WRITE;
/*!40000 ALTER TABLE `group_info` DISABLE KEYS */;
INSERT INTO `group_info` VALUES (1,'nZ_Hj91CrAYD225FNZ2jW8Sj1wNzoncA','Mr','ewrrwer','kamal','kamal@j.com','0987654321','2016-10-31','dsf234',5),(2,'rhFovOfC9qvxOy8mkCWuSTUluPk1cu-6','Mr','ewrrwer','kamal','kamal@j.com','0987654321','2016-10-31','77654',1),(3,'rhFovOfC9qvxOy8mkCWuSTUluPk1cu-6','Mr','ewrrwer','kamal','kamal@j.com','0987654321','2016-10-30','77654',2),(4,'rhFovOfC9qvxOy8mkCWuSTUluPk1cu-6','Mr','ddtt','kamal','kamal@j.com','0987654321','2016-10-30','77654',3),(5,'rhFovOfC9qvxOy8mkCWuSTUluPk1cu-6','Mr','ewrrwer','kamal','kamal@j.com','0987654321','2016-10-30','77654',4),(6,'rhFovOfC9qvxOy8mkCWuSTUluPk1cu-6','Mr','ewwwwww','kamal','kamal@j.com','0987654321','2016-10-30','dsf234',5);
/*!40000 ALTER TABLE `group_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_travel_quotation`
--

DROP TABLE IF EXISTS `group_travel_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_travel_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_quotation_id` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `number_of_ppl` int(11) DEFAULT NULL,
  `dep_date` date DEFAULT NULL,
  `arraival_date` date DEFAULT NULL,
  `travel_rigon` varchar(45) DEFAULT NULL,
  `medical` varchar(45) DEFAULT NULL,
  `goods` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`travel_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_travel_quotation`
--

LOCK TABLES `group_travel_quotation` WRITE;
/*!40000 ALTER TABLE `group_travel_quotation` DISABLE KEYS */;
INSERT INTO `group_travel_quotation` VALUES (3,'1GJ0e2EZslWVr6CaSCMlj2UideA6szx5','project.m@g.com',10,'2016-11-01','2016-11-09',NULL,NULL,NULL),(8,'7RhniXiwRiBwwaKszkOHMzDk1PG53Bjk','project.m@g.com',5,'2016-11-02','2016-11-10','US','500','500'),(27,'8JZiEKnIHdl2ETMegVS9tcuVMxcmWSs9','project.m@g.com',6,'2016-11-03','2016-11-17','Mrs','500','1000'),(9,'9bfXaJUAOl4V3UlDKkerZJ_94C8Q5SLQ','project.m@g.com',5,'2016-11-02','2016-11-10','US','500','500'),(13,'D8W7sq89pi0wnS4eygcok7YfKnnqQG7S','project.m@g.com',6,'2016-11-02','2016-11-23','Mrs','500','500'),(10,'DiQXWZ04ZDjTzkUGRXb0W2VY_y6TQZPz','project.m@g.com',5,'2016-11-02','2016-11-10','US','500','1000'),(22,'ekXxpw_A0vn_qv2MHrXyjBlJjMQwQ55T','project.m@g.com',6,'2016-11-14','2016-11-22','Mrs','500','1000'),(21,'GG4LX7VpxukPhCI7OeQ2itL6eZMsaCXj','project.m@g.com',5,'2016-11-03','2016-11-16','US','500','1000'),(20,'I37Sd4UhQPK2x0AefEbFdpFPA4Kw8iNk','project.m@g.com',6,'2016-11-03','2016-11-14','US','500','500'),(11,'KpLSdceO9TeMbiNiZMHiCJ9o1eZ0mrSu','project.m@g.com',5,'2016-11-02','2016-11-09','US','500','500'),(7,'KyCnxAWzc5Ngw05szHV8CbsO0bwwdV_K','project.m@g.com',5,'2016-11-02','2016-11-04','US','500','500'),(6,'MxmWKPOKR13iRKGXfDoMTpqjFso69htU','project.m@g.com',5,'2016-11-02','2016-11-10','US','500','500'),(5,'NDEd8VGLp3gi_Is4aZXHO2HhDsk8lxUx','project.m@g.com',7,'2016-11-01','2016-11-09','Mrs','500','500'),(30,'nZ_Hj91CrAYD225FNZ2jW8Sj1wNzoncA','project.m@g.com',5,'2016-11-03','2016-11-08','US','500','1000'),(31,'rhFovOfC9qvxOy8mkCWuSTUluPk1cu-6','project.m@g.com',5,'2016-11-03','2016-11-15','US','500','500'),(12,'S9XkysepkiWKUq3R_C1RLhxS-1eVr5s0','project.m@g.com',5,'2016-11-02','2016-11-10','US','500','500'),(28,'T27kfFrRZXUYqTMT7BuU4mBJVHhUn_Ur','project.m@g.com',5,'2016-11-03','2016-11-16','US','500','500'),(2,'Tmdjs2uQ8kM4hHdp75YL6txel5cxTZj3','project.m@g.com',5,'2016-11-16','2016-11-25',NULL,NULL,NULL),(29,'uaqIVjFVNdO5nHWqu_yjVjhzR5I2W7PK','project.m@g.com',5,'2016-11-03','2016-11-10','US','1000','1000'),(26,'uwpaVf6tQQjoXN6lTU8unYdFqG1PE_Tk','project.m@g.com',5,'2016-11-03','2016-11-10','US','500','500'),(23,'V8HhO1pDhGXw_uJYq9pl2tS7VVgP7Vy6','project.m@g.com',5,'2016-11-03','2016-11-15','US','500','500'),(24,'VyZ41ZRYtFmivWkO3voNdLf0WalnCNbE','project.m@g.com',8,'2016-11-07','2016-11-30','US','500','500'),(1,'y2p_Sn-SNF_ntRJ066RyV3rrbh3ACZYH','project.m@g.com',5,'2016-11-16','2016-11-25',NULL,NULL,NULL);
/*!40000 ALTER TABLE `group_travel_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `housing_loan_quotation`
--

DROP TABLE IF EXISTS `housing_loan_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `housing_loan_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_quotation_id` varchar(45) NOT NULL,
  `property_value` double DEFAULT NULL,
  `requesting_amount` double DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `rate_type` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`loan_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `housing_loan_quotation`
--

LOCK TABLES `housing_loan_quotation` WRITE;
/*!40000 ALTER TABLE `housing_loan_quotation` DISABLE KEYS */;
INSERT INTO `housing_loan_quotation` VALUES (3,'JZbet7wpU_1AIJBUrnRLK53jYrmzXRPQ',10000,500,5,'fixed','Mr','chaminda','name','hama@gmail.com','0123456789','editor'),(2,'naxbAvr7p5XazCWBQohpSDfZwmbcGuCj',10000,4000,5,'fixed',NULL,NULL,NULL,NULL,NULL,NULL),(1,'yNOfAuXH4nEUhQzwerm8m9eG6wKKwg7S',10000,500,5,'fixed',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `housing_loan_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_companies`
--

DROP TABLE IF EXISTS `insurance_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_name` varchar(100) DEFAULT NULL,
  `calculation` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `path` varchar(5000) DEFAULT NULL,
  `motor_vehicle` int(11) DEFAULT '0',
  `motor_bike` int(11) DEFAULT '0',
  `three_wheeler` int(11) DEFAULT '0',
  `travel_single` int(11) DEFAULT '0',
  `travel_family` int(11) DEFAULT '0',
  `investment_fd` int(11) DEFAULT '0',
  `investments_savings` int(11) DEFAULT '0',
  `lease_housing` int(11) DEFAULT '0',
  `lease_vehicles` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_companies`
--

LOCK TABLES `insurance_companies` WRITE;
/*!40000 ALTER TABLE `insurance_companies` DISABLE KEYS */;
INSERT INTO `insurance_companies` VALUES (1,'Ceylinco','2.25',1,NULL,0,0,0,0,0,0,0,0,0),(2,'Janashakthi','2.35',1,NULL,0,0,0,0,0,0,0,0,0),(3,'Sri Lanka Insurance','2.30',1,NULL,0,0,0,0,0,0,0,0,0),(4,'Allianz','2.20',1,NULL,0,0,0,0,0,0,0,0,0),(5,'Continental Insurance','2.25',0,NULL,0,0,0,0,0,0,0,0,0),(6,'AIG','3.22',0,NULL,0,0,0,0,0,0,0,0,0),(7,'Amana','2.86',0,NULL,0,0,0,0,0,0,0,0,0),(8,'Coop','2.34',0,NULL,0,0,0,0,0,0,0,0,0),(9,'HNB','2.30',0,NULL,0,0,0,0,0,0,0,0,0),(10,'LOLC','2.34',0,NULL,0,0,0,0,0,0,0,0,0),(11,'MBSL','2.23',0,NULL,0,0,0,0,0,0,0,0,0),(12,'NITF','2.45',0,NULL,0,0,0,0,0,0,0,0,0),(13,'Orient','2.44',0,NULL,0,0,0,0,0,0,0,0,0),(14,'People\'s Insurance','2.32',0,NULL,0,0,0,0,0,0,0,0,0),(15,'Union Assurance','2.12',0,NULL,0,0,0,0,0,0,0,0,0),(16,'Asian Alliance','2.01',1,NULL,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `insurance_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_company_insurance_type_id`
--

DROP TABLE IF EXISTS `insurance_company_insurance_type_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_company_insurance_type_id` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_company_id` int(11) DEFAULT NULL,
  `insurance_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_company_insurance_type_id`
--

LOCK TABLES `insurance_company_insurance_type_id` WRITE;
/*!40000 ALTER TABLE `insurance_company_insurance_type_id` DISABLE KEYS */;
INSERT INTO `insurance_company_insurance_type_id` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,2),(5,3,1),(6,3,2),(7,4,1);
/*!40000 ALTER TABLE `insurance_company_insurance_type_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_features`
--

DROP TABLE IF EXISTS `insurance_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_id` int(11) DEFAULT NULL,
  `feature` varchar(200) DEFAULT NULL,
  `insurance_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `insurance_features_fk1_idx` (`insurance_id`),
  KEY `insurance_features_fk2_idx` (`insurance_type`),
  CONSTRAINT `insurance_features_fk1` FOREIGN KEY (`insurance_id`) REFERENCES `insurance_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_features_fk2` FOREIGN KEY (`insurance_type`) REFERENCES `insurance_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_features`
--

LOCK TABLES `insurance_features` WRITE;
/*!40000 ALTER TABLE `insurance_features` DISABLE KEYS */;
INSERT INTO `insurance_features` VALUES (3,1,'100% Air Bag Cover ',1),(4,1,'Rs. 1,000,000/= ',1),(5,1,'Rs. 10,000/= ',1),(6,2,'100% Air Bag Cover ',1),(7,2,'Rs. 20,000/= ',1),(8,2,'Rs. 1000/= per day ',1),(11,3,'100% Air Bag Cover ',1),(12,3,'Rs. 30,000/= ',1),(13,3,'Rs. 2000/= per day ',1),(16,4,'100% Air Bag Cover ',1),(17,4,'Rs. 300,000/= ',1),(18,4,'Rs. 2000/= per day ',1),(21,5,'100% Air Bag Cover ',1),(22,5,'Rs. 300,000/=  ',1),(23,5,'Rs. 2000/= per day ',1),(24,1,'no feature',1),(25,1,'no feature',1);
/*!40000 ALTER TABLE `insurance_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_purpose_value`
--

DROP TABLE IF EXISTS `insurance_purpose_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_purpose_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_type` int(11) NOT NULL,
  `insurance_company` int(11) NOT NULL,
  `purpose` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `equation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `insurance_purpose_value_fk1_idx` (`insurance_type`),
  KEY `insurance_purpose_value_fk2_idx` (`insurance_company`),
  KEY `insurance_purpose_value_fk3_idx` (`purpose`),
  CONSTRAINT `insurance_purpose_value_fk1` FOREIGN KEY (`insurance_type`) REFERENCES `insurance_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_purpose_value_fk2` FOREIGN KEY (`insurance_company`) REFERENCES `insurance_companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_purpose_value_fk3` FOREIGN KEY (`purpose`) REFERENCES `purpose` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_purpose_value`
--

LOCK TABLES `insurance_purpose_value` WRITE;
/*!40000 ALTER TABLE `insurance_purpose_value` DISABLE KEYS */;
INSERT INTO `insurance_purpose_value` VALUES (1,1,2,1,500,1,'xy'),(2,1,1,1,400,1,'xy'),(3,1,3,1,600,1,'xy'),(4,1,4,1,480,1,'xy'),(5,1,5,1,350,1,'xy'),(6,1,6,1,100,1,'xy'),(7,1,7,1,500,1,'xy'),(8,1,8,1,200,1,'xy'),(9,1,9,1,700,1,'xy'),(10,1,10,1,900,1,'xy');
/*!40000 ALTER TABLE `insurance_purpose_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_quotation`
--

DROP TABLE IF EXISTS `insurance_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_quotation_id` varchar(45) NOT NULL,
  `v_province` int(11) DEFAULT NULL,
  `v_letters` varchar(45) DEFAULT NULL,
  `v_number` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `nic` varchar(45) DEFAULT NULL,
  `make` varchar(45) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `year` varchar(45) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `no_claim_bonus` double DEFAULT NULL,
  `current_insurer` varchar(45) DEFAULT NULL,
  `cover_type_required` int(11) DEFAULT NULL,
  `ex_insurance_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `voluntary_excess` int(11) DEFAULT NULL,
  `purpose` int(11) DEFAULT NULL,
  `authorise_agent_repair` int(11) DEFAULT NULL,
  `engine_no` varchar(45) DEFAULT NULL,
  `chassis_no` varchar(45) DEFAULT NULL,
  `type_v` int(11) NOT NULL,
  PRIMARY KEY (`insurance_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `insurance_quotation_fk1_idx` (`cover_type_required`),
  KEY `insurance_quotation_fk2_idx` (`voluntary_excess`),
  KEY `insurance_quotation_fk3_idx` (`purpose`),
  CONSTRAINT `insurance_quotation_fk1` FOREIGN KEY (`cover_type_required`) REFERENCES `cover_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_quotation_fk2` FOREIGN KEY (`voluntary_excess`) REFERENCES `voluntary_excess` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_quotation_fk3` FOREIGN KEY (`purpose`) REFERENCES `purpose` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_quotation`
--

LOCK TABLES `insurance_quotation` WRITE;
/*!40000 ALTER TABLE `insurance_quotation` DISABLE KEYS */;
INSERT INTO `insurance_quotation` VALUES (37,'3daYNfbJzTtolVbmpRiTDhbDfJxCImhJ',2,'CAT','1234','Mr','chaminda','hama','chathu.gg@hh.co.com','0123456789','123456789x','5','2',1,'2012',4500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(16,'8V8VSLh67qppK6hrTnO6fKkhtgL-S0SH',1,'CAT','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(22,'8vAgj7Lx1DDlMIwdDGoPVazbperc6yGj',2,'uuu','3333','Mr','chaminda','fernando','hama@gmail.com','0123456789','234567891x','5','2',1,'2011',4000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(35,'9dOc9gf04qvG1288KPdS5myl8j8sEhRv',3,'uuu','5668','Mr','yoko','fernando','chathu.gg@hh.co.com','0123456789','234567891x','5','2',2,'2012',5500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(20,'9q85lmQ8282eoa1-urFZ8R0l9JwSX_uT',8,'CAD','9087','Mr','chaminda','fernando','chathu.gg@hh.co.com','0713232222','234567891x','5','2',1,'2012',4500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(13,'ARD_IxywkkO3eCSD1C6n0aQop6LNis3v',3,'uuu','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(24,'Av-wPFnr8s9esgu9uYOkifvUndROQfIu',6,'CAT','3333','Mr','chaminda','fernando','chathu.gg@hh.co.com','0713232222','123456789x','5','2',2,'2012',5500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,'78889009','23346',1),(39,'CleFmAw6OO25XL9x57o4Oo5srJUQwhDY',3,'CAT','3333','Mr','yoko','fernando','hama@gmail.com','0987654321','234567891x','5','2',2,'2012',5500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(21,'CNTWRtc1vU7kUqCYf9ahPY2lIjVFejIj',1,'uuu','1234','Mr','chaminda','fernando','hama@gmail.com','0123456789','123456789x','5','2',1,'2011',4000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(32,'EyVTHgGEBqWTqA9RJbhQRqfsxTI9Kmai',2,'CAD','3333','Mr','chaminda','hama','hama@gmail.com','0713232222','234567891x','5','2',1,'2012',4500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(40,'fXJst0ypXmu3zbp0O6Xl8aftLVNkl5wa',2,'uuu','1234','Mrs','chaminda','fernando','hama@gmail.com','0123456789','123456789x','5','2',2,'2012',5500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(31,'GSRABX_PiH7a8jmFVwXDstks329thTIT',3,'CAT','3333','Mrs','yoko','hama','hama@gmail.com','0713232222','123456789x','5','2',2,'2013',6000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(10,'IlOITUty-4lBUhM7tpglE0DajnTnGbRt',3,'CAD','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(36,'ItaYRU88U2AxjMq0Ec4bmpbrv3E76eZG',1,'CAT','5668','Mr','rrrugjhl','fernando','chathu.gg@hh.co.com','0123456789','123456789x','5','2',1,'2012',4500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(38,'KSk6PNVQNnTepKfmfCivCtkvNrSNRkd4',2,'CAT','3333','Mrs','chaminda','hama','hama@gmail.com','0713232222','123456789x','5','2',1,'2012',4500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(1,'kZI6Zslrm664zu-xOtLDhh4gtQk2xU9D',1,'CAD','9087','Mr','yoko','name','chathu.gg@hh.co.com','0123456789','234567891x','9','244',NULL,'1912',10000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(15,'nHldpk7Cy9yVnwzFp9xugYy9iPDhqEHW',1,'CAT','5668',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(45,'OWo6hlDN05Cl4trTAXg9fUEt1ZR-Nq17',2,'CAT','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(34,'Q3mq-YrMXUFuOA8kcBdHNkDpCWdQ_EmV',3,'CAT','3333','Mr','yoko','hama','chathu.gg@hh.co.com','0123456789','123456789x','5','2',1,'2012',4500000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(28,'r16CrWZACz5YJ1TIpKmDqRthMxpVmxwc',3,'CAD','5668',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(14,'stSRBfanA4FbXVBve9G0yQC5MEZ_Yp1P',2,'uuu','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(19,'TaCP_m5rQ_shWD79KM9KAiUm-0KdJMVt',1,'yub','5668','Mr','Doctor','Strange','chathu.gg@hh.co.com','0123456789','123456789x','5','2',1,'2012',4060000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(17,'U189Lpgdt6WKe6s75PnlhnLU-BEBrTD_',3,'CAT','3333','Mr','chaminda','fernando','menaka@saveyourmonkey.com','0123456789','123456789x','5','2',NULL,'2011',4000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(11,'UaxVc9TIoGecJ-xucQiPasoM9Hz6BSnK',2,'CAD','5668',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(12,'UfNG1hu5wiCCgOM9G9YtELwjqMxjyGOX',2,'CAT','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(23,'uzSlqFwI7MDf_99oR1YhAKc6t-rrvtTR',2,'CAD','5668','Mr','chaminda','fernando','chathu.gg@hh.co.com','0713232222','123456789x','5','2',1,'2011',4000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(33,'vfGSwol4BPMA5s-Nd48bba_1qiqEueKZ',4,'CAT','3333','Mr','yoko','fernando','hama@gmail.com','0713232222','123456789x','5','2',2,'2013',6000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(41,'xL1TlZyCHX1KOOMljw2d9JDKSGy9gwSj',2,'CAT','5668','Mr','rrrugjhl','name','chathu.gg@hh.co.com','0123456789','123456789x','5','2',2,'2013',6000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(42,'zVCfDsYPckyuqJ37A0Xp4XGlq0A3sd8c',3,'CAT','1234','Mrs','chaminda','fernando','chathu.gg@hh.co.com','0123456789','123456789x','5','2',2,'2011',5000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,'78889009','990',1),(30,'_1YlTjnlXPBcJ4y8bL6_UatG4b56y9Tj',3,'CAT','9087','Mrs','chaminda','fernando','hama@gmail.com','0123456789','123456789x','64','1',1,'2014',8000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,NULL,NULL,1),(43,'_ClmUMtK7hD_AJkdXNNUwrL1uNT4lfm3',2,'uuu','3333','Mr','chaminda','fernando','chathu.gg@hh.co.com','0123456789','123456789x','5','2',1,'2011',4000000,5,'2',1,'2016-11-22 12:00:00','2016-11-23 00:00:00',2,1,0,'78889009','990',1);
/*!40000 ALTER TABLE `insurance_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_quotation_aditional_covers`
--

DROP TABLE IF EXISTS `insurance_quotation_aditional_covers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_quotation_aditional_covers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_quotation_id` varchar(45) NOT NULL,
  `aditional_cover` int(11) NOT NULL,
  `price` double DEFAULT '0',
  PRIMARY KEY (`insurance_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `insurance_quotation_aditional_covers_fk2_idx` (`aditional_cover`),
  CONSTRAINT `insurance_quotation_aditional_covers_fk1` FOREIGN KEY (`insurance_quotation_id`) REFERENCES `insurance_quotation` (`insurance_quotation_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `insurance_quotation_aditional_covers_fk2` FOREIGN KEY (`aditional_cover`) REFERENCES `aditional_covers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_quotation_aditional_covers`
--

LOCK TABLES `insurance_quotation_aditional_covers` WRITE;
/*!40000 ALTER TABLE `insurance_quotation_aditional_covers` DISABLE KEYS */;
/*!40000 ALTER TABLE `insurance_quotation_aditional_covers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_types`
--

DROP TABLE IF EXISTS `insurance_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insurance_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_types`
--

LOCK TABLES `insurance_types` WRITE;
/*!40000 ALTER TABLE `insurance_types` DISABLE KEYS */;
INSERT INTO `insurance_types` VALUES (1,'Vehicle'),(2,'Travel');
/*!40000 ALTER TABLE `insurance_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_info`
--

DROP TABLE IF EXISTS `payment_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(45) DEFAULT NULL,
  `shipping_mentod` int(11) NOT NULL,
  `payment_method` varchar(45) DEFAULT NULL,
  `insurance_quotation_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `shipping_fk1_idx` (`shipping_mentod`),
  KEY `shipping_fk2_idx` (`insurance_quotation_id`),
  CONSTRAINT `shipping_fk1` FOREIGN KEY (`shipping_mentod`) REFERENCES `shipping_method` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `shipping_fk2` FOREIGN KEY (`insurance_quotation_id`) REFERENCES `insurance_quotation` (`insurance_quotation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_info`
--

LOCK TABLES `payment_info` WRITE;
/*!40000 ALTER TABLE `payment_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona_info_single`
--

DROP TABLE IF EXISTS `persona_info_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona_info_single` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `single_basic_info_id` int(11) NOT NULL,
  `passport` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `type` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `persona_info_single_fk1_idx` (`single_basic_info_id`),
  KEY `persona_info_single_fk2_idx` (`type`),
  CONSTRAINT `persona_info_single_fk1` FOREIGN KEY (`single_basic_info_id`) REFERENCES `single_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `persona_info_single_fk2` FOREIGN KEY (`type`) REFERENCES `travel_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona_info_single`
--

LOCK TABLES `persona_info_single` WRITE;
/*!40000 ALTER TABLE `persona_info_single` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona_info_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prefix_honor`
--

DROP TABLE IF EXISTS `prefix_honor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prefix_honor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prefix_honor`
--

LOCK TABLES `prefix_honor` WRITE;
/*!40000 ALTER TABLE `prefix_honor` DISABLE KEYS */;
INSERT INTO `prefix_honor` VALUES (1,'Mr'),(2,'Mrs'),(3,'Ms'),(4,'Master'),(5,'Miss'),(6,'Dr'),(7,'Hon'),(8,'Rev');
/*!40000 ALTER TABLE `prefix_honor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `province_list`
--

DROP TABLE IF EXISTS `province_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `province_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `province_list`
--

LOCK TABLES `province_list` WRITE;
/*!40000 ALTER TABLE `province_list` DISABLE KEYS */;
INSERT INTO `province_list` VALUES (1,'WP'),(2,'NP'),(3,'SP'),(4,'EP'),(5,'NC'),(6,'CP'),(7,'NW'),(8,'SG'),(9,'UP');
/*!40000 ALTER TABLE `province_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purpose`
--

DROP TABLE IF EXISTS `purpose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purpose` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose` varchar(45) DEFAULT NULL,
  `car` int(11) DEFAULT '1',
  `bike` int(11) DEFAULT '1',
  `threeWheel` int(11) DEFAULT '1',
  `heavyVehicle` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purpose`
--

LOCK TABLES `purpose` WRITE;
/*!40000 ALTER TABLE `purpose` DISABLE KEYS */;
INSERT INTO `purpose` VALUES (1,'Social, Domastic & Private Purposes ',1,1,1,1),(3,'Carriage of Passengers ',1,0,1,1),(4,'Hiring or Hired ',1,1,1,1),(5,'Rented or Self Drive Basis',1,1,1,1),(6,'Driving Tuition ',1,1,1,1);
/*!40000 ALTER TABLE `purpose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regions`
--

DROP TABLE IF EXISTS `regions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regions`
--

LOCK TABLES `regions` WRITE;
/*!40000 ALTER TABLE `regions` DISABLE KEYS */;
/*!40000 ALTER TABLE `regions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sampletable`
--

DROP TABLE IF EXISTS `sampletable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sampletable` (
  `id` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Age` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sampletable`
--

LOCK TABLES `sampletable` WRITE;
/*!40000 ALTER TABLE `sampletable` DISABLE KEYS */;
INSERT INTO `sampletable` VALUES (1,'Sample','12');
/*!40000 ALTER TABLE `sampletable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service_id` varchar(45) NOT NULL,
  `service` varchar(300) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping`
--

DROP TABLE IF EXISTS `shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quotation_id` varchar(50) NOT NULL,
  `shipping_method` int(11) DEFAULT NULL,
  `reg_first_name` varchar(50) DEFAULT NULL,
  `reg_last_name` varchar(50) DEFAULT NULL,
  `reg_company` varchar(50) DEFAULT NULL,
  `reg_address` varchar(100) DEFAULT NULL,
  `reg_apt` varchar(50) DEFAULT NULL,
  `reg_city` varchar(50) DEFAULT NULL,
  `reg_country` varchar(50) DEFAULT NULL,
  `reg_postal_code` varchar(50) DEFAULT NULL,
  `reg_phone` varchar(50) DEFAULT NULL,
  `ship_first_name` varchar(50) DEFAULT NULL,
  `ship_last_name` varchar(50) DEFAULT NULL,
  `ship_company` varchar(50) DEFAULT NULL,
  `ship_address` varchar(100) DEFAULT NULL,
  `ship_apt` varchar(50) DEFAULT NULL,
  `ship_city` varchar(50) DEFAULT NULL,
  `ship_country` varchar(50) DEFAULT NULL,
  `ship_postal_code` varchar(50) DEFAULT NULL,
  `ship_phone` varchar(50) DEFAULT NULL,
  `cost` int(11) NOT NULL,
  `insureCompany` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `quotation_id` (`quotation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'apE69X3Am2WEo27VhdQzBmmaH5HPV3x_',1,'menaka','fernando','gajma','kattuwa','44','negombo','other','11203','711656570','','','','','','','','','',222835,NULL),(2,'WAKfjPXO11Rxf7SlLzriaxxoXid1_8Ys',2,'menaka','fernando','new company','kattuwa','44','negombo','US','11203','711656570','','','','','','','','','',350000,NULL),(4,'gqrKoEFhcL1a9hNCyXqxAbwu8WgGjM6p',1,'menaka2','fernando','rrr','kattuwa','23','negombo','US','11203','711656570','','','','','','','','','',21780,NULL),(5,'bluhSZzD3uM6nswO2eVX3U5QTkddMsvs',2,'menaka','fernando','rrr','kattuwa','44','negombo','US','11203','711656570','','','','','','','','','',350000,NULL),(6,'M-Y37esE0T6P0g4ta-m8CFq7knPeRWt0',2,'kamal','perara','kasper','nuwara','66','nuwara','other','998','0987654321','kamal','perara','kasper','nuwara','66','nuwara','other','998','0987654321',3333330,NULL),(7,'_zONclI7jnpTCahpCK9GLlOsye58PcwG',2,'jon','snow','castle black','north','99','wall','US','5578','0117654234','jon','snow','king of the north','winterfell','1','north','US','77','0746734251',3712000,NULL),(8,'-9CZqxXdT28jtRY9X1PXPXAajRM4hy9B',2,'jon','snow','nights watch','castle black','1','north','US','4567','711656570','jon','snow','king of the north','winterfell','99','north','US','11203','711656570',490000,NULL),(9,'6iXWrYmFMASOYVugI0Te7S00BB-GPhbB',2,'menjgjg','men','SYN','kollupitiuya','234','yamana2346','other','456','07143267','menjgjg','men','SYN','kollupitiuya','234','yamana2346','other','456','07143267',20736,NULL),(10,'WbIIPTSXf2v4RaAwuVMjSPZTm_CpjaiV',2,'men','tyu','SYN','kollupitiuya','7657','yamana2346','US','456','45676578','men','tyu','SYN','kollupitiuya','7657','yamana2346','US','456','45676578',4072608,NULL),(11,'y_QAtXHwY2bIFuUC3rip12-ViAvgkKrn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3936854,4),(17,'VXmp4uDA4eFPonthHqvGKfWvgWAEtLIH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140658,2),(18,'NisQA8jJ6RmZQDrqPF2RBzQnkUxDiEW6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(19,'R6VxKiz-mcPot-tq-EpyDAYy30hvJiPH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(20,'j6jAopzS__6cwU5rfudcQdwLra2e0DTF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,478068,2),(21,'BoESAzz4D4d42WJ4gue0Kh8J3ok-QBTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,264289,4),(24,'6oGI4wCXr3YSPNbBCvXgz3GBP4gXTD7K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4716446,3),(25,'_B-NVpLkBmlnUVbjCRUrqAE_Fa5BxPUV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105494,5),(26,'z9icGNC2_M8Vqck7C6FkMx1v9LUkglWw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(27,'y5wFggtqG54JYjzhJZ7JKeoi9zlZ2Ht7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,264289,4),(28,'Tbb_A-MXBknDkl6z4cnyWWuQAuAEECHw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17280,1),(29,'ja8c74LSn35Glpj5f3M6EMcs7s_9pMKB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135969,4),(30,'ypu3hH1OE4P2a4N-PqnGrxDdhTlsLuvW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,117215,1),(31,'RXlkOYkOrh5khBJZLodCyKI3UIGg5hWS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140658,2),(32,'8e-r8T4eEXWX3uduMeS87vt9_DQzRElX',2,NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','456','07143267',NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','456',NULL,4042668,2),(33,'Kyh_b2_i9x1FzRT-PAkc4FFfJkOpjMyP',1,NULL,NULL,NULL,'kollupitiuya','24','colombo','Ketchup','456','07143267',NULL,NULL,NULL,'kollupitiuya','24','colombo','Ketchup','456',NULL,6000,2),(34,'XhzAy4LGDEQlcDvmUcSa9VKHlNWQyK_v',1,NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456','45676578',NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456',NULL,500000,1),(35,'f115r0SDo21VxiG4tkY7a54bnenKqdcE',1,NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','783459','0711656570',NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','783459',NULL,40426680,2),(45,'4tqjti_IfOnI6qHR_D81h9LegoXiMHQA',1,NULL,NULL,NULL,'kollupitiuya','234','yamana','Relish','456','0714326700',NULL,NULL,NULL,'kollupitiuya','234','yamana','Relish','456',NULL,40426680,2),(46,'uP7atEj8QjarGxP3HVX5nkzKlipDn8o4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,474000,2),(47,'uM9lKLisX6Z_dfqZooiouXfvd2AivSzw',1,NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456','0714326700',NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456',NULL,5340000,2),(48,'dLcumJaGpv5THcgSthINfkoal5tY7piU',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,335000,1),(50,'-MPRQGGsDptUKS3vFyhM0GDC2H6OF6B7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3360000,2),(51,'orEX3Of0_jNREmTE99UC3Pu_HFuvyVdu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50000,1),(52,'oUQQ-RllVuDpwvfXlyezfoiq2PPWeWKe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000000,1),(55,'nSHeZCslJK-4sM6tPMertGc2y3LLU8-y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000,2),(56,'nvblgkSjK5xxBFS6r6eXmWFIVQp22V_O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000,2),(57,'GVJUEr71xydlkQXIsVHXhCRZBY99-x7I',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4734000,2),(58,'T107PN-xPHFMCwvpARbArzPJlyQ4F8TW',2,NULL,NULL,NULL,'etet','34','sdfsdf','Ketchup','4567','0123456789',NULL,NULL,NULL,'etet','34','sdfsdf','Ketchup','4567',NULL,407400,2),(59,'JZbet7wpU_1AIJBUrnRLK53jYrmzXRPQ',1,NULL,NULL,NULL,'uybyiun','90','hinmki','Ketchup','8990','0987654321',NULL,NULL,NULL,'uybyiun','90','hinmki','Ketchup','8990',NULL,7000000,3),(60,'2yPZ5WYIfI2zDMsD8X3u2DWq1muPdb9A',1,NULL,NULL,NULL,'sdfsdf','23','sdsdf','Relish','324','0987654321',NULL,NULL,NULL,'sdfsdf','23','sdsdf','Relish','324',NULL,20000000,1),(61,'ZidsUzBji9aB57cH5g375FGHCCod-T29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40600000,4),(63,'idH4alL3pENx_JRBL3nLAZulHiOc7vzr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,400000,1),(64,'aqa07DMyKxJAXcbJ1vaXlhB_AXzIPnnP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,350000,1),(65,'bKBb-43j__F2GX1AZVatVrOIrJuyI7Lj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5000000,1),(66,'kZI6Zslrm664zu-xOtLDhh4gtQk2xU9D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2900000,4),(73,'Av-wPFnr8s9esgu9uYOkifvUndROQfIu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27500000,1),(75,'zVCfDsYPckyuqJ37A0Xp4XGlq0A3sd8c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25000000,1),(76,'_ClmUMtK7hD_AJkdXNNUwrL1uNT4lfm3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,90000,1);
/*!40000 ALTER TABLE `shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shipping_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shipping_method` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'USPS First Class International'),(2,'USPS Priority Mail International');
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_basic_info`
--

DROP TABLE IF EXISTS `single_basic_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_basic_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dob` date DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_basic_info`
--

LOCK TABLES `single_basic_info` WRITE;
/*!40000 ALTER TABLE `single_basic_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `single_basic_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_travel_info`
--

DROP TABLE IF EXISTS `single_travel_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `single_travel_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `single_basic_info_if` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `medical_id` int(11) NOT NULL,
  `region_id` int(11) NOT NULL,
  `date_of_arrival` date DEFAULT NULL,
  `date_of_departure` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `single_travel_info_fk1_idx` (`single_basic_info_if`),
  KEY `single_travel_info_fk2_idx` (`region_id`),
  KEY `single_travel_info_fk3_idx` (`goods_id`),
  KEY `single_travel_info_fk4_idx` (`medical_id`),
  CONSTRAINT `single_travel_info_fk1` FOREIGN KEY (`single_basic_info_if`) REFERENCES `single_basic_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `single_travel_info_fk2` FOREIGN KEY (`region_id`) REFERENCES `regions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `single_travel_info_fk3` FOREIGN KEY (`goods_id`) REFERENCES `travel_goods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `single_travel_info_fk4` FOREIGN KEY (`medical_id`) REFERENCES `travel_medical` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_travel_info`
--

LOCK TABLES `single_travel_info` WRITE;
/*!40000 ALTER TABLE `single_travel_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `single_travel_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top_five_feature`
--

DROP TABLE IF EXISTS `top_five_feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_five_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `insurance_id` int(11) DEFAULT NULL,
  `row1` varchar(45) DEFAULT NULL,
  `row2` varchar(45) DEFAULT NULL,
  `row3` varchar(45) DEFAULT NULL,
  `row4` varchar(45) DEFAULT NULL,
  `row5` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top_five_feature`
--

LOCK TABLES `top_five_feature` WRITE;
/*!40000 ALTER TABLE `top_five_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `top_five_feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_goods`
--

DROP TABLE IF EXISTS `travel_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_goods` double DEFAULT NULL,
  `travel_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `travel_goods_fk1_idx` (`travel_type`),
  CONSTRAINT `travel_goods_fk1` FOREIGN KEY (`travel_type`) REFERENCES `travel_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_goods`
--

LOCK TABLES `travel_goods` WRITE;
/*!40000 ALTER TABLE `travel_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_medical`
--

DROP TABLE IF EXISTS `travel_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_medical` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medical` double DEFAULT NULL,
  `travel_type` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `travel_medical_fk1_idx` (`travel_type`),
  CONSTRAINT `travel_medical_fk1` FOREIGN KEY (`travel_type`) REFERENCES `travel_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_medical`
--

LOCK TABLES `travel_medical` WRITE;
/*!40000 ALTER TABLE `travel_medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_quotation_single`
--

DROP TABLE IF EXISTS `travel_quotation_single`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_quotation_single` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_quotation_id` varchar(45) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `cover_type` int(11) DEFAULT NULL,
  `date_of_departure` date DEFAULT NULL,
  `date_of_arrival` date DEFAULT NULL,
  `travel_rigon` varchar(45) DEFAULT NULL,
  `medical` varchar(45) DEFAULT NULL,
  `goods` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `passport` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`travel_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_quotation_single`
--

LOCK TABLES `travel_quotation_single` WRITE;
/*!40000 ALTER TABLE `travel_quotation_single` DISABLE KEYS */;
INSERT INTO `travel_quotation_single` VALUES (32,'2yPZ5WYIfI2zDMsD8X3u2DWq1muPdb9A','pro@gmail.com','2016-10-31',1,'2016-11-04','2016-11-30','US','1000','500',NULL,NULL,NULL,NULL,NULL),(25,'3F7hA_GHu4NjQiwievsYQ17RfeDvF3hM','vaq@f.comq','2016-10-26',NULL,'2016-10-28','2016-11-02','Others','500','1000',NULL,NULL,NULL,NULL,NULL),(5,'3v6Mc8GjefKpQUD9wQohYY6fvSfsIBXU','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'541MZ3I1dLamu2XEC02D4n27v7NztPTi','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'5GVDxXbcZe119aMFuB83UIfgeCaYiEl9','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(15,'cHZo9Zr0Au8f8Rcz8vQCwokN5_Eh1tzu','va@f.com','2016-10-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'iarRYcG1Ozl8TorYxAehjqFCEv5_l8LH','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'is7hNGhejAJenEBSNRiuzfp6R4epF2vJ','vaq@f.comq','2016-10-18',NULL,'2016-10-27','2016-11-03','US','1000','1000',NULL,NULL,NULL,NULL,NULL),(20,'IxUxHF-pGFUNZyDbMy6v-jbic8Z_f10l','va@f.com','2016-10-04',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'kmOcmZW2mH9xGXaSkJ2QxA9Z60Jw-GgU','va@f.com','2016-10-10',NULL,'2016-10-28','2016-11-01','US','1000','500',NULL,NULL,NULL,NULL,NULL),(11,'kNPtQJ5e5l_r0Vn71A879vKgOMJ5cdqJ','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'mJKp02TFyVhBYSnMSyP9592TrRMxt5wn','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'nCABXR9uLwoWJIHgwRi9EKxvPj8D0xIN','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'pNaJu6Yraon16PD7631Yjp7dpbaINgDU','va@f.com','2016-10-28',NULL,'2016-10-28','2016-11-03','US','500','1000',NULL,NULL,NULL,NULL,NULL),(27,'qpt_jiecAITqFxpPRhXIjKtZXRVUdV5X','vaq@f.comq','2016-10-26',NULL,'2016-10-28','2016-11-04','US','500','500',NULL,NULL,NULL,NULL,NULL),(28,'rnl1etkI_mrsfZZU1vT2kUQSa90w6syt','va@f.com','2016-10-27',NULL,'2016-10-28','2016-11-02','Others','1000','500','Mr','men','0711656570','23455','tyu'),(29,'T107PN-xPHFMCwvpARbArzPJlyQ4F8TW','pro@gmail.com','2016-10-30',NULL,'2016-11-01','2016-11-02','US','500','500','Mr','yoko','0123456789','235789','hama'),(10,'t5gchEC6bfaDvHNBUcY_jaXRulaLuziT','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'uEa5O7HeY-j_4VT9K_dVPprnhNQNv64j','va@f.com','2016-10-19',NULL,'2016-10-28','2016-11-03','US','1000','1000',NULL,NULL,NULL,NULL,NULL),(21,'uG3MIo4FoRRi6aqmXAN-_3E-hFw-STUZ','va@f.com','2016-09-27',NULL,'2016-10-27','2016-11-04','Others','500','1000',NULL,NULL,NULL,NULL,NULL),(30,'wKA-e9IpeenXi9SN2Om47R6Fe7HgH9vh','pro@gmail.com','2016-11-01',1,'2016-11-01','2016-11-02','US','500','500','Mr','yoko','0711656570','1243847','hama'),(14,'WTySQwChykpiEf69OOa280rBYVdmru0C','va@f.com','2016-10-26',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'y2p_Sn-SNF_ntRJ066RyV3rrbh3ACZYH','pro@gmail.com','2016-11-01',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `travel_quotation_single` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_type`
--

DROP TABLE IF EXISTS `travel_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `travel_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_type`
--

LOCK TABLES `travel_type` WRITE;
/*!40000 ALTER TABLE `travel_type` DISABLE KEYS */;
INSERT INTO `travel_type` VALUES (1,'Single Trip'),(2,'Multi Trip');
/*!40000 ALTER TABLE `travel_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travel_values`
--

DROP TABLE IF EXISTS `travel_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travel_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medicals` double DEFAULT NULL,
  `goods` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travel_values`
--

LOCK TABLES `travel_values` WRITE;
/*!40000 ALTER TABLE `travel_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `travel_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Sam','Colombo','admin@gmail.com','07771231233'),(2,'Dam','Galle','dam@gmail.com','07771235533'),(3,'John','Kandy','john@gmail.com','07771234233'),(5,'kamal','angoda','pkamal@pcloud.com','0546689456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `value_added_service`
--

DROP TABLE IF EXISTS `value_added_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `value_added_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `value_added_service`
--

LOCK TABLES `value_added_service` WRITE;
/*!40000 ALTER TABLE `value_added_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `value_added_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variable_value`
--

DROP TABLE IF EXISTS `variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purpose_id` int(11) NOT NULL,
  `variable` int(11) NOT NULL,
  `variable_value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `variable_ value_fk2_idx` (`variable`),
  KEY `variable_ value_fk1_idx` (`purpose_id`),
  CONSTRAINT `variable_ value_fk1` FOREIGN KEY (`purpose_id`) REFERENCES `insurance_purpose_value` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `variable_ value_fk2` FOREIGN KEY (`variable`) REFERENCES `equation_keys` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variable_value`
--

LOCK TABLES `variable_value` WRITE;
/*!40000 ALTER TABLE `variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_lease_quotation`
--

DROP TABLE IF EXISTS `vehicle_lease_quotation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_lease_quotation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lease_quotation_id` varchar(45) NOT NULL,
  `vehicle_Value` double DEFAULT NULL,
  `down_payment` double DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `profession` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`lease_quotation_id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_lease_quotation`
--

LOCK TABLES `vehicle_lease_quotation` WRITE;
/*!40000 ALTER TABLE `vehicle_lease_quotation` DISABLE KEYS */;
INSERT INTO `vehicle_lease_quotation` VALUES (2,'6-H5RyIStmx2tW2gdmnXLDKJk5LjQJzG',1000,100,7,'registered','Mr','chaminda','fernando','chathu.gg@hh.co.com','0123456789','editor'),(1,'Zop7hOXeLSiOAzZuS5v8jGUOyzeVspl2',10000,1000,6,'registered',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vehicle_lease_quotation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_make`
--

DROP TABLE IF EXISTS `vehicle_make`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_make` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `make` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_make`
--

LOCK TABLES `vehicle_make` WRITE;
/*!40000 ALTER TABLE `vehicle_make` DISABLE KEYS */;
INSERT INTO `vehicle_make` VALUES (1,'AUDI'),(2,'VOLKS WAGON'),(3,'BMW'),(4,'BMW 1 SERIES'),(5,'BMW 3 SERIES'),(6,'BMW 5 SERIES'),(7,'BMW 7 SERIES'),(8,'BMW I SERIES'),(9,'CHERY'),(10,'DAIHATSU'),(11,'DFSK'),(12,'HYUNDAI'),(13,'HONDA'),(14,'JAGUAR'),(15,'KIA'),(16,'LAND ROVER'),(17,'LEXUS'),(18,'MARUTI/SUZUKI '),(19,'MAZDA'),(20,'MERCEDES BENZ'),(21,'MITSUBISHI'),(22,'MICRO'),(23,'NISSAN'),(24,'RANGE ROVER'),(25,'SUZUKI'),(26,'Subaru'),(27,'TOYOTA');
/*!40000 ALTER TABLE `vehicle_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_models`
--

DROP TABLE IF EXISTS `vehicle_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) DEFAULT NULL,
  `vehicleModel` varchar(80) DEFAULT NULL,
  `vehicleType` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_models`
--

LOCK TABLES `vehicle_models` WRITE;
/*!40000 ALTER TABLE `vehicle_models` DISABLE KEYS */;
INSERT INTO `vehicle_models` VALUES (1,1,'A4',1,1),(2,1,'A6',1,1),(3,1,'Q3',1,1),(4,1,'Q 730 LT(JEEP)',1,1),(5,3,'X1',1,1),(6,3,'X3',1,1),(7,3,'X5',1,1),(8,4,'E82    118I',1,1),(9,5,'E30    320i/325i',1,1),(10,5,'E30    320d',1,1),(11,5,'E36   328i/318i/M3',1,1),(12,5,'E36    320d',1,1),(13,5,'E46   325i/325xi/330i/',1,1),(14,5,'E46          320d',1,1),(15,5,'E90     SEDAN 320I',1,1),(16,5,'E90     SEDAN 320D',1,1),(17,5,'E91    WAGON',1,1),(18,5,'E92    COUPE',1,1),(19,5,'F30/31    320I',1,1),(20,5,'F30/31    320D',1,1),(21,6,'E34    520I/525I',1,1),(22,6,'E34    520D',1,1),(23,6,'E39    520I/525I',1,1),(24,6,'E39    530D',1,1),(25,6,'E60    528I/535I',1,1),(26,6,'E60    545D',1,1),(27,6,'F10    520i',1,1),(28,6,'F10    520D',1,1),(29,7,'E38     730i/735i/740i',1,1),(30,7,'           730d',1,1),(31,7,'E65   730I/740I/745I',1,1),(32,7,'E65     730D',1,1),(33,7,'ACTIVE HYBRID 3',1,1),(34,7,'ACTIVE HYBRID  5 ',1,1),(35,8,'I3   ELECTRIC',1,1),(36,8,'I8   PHEV',1,1),(37,9,'QQ',1,1),(38,9,'FULL WING',1,1),(39,9,'YOYO',1,1),(40,9,'TIGO',1,1),(41,9,'J 11',1,1),(42,10,'TERIOS',1,1),(43,10,'MIRA',1,1),(44,11,'GLORY MANUAL',1,1),(45,11,'BRILLIANCE HZ',1,1),(46,11,'V27(MINI VAN)',1,1),(47,12,'SANTAFE',1,1),(48,12,'TUCSON (4WD)',1,1),(49,12,'H100',1,1),(50,13,'INSIGHT',1,1),(51,13,'FIT GP1',1,1),(52,13,'FIT GP2',1,1),(53,13,'FIT GP5',1,1),(54,13,'CRV',1,1),(55,13,'CRZ',1,1),(56,13,'GRACE GM4',1,1),(57,13,'GRACE LX',1,1),(58,13,'GRACE EX',1,1),(59,13,'FREED 7',1,1),(60,13,'CITY',1,1),(61,13,'Fit Shuttle',1,1),(62,13,'CIVIC FD 4',1,1),(63,13,'CIVIC FD 1',1,1),(64,13,'CIVIC FD 3',1,1),(65,13,'CIVIC EK3',1,1),(66,13,'Airwave',1,1),(67,13,'VEZEL Z',1,1),(68,13,'VEZEL RU3',1,1),(69,13,'VEZEL RS ',1,1),(70,14,'XF',1,1),(71,15,'SPOTAGE',1,1),(72,15,'SORRENTO',1,1),(73,15,'CERATO',1,1),(74,15,'PICANTO',1,1),(75,15,'RIO',1,1),(76,16,'FREE LANDER',1,1),(77,16,'DISCOVERY 4',1,1),(78,16,'DISCOVERY ',1,1),(79,16,'DEFENDER',1,1),(80,17,'RX 450H',1,1),(81,18,'ALTO',1,1),(82,18,'ALTO 800',1,1),(83,18,'ALTO K10',1,1),(84,18,'ALTO K10 A/T',1,1),(85,18,'CELERIO',1,1),(86,18,'CELERIO A/T',1,1),(87,18,'A STAR ',1,1),(88,18,'A STAR A/T',1,1),(89,18,'MARUTI 800',1,1),(90,19,'2',1,1),(91,19,'3',1,1),(92,19,'6 (2.0)',1,1),(93,19,'6 (2.5)',1,1),(94,19,'CX 5 (2.0 2WD)',1,1),(95,19,'CX 5 (2.0 4WD)',1,1),(96,19,'DEMIO',1,1),(97,19,'AXELA',1,1),(98,19,'BONGO',1,1),(99,19,'BONGO BROWNY',1,1),(100,20,'C 180',1,1),(101,20,'C180 EXCLUSIVE',1,1),(102,20,'C180 AVANTGARDE',1,1),(103,20,'C220 CDI',1,1),(104,20,'C300 ',1,1),(105,20,'C300 DIESEL',1,1),(106,20,'CLA200',1,1),(107,20,'E 200 CGI ',1,1),(108,20,'E200 EXCLUSIVE',1,1),(109,20,'E200 AMG LINE',1,1),(110,20,'S300 DIESEL',1,1),(111,20,'S300',1,1),(112,20,'S350  WDD205',1,1),(113,20,'S350 WDD221',1,1),(114,20,'S400',1,1),(115,20,'S500 PLUGIN HYBRID',1,1),(116,20,'E300',1,1),(117,20,'GLE250D 4 MATIC',1,1),(118,20,'GLC250 4 MATIC',1,1),(119,20,'GLA200',1,1),(120,21,'MONTERO ',1,1),(121,21,'MONTERO SPORT',1,1),(122,21,'SHOGUN',1,1),(123,21,'OUTLANDER',1,1),(124,21,'LANCER',1,1),(125,21,'LANCER EX',1,1),(126,21,'PO5',1,1),(127,21,'PI5',1,1),(128,21,'P25',1,1),(129,21,'P45',1,1),(130,21,'L400',1,1),(131,22,'REXTON 3.0L',1,1),(132,22,'REXTON 2.0L',1,1),(133,22,'KORANDO',1,1),(134,22,'TOURER',1,1),(135,22,'KYRON',1,1),(136,22,'ACTYON',1,1),(137,23,'X- TRAIL',1,1),(138,23,'TIIDA',1,1),(139,23,'SUNNY FB 14 (1.5)',1,1),(140,23,'SUNNY B 14 (1.3)',1,1),(141,23,'SUNNY B 14 ',1,1),(142,23,'SUNNY FB 15 (1.5) EX',1,1),(143,23,'SUNNY FB 15 (1.5) SS',1,1),(144,23,'SUNNY B 15 (1.3)',1,1),(145,23,'SUNNY N16',1,1),(146,23,'SHILPHY FG 10 (1.3)',1,1),(147,23,'SHILPHY FG 10 (1.5)',1,1),(148,23,'SHILPHY FG 11 (1.5)',1,1),(149,23,'SHILPHY B 17 (1.6L)',1,1),(150,23,'PULSAR N 14',1,1),(151,23,'PULSAR SN 14',1,1),(152,23,'PULSAR FN 15',1,1),(153,23,'MARCH K11 3D 1.0L',1,1),(154,23,'MARCH K11 3D 1.3L',1,1),(155,23,'MARCH K 11 5D 1.L',1,1),(156,23,'MARCH K 11 5D 1.3L',1,1),(157,23,'MARCH  K12 1.3L',1,1),(158,23,'NISSAN LEAF ZE0',1,1),(159,23,'NISSAN LEAF  AZE0',1,1),(160,23,'NISSAN PREMERA P11',1,1),(161,23,'NISSAN PREMIRA P12',1,1),(162,23,'FAIRLADY COUPE)',1,1),(163,23,'JUKE',1,1),(164,23,'WINGROAD Y 11',1,1),(165,23,'WINGROAD Y 12',1,1),(166,23,'NAVARA',1,1),(167,23,'CARAVAN/HOMY E24 (M)',1,1),(168,23,'CARAVAN/HOMY E24',1,1),(169,23,'CARAVAN/HOMY E24(M)',1,1),(170,23,'CARAVAN E25 ',1,1),(171,23,'CARAVAN NV350',1,1),(172,24,'IVOQUE',1,1),(173,24,'0',1,1),(174,25,'GRAND VITARA (2.0D 2WD)',1,1),(175,26,'Forester',1,1),(176,26,'Impreza GD2',1,1),(177,26,'Impreza WRX 7',1,1),(178,26,'Legacy B4',1,1),(179,26,'Subaru XV',1,1),(180,26,'XV',1,1),(181,26,'STI 4 RA',1,1),(182,27,'AXIO',1,1),(183,27,'ALION 240',1,1),(184,27,'ALION 260',1,1),(185,27,'COROLLA (121)',1,1),(186,27,'COROLLA (141 LX)',1,1),(187,27,'COROLLA (141)',1,1),(188,27,'COROLLA 110',1,1),(189,27,'CERES',1,1),(190,27,'MARINO',1,1),(191,27,'CYNOS',1,1),(192,27,'TERCEL/CROSA',1,1),(193,27,'STARLET',1,1),(194,27,'COROLLA 11 (2door)',1,1),(195,27,'CORONA 210',1,1),(196,27,'CARINA 210',1,1),(197,27,'CAMRY',1,1),(198,27,'CROWN',1,1),(199,27,'HARRIER',1,1),(200,27,'FORTUNER',1,1),(201,27,'LAND CRUISER 200',1,1),(202,27,'LAND CRUISER 200-fo',1,1),(203,27,'LAND CRUISER 200-so',1,1),(204,27,'PREMIO',1,1),(205,27,'PRADO 150-fo',1,1),(206,27,'PRADO 150-so',1,1),(207,27,'PRADO 150-fol',1,1),(208,27,'PRADO 150-3l',1,1),(209,27,'YARIS',1,1),(210,27,'BELTA',1,1),(211,27,'VIOS',1,1),(212,27,'COROLLA (ZRE171R)',1,1),(213,27,'PRIUS (ZEW30)',1,1),(214,27,'PRIUS C',1,1),(215,27,'PRIUS CX',1,1),(216,27,'AQUA',1,1),(217,27,'VITS KSP 90',1,1),(218,27,'VITS SCP 90',1,1),(219,27,'VITS KSP 130',1,1),(220,27,'AVENZA 1.5 A/T',1,1),(221,27,'AVENZA 1.3 A/T',1,1),(222,27,'RAV4 (ASA44)',1,1),(223,27,'HIACE HIGH ROOF',1,1),(224,27,'HIACE FLAT ROOF',1,1),(225,27,'HILUX D/CAB 4X4',1,1),(226,27,'HILUX S/CAB 4X4',1,1),(227,27,'HILUX S/CAB 2X4',1,1),(228,27,'HILUX D/CAB 2X4',1,1),(229,27,'HIACE LH 103',1,1),(230,27,'HIACE RZH 112',1,1),(231,27,'HIACE LH 113',1,1),(232,27,'HIACE LH 119',1,1),(233,27,'HIACE KZH 110',1,1),(234,27,'HIACE LH 123',1,1),(235,27,'HIACE LH 162',1,1),(236,27,'HIACE LH 168',1,1),(237,27,'HIACE LH 172',1,1),(238,27,'HIACE LH 182',1,1),(239,27,'HIACE  KDH 200',1,1),(240,27,'HIACE  KDH 201',1,1),(241,27,'HIACE  KDH 205',1,1),(242,27,'HIACE  KDH 220',1,1),(243,27,'HIACE  KDH 221',1,1),(244,27,'HIACE  KDH 223',1,1),(245,27,'TOWN ACE CR 41',1,1),(246,27,'TOWN ACE CR 42',1,1),(247,27,'TOWN ACE KR 41',1,1),(248,27,'TOWN ACE KR 42',1,1),(249,27,'TOWN ACE CR 42 NOAH',1,1),(250,27,'TOWN ACE KR 42 NOAH',1,1),(251,27,'TOWN ACE CR 42 / KR42',1,1),(252,27,'TOWN ACE CR 51',1,1),(253,27,'TOWN ACE CR27',1,1),(254,27,'TOWN ACE CR36 (4WD)',1,1),(255,27,'TOWN ACE',1,1),(256,2,'TIGUAN',1,1);
/*!40000 ALTER TABLE `vehicle_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL,
  `vehicle_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'CAR'),(2,'BIKE'),(3,'3 WHEELER');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_valivation`
--

DROP TABLE IF EXISTS `vehicle_valivation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_valivation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `model_id` int(11) DEFAULT NULL,
  `fuel_type` int(11) DEFAULT NULL,
  `year` year(4) DEFAULT NULL,
  `valivation` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1091 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_valivation`
--

LOCK TABLES `vehicle_valivation` WRITE;
/*!40000 ALTER TABLE `vehicle_valivation` DISABLE KEYS */;
INSERT INTO `vehicle_valivation` VALUES (10,1,1,2014,8000000),(11,1,2,2014,8500000),(12,2,1,2014,10000000),(13,2,2,2014,11000000),(14,3,1,2014,12000000),(15,4,1,2012,20000000),(16,5,1,2011,4000000),(17,5,1,2012,4500000),(18,5,1,2013,5000000),(19,5,1,2014,5000000),(20,5,2,2011,5000000),(21,5,2,2012,5500000),(22,5,2,2013,6000000),(23,5,2,2014,6500000),(24,6,1,2013,8500000),(25,6,1,2014,10000000),(26,6,2,2013,10000000),(27,6,2,2014,15000000),(28,6,2,2015,17000000),(29,7,2,2014,17000000),(30,7,2,2015,22000000),(31,7,2,2016,24000000),(32,8,1,2012,6000000),(33,9,1,1995,800000),(34,10,2,1995,1000000),(35,11,1,1995,1000000),(36,11,1,1996,1250000),(37,11,1,1997,1600000),(38,11,1,1998,1800000),(39,11,1,1999,2000000),(40,12,2,1995,1700000),(41,12,2,1996,2000000),(42,12,2,1997,2300000),(43,12,2,1998,2500000),(44,12,2,1999,2700000),(45,13,1,1999,2700000),(46,13,1,2000,3600000),(47,13,1,2001,5000000),(48,13,1,2002,5200000),(49,13,1,2003,5300000),(50,13,1,2004,5500000),(51,14,2,1999,3000000),(52,14,2,2000,3800000),(53,14,2,2001,5000000),(54,14,2,2002,5500000),(55,14,2,2003,5500000),(56,14,2,2004,5800000),(57,15,1,2005,6000000),(58,15,1,2006,6500000),(59,15,1,2007,66000000),(60,15,1,2008,6700000),(61,15,1,2009,6800000),(62,15,1,2010,69000000),(63,15,1,2011,69000000),(64,15,1,2012,7000000),(65,16,2,2005,6500000),(66,16,2,2006,7000000),(67,16,2,2007,7000000),(68,16,2,2008,7200000),(69,16,2,2009,7200000),(70,16,2,2010,7300000),(71,16,2,2011,74000000),(72,16,2,2012,7500000),(73,17,1,2011,7500000),(74,17,1,2012,7700000),(75,17,1,2013,7800000),(76,17,1,2014,7800000),(77,18,1,2011,8000000),(78,18,1,2012,8200000),(79,18,1,2013,8300000),(80,18,1,2014,8500000),(81,19,1,2011,7500000),(82,19,1,2012,7700000),(83,19,1,2013,7800000),(84,19,1,2014,7800000),(85,20,2,2011,8000000),(86,20,2,2012,8200000),(87,20,2,2013,8400000),(88,20,2,2014,8500000),(89,21,1,1995,1100000),(90,21,1,1996,1300000),(91,21,1,1997,1600000),(92,22,2,1995,2100000),(93,22,2,1996,2600000),(94,22,2,1997,2800000),(95,23,1,1996,2800000),(96,23,1,1997,3200000),(97,23,1,1998,3300000),(98,23,1,1999,3500000),(99,23,1,2000,3500000),(100,23,1,2001,3500000),(101,23,1,2002,3600000),(102,23,1,2003,3700000),(103,24,2,1996,3500000),(104,24,2,1997,3600000),(105,24,2,1998,3700000),(106,24,2,1999,3800000),(107,24,2,2000,3900000),(108,24,2,2001,4000000),(109,24,2,2002,4200000),(110,24,2,2003,4300000),(111,25,1,2004,4000000),(112,25,1,2005,4200000),(113,25,1,2006,4300000),(114,25,1,2007,4500000),(115,25,1,2008,4700000),(116,25,1,2009,4800000),(117,25,1,2010,4900000),(118,25,1,2011,5000000),(119,26,2,2004,4500000),(120,26,2,2005,4600000),(121,26,2,2006,4700000),(122,26,2,2007,4800000),(123,26,2,2008,5000000),(124,26,2,2009,5200000),(125,26,2,2010,5300000),(126,26,2,2011,5500000),(127,27,1,2011,8000000),(128,27,1,2012,8500000),(129,27,1,2013,9000000),(130,27,1,2014,9200000),(131,27,1,2015,9500000),(132,28,2,2011,8500000),(133,28,2,2012,9000000),(134,28,2,2013,10000000),(135,28,2,2014,11500000),(136,28,2,2015,12500000),(137,28,2,2016,15000000),(138,29,1,1995,2000000),(139,29,1,1996,2500000),(140,29,1,1997,3000000),(141,29,1,1998,3500000),(142,29,1,1999,3500000),(143,29,1,2000,3600000),(144,29,1,2001,3800000),(145,29,1,2013,6500000),(146,29,1,2014,7000000),(147,30,2,1995,2500000),(148,30,2,1996,3000000),(149,30,2,1997,3500000),(150,30,2,1998,4000000),(151,30,2,1999,4500000),(152,30,2,2000,5000000),(153,30,2,2001,5500000),(154,31,1,2002,4000000),(155,31,1,2003,4200000),(156,31,1,2004,4400000),(157,31,1,2005,4600000),(158,31,1,2006,4800000),(159,31,1,2007,4900000),(160,31,1,2008,5000000),(161,32,2,2002,6000000),(162,32,2,2003,6200000),(163,32,2,2004,6400000),(164,32,2,2005,6600000),(165,32,2,2006,6800000),(166,32,2,2007,6900000),(167,32,2,2008,7000000),(168,33,3,2013,12000000),(169,34,3,2014,17000000),(170,35,4,2013,5000000),(171,35,4,2014,5500000),(172,35,4,2015,6500000),(173,35,4,2016,10500000),(174,36,5,2016,40000000),(175,37,1,2016,1750000),(176,38,1,2016,2800000),(177,39,1,2016,2300000),(178,40,1,2016,4300000),(179,41,1,2016,3300000),(180,42,1,2006,35000000),(181,42,1,2007,36000000),(182,42,1,2008,3700000),(183,42,1,2009,3800000),(184,42,1,2010,4000000),(185,42,1,2011,4500000),(186,42,1,2012,4600000),(187,42,1,2013,4700000),(188,42,1,2014,48000000),(189,42,1,2015,5000000),(190,43,1,2012,2200000),(191,43,1,2013,2300000),(192,43,1,2014,2400000),(193,43,1,2015,2600000),(194,43,1,2016,3000000),(195,44,1,2016,3250000),(196,45,2,2016,5400000),(197,46,1,2016,2150000),(198,47,1,2012,4800000),(199,47,1,2013,5000000),(200,47,1,2014,7000000),(201,47,2,2012,5500000),(202,47,2,2013,6000000),(203,47,2,2014,7500000),(204,48,1,2011,4400000),(205,48,1,2012,4600000),(206,48,1,2013,5000000),(207,48,2,2012,5000000),(208,48,2,2013,5500000),(209,49,2,1999,1600000),(210,49,2,2000,1700000),(211,49,2,2001,1800000),(212,50,3,2011,3600000),(213,50,3,2012,4000000),(214,50,3,2013,4200000),(215,50,3,2014,4400000),(216,50,3,2015,4800000),(217,51,3,2011,3500000),(218,51,3,2012,3700000),(219,51,3,2013,4000000),(220,52,3,2012,4500000),(221,52,3,2013,4700000),(222,53,3,2013,4400000),(223,53,3,2014,4500000),(224,53,3,2015,5000000),(225,54,1,1995,2000000),(226,54,1,1996,2100000),(227,54,1,1997,2200000),(228,54,1,1998,2300000),(229,54,1,1999,2400000),(230,54,1,2000,2600000),(231,54,1,2001,2800000),(232,54,1,2002,2900000),(233,54,1,2003,3000000),(234,54,1,2004,400000),(235,54,1,2005,4200000),(236,54,1,2006,4300000),(237,54,1,2007,4400000),(238,54,1,2008,4600000),(239,54,1,2009,5000000),(240,54,1,2010,5400000),(241,54,1,2011,5900000),(242,54,1,2012,6500000),(243,54,1,2013,7300000),(244,54,1,2014,7400000),(245,55,3,2012,4500000),(246,55,3,2013,4800000),(247,55,3,2014,52000000),(248,56,3,2016,6000000),(249,57,3,2013,5400000),(250,57,3,2014,5700000),(251,58,3,2015,5900000),(252,59,3,2013,4800000),(253,59,3,2014,5000000),(254,60,1,2000,1800000),(255,60,1,2001,2200000),(256,60,1,2002,2400000),(257,60,1,2003,2600000),(258,61,3,2012,3900000),(259,61,3,2013,4800000),(260,61,3,2014,5000000),(261,62,1,2006,3600000),(262,62,1,2007,3800000),(263,62,1,2008,3800000),(264,62,1,2009,4000000),(265,62,1,2010,4300000),(266,62,1,2011,4500000),(267,63,1,2006,3500000),(268,63,1,2007,3600000),(269,63,1,2008,3700000),(270,63,1,2009,3900000),(271,64,3,2008,3600000),(272,64,3,2009,3800000),(273,64,3,2010,4000000),(274,64,3,2011,4200000),(275,65,1,2000,2200000),(276,65,1,2001,2300000),(277,65,1,2002,2400000),(278,66,1,2006,2500000),(279,66,1,2007,2700000),(280,66,1,2008,3000000),(281,66,1,2009,3300000),(282,66,1,2010,3500000),(283,67,3,2015,6700000),(284,68,3,2016,6900000),(285,69,3,2016,7000000),(286,70,1,2014,10500000),(287,70,2,2014,11000000),(288,71,1,2011,4500000),(289,71,1,2012,5000000),(290,71,1,2013,5200000),(291,71,1,2014,5500000),(292,71,1,2015,7500000),(293,71,1,2016,8800000),(294,71,2,2011,5000000),(295,71,2,2012,5400000),(296,71,2,2013,5700000),(297,71,2,2014,6000000),(298,72,1,2010,4500000),(299,72,1,2011,4800000),(300,72,1,2012,5000000),(301,72,1,2013,5200000),(302,72,2,2010,5400000),(303,72,2,2011,5700000),(304,72,2,2012,6000000),(305,72,2,2013,7000000),(306,72,2,2014,8500000),(307,72,2,2015,9500000),(308,72,2,2016,10900000),(309,73,1,2012,4400000),(310,73,1,2013,4800000),(311,73,1,2014,5200000),(312,73,1,2015,6200000),(313,74,1,2014,2000000),(314,74,1,2015,2300000),(315,74,1,2016,2782000),(316,75,1,2016,4500000),(317,76,2,2012,8000000),(318,76,2,2013,9000000),(319,76,2,2014,10500000),(320,77,2,2012,13000000),(321,77,2,2013,14000000),(322,77,2,2014,15000000),(323,77,1,2012,14000000),(324,77,1,2013,16000000),(325,78,2,2015,22500000),(326,79,2,2013,9500000),(327,79,2,2014,10000000),(328,79,2,2015,11000000),(329,80,3,2014,16000000),(330,80,2,2012,5500000),(331,80,2,2013,6000000),(332,81,1,2004,11000000),(333,81,1,2005,1100000),(334,81,1,2006,12000000),(335,81,1,2007,12000000),(336,81,1,2008,1300000),(337,81,1,2009,1400000),(338,81,1,2010,14000000),(339,81,1,2011,1500000),(340,82,1,2013,1600000),(341,82,1,2014,1700000),(342,82,1,2015,1800000),(343,83,1,2011,1700000),(344,83,1,2012,1800000),(345,83,1,2013,1900000),(346,83,1,2014,2000000),(347,83,1,2015,2200000),(348,84,1,2015,2400000),(349,85,1,2014,2400000),(350,85,1,2015,2500000),(351,86,1,2014,2400000),(352,86,1,2015,2500000),(353,87,1,2011,1900000),(354,87,1,2012,2000000),(355,87,1,2013,2300000),(356,88,1,2011,2200000),(357,88,1,2012,2400000),(358,88,1,2013,2500000),(359,89,1,1995,450000),(360,89,1,1996,450000),(361,89,1,1997,450000),(362,89,1,1998,500000),(363,89,1,1999,500000),(364,89,1,2000,550000),(365,89,1,2001,600000),(366,89,1,2002,600000),(367,89,1,2003,600000),(368,89,1,2004,700000),(369,89,1,2005,700000),(370,89,1,2006,700000),(371,89,1,2007,800000),(372,89,1,2008,800000),(373,89,1,2009,900000),(374,89,1,2010,1000000),(375,89,1,2011,1100000),(376,89,1,2012,1200000),(377,90,1,2015,4500000),(378,91,1,2015,5200000),(379,92,1,2015,600000),(380,93,1,2015,7500000),(381,94,1,2015,7000000),(382,95,1,2015,7500000),(383,96,1,2008,2600000),(384,96,1,2009,2800000),(385,96,1,2010,3000000),(386,97,1,2008,3400000),(387,97,1,2009,4000000),(388,97,1,2010,4800000),(389,97,1,2011,5400000),(390,97,1,2012,6000000),(391,97,1,2013,6300000),(392,97,1,2014,6500000),(393,97,1,2015,7000000),(394,97,1,2016,7200000),(395,97,3,2013,6700000),(396,97,3,2014,7000000),(397,97,3,2015,7200000),(398,98,2,1995,1400000),(399,98,2,1996,1400000),(400,98,2,1997,1500000),(401,99,2,1995,1400000),(402,99,2,1996,1400000),(403,100,1,2011,7000000),(404,100,1,2012,7500000),(405,100,1,2013,9000000),(406,100,1,2014,10000000),(407,101,1,2016,15600000),(408,102,1,2016,16200000),(409,103,2,2013,8500000),(410,104,1,2016,18000000),(411,105,3,2016,17200000),(412,106,1,2014,10000000),(413,106,1,2015,11000000),(414,106,1,2016,13500000),(415,107,1,2011,10000000),(416,107,1,2012,11000000),(417,107,1,2013,12000000),(418,107,1,2014,14000000),(419,108,1,2016,20523000),(420,109,1,2016,22000000),(421,110,3,2016,35000000),(422,111,1,2011,15000000),(423,111,1,2012,16000000),(424,112,3,2016,17000000),(425,113,1,2007,10000000),(426,114,3,2013,22000000),(427,115,3,2016,40000000),(428,116,1,2013,17000000),(429,116,1,2014,18000000),(430,117,2,2016,30000000),(431,118,1,2016,18000000),(432,119,1,2016,13200000),(433,120,2,2014,1000000),(434,120,2,2015,12000000),(435,120,1,2014,8000000),(436,120,1,2015,9000000),(437,121,1,2012,5700000),(438,121,1,2013,6300000),(439,121,1,2014,6700000),(440,121,1,2015,7000000),(441,121,2,2015,8000000),(442,122,2,2014,10000000),(443,123,5,2013,9000000),(444,123,5,2014,9500000),(445,123,5,2015,10000000),(446,124,1,2008,2700000),(447,124,1,2009,2800000),(448,125,1,2008,3200000),(449,125,1,2009,3300000),(450,125,1,2010,3400000),(451,126,2,1995,1500000),(452,126,2,1996,1500000),(453,126,2,1997,1600000),(454,126,2,1998,1700000),(455,126,2,1999,1800000),(456,127,2,1995,1600000),(457,127,2,2001,2100000),(458,127,2,2002,2100000),(459,127,2,2010,3400000),(460,127,2,2011,3500000),(461,128,2,1995,1900000),(462,128,2,1996,2500000),(463,128,2,1997,2500000),(464,128,2,1998,2700000),(465,129,2,1998,2900000),(466,130,2,1995,1700000),(467,130,2,1996,1700000),(468,130,2,1997,1900000),(469,130,2,1998,1900000),(470,130,2,1995,1700000),(471,130,2,1996,1700000),(472,130,2,1997,1900000),(473,130,2,1998,1900000),(474,130,2,1995,1700000),(475,130,2,1996,1700000),(476,130,2,1997,1900000),(477,130,2,1998,1900000),(478,131,2,2011,3000000),(479,131,2,2012,4000000),(480,131,2,2013,5500000),(481,131,2,2014,6500000),(482,131,2,2015,9500000),(483,132,2,2015,6400000),(484,133,2,2015,5700000),(485,134,2,2015,4900000),(486,135,2,2011,3000000),(487,136,2,2011,2500000),(488,137,1,2000,2700000),(489,137,1,2001,2800000),(490,137,1,2002,3000000),(491,137,1,2003,3000000),(492,137,1,2012,5000000),(493,137,1,2013,6000000),(494,137,1,2014,6500000),(495,137,1,2015,8000000),(496,137,2,2014,9500000),(497,137,3,2015,7500000),(498,138,1,2008,2800000),(499,138,1,2009,2900000),(500,138,1,2010,3000000),(501,138,1,2011,3300000),(502,139,1,1995,1400000),(503,139,1,1996,1550000),(504,139,1,1997,1600000),(505,139,1,1998,1650000),(506,140,1,1995,1300000),(507,140,1,1996,1400000),(508,140,1,1997,1450000),(509,140,1,1998,1500000),(510,141,2,1995,1450000),(511,141,2,1996,1600000),(512,141,2,1997,1700000),(513,141,2,1998,1750000),(514,142,1,1998,2000000),(515,142,1,1999,2100000),(516,142,1,2000,2200000),(517,142,1,2001,2300000),(518,142,1,2002,2350000),(519,142,1,2003,2400000),(520,142,1,2004,2450000),(521,143,1,1998,2100000),(522,143,1,1999,2200000),(523,143,1,2000,2300000),(524,143,1,2001,2350000),(525,143,1,2002,2400000),(526,143,1,2003,2500000),(527,143,1,2004,2550000),(528,144,1,1998,1900000),(529,144,1,1999,1950000),(530,144,1,2000,2000000),(531,144,1,2001,2100000),(532,144,1,2002,2150000),(533,145,1,2000,2100000),(534,145,1,2001,2150000),(535,145,1,2002,2200000),(536,145,1,2003,2300000),(537,145,1,2004,2350000),(538,146,1,2000,1900000),(539,146,1,2001,1950000),(540,146,1,2002,2000000),(541,146,1,2003,2050000),(542,146,1,2004,2200000),(543,147,1,2000,2100000),(544,147,1,2001,2250000),(545,147,1,2002,2350000),(546,147,1,2003,2400000),(547,147,1,2004,2450000),(548,148,1,2008,3500000),(549,148,1,2009,3600000),(550,148,1,2010,3800000),(551,148,1,2011,3900000),(552,148,1,2012,4100000),(553,149,1,2016,10300000),(554,150,1,1995,1300000),(555,150,1,1995,1300000),(556,151,2,1995,1400000),(557,152,2,1995,1500000),(558,152,2,1996,1600000),(559,152,2,1997,1700000),(560,152,2,1998,1800000),(561,152,2,1999,1850000),(562,152,2,2000,1900000),(563,153,1,1995,800000),(564,153,1,1996,850000),(565,153,1,1997,900000),(566,153,1,1998,950000),(567,153,1,1999,1000000),(568,153,1,2000,1100000),(569,153,1,2001,1150000),(570,153,1,2002,1200000),(571,153,1,2003,1250000),(572,154,1,1995,850000),(573,154,1,1996,900000),(574,154,1,1997,950000),(575,154,1,1998,1000000),(576,154,1,1999,1050000),(577,154,1,2000,1150000),(578,154,1,2001,1200000),(579,154,1,2002,1250000),(580,154,1,2003,1300000),(581,155,1,1995,110000),(582,155,1,1996,1200000),(583,155,1,1997,1300000),(584,155,1,1998,1400000),(585,155,1,1999,1500000),(586,155,1,2000,1550000),(587,155,1,2001,1650000),(588,155,1,2002,1700000),(589,155,1,2003,1800000),(590,156,1,1995,1150000),(591,156,1,1996,1250000),(592,156,1,1997,1350000),(593,156,1,1998,1450000),(594,156,1,1999,1550000),(595,156,1,2000,1600000),(596,156,1,2001,1650000),(597,156,1,2002,1750000),(598,156,1,2003,1850000),(599,157,1,2002,1900000),(600,157,1,2003,2000000),(601,157,1,2004,2100000),(602,157,1,2005,2200000),(603,157,1,2006,2300000),(604,157,1,2007,2400000),(605,157,1,2008,2500000),(606,158,4,2011,2700000),(607,158,4,2012,2800000),(608,159,4,2012,3100000),(609,159,4,2013,3200000),(610,159,4,2014,3250000),(611,160,1,1995,1300000),(612,160,1,1996,1350000),(613,160,1,1997,1450000),(614,160,1,1998,1500000),(615,160,1,1999,1600000),(616,160,1,2000,1700000),(617,160,1,2001,1800000),(618,160,1,2002,1900000),(619,161,1,2001,2200000),(620,161,1,2002,2300000),(621,162,1,2004,7000000),(622,163,1,2012,5200000),(623,163,1,2013,5350000),(624,163,1,2014,5450000),(625,164,1,2001,2100000),(626,165,1,2006,2700000),(627,165,1,2007,2800000),(628,165,1,2008,2900000),(629,166,2,2006,3700000),(630,166,2,2007,3800000),(631,166,2,2008,3900000),(632,166,2,2009,4000000),(633,166,2,2010,4200000),(634,166,2,2011,4300000),(635,166,2,2012,4400000),(636,166,1,2010,3000000),(637,166,1,2011,3100000),(638,166,1,2012,3200000),(639,167,2,1995,2200000),(640,167,2,1996,2300000),(641,167,2,1997,2400000),(642,167,2,1998,2500000),(643,168,2,1995,2300000),(644,168,2,1996,2400000),(645,168,2,1997,2500000),(646,168,2,1998,2600000),(647,168,2,1995,2300000),(648,168,2,1996,2400000),(649,168,2,1997,2500000),(650,168,2,1998,2600000),(651,168,2,1995,2300000),(652,168,2,1996,2400000),(653,168,2,1997,2500000),(654,168,2,1998,2600000),(655,168,2,1995,2300000),(656,168,2,1996,2400000),(657,168,2,1997,2500000),(658,168,2,1998,2600000),(659,169,2,1996,3200000),(660,169,2,1997,3300000),(661,169,2,1998,3400000),(662,169,2,1999,3500000),(663,169,2,2000,3600000),(664,169,2,2001,3700000),(665,168,2,1995,2300000),(666,168,2,1996,2400000),(667,168,2,1997,2500000),(668,168,2,1998,2600000),(669,168,2,1995,2300000),(670,168,2,1996,2400000),(671,168,2,1997,2500000),(672,168,2,1998,2600000),(673,170,2,2001,4300000),(674,170,2,2002,4400000),(675,170,2,2003,4450000),(676,170,2,2004,4500000),(677,170,2,2005,4550000),(678,170,2,2006,4600000),(679,170,2,2007,46500000),(680,170,2,2008,4700000),(681,170,2,2009,4750000),(682,170,2,2010,4800000),(683,170,2,2011,4900000),(684,170,2,2001,4300000),(685,170,2,2002,4400000),(686,170,2,2003,4450000),(687,170,2,2004,4500000),(688,170,2,2005,4550000),(689,170,2,2006,4600000),(690,170,2,2007,46500000),(691,170,2,2008,4700000),(692,170,2,2009,4750000),(693,170,2,2010,4800000),(694,170,2,2011,4900000),(695,171,2,2012,7600000),(696,171,2,2013,7750000),(697,171,2,2014,8000000),(698,171,2,2012,7600000),(699,171,2,2013,7750000),(700,171,2,2014,8000000),(701,172,2,2013,9000000),(702,172,2,2014,10000000),(703,173,2,2015,47500000),(704,173,2,2016,65000000),(705,174,1,2012,4400000),(706,174,1,2013,4800000),(707,174,1,2014,5500000),(708,174,1,2015,8500000),(709,175,1,1997,2200000),(710,175,1,1998,2300000),(711,175,1,1999,2400000),(712,175,1,2000,2500000),(713,175,1,2001,2600000),(714,175,1,2002,2800000),(715,175,1,2003,3000000),(716,175,1,2004,3200000),(717,175,1,2005,3400000),(718,175,1,2006,3600000),(719,175,1,2007,3800000),(720,175,1,2008,4800000),(721,176,1,2004,2600000),(722,177,1,2000,3600000),(723,178,3,2000,2200000),(724,179,3,2013,6300000),(725,180,3,2013,6400000),(726,180,3,2014,7000000),(727,180,3,2015,7800000),(728,181,1,1999,2500000),(729,182,1,2007,3600000),(730,182,1,2008,3700000),(731,182,1,2009,4000000),(732,182,1,2010,4200000),(733,182,1,2011,4300000),(734,182,1,2012,4500000),(735,182,1,2013,4800000),(736,182,1,2014,5000000),(737,182,1,2007,3600000),(738,182,1,2008,3700000),(739,182,1,2009,4000000),(740,182,1,2010,4200000),(741,182,1,2011,4300000),(742,182,1,2012,4500000),(743,182,1,2013,4800000),(744,182,1,2014,5000000),(745,183,1,2002,3000000),(746,183,1,2003,3200000),(747,183,1,2004,3500000),(748,183,1,2005,3550000),(749,183,1,2006,3600000),(750,183,1,2007,3700000),(751,184,1,2007,3900000),(752,184,1,2008,4000000),(753,184,1,2009,4100000),(754,184,1,2010,4200000),(755,184,1,2011,4400000),(756,184,1,2012,4700000),(757,184,1,2013,5000000),(758,184,1,2014,5500000),(759,185,1,2001,2700000),(760,185,1,2002,800000),(761,185,1,2003,300000),(762,185,1,2004,3200000),(763,185,1,2005,3300000),(764,185,1,2006,3400000),(765,186,1,2008,3300000),(766,186,1,2009,3400000),(767,186,1,2010,3600000),(768,187,2,2008,3200000),(769,187,2,2009,3300000),(770,187,2,2010,3500000),(771,188,1,1996,1550000),(772,188,1,1997,1750000),(773,188,1,1998,1900000),(774,188,1,1999,2000000),(775,188,1,2000,2100000),(776,188,1,2001,2200000),(777,188,1,2002,2250000),(778,188,2,1996,1600000),(779,188,2,1997,1800000),(780,188,2,1998,200000),(781,188,2,1999,2100000),(782,189,1,1995,1450000),(783,190,1,1995,1450000),(784,191,1,1995,1450000),(785,192,1,1996,1350000),(786,192,1,1997,1400000),(787,192,1,1998,1500000),(788,193,1,1997,1500000),(789,193,1,1998,1650000),(790,193,1,1999,1800000),(791,193,2,1997,1500000),(792,193,2,1998,1600000),(793,194,1,1997,1250000),(794,194,2,1997,1100000),(795,195,1,1998,1700000),(796,195,1,1999,1800000),(797,195,1,2000,1900000),(798,195,1,2001,2100000),(799,195,2,1998,1700000),(800,195,2,1999,1800000),(801,195,2,2000,1900000),(802,195,2,2001,2000000),(803,196,1,1998,1800000),(804,196,1,1999,1950000),(805,196,1,2000,2050000),(806,196,1,2001,2250000),(807,196,2,1998,1750000),(808,196,2,1999,1900000),(809,196,2,2000,2000000),(810,196,2,2001,2100000),(811,197,1,2005,2800000),(812,197,1,2006,3300000),(813,197,1,2007,3700000),(814,198,3,2013,12000000),(815,199,1,2014,7500000),(816,199,1,2015,10000000),(817,200,2,2013,8000000),(818,200,2,2014,8800000),(819,200,2,2015,9500000),(820,201,1,2012,17000000),(821,202,2,2012,20000000),(822,202,2,2013,23000000),(823,202,2,2014,25000000),(824,202,2,2015,28000000),(825,203,2,2014,16000000),(826,203,2,2015,19500000),(827,204,1,1997,1800000),(828,204,1,1998,1900000),(829,204,1,1999,2000000),(830,204,1,2000,2100000),(831,204,1,2001,2200000),(832,204,1,2002,2400000),(833,204,1,2003,2500000),(834,204,1,2004,2800000),(835,204,1,2005,3000000),(836,204,1,2006,3500000),(837,204,1,2007,4000000),(838,204,1,2008,4400000),(839,204,1,2009,4700000),(840,204,1,2010,500000),(841,204,1,2011,5400000),(842,204,1,2012,5600000),(843,204,1,2013,5800000),(844,204,1,2014,6200000),(845,204,1,2015,7000000),(846,205,2,2012,12000000),(847,205,2,2013,12500000),(848,206,2,2014,10000000),(849,207,2,2013,10000000),(850,207,2,2014,12000000),(851,208,2,2015,14500000),(852,209,2,2007,3300000),(853,209,2,2008,3400000),(854,209,2,2009,3500000),(855,209,2,2010,3700000),(856,209,2,2011,3800000),(857,209,2,2015,5400000),(858,210,2,2007,3000000),(859,210,2,2008,3300000),(860,210,2,2009,3500000),(861,210,2,2010,3700000),(862,210,2,2011,3900000),(863,211,2,2002,2200000),(864,211,2,2003,2400000),(865,211,2,2004,2500000),(866,211,2,2005,2600000),(867,211,2,2006,2800000),(868,211,2,2007,3300000),(869,211,2,2008,3500000),(870,211,2,2009,3600000),(871,212,2,2015,6500000),(872,213,3,2010,4500000),(873,213,3,2011,4600000),(874,213,3,2012,4800000),(875,213,3,2013,5200000),(876,213,3,2014,5800000),(877,213,3,2015,6800000),(878,214,3,2015,4500000),(879,215,3,2012,5700000),(880,215,3,2013,6000000),(881,215,3,2014,6400000),(882,216,3,2012,3400000),(883,216,3,2013,3600000),(884,216,3,2014,3900000),(885,216,3,2015,4200000),(886,217,1,2005,2500000),(887,217,1,2006,2600000),(888,217,1,2007,2700000),(889,217,1,2008,2800000),(890,217,1,2009,3000000),(891,217,1,2010,3200000),(892,218,1,2005,2800000),(893,218,1,2006,2900000),(894,218,1,2007,3000000),(895,218,1,2008,3000000),(896,218,1,2009,3200000),(897,218,1,2010,3400000),(898,219,1,2011,3400000),(899,219,1,2012,3500000),(900,219,1,2013,3700000),(901,219,1,2014,4000000),(902,220,1,2008,3000000),(903,220,1,2009,3100000),(904,220,1,2010,3200000),(905,220,1,2011,3500000),(906,220,1,2012,4000000),(907,220,1,2013,4500000),(908,220,1,2014,5000000),(909,220,1,2015,5850000),(910,221,1,2008,2700000),(911,221,1,2009,2800000),(912,221,1,2010,3000000),(913,221,1,2011,3300000),(914,221,1,2012,3600000),(915,221,1,2013,4000000),(916,221,1,2014,4500000),(917,221,1,2015,5200000),(918,222,1,1996,1700000),(919,222,1,1999,2500000),(920,222,1,2007,4500000),(921,222,1,2008,5000000),(922,222,1,2009,5300000),(923,222,1,2010,5700000),(924,222,1,2011,6000000),(925,222,1,2012,6200000),(926,222,1,2013,6500000),(927,222,1,2014,7500000),(928,222,1,2015,14500000),(929,223,2,2015,8500000),(930,224,2,2015,7400000),(931,225,2,2008,5000000),(932,225,2,2009,5300000),(933,225,2,2010,5500000),(934,225,2,2011,5800000),(935,225,2,2012,6100000),(936,225,2,2013,6500000),(937,225,2,2014,7000000),(938,225,2,2015,7750000),(939,225,2,2008,5000000),(940,225,2,2009,5300000),(941,225,2,2010,5500000),(942,225,2,2011,5800000),(943,225,2,2012,6100000),(944,225,2,2013,6500000),(945,225,2,2014,7000000),(946,225,2,2015,7750000),(947,226,2,2015,4700000),(948,227,2,2015,3300000),(949,228,2,2015,6200000),(950,229,2,1995,2500000),(951,229,2,1996,2700000),(952,229,2,1997,3000000),(953,230,1,1995,1800000),(954,230,1,1996,2000000),(955,230,1,1997,2200000),(956,230,2,1995,2200000),(957,230,2,1996,2500000),(958,230,2,1997,2700000),(959,231,2,1995,3000000),(960,231,2,1996,3200000),(961,231,2,1997,3500000),(962,232,2,1995,2500000),(963,232,2,1996,2700000),(964,232,2,1997,3000000),(965,233,2,1995,2500000),(966,233,2,1996,2700000),(967,233,2,1997,3000000),(968,234,2,1995,3400000),(969,234,2,1996,3500000),(970,234,2,1997,3800000),(971,235,2,1998,3200000),(972,235,2,1999,3300000),(973,235,2,2000,3400000),(974,235,2,2001,3500000),(975,235,2,2002,3600000),(976,235,2,2003,3700000),(977,236,2,1998,3300000),(978,236,2,1999,3400000),(979,236,2,2000,3500000),(980,236,2,2001,3600000),(981,236,2,2002,3700000),(982,236,2,2003,3800000),(983,237,2,1998,3800000),(984,237,2,1999,3900000),(985,237,2,2000,4000000),(986,237,2,2001,4100000),(987,237,2,2002,4200000),(988,237,2,2003,4300000),(989,238,2,1998,4200000),(990,238,2,1999,4300000),(991,238,2,2000,4400000),(992,238,2,2001,4500000),(993,238,2,2002,4600000),(994,238,2,2003,4700000),(995,239,2,2004,4500000),(996,239,2,2005,4800000),(997,239,2,2006,5200000),(998,239,2,2007,5400000),(999,240,2,2008,5400000),(1000,240,2,2009,5800000),(1001,240,2,2010,6000000),(1002,240,2,2011,6200000),(1003,240,2,2012,6500000),(1004,240,2,2013,6700000),(1005,240,2,2014,7000000),(1006,240,2,2015,7400000),(1007,240,2,2016,7800000),(1008,241,2,2004,4000000),(1009,241,2,2005,4300000),(1010,241,2,2006,4600000),(1011,241,2,2007,4800000),(1012,242,2,2004,4800000),(1013,242,2,2005,5200000),(1014,242,2,2006,5600000),(1015,242,2,2007,6000000),(1016,243,2,2008,6500000),(1017,243,2,2009,7000000),(1018,243,2,2010,7200000),(1019,243,2,2011,7400000),(1020,243,2,2012,7600000),(1021,243,2,2013,7800000),(1022,243,2,2014,8000000),(1023,243,2,2015,8200000),(1024,243,2,2016,8500000),(1025,244,2,2008,6000000),(1026,244,2,2009,6400000),(1027,244,2,2010,6600000),(1028,244,2,2011,6800000),(1029,244,2,2012,7000000),(1030,244,2,2013,7200000),(1031,244,2,2014,7600000),(1032,244,2,2015,8000000),(1033,244,2,2016,9500000),(1034,245,2,1997,2600000),(1035,245,2,1998,2900000),(1036,246,2,1998,3200000),(1037,246,2,1999,3400000),(1038,246,2,2000,3500000),(1039,246,2,2001,3500000),(1040,246,2,2002,3800000),(1041,246,2,2003,3900000),(1042,246,2,2004,4000000),(1043,246,2,2005,4000000),(1044,247,1,1997,2700000),(1045,247,1,1998,2800000),(1046,247,1,2005,3300000),(1047,247,1,2006,3400000),(1048,248,1,2000,2800000),(1049,248,1,2001,3100000),(1050,248,1,2002,3200000),(1051,248,1,2003,3300000),(1052,248,1,2004,3400000),(1053,248,1,2005,3500000),(1054,248,1,2006,3700000),(1055,248,1,2007,3900000),(1056,247,2,1996,2900000),(1057,247,2,1997,2900000),(1058,247,2,1998,3200000),(1059,248,2,1997,3000000),(1060,248,2,1998,3200000),(1061,248,2,1999,3200000),(1062,248,2,2000,3300000),(1063,248,2,2001,3400000),(1064,248,2,2002,3500000),(1065,248,2,2003,3500000),(1066,249,2,1998,3600000),(1067,249,2,1999,3700000),(1068,249,2,2000,4000000),(1069,249,2,2001,4100000),(1070,249,2,2002,4200000),(1071,250,1,1998,3300000),(1072,250,1,1999,3400000),(1073,250,1,2000,3600000),(1074,250,1,2001,3700000),(1075,250,1,2002,3800000),(1076,251,6,1998,2900000),(1077,251,6,1999,3000000),(1078,251,6,2000,3100000),(1079,252,2,1998,2600000),(1080,252,2,1999,2600000),(1081,252,2,2000,2700000),(1082,253,2,1995,2000000),(1083,253,2,1996,2200000),(1084,253,2,1997,2300000),(1085,254,2,1995,1700000),(1086,254,2,1996,1800000),(1087,254,2,1997,1800000),(1088,255,1,2013,4500000),(1089,256,1,2011,5000000),(1090,256,2,2011,6000000);
/*!40000 ALTER TABLE `vehicle_valivation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voluntary_excess`
--

DROP TABLE IF EXISTS `voluntary_excess`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `voluntary_excess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voluntary_excess` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voluntary_excess`
--

LOCK TABLES `voluntary_excess` WRITE;
/*!40000 ALTER TABLE `voluntary_excess` DISABLE KEYS */;
INSERT INTO `voluntary_excess` VALUES (1,1000),(2,2000),(3,3000);
/*!40000 ALTER TABLE `voluntary_excess` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-23  9:38:33
