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
  `fuel_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fuel_types`
--

LOCK TABLES `fuel_types` WRITE;
/*!40000 ALTER TABLE `fuel_types` DISABLE KEYS */;
INSERT INTO `fuel_types` VALUES (1,'Petrol'),(2,'Diesel'),(3,'Hybrid'),(4,'Electric');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_companies`
--

LOCK TABLES `insurance_companies` WRITE;
/*!40000 ALTER TABLE `insurance_companies` DISABLE KEYS */;
INSERT INTO `insurance_companies` VALUES (1,'Asian Alliance','2.25',1,NULL,0,0,0,0,0,0,0,0,0),(2,'Janashakthi','2.35',1,NULL,0,0,0,0,0,0,0,0,0),(3,'Sri Lanka Insurance','2.30',1,NULL,0,0,0,0,0,0,0,0,0),(4,'Allianz','2.20',1,NULL,0,0,0,0,0,0,0,0,0),(5,'Continental Insurance','2.25',0,NULL,0,0,0,0,0,0,0,0,0),(6,'AIG','3.22',0,NULL,0,0,0,0,0,0,0,0,0),(7,'Amana','2.86',0,NULL,0,0,0,0,0,0,0,0,0),(8,'Coop','2.34',0,NULL,0,0,0,0,0,0,0,0,0),(9,'HNB','2.30',0,NULL,0,0,0,0,0,0,0,0,0),(10,'LOLC','2.34',0,NULL,0,0,0,0,0,0,0,0,0),(11,'MBSL','2.23',0,NULL,0,0,0,0,0,0,0,0,0),(12,'NITF','2.45',0,NULL,0,0,0,0,0,0,0,0,0),(13,'Orient','2.44',0,NULL,0,0,0,0,0,0,0,0,0),(14,'People\'s Insurance','2.32',0,NULL,0,0,0,0,0,0,0,0,0),(15,'Union Assurance','2.12',0,NULL,0,0,0,0,0,0,0,0,0);
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
  `year` varchar(45) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `no_claim_bonus` double DEFAULT NULL,
  `current_insurer` varchar(45) DEFAULT NULL,
  `cover_type_required` int(11) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_quotation`
--

LOCK TABLES `insurance_quotation` WRITE;
/*!40000 ALTER TABLE `insurance_quotation` DISABLE KEYS */;
INSERT INTO `insurance_quotation` VALUES (1,'kZI6Zslrm664zu-xOtLDhh4gtQk2xU9D',2,'CAT','3333','Mr','yoko','name','chathu.gg@hh.co.com','0123456789','234567891x','9','244','1912',10000000,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
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
INSERT INTO `purpose` VALUES (1,'Social, Domastic & Private Purposes ',1,1,1,1),(2,'SLTB Route',0,0,0,1),(3,'Carriage of Passengers ',1,0,1,1),(4,'Hiring or Hired ',1,1,1,1),(5,'Rented or Self Drive Basis',1,1,1,1),(6,'Driving Tuition ',1,1,1,1),(7,'Carriage of Goods ',0,0,1,1),(8,'Agricultural Purposes',0,0,0,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'apE69X3Am2WEo27VhdQzBmmaH5HPV3x_',1,'menaka','fernando','gajma','kattuwa','44','negombo','other','11203','711656570','','','','','','','','','',222835,NULL),(2,'WAKfjPXO11Rxf7SlLzriaxxoXid1_8Ys',2,'menaka','fernando','new company','kattuwa','44','negombo','US','11203','711656570','','','','','','','','','',350000,NULL),(4,'gqrKoEFhcL1a9hNCyXqxAbwu8WgGjM6p',1,'menaka2','fernando','rrr','kattuwa','23','negombo','US','11203','711656570','','','','','','','','','',21780,NULL),(5,'bluhSZzD3uM6nswO2eVX3U5QTkddMsvs',2,'menaka','fernando','rrr','kattuwa','44','negombo','US','11203','711656570','','','','','','','','','',350000,NULL),(6,'M-Y37esE0T6P0g4ta-m8CFq7knPeRWt0',2,'kamal','perara','kasper','nuwara','66','nuwara','other','998','0987654321','kamal','perara','kasper','nuwara','66','nuwara','other','998','0987654321',3333330,NULL),(7,'_zONclI7jnpTCahpCK9GLlOsye58PcwG',2,'jon','snow','castle black','north','99','wall','US','5578','0117654234','jon','snow','king of the north','winterfell','1','north','US','77','0746734251',3712000,NULL),(8,'-9CZqxXdT28jtRY9X1PXPXAajRM4hy9B',2,'jon','snow','nights watch','castle black','1','north','US','4567','711656570','jon','snow','king of the north','winterfell','99','north','US','11203','711656570',490000,NULL),(9,'6iXWrYmFMASOYVugI0Te7S00BB-GPhbB',2,'menjgjg','men','SYN','kollupitiuya','234','yamana2346','other','456','07143267','menjgjg','men','SYN','kollupitiuya','234','yamana2346','other','456','07143267',20736,NULL),(10,'WbIIPTSXf2v4RaAwuVMjSPZTm_CpjaiV',2,'men','tyu','SYN','kollupitiuya','7657','yamana2346','US','456','45676578','men','tyu','SYN','kollupitiuya','7657','yamana2346','US','456','45676578',4072608,NULL),(11,'y_QAtXHwY2bIFuUC3rip12-ViAvgkKrn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3936854,4),(17,'VXmp4uDA4eFPonthHqvGKfWvgWAEtLIH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140658,2),(18,'NisQA8jJ6RmZQDrqPF2RBzQnkUxDiEW6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(19,'R6VxKiz-mcPot-tq-EpyDAYy30hvJiPH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(20,'j6jAopzS__6cwU5rfudcQdwLra2e0DTF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,478068,2),(21,'BoESAzz4D4d42WJ4gue0Kh8J3ok-QBTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,264289,4),(24,'6oGI4wCXr3YSPNbBCvXgz3GBP4gXTD7K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4716446,3),(25,'_B-NVpLkBmlnUVbjCRUrqAE_Fa5BxPUV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105494,5),(26,'z9icGNC2_M8Vqck7C6FkMx1v9LUkglWw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(27,'y5wFggtqG54JYjzhJZ7JKeoi9zlZ2Ht7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,264289,4),(28,'Tbb_A-MXBknDkl6z4cnyWWuQAuAEECHw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17280,1),(29,'ja8c74LSn35Glpj5f3M6EMcs7s_9pMKB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135969,4),(30,'ypu3hH1OE4P2a4N-PqnGrxDdhTlsLuvW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,117215,1),(31,'RXlkOYkOrh5khBJZLodCyKI3UIGg5hWS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140658,2),(32,'8e-r8T4eEXWX3uduMeS87vt9_DQzRElX',2,NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','456','07143267',NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','456',NULL,4042668,2),(33,'Kyh_b2_i9x1FzRT-PAkc4FFfJkOpjMyP',1,NULL,NULL,NULL,'kollupitiuya','24','colombo','Ketchup','456','07143267',NULL,NULL,NULL,'kollupitiuya','24','colombo','Ketchup','456',NULL,6000,2),(34,'XhzAy4LGDEQlcDvmUcSa9VKHlNWQyK_v',1,NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456','45676578',NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456',NULL,500000,1),(35,'f115r0SDo21VxiG4tkY7a54bnenKqdcE',1,NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','783459','0711656570',NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','783459',NULL,40426680,2),(45,'4tqjti_IfOnI6qHR_D81h9LegoXiMHQA',1,NULL,NULL,NULL,'kollupitiuya','234','yamana','Relish','456','0714326700',NULL,NULL,NULL,'kollupitiuya','234','yamana','Relish','456',NULL,40426680,2),(46,'uP7atEj8QjarGxP3HVX5nkzKlipDn8o4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,474000,2),(47,'uM9lKLisX6Z_dfqZooiouXfvd2AivSzw',1,NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456','0714326700',NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456',NULL,5340000,2),(48,'dLcumJaGpv5THcgSthINfkoal5tY7piU',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,335000,1),(50,'-MPRQGGsDptUKS3vFyhM0GDC2H6OF6B7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3360000,2),(51,'orEX3Of0_jNREmTE99UC3Pu_HFuvyVdu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50000,1),(52,'oUQQ-RllVuDpwvfXlyezfoiq2PPWeWKe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000000,1),(55,'nSHeZCslJK-4sM6tPMertGc2y3LLU8-y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000,2),(56,'nvblgkSjK5xxBFS6r6eXmWFIVQp22V_O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000,2),(57,'GVJUEr71xydlkQXIsVHXhCRZBY99-x7I',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4734000,2),(58,'T107PN-xPHFMCwvpARbArzPJlyQ4F8TW',2,NULL,NULL,NULL,'etet','34','sdfsdf','Ketchup','4567','0123456789',NULL,NULL,NULL,'etet','34','sdfsdf','Ketchup','4567',NULL,407400,2),(59,'JZbet7wpU_1AIJBUrnRLK53jYrmzXRPQ',1,NULL,NULL,NULL,'uybyiun','90','hinmki','Ketchup','8990','0987654321',NULL,NULL,NULL,'uybyiun','90','hinmki','Ketchup','8990',NULL,7000000,3),(60,'2yPZ5WYIfI2zDMsD8X3u2DWq1muPdb9A',1,NULL,NULL,NULL,'sdfsdf','23','sdsdf','Relish','324','0987654321',NULL,NULL,NULL,'sdfsdf','23','sdsdf','Relish','324',NULL,20000000,1),(61,'ZidsUzBji9aB57cH5g375FGHCCod-T29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40600000,4),(63,'idH4alL3pENx_JRBL3nLAZulHiOc7vzr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,400000,1),(64,'aqa07DMyKxJAXcbJ1vaXlhB_AXzIPnnP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,350000,1),(65,'bKBb-43j__F2GX1AZVatVrOIrJuyI7Lj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5000000,1),(66,'kZI6Zslrm664zu-xOtLDhh4gtQk2xU9D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2900000,4);
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
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_make`
--

LOCK TABLES `vehicle_make` WRITE;
/*!40000 ALTER TABLE `vehicle_make` DISABLE KEYS */;
INSERT INTO `vehicle_make` VALUES (2,'Alfa Romeo'),(3,'Toyota'),(4,'Bentley'),(5,'BMW'),(6,'Buick'),(7,'Cadillac'),(8,'Checker'),(9,'Chery'),(10,'Chevrolet'),(11,'Chrysler'),(12,'Daewoo'),(13,'Daihatsu'),(14,'Datsun'),(15,'Dodge'),(16,'Fiat'),(17,'Ford'),(18,'Foton'),(19,'Geely'),(20,'Geo'),(21,'GMC'),(22,'Honda'),(23,'Hummer'),(24,'Hyundai'),(25,'Infiniti'),(26,'Isuzu'),(27,'Jaguar'),(28,'Jeep'),(29,'Kia'),(30,'Land Rover'),(31,'Lexus'),(32,'Lincoln'),(33,'Maruti'),(34,'Mazda'),(35,'Mercedes-Benz'),(36,'Mercury'),(37,'Micro'),(38,'Mini'),(39,'Mitsubishi'),(40,'Morris'),(41,'Nissan'),(42,'Oldsmobile'),(43,'Opel'),(44,'Perodua'),(45,'Peugeot'),(46,'Plymouth'),(47,'Pontiac'),(48,'Porsche'),(49,'Proton'),(50,'Range Rover'),(51,'Renault'),(52,'Saab'),(53,'Ssang Yong'),(54,'Saturn'),(55,'Subaru'),(56,'Suzuki'),(57,'TATA'),(59,'Volkswagen'),(60,'Volvo'),(61,'Yugo'),(62,'Zotye'),(63,'Acura'),(64,'Audi');
/*!40000 ALTER TABLE `vehicle_make` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_model`
--

DROP TABLE IF EXISTS `vehicle_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_model` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle_id` int(11) DEFAULT NULL,
  `vehicleModel` varchar(80) DEFAULT NULL,
  `vehicleType` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_model_fk_idx` (`vehicle_id`),
  CONSTRAINT `vehicle_model_fk` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle_make` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_model`
--

LOCK TABLES `vehicle_model` WRITE;
/*!40000 ALTER TABLE `vehicle_model` DISABLE KEYS */;
INSERT INTO `vehicle_model` VALUES (1,63,'EL','1',NULL),(2,63,'TL','1',NULL),(3,63,'TL','1',NULL),(4,63,'RL','1',NULL),(5,63,'DAA-RU3','1',NULL),(6,63,'INTEGRA','1',NULL),(7,63,'LEGEND','1',NULL),(8,63,'MDX','1',NULL),(9,63,'RDX','1',NULL),(10,63,'RL','1',NULL),(11,63,'T3289309','1',NULL),(12,63,'TL','1',NULL),(13,63,'TSX','1',NULL),(14,63,'VIGOR','1',NULL),(15,63,'ZDX','1',NULL),(16,2,'155 1.8TS','1',NULL),(17,2,'156 TS','1',NULL),(18,2,'ZAR93000','1',NULL),(19,64,'AUDI100','1',NULL),(20,64,'AUDI200','1',NULL),(21,64,'4000','1',NULL),(22,64,'5000','1',NULL),(23,64,'80','1',NULL),(24,64,'90','1',NULL),(25,64,'A3','1',NULL),(26,64,'A4','1',NULL),(27,64,'A5','1',NULL),(28,64,'A6','1',NULL),(29,64,'A7','1',NULL),(30,64,'A8','1',NULL),(31,64,'ALLRDQUA','1',NULL),(32,64,'AUDICABRI','1',NULL),(33,64,'AUDICOUPE','1',NULL),(34,64,'Q3','1',NULL),(35,64,'Q5','1',NULL),(36,64,'Q7','1',NULL),(37,64,'QUATTR','1',NULL),(38,64,'R8','1',NULL),(39,64,'RS4','1',NULL),(40,64,'RS5','1',NULL),(41,64,'RS6','1',NULL),(42,64,'S4','1',NULL),(43,64,'S5','1',NULL),(44,64,'S6','1',NULL),(45,64,'S7','1',NULL),(46,64,'S8','1',NULL),(47,64,'TTRS','1',NULL),(48,64,'TTS','1',NULL),(49,64,'V8','1',NULL),(50,64,'100','1',NULL),(51,64,'200','1',NULL),(52,64,'90S','1',NULL),(53,64,'A4 1.8T','1',NULL),(54,64,'A4 2.0LT','1',NULL),(55,64,'A6-2.0L','1',NULL),(56,64,'A61.9TDI','1',NULL),(57,64,'A62.OLT','1',NULL),(58,64,'TT','1',NULL),(59,4,'ARNAGE','1',NULL),(60,4,'AZURE','1',NULL),(61,4,'BROOKLANDS','1',NULL),(62,4,'BENCONT','1',NULL),(63,4,'CORNICHE','1',NULL),(64,4,'BENEIGHT','1',NULL),(65,4,'BENMUL','1',NULL),(66,4,'BENTURBO','1',NULL),(67,5,'1_SERIES','1',NULL),(68,5,'128I','1',NULL),(69,5,'135I','1',NULL),(70,5,'135IS','1',NULL),(71,5,'3_SERIES','1',NULL),(72,5,'318I','1',NULL),(73,5,'318IC','1',NULL),(74,5,'318IS','1',NULL),(75,5,'318TI','1',NULL),(76,5,'320I','1',NULL),(77,5,'323CI','1',NULL),(78,5,'323I','1',NULL),(79,5,'323IS','1',NULL),(80,5,'323IT','1',NULL),(81,5,'325CI','1',NULL),(82,5,'325E','1',NULL),(83,5,'325ES','1',NULL),(84,5,'325I','1',NULL),(85,5,'325IS','1',NULL),(86,5,'325IX','1',NULL),(87,5,'325XI','1',NULL),(88,5,'328CI','1',NULL),(89,5,'328I','1',NULL),(90,5,'328IS','1',NULL),(91,5,'328XI','1',NULL),(92,5,'330CI','1',NULL),(93,5,'330I','1',NULL),(94,5,'330XI','1',NULL),(95,5,'335D','1',NULL),(96,5,'335I','1',NULL),(97,5,'335IS','1',NULL),(98,5,'335XI','1',NULL),(99,5,'ACTIVE3','1',NULL),(100,5,'5_SERIES','1',NULL),(101,5,'524TD','1',NULL),(102,5,'525I','1',NULL),(103,5,'525XI','1',NULL),(104,5,'528E','1',NULL),(105,5,'528I','1',NULL),(106,5,'528IT','1',NULL),(107,5,'528XI','1',NULL),(108,5,'530I','1',NULL),(109,5,'530IT','1',NULL),(110,5,'530XI','1',NULL),(111,5,'533I','1',NULL),(112,5,'535I','1',NULL),(113,5,'535IGT','1',NULL),(114,5,'535XI','1',NULL),(115,5,'540I','1',NULL),(116,5,'545I','1',NULL),(117,5,'550I','1',NULL),(118,5,'550IGT','1',NULL),(119,5,'ACTIVE5','1',NULL),(120,5,'6_SERIES','1',NULL),(121,5,'633CSI','1',NULL),(122,5,'635CSI','1',NULL),(123,5,'640I','1',NULL),(124,5,'640IGC','1',NULL),(125,5,'645CI','1',NULL),(126,5,'650I','1',NULL),(127,5,'650IGC','1',NULL),(128,5,'L6','1',NULL),(129,5,'7_SERIES','1',NULL),(130,5,'733I','1',NULL),(131,5,'735I','1',NULL),(132,5,'735IL','1',NULL),(133,5,'740I','1',NULL),(134,5,'740IL','1',NULL),(135,5,'740LI','1',NULL),(136,5,'745I','1',NULL),(137,5,'745LI','1',NULL),(138,5,'750I','1',NULL),(139,5,'750IL','1',NULL),(140,5,'750LI','1',NULL),(141,5,'760I','1',NULL),(142,5,'760LI','1',NULL),(143,5,'ACTIVE7','1',NULL),(144,5,'ALPINAB7','1',NULL),(145,5,'8_SERIES','1',NULL),(146,5,'840CI','1',NULL),(147,5,'850CI','1',NULL),(148,5,'850CSI','1',NULL),(149,5,'850I','1',NULL),(150,5,'L_SERIES','1',NULL),(151,5,'L7','1',NULL),(152,5,'M_SERIES','1',NULL),(153,5,'1SERIESM','1',NULL),(154,5,'BMWROAD','1',NULL),(155,5,'M3','1',NULL),(156,5,'M5','1',NULL),(157,5,'M6','1',NULL),(158,5,'X5M','1',NULL),(159,5,'X6M','1',NULL),(160,5,'X_SERIES','1',NULL),(161,5,'ACTIVEX6','1',NULL),(162,5,'X1','1',NULL),(163,5,'X3','1',NULL),(164,5,'X5','1',NULL),(165,5,'X6','1',NULL),(166,5,'Z_SERIES','1',NULL),(167,5,'Z3','1',NULL),(168,5,'Z4','1',NULL),(169,5,'Z8','1',NULL),(170,5,'1181 M SPORT AUTO','1',NULL),(171,5,'316I','1',NULL),(172,5,'318','1',NULL),(173,5,'3181','1',NULL),(174,5,'3181 M SPORT','1',NULL),(175,5,'318D MODERN AUTO','1',NULL),(176,5,'320 I','1',NULL),(177,5,'320 I E 90','1',NULL),(178,5,'320 IA','1',NULL),(179,5,'3200','1',NULL),(180,5,'3201 SE','1',NULL),(181,5,'320D','1',NULL),(182,5,'323 I','1',NULL),(183,5,'325 I','1',NULL),(184,5,'328 I','1',NULL),(185,5,'518 I','1',NULL),(186,5,'5201','1',NULL),(187,5,'520D','1',NULL),(188,5,'520LA','1',NULL),(189,5,'523','1',NULL),(190,5,'523 I','1',NULL),(191,5,'523IA','1',NULL),(192,5,'528 I','1',NULL),(193,5,'530D','1',NULL),(194,5,'530IA','1',NULL),(195,5,'535 I','1',NULL),(196,5,'728I AUTO','1',NULL),(197,5,'730 DI','1',NULL),(198,5,'730D SE','1',NULL),(199,5,'735','1',NULL),(200,5,'740 LI','1',NULL),(201,5,'ABA UE16 1161','1',NULL),(202,5,'ABA-FF30','1',NULL),(203,5,'ACTIVE','1',NULL),(204,5,'DAA-YE30','1',NULL),(205,5,'GHAY20','1',NULL),(206,5,'LDA-3D20 320D SPORT','1',NULL),(207,5,'X1D','1',NULL),(208,5,'X3D','1',NULL),(209,5,'Z4 ROADSTER','1',NULL),(210,5,'Z4 SDRIVE 231','1',NULL),(211,6,'CENTURY','1',NULL),(212,6,'LUCERNE','1',NULL),(213,6,'PARK AVENUE','1',NULL),(214,6,'REGAL','1',NULL),(215,6,'RENDEZVOUS','1',NULL),(216,6,'RIVIERA','1',NULL),(217,6,'BUIENC','1',NULL),(218,6,'LESA','1',NULL),(219,6,'PARK','1',NULL),(220,6,'TERRAZA','1',NULL),(221,7,'ALLANT','1',NULL),(222,7,'ATS','1',NULL),(223,7,'BROUGH','1',NULL),(224,7,'CATERA','1',NULL),(225,7,'CIMA','1',NULL),(226,7,'CTS','1',NULL),(227,7,'DEV','1',NULL),(228,7,'DTS','1',NULL),(229,7,'ELDO','1',NULL),(230,7,'ESCALA','1',NULL),(231,7,'ESCALAESV','1',NULL),(232,7,'EXT','1',NULL),(233,7,'FLEE','1',NULL),(234,7,'SEV','1',NULL),(235,7,'SRX','1',NULL),(236,7,'STS','1',NULL),(237,7,'XLR','1',NULL),(238,7,'XTS','1',NULL),(239,8,'AVEO','1',NULL),(240,8,'CAMARO','1',NULL),(241,8,'CAPRICE','1',NULL),(242,8,'CAVALIER','1',NULL),(243,8,'CORVETTE','1',NULL),(244,9,'QQ','1',NULL),(245,9,'FULWIN2 CAR','1',NULL),(246,10,'ASTRO','1',NULL),(247,10,'AVALNCH','1',NULL),(248,10,'AVEO5','1',NULL),(249,10,'BERETT','1',NULL),(250,10,'COBALT','1',NULL),(251,10,'COLORADO','1',NULL),(252,10,'CORSI','1',NULL),(253,10,'CORV','1',NULL),(254,10,'CRUZE','1',NULL),(255,10,'G15EXP','1',NULL),(256,10,'CHEVIMP','1',NULL),(257,10,'KODC4500','1',NULL),(258,10,'LUMINA','1',NULL),(259,10,'LAPV','1',NULL),(260,10,'LUV','1',NULL),(261,10,'MALI','1',NULL),(262,10,'CHVMETR','1',NULL),(263,10,'CHEVMONT','1',NULL),(264,10,'NOVA','1',NULL),(265,10,'CHEVPRIZM','1',NULL),(266,10,'CHVST','1',NULL),(267,10,'S10PICKUP','1',NULL),(268,10,'CHEV150','1',NULL),(269,10,'CHEVC25','1',NULL),(270,10,'CH3500PU','1',NULL),(271,10,'SONIC','1',NULL),(272,10,'SPARK','1',NULL),(273,10,'CHEVSPEC','1',NULL),(274,10,'CHSPRINT','1',NULL),(275,10,'SSR','1',NULL),(276,10,'UPLANDER','1',NULL),(277,10,'VENTUR','1',NULL),(278,10,'VOLT','1',NULL),(279,10,'CHEOTH','1',NULL),(280,10,'AVEO U-VA','1',NULL),(281,10,'AVEO-1.6','1',NULL),(282,10,'BEAT','1',NULL),(283,10,'CAPTIVA LTZ','1',NULL),(284,10,'DBA-HR52S','1',NULL),(285,10,'LA-HR51S','1',NULL),(286,10,'MD90','1',NULL),(287,10,'SPARK LT','1',NULL),(288,10,'TAVERA','1',NULL),(289,10,'UA-HR528CRUZE','1',NULL),(290,10,'UA-HR52S','1',NULL),(291,11,'CHRYS200','1',NULL),(292,11,'CHRY300','1',NULL),(293,11,'CIRRUS','1',NULL),(294,11,'CONC','1',NULL),(295,11,'CHRYCONQ','1',NULL),(296,11,'CORDOBA','1',NULL),(297,11,'CROSSFIRE','1',NULL),(298,11,'ECLASS','1',NULL),(299,11,'FIFTH','1',NULL),(300,11,'CHRYGRANDV','1',NULL),(301,11,'IMPE','1',NULL),(302,11,'INTREPID','1',NULL),(303,11,'CHRYLAS','1',NULL),(304,11,'LEBA','1',NULL),(305,11,'LHS','1',NULL),(306,11,'CHRYNEON','1',NULL),(307,11,'NEWPORT','1',NULL),(308,11,'PACIFICA','1',NULL),(309,11,'300C','1',NULL),(310,11,'CONCORDE','1',NULL),(311,11,'CONQUEST','1',NULL),(312,12,'LANOS','1',NULL),(313,12,'LEGANZA','1',NULL),(314,12,'NUBIRA','1',NULL),(315,12,'CIELO GLE','1',NULL),(316,12,'LE-S210V','1',NULL),(317,12,'LE-S320V','1',NULL),(318,12,'MATIZ','1',NULL),(319,12,'MITIZ','1',NULL),(320,12,'RACER ETI','1',NULL),(321,13,'ABAJ131G','1',NULL),(322,13,'ATRAI','1',NULL),(323,13,'CHARADE','1',NULL),(324,13,'CUORE','1',NULL),(325,13,'DBA-M300S','1',NULL),(326,13,'DELTA','1',NULL),(327,13,'FC11-TERIOS','1',NULL),(328,13,'HIJET','1',NULL),(329,13,'HIJET EBD - S321V','1',NULL),(330,13,'HIJET GD S200V','1',NULL),(331,13,'HIJET S200P','1',NULL),(332,13,'JDA000-A35','1',NULL),(333,13,'JDA000L8000022773','1',NULL),(334,13,'LEEZA','1',NULL),(335,13,'LR8320V','1',NULL),(336,13,'M100RS-GFNF','1',NULL),(337,13,'MEERA','1',NULL),(338,13,'MIRA','1',NULL),(339,13,'MOVE','1',NULL),(340,13,'TERIOS','1',NULL),(341,13,'VIRA','1',NULL),(342,14,'280Z','1',NULL),(343,14,'300ZX','1',NULL),(344,14,'310','1',NULL),(345,14,'510','1',NULL),(346,14,'720','1',NULL),(347,14,'810','1',NULL),(348,14,'DATMAX','1',NULL),(349,15,'400','1',NULL),(350,15,'ARIES','1',NULL),(351,15,'ASPEN','1',NULL),(352,15,'AVENGER','1',NULL),(353,15,'CALIBER','1',NULL),(354,15,'CHALLENGER','1',NULL),(355,15,'CHARGER','1',NULL),(356,15,'COLT','1',NULL),(357,15,'COLT PICKUP','1',NULL),(358,15,'D-150','1',NULL),(359,15,'DURANGO','1',NULL),(360,15,'DYNASTY','1',NULL),(361,15,'GRAND CARAVAN','1',NULL),(362,15,'LANCER','1',NULL),(363,15,'MAGNUM','1',NULL),(364,15,'MIRADA','1',NULL),(365,15,'RAM','1',NULL),(366,15,'RAM 150','1',NULL),(367,15,'RAM 250 VAN','1',NULL),(368,15,'RAM 50','1',NULL),(369,15,'RAM1500','1',NULL),(370,15,'RAMPAGE','1',NULL),(371,16,'131','1',NULL),(372,16,'132','1',NULL),(373,16,'BELVEDERE','1',NULL),(374,16,'BRAVO','1',NULL),(375,16,'MAREA','1',NULL),(376,16,'PANDA','1',NULL),(377,16,'PUNTO','1',NULL),(378,16,'SPIDER','1',NULL),(379,16,'TEMPRA','1',NULL),(380,17,'AEROSTAR','1',NULL),(381,17,'ASPIRE','1',NULL),(382,17,'BRONCO','1',NULL),(383,17,'BRONCO II','1',NULL),(384,17,'CLUBWAGON MPV','1',NULL),(385,17,'CONSEL','1',NULL),(386,17,'CONTOUR','1',NULL),(387,17,'CORTINA','1',NULL),(388,17,'COURIER','1',NULL),(389,17,'CROWN VICTORIA','1',NULL),(390,17,'ESCAPE','1',NULL),(391,17,'ESCORT','1',NULL),(392,17,'ESCORT ZX2','1',NULL),(393,17,'EV RANGER','1',NULL),(394,17,'EVEREST','1',NULL),(395,17,'EXP','1',NULL),(396,17,'EXPEDITION','1',NULL),(397,17,'EXPLORER','1',NULL),(398,17,'EXPLORER SPORT','1',NULL),(399,17,'F150 PICKUP','1',NULL),(400,17,'F150 SUPERCAB','1',NULL),(401,17,'F150 SUPERCREW','1',NULL),(402,17,'F250 PICKUP','1',NULL),(403,17,'FAIRMONT','1',NULL),(404,17,'FESTIVA','1',NULL),(405,17,'FIESTA','1',NULL),(406,17,'FIVE HUNDRED','1',NULL),(407,17,'FLEX','1',NULL),(408,17,'FOCUS','1',NULL),(409,17,'FREESTAR','1',NULL),(410,17,'FREESTYLE','1',NULL),(411,17,'FULL SIZE','1',NULL),(412,17,'FUSION','1',NULL),(413,17,'FUSION HYBRID','1',NULL),(414,17,'GRANADA','1',NULL),(415,17,'J80','1',NULL),(416,17,'JC6','1',NULL),(417,17,'MONDEO','1',NULL),(418,17,'MONDEO GLX','1',NULL),(419,17,'MUSTANG','1',NULL),(420,17,'PICKUP','1',NULL),(421,17,'RANGER','1',NULL),(422,17,'TAURUS','1',NULL),(423,17,'TEMPO','1',NULL),(424,17,'THUNDERBIRD','1',NULL),(425,18,'SUP CX','1',NULL),(426,18,'SUP C1','1',NULL),(427,19,'EC7','1',NULL),(428,19,'MK1.5','1',NULL),(429,19,'MR479QA','1',NULL),(430,19,'MR7151','1',NULL),(431,20,'METRO','1',NULL),(432,20,'PRIZM','1',NULL),(433,20,'STORM','1',NULL),(434,20,'TRACKER','1',NULL),(435,21,'ACADIA','1',NULL),(436,21,'CABALLERO','1',NULL),(437,21,'CANYON','1',NULL),(438,21,'ENVOY','1',NULL),(439,21,'ENVOYXL','1',NULL),(440,21,'ENVOYXUV','1',NULL),(441,21,'JIM','1',NULL),(442,21,'RALLYWAG','1',NULL),(443,21,'GMCS15','1',NULL),(444,21,'S15','1',NULL),(445,21,'SUB','1',NULL),(446,21,'TERRAIN','1',NULL),(447,21,'TOPC4500','1',NULL),(448,21,'TYPH','1',NULL),(449,21,'GMCVANDUR','1',NULL),(450,21,'S15 PICKUP','1',NULL),(451,22,'ACCORD','1',NULL),(452,22,'AIRWAVE','1',NULL),(453,22,'AKDR','1',NULL),(454,22,'ARIYA','1',NULL),(455,22,'CITY','1',NULL),(456,22,'CITY 1.5A','1',NULL),(457,22,'CITY ABS 4A','1',NULL),(458,22,'CITY VTEC','1',NULL),(459,22,'CITY VTEC 4A','1',NULL),(460,22,'CIVIC','1',NULL),(461,22,'CIVIC 1.6A','1',NULL),(462,22,'CIVIC ES','1',NULL),(463,22,'CIVIC EXI 4A','1',NULL),(464,22,'CIVIC EXT','1',NULL),(465,22,'CIVIC FERIO','1',NULL),(466,22,'CR-V','1',NULL),(467,22,'CR-V 2.0L','1',NULL),(468,22,'CRZ','1',NULL),(469,22,'CT200','1',NULL),(470,22,'DAA-FD3 CIVIC HYBRID','1',NULL),(471,22,'DAA-GM4','1',NULL),(472,22,'DAA-GM4-GRACE-HYBRID','1',NULL),(473,22,'DAA-GP1','1',NULL),(474,22,'DAA-GP1 FIT','1',NULL),(475,22,'DAA-GP2','1',NULL),(476,22,'DAA-GP2 FIT SHUTTLE','1',NULL),(477,22,'DAA-GP2SHUTTLEHYBRID','1',NULL),(478,22,'DAA-GP3','1',NULL),(479,22,'DAA-GP3 FREED','1',NULL),(480,22,'DAA-GP5 FIT','1',NULL),(481,22,'DAA-RU3 VEZEL','1',NULL),(482,22,'DAA-RU4','1',NULL),(483,22,'DAA-RU5','1',NULL),(484,22,'DAA-RUS VEZEL','1',NULL),(485,22,'DAA-ZE2','1',NULL),(486,22,'DAA-ZE2-INSIGHT','1',NULL),(487,22,'DAA-ZF1','1',NULL),(488,22,'DAA-ZF1 CR-Z','1',NULL),(489,22,'DAAGP1','1',NULL),(490,22,'DAAGP1-FIT HYBRID','1',NULL),(491,22,'DAAZF2','1',NULL),(492,22,'DBA GD1','1',NULL),(493,22,'DBA-FD1','1',NULL),(494,22,'DBA-GD1','1',NULL),(495,22,'DBA-GD8','1',NULL),(496,22,'DBA-GD9','1',NULL),(497,22,'DBA-GE 5','1',NULL),(498,22,'DBA-GE6','1',NULL),(499,22,'DBA-GJ1','1',NULL),(500,22,'DBA-GJI AIR WAVE','1',NULL),(501,22,'DBA-OD8','1',NULL),(502,22,'DBA-RD2','1',NULL),(503,22,'DBA-RE4','1',NULL),(504,22,'DBA-RT1 CROSSROAD','1',NULL),(505,22,'E-DA2','1',NULL),(506,22,'E-EF2','1',NULL),(507,22,'EG8','1',NULL),(508,22,'EK3','1',NULL),(509,22,'FIT','1',NULL),(510,22,'FIT 1.3A','1',NULL),(511,22,'FIT ARIA','1',NULL),(512,22,'FIT DAA-GP1','1',NULL),(513,22,'FIT SHUTTLE','1',NULL),(514,22,'FIT-GP5','1',NULL),(515,22,'FREED','1',NULL),(516,22,'GD8 FIT ARIA','1',NULL),(517,22,'GRACE','1',NULL),(518,22,'GRAND CIVIC','1',NULL),(519,22,'INSIGHT','1',NULL),(520,22,'INSIGHT ZE2','1',NULL),(521,22,'JAZZ','1',NULL),(522,22,'JHMGK','1',NULL),(523,22,'LA CUSTOM','1',NULL),(524,22,'LA-GD1','1',NULL),(525,22,'LA-GD6','1',NULL),(526,22,'MRV','1',NULL),(527,22,'ODYSSEY','1',NULL),(528,22,'RU3','1',NULL),(529,22,'SHUTTLE','1',NULL),(530,22,'STATION WAGON','1',NULL),(531,22,'STREAM','1',NULL),(532,22,'UA-ES1','1',NULL),(533,22,'UA-GD1','1',NULL),(534,22,'VEZEL','1',NULL),(535,22,'VXI','1',NULL),(536,23,'H2','1',NULL),(537,23,'H3','1',NULL),(538,24,'ACCENT','1',NULL),(539,24,'ACCENT GLM','1',NULL),(540,24,'ARACE H100M','1',NULL),(541,24,'ATOS','1',NULL),(542,24,'AZERA','1',NULL),(543,24,'ELAN XD 4D M','1',NULL),(544,24,'ELAN XD 4DA','1',NULL),(545,24,'ELAN XD 5D M','1',NULL),(546,24,'ELANTRA','1',NULL),(547,24,'ENTOURAGE','1',NULL),(548,24,'EON','1',NULL),(549,24,'EXCEL GLS','1',NULL),(550,24,'F/L COUPE','1',NULL),(551,24,'GENESIS','1',NULL),(552,24,'GETZ','1',NULL),(553,24,'GRACE H100','1',NULL),(554,24,'MATRIX GLS A','1',NULL),(555,24,'MATRIX GLS M','1',NULL),(556,24,'PONY EXCEL','1',NULL),(557,24,'SANTA FE','1',NULL),(558,24,'SANTRO','1',NULL),(559,24,'SCOUPE','1',NULL),(560,24,'SONATA','1',NULL),(561,24,'STELLAR GSL','1',NULL),(562,24,'TERRACAN','1',NULL),(563,24,'TIBURON','1',NULL),(564,24,'TRAJET','1',NULL),(565,24,'TUCSON','1',NULL),(566,24,'VERACRUZ','1',NULL),(567,24,'XG GLSA','1',NULL),(568,24,'XG300','1',NULL),(569,25,'EX35','1',NULL),(570,25,'G20','1',NULL),(571,25,'J30','1',NULL),(572,25,'M30','1',NULL),(573,25,'M37','1',NULL),(574,25,'Q45','1',NULL),(575,25,'QX4','1',NULL),(576,25,'EX_MODELS','1',NULL),(577,25,'EX37','1',NULL),(578,25,'FX_MODELS','1',NULL),(579,25,'FX35','1',NULL),(580,25,'FX37','1',NULL),(581,25,'FX45','1',NULL),(582,25,'FX50','1',NULL),(583,25,'G_MODELS','1',NULL),(584,25,'G25','1',NULL),(585,25,'G35','1',NULL),(586,25,'G37','1',NULL),(587,25,'I_MODELS','1',NULL),(588,25,'I30','1',NULL),(589,25,'I35','1',NULL),(590,25,'J_MODELS','1',NULL),(591,25,'JX_MODELS','1',NULL),(592,25,'JX35','1',NULL),(593,25,'M_MODELS','1',NULL),(594,25,'M35','1',NULL),(595,25,'M35HYBRID','1',NULL),(596,25,'M45','1',NULL),(597,25,'M56','1',NULL),(598,25,'Q_MODELS','1',NULL),(599,25,'QX_MODELS','1',NULL),(600,25,'QX56','1',NULL),(601,25,'INFOTH','1',NULL),(602,26,'AMIGO','1',NULL),(603,26,'ASCENDER','1',NULL),(604,26,'AXIOM','1',NULL),(605,26,'HOMBRE','1',NULL),(606,26,'I280','1',NULL),(607,26,'I290','1',NULL),(608,26,'I350','1',NULL),(609,26,'I370','1',NULL),(610,26,'RODEO','1',NULL),(611,26,'STYLUS','1',NULL),(612,27,'STYPE','1',NULL),(613,27,'XTYPE','1',NULL),(614,27,'XF','1',NULL),(615,27,'XJ12','1',NULL),(616,27,'XJ6','1',NULL),(617,27,'XJR','1',NULL),(618,27,'XJRS','1',NULL),(619,27,'XJS','1',NULL),(620,27,'VANDEN','1',NULL),(621,27,'XJ8','1',NULL),(622,27,'XJ8L','1',NULL),(623,27,'XJSPORT','1',NULL),(624,27,'XK8','1',NULL),(625,27,'XKR','1',NULL),(626,27,'JAGOTH','1',NULL),(627,28,'CHEROKEE','1',NULL),(628,28,'CHEROKEE LAREDO','1',NULL),(629,28,'CJ','1',NULL),(630,28,'COMANCHE','1',NULL),(631,28,'COMPASS','1',NULL),(632,28,'GRAND CHEROKEE','1',NULL),(633,28,'LIBERTY','1',NULL),(634,28,'PATRIOT','1',NULL),(635,28,'TOWNSIDE MPV','1',NULL),(636,28,'WRANGLER','1',NULL),(637,29,'BORREGO','1',NULL),(638,29,'CARENS','1',NULL),(639,29,'CARENSI 8A','1',NULL),(640,29,'CARNIVAL','1',NULL),(641,29,'OPTIMA','1',NULL),(642,29,'PECTRA 1.6HB','1',NULL),(643,29,'PICANTO','1',NULL),(644,29,'PREGIO 2.7','1',NULL),(645,29,'PRIDE','1',NULL),(646,29,'PRONTIER','1',NULL),(647,29,'RIO','1',NULL),(648,29,'RIO 1.3M','1',NULL),(649,29,'RONDO','1',NULL),(650,29,'SEDONA','1',NULL),(651,29,'SEPHIA','1',NULL),(652,29,'SEPHIA 1.5M','1',NULL),(653,29,'SORENTO','1',NULL),(654,29,'SORENTO 4X4 JEEP','1',NULL),(655,29,'SORENTO JEEP','1',NULL),(656,29,'SOUL','1',NULL),(657,29,'SPECTRA','1',NULL),(658,29,'SPORTAGE','1',NULL),(659,29,'SPORTAGE 4X4','1',NULL),(660,30,'4 WD RHD','1',NULL),(661,30,'CLAA','1',NULL),(662,30,'DEFENDER','1',NULL),(663,30,'DEFENDER 110','1',NULL),(664,30,'DISCOVERY','1',NULL),(665,30,'DISCOVERY II','1',NULL),(666,30,'FREE LANDER','1',NULL),(667,30,'JEEP TYPE','1',NULL),(668,30,'LR3','1',NULL),(669,30,'RANGE ROVER SPORT','1',NULL),(670,30,'TAURUS 2518','1',NULL),(671,31,'CT200H','1',NULL),(672,31,'ES_MODELS','1',NULL),(673,31,'ES250','1',NULL),(674,31,'ES300','1',NULL),(675,31,'ES300H','1',NULL),(676,31,'ES330','1',NULL),(677,31,'ES350','1',NULL),(678,31,'GS_MODELS','1',NULL),(679,31,'GS300','1',NULL),(680,31,'GS350','1',NULL),(681,31,'GS400','1',NULL),(682,31,'GS430','1',NULL),(683,31,'GS450H','1',NULL),(684,31,'GS460','1',NULL),(685,31,'GX_MODELS','1',NULL),(686,31,'GX460','1',NULL),(687,31,'GX470','1',NULL),(688,31,'HS_MODELS','1',NULL),(689,31,'HS250H','1',NULL),(690,31,'IS_MODELS','1',NULL),(691,31,'IS250','1',NULL),(692,31,'IS250C','1',NULL),(693,31,'IS300','1',NULL),(694,31,'IS350','1',NULL),(695,31,'IS350C','1',NULL),(696,31,'ISF','1',NULL),(697,31,'LEXLFA','1',NULL),(698,31,'LS_MODELS','1',NULL),(699,31,'LS400','1',NULL),(700,31,'LS430','1',NULL),(701,31,'LS460','1',NULL),(702,31,'LS600H','1',NULL),(703,31,'LX_MODELS','1',NULL),(704,31,'LX450','1',NULL),(705,31,'LX470','1',NULL),(706,31,'LX570','1',NULL),(707,31,'RX_MODELS','1',NULL),(708,31,'RX300','1',NULL),(709,31,'RX330','1',NULL),(710,31,'RX350','1',NULL),(711,31,'RX400H','1',NULL),(712,31,'RX450H','1',NULL),(713,31,'SC_MODELS','1',NULL),(714,31,'SC300','1',NULL),(715,31,'SC400','1',NULL),(716,31,'SC430','1',NULL),(717,31,'DAA-ANF10','1',NULL),(718,31,'DAA-GYL16W','1',NULL),(719,31,'DAA-UVF46','1',NULL),(720,31,'DBA-AGZ10','1',NULL),(721,31,'ES 350','1',NULL),(722,31,'NX 300H','1',NULL),(723,31,'RX 400','1',NULL),(724,32,'AVIATOR','1',NULL),(725,32,'MARKLT','1',NULL),(726,32,'MARK6','1',NULL),(727,32,'MARK7','1',NULL),(728,32,'MARK8','1',NULL),(729,32,'MKS','1',NULL),(730,32,'MKT','1',NULL),(731,32,'MKX','1',NULL),(732,32,'MKZ','1',NULL),(733,32,'NAVIGA','1',NULL),(734,32,'NAVIGAL','1',NULL),(735,32,'LINCTC','1',NULL),(736,32,'ZEPHYR','1',NULL),(737,32,'LINOTH','1',NULL),(738,32,'CONTINENTAL','1',NULL),(739,32,'LS','1',NULL),(740,32,'MARK','1',NULL),(741,33,'Alto L7TD','1',NULL),(742,33,'Alto LXI','1',NULL),(743,33,'Alto SPORTZ','1',NULL),(744,33,'410','1',NULL),(745,33,'50FTOP','1',NULL),(746,33,'650','1',NULL),(747,33,'800','1',NULL),(748,33,'A STAR','1',NULL),(749,33,'A STAR VXI','1',NULL),(750,33,'ALTO LXI-800','1',NULL),(751,33,'ALTO-K10','1',NULL),(752,33,'ESTEEM','1',NULL),(753,33,'ESTILO','1',NULL),(754,33,'FJ4I','1',NULL),(755,33,'OMNI','1',NULL),(756,33,'SWIFT','1',NULL),(757,33,'SWIFT DZ1RE VX1','1',NULL),(758,33,'SWIFT VXI SUZUKI','1',NULL),(759,33,'WAGON VX1','1',NULL),(760,33,'GYPSY S/T','1',NULL),(761,33,'ZEN','1',NULL),(762,33,'ZENVX1','1',NULL),(763,34,'323','1',NULL),(764,34,'626','1',NULL),(765,34,'929','1',NULL),(766,34,'B-SERIES','1',NULL),(767,34,'CX-5','1',NULL),(768,34,'CX-7','1',NULL),(769,34,'CX-9','1',NULL),(770,34,'GLC','1',NULL),(771,34,'MAZDA2','1',NULL),(772,34,'MAZDA3','1',NULL),(773,34,'MAZDA5','1',NULL),(774,34,'MAZDA6','1',NULL),(775,34,'MAZDASPD3','1',NULL),(776,34,'MAZDASPD6','1',NULL),(777,34,'MIATA','1',NULL),(778,34,'MILL','1',NULL),(779,34,'MPV','1',NULL),(780,34,'MX3','1',NULL),(781,34,'MX6','1',NULL),(782,34,'NAVAJO','1',NULL),(783,34,'PROTE','1',NULL),(784,34,'RX7','1',NULL),(785,34,'RX8','1',NULL),(786,34,'TRIBUTE','1',NULL),(787,34,'323 GLX','1',NULL),(788,34,'323 LX','1',NULL),(789,34,'323 SA ABS','1',NULL),(790,34,'323-PROTEGE','1',NULL),(791,34,'323SA AB5','1',NULL),(792,34,'626 GLX','1',NULL),(793,34,'6I','1',NULL),(794,34,'ASTINA','1',NULL),(795,34,'AXELA','1',NULL),(796,34,'BONGO','1',NULL),(797,34,'BONGO BRAWNY','1',NULL),(798,34,'BS98LX','1',NULL),(799,34,'CX-5 KH43 RAC','1',NULL),(800,34,'D2200SE51','1',NULL),(801,34,'DEMI','1',NULL),(802,34,'DEMIO','1',NULL),(803,34,'E2200','1',NULL),(804,34,'EBD','1',NULL),(805,34,'EBD-DG64V','1',NULL),(806,34,'EBPTP','1',NULL),(807,34,'EPEW','1',NULL),(808,34,'EUNOS','1',NULL),(809,34,'FAMILIA','1',NULL),(810,34,'FAMILIAR','1',NULL),(811,34,'FAMILIYA','1',NULL),(812,34,'METAL','1',NULL),(813,34,'MILLENIA','1',NULL),(814,34,'MISTER','1',NULL),(815,34,'MR90','1',NULL),(816,34,'MX5','1',NULL),(817,34,'R-BF3V','1',NULL),(818,34,'R-BF5V','1',NULL),(819,34,'RX','1',NULL),(820,34,'RX-8','1',NULL),(821,35,'190_CLASS','1',NULL),(822,35,'190D','1',NULL),(823,35,'190E','1',NULL),(824,35,'240_CLASS','1',NULL),(825,35,'240D','1',NULL),(826,35,'300_CLASS_E_CLASS','1',NULL),(827,35,'300CD','1',NULL),(828,35,'300CE','1',NULL),(829,35,'300D','1',NULL),(830,35,'300E','1',NULL),(831,35,'300TD','1',NULL),(832,35,'300TE','1',NULL),(833,35,'C_CLASS','1',NULL),(834,35,'C220','1',NULL),(835,35,'C230','1',NULL),(836,35,'C240','1',NULL),(837,35,'C250','1',NULL),(838,35,'C280','1',NULL),(839,35,'C300','1',NULL),(840,35,'C320','1',NULL),(841,35,'C32AMG','1',NULL),(842,35,'C350','1',NULL),(843,35,'C36AMG','1',NULL),(844,35,'C43AMG','1',NULL),(845,35,'C55AMG','1',NULL),(846,35,'C63AMG','1',NULL),(847,35,'CL_CLASS','1',NULL),(848,35,'CL500','1',NULL),(849,35,'CL550','1',NULL),(850,35,'CL55AMG','1',NULL),(851,35,'CL600','1',NULL),(852,35,'CL63AMG','1',NULL),(853,35,'CL65AMG','1',NULL),(854,35,'CLK_CLASS','1',NULL),(855,35,'CLK320','1',NULL),(856,35,'CLK350','1',NULL),(857,35,'CLK430','1',NULL),(858,35,'CLK500','1',NULL),(859,35,'CLK550','1',NULL),(860,35,'CLK55AMG','1',NULL),(861,35,'CLK63AMG','1',NULL),(862,35,'CLS_CLASS','1',NULL),(863,35,'CLS500','1',NULL),(864,35,'CLS550','1',NULL),(865,35,'CLS55AMG','1',NULL),(866,35,'CLS63AMG','1',NULL),(867,35,'E_CLASS','1',NULL),(868,35,'260E','1',NULL),(869,35,'280CE','1',NULL),(870,35,'280E','1',NULL),(871,35,'400E','1',NULL),(872,35,'500E','1',NULL),(873,35,'E300','1',NULL),(874,35,'E320','1',NULL),(875,35,'E320BLUE','1',NULL),(876,35,'E320CDI','1',NULL),(877,35,'E350','1',NULL),(878,35,'E350BLUE','1',NULL),(879,35,'E400','1',NULL),(880,35,'E420','1',NULL),(881,35,'E430','1',NULL),(882,35,'E500','1',NULL),(883,35,'E550','1',NULL),(884,35,'E55AMG','1',NULL),(885,35,'E63AMG','1',NULL),(886,35,'G_CLASS','1',NULL),(887,35,'G500','1',NULL),(888,35,'G550','1',NULL),(889,35,'G55AMG','1',NULL),(890,35,'G63AMG','1',NULL),(891,35,'GL_CLASS','1',NULL),(892,35,'GL320BLUE','1',NULL),(893,35,'GL320CDI','1',NULL),(894,35,'GL350BLUE','1',NULL),(895,35,'GL450','1',NULL),(896,35,'GL550','1',NULL),(897,35,'GLK_CLASS','1',NULL),(898,35,'GLK350','1',NULL),(899,35,'M_CLASS','1',NULL),(900,35,'ML320','1',NULL),(901,35,'ML320BLUE','1',NULL),(902,35,'ML320CDI','1',NULL),(903,35,'ML350','1',NULL),(904,35,'ML350BLUE','1',NULL),(905,35,'ML430','1',NULL),(906,35,'ML450HY','1',NULL),(907,35,'ML500','1',NULL),(908,35,'ML550','1',NULL),(909,35,'ML55AMG','1',NULL),(910,35,'ML63AMG','1',NULL),(911,35,'R_CLASS','1',NULL),(912,35,'R320BLUE','1',NULL),(913,35,'R320CDI','1',NULL),(914,35,'R350','1',NULL),(915,35,'R350BLUE','1',NULL),(916,35,'R500','1',NULL),(917,35,'R63AMG','1',NULL),(918,35,'S_CLASS','1',NULL),(919,35,'300SD','1',NULL),(920,35,'300SDL','1',NULL),(921,35,'300SE','1',NULL),(922,35,'300SEL','1',NULL),(923,35,'350SD','1',NULL),(924,35,'350SDL','1',NULL),(925,35,'380SE','1',NULL),(926,35,'380SEC','1',NULL),(927,35,'380SEL','1',NULL),(928,35,'400SE','1',NULL),(929,35,'400SEL','1',NULL),(930,35,'420SEL','1',NULL),(931,35,'500SEC','1',NULL),(932,35,'500SEL','1',NULL),(933,35,'560SEC','1',NULL),(934,35,'560SEL','1',NULL),(935,35,'600SEC','1',NULL),(936,35,'600SEL','1',NULL),(937,35,'S320','1',NULL),(938,35,'S350','1',NULL),(939,35,'S350BLUE','1',NULL),(940,35,'S400HY','1',NULL),(941,35,'S420','1',NULL),(942,35,'S430','1',NULL),(943,35,'S500','1',NULL),(944,35,'S550','1',NULL),(945,35,'S55AMG','1',NULL),(946,35,'S600','1',NULL),(947,35,'S63AMG','1',NULL),(948,35,'S65AMG','1',NULL),(949,35,'SL_CLASS','1',NULL),(950,35,'300SL','1',NULL),(951,35,'380SL','1',NULL),(952,35,'380SLC','1',NULL),(953,35,'500SL','1',NULL),(954,35,'560SL','1',NULL),(955,35,'600SL','1',NULL),(956,35,'SL320','1',NULL),(957,35,'SL500','1',NULL),(958,35,'SL550','1',NULL),(959,35,'SL55AMG','1',NULL),(960,35,'SL600','1',NULL),(961,35,'SL63AMG','1',NULL),(962,35,'SL65AMG','1',NULL),(963,35,'SLK_CLASS','1',NULL),(964,35,'SLK230','1',NULL),(965,35,'SLK250','1',NULL),(966,35,'SLK280','1',NULL),(967,35,'SLK300','1',NULL),(968,35,'SLK320','1',NULL),(969,35,'SLK32AMG','1',NULL),(970,35,'SLK350','1',NULL),(971,35,'SLK55AMG','1',NULL),(972,35,'SLR_CLASS','1',NULL),(973,35,'SLR','1',NULL),(974,35,'SLS_CLASS','1',NULL),(975,35,'SLSAMG','1',NULL),(976,35,'SPRINTER_CLASS','1',NULL),(977,35,'A170','1',NULL),(978,35,'C 180 KOMP','1',NULL),(979,35,'C180','1',NULL),(980,35,'C180 KOMPRESSOR','1',NULL),(981,35,'C200','1',NULL),(982,35,'CLA180','1',NULL),(983,35,'CLS350','1',NULL),(984,35,'DBA-117342CLA180','1',NULL),(985,35,'E 250','1',NULL),(986,35,'E200','1',NULL),(987,35,'E200 KOMPRESSOR','1',NULL),(988,35,'E220','1',NULL),(989,35,'E230','1',NULL),(990,35,'E300 AMG NIGHT ED B TECH','1',NULL),(991,35,'E300 BLUETEC HYBRID','1',NULL),(992,35,'F/B','1',NULL),(993,35,'MB 140','1',NULL),(994,35,'ML 350 4 MATIC','1',NULL),(995,35,'S300L','1',NULL),(996,35,'S400 HYBRID','1',NULL),(997,35,'SLK200','1',NULL),(998,35,'SMART','1',NULL),(999,35,'100D 123','1',NULL),(1000,35,'8400 HYBRID','1',NULL),(1001,35,'S 320 CDI','1',NULL),(1002,36,'BOBCAT','1',NULL),(1003,36,'CAPRI','1',NULL),(1004,36,'COUGAR','1',NULL),(1005,36,'MERCGRAND','1',NULL),(1006,36,'LYNX','1',NULL),(1007,36,'MARAUDER','1',NULL),(1008,36,'MILAN','1',NULL),(1009,36,'MONTEGO','1',NULL),(1010,36,'MONTEREY','1',NULL),(1011,37,'ACTYON','1',NULL),(1012,37,'EC7-AUTO 4 DOOR SEDAN','1',NULL),(1013,37,'GELLY','1',NULL),(1014,37,'JUNIOR 111','1',NULL),(1015,37,'KORANDO','1',NULL),(1016,37,'KYRON','1',NULL),(1017,37,'KYRON200XDI','1',NULL),(1018,37,'MARK II','1',NULL),(1019,37,'MX-7','1',NULL),(1020,37,'MX7 MARK11','1',NULL),(1021,37,'MX711','1',NULL),(1022,37,'PANDA','1',NULL),(1023,37,'PANDA 1.0 GS','1',NULL),(1024,37,'PANDA CROSS','1',NULL),(1025,37,'PANDA CROSS-STANDARD','1',NULL),(1026,37,'PANDA LC 10','1',NULL),(1027,37,'PANDA LC 13','1',NULL),(1028,37,'PANDA LC1.0','1',NULL),(1029,37,'PRIVILEGE','1',NULL),(1030,37,'RANTIA LC 1.0','1',NULL),(1031,37,'REXTON','1',NULL),(1032,37,'TOURER','1',NULL),(1033,37,'TREND','1',NULL),(1034,37,'VOLEER','1',NULL),(1035,38,'COOPRCLUB_MODELS','1',NULL),(1036,38,'COOPERCLUB','1',NULL),(1037,38,'COOPRCLUBS','1',NULL),(1038,38,'COOPCOUNTRY_MODELS','1',NULL),(1039,38,'COUNTRYMAN','1',NULL),(1040,38,'COOPCOUP_MODELS','1',NULL),(1041,38,'MINICOUPE','1',NULL),(1042,38,'MINISCOUPE','1',NULL),(1043,38,'COOPER','1',NULL),(1044,38,'COOPERS','1',NULL),(1045,38,'COOPERROAD','1',NULL),(1046,38,'COOPERSRD','1',NULL),(1047,38,'DLA-GG2W','1',NULL),(1048,38,'KA4TNJNMFR','1',NULL),(1049,39,'3000 GT','1',NULL),(1050,39,'CBD-U61V MINICAB','1',NULL),(1051,39,'CEDIA','1',NULL),(1052,39,'CHARIOT','1',NULL),(1053,39,'CK2A','1',NULL),(1054,39,'CS1 ASNJER LANCER','1',NULL),(1055,39,'CY2ASRMHR','1',NULL),(1056,39,'D-CAB','1',NULL),(1057,39,'DELICA','1',NULL),(1058,39,'DIAMANTE','1',NULL),(1059,39,'EV 4500','1',NULL),(1060,39,'EVOLUTION V111 RS','1',NULL),(1061,39,'FARGO','1',NULL),(1062,39,'FUSO','1',NULL),(1063,39,'GA-F02T','1',NULL),(1064,39,'GA2WXTSHR','1',NULL),(1065,39,'GA2WXTSHZR','1',NULL),(1066,39,'GALANT','1',NULL),(1067,39,'GF3WXTMGZR','1',NULL),(1068,39,'GG2WXDHHZR','1',NULL),(1069,39,'GH-CS2A','1',NULL),(1070,39,'GH-H76W-JEEP','1',NULL),(1071,39,'GH-V75W','1',NULL),(1072,39,'GK1ASNDR','1',NULL),(1073,39,'K34','1',NULL),(1074,39,'KB-5A5V','1',NULL),(1075,39,'L-200','1',NULL),(1076,39,'L-200 DIAMOD','1',NULL),(1077,39,'L200 ELEGANCE','1',NULL),(1078,39,'L200 KA4TNJNMR','1',NULL),(1079,39,'L200 PICK UP','1',NULL),(1080,39,'L200 WARRIOR','1',NULL),(1081,39,'L200S','1',NULL),(1082,39,'L300','1',NULL),(1083,39,'L400','1',NULL),(1084,39,'LA-V73W','1',NULL),(1085,39,'LANCER','1',NULL),(1086,39,'LANCER -C11V','1',NULL),(1087,39,'LANCER CB3A','1',NULL),(1088,39,'MINI CA VAN','1',NULL),(1089,39,'MINI CAB','1',NULL),(1090,39,'MINI PAJERO','1',NULL),(1091,39,'MIRAGE','1',NULL),(1092,39,'MITSUBISHI ATTRAGE','1',NULL),(1093,39,'MONTERO','1',NULL),(1094,39,'MONTERO JEEP','1',NULL),(1095,39,'MONTERO SPORT','1',NULL),(1096,39,'MONTERO V73WLRXVR','1',NULL),(1097,39,'OUTLANDER','1',NULL),(1098,39,'OUTLANDER 2.4L FABRIC','1',NULL),(1099,39,'OUTLANDER PHEV','1',NULL),(1100,39,'P27V','1',NULL),(1101,39,'PAJERO','1',NULL),(1102,39,'PAJERO 10','1',NULL),(1103,39,'PO5V','1',NULL),(1104,39,'PRECIS','1',NULL),(1105,39,'PV 25V','1',NULL),(1106,39,'R-CB3A','1',NULL),(1107,39,'RVR','1',NULL),(1108,39,'S-P15V','1',NULL),(1109,39,'SPACE','1',NULL),(1110,39,'SPORT GEAR','1',NULL),(1111,39,'STARION','1',NULL),(1112,39,'STRADA','1',NULL),(1113,39,'STRADA-DOUBLE CAB','1',NULL),(1114,39,'TOWNY','1',NULL),(1115,39,'TREDIA','1',NULL),(1116,39,'TROJAN','1',NULL),(1117,39,'VERADA','1',NULL),(1118,39,'WAGON','1',NULL),(1119,40,'MAS5','1',NULL),(1120,40,'MINI','1',NULL),(1121,41,'200 SX','1',NULL),(1122,41,'2000','1',NULL),(1123,41,'210','1',NULL),(1124,41,'240 SX','1',NULL),(1125,41,'280','1',NULL),(1126,41,'2WD D-CAB','1',NULL),(1127,41,'300 ZX','1',NULL),(1128,41,'350Z','1',NULL),(1129,41,'4-SP4F23','1',NULL),(1130,41,'4WD/DCAB','1',NULL),(1131,41,'AD WAGON','1',NULL),(1132,41,'ADF-SKF2VN','1',NULL),(1133,41,'ADF-VWE25-CARAVAN','1',NULL),(1134,41,'ALTIMA','1',NULL),(1135,41,'ARMADA','1',NULL),(1136,41,'ATLAS','1',NULL),(1137,41,'AVENIER','1',NULL),(1138,41,'AXXESS','1',NULL),(1139,41,'AZE0','1',NULL),(1140,41,'B12','1',NULL),(1141,41,'B14 SUNNY','1',NULL),(1142,41,'BCAB13','1',NULL),(1143,41,'BLUE BIRD','1',NULL),(1144,41,'BMD21','1',NULL),(1145,41,'CARAVAN','1',NULL),(1146,41,'CARAVAN 4LL','1',NULL),(1147,41,'CARAVAN ADF-VWE25','1',NULL),(1148,41,'CARAVAN DX VWE25','1',NULL),(1149,41,'CARAVEN 4LL','1',NULL),(1150,41,'CEDRIC','1',NULL),(1151,41,'CEFIFO','1',NULL),(1152,41,'CEFIRO','1',NULL),(1153,41,'CENRO','1',NULL),(1154,41,'CERENA','1',NULL),(1155,41,'CLIPPER','1',NULL),(1156,41,'CRGE24','1',NULL),(1157,41,'CUBE','1',NULL),(1158,41,'D/CAB','1',NULL),(1159,41,'DAA HT52X TRAIL','1',NULL),(1160,41,'DAA-HT32 X TRAIL','1',NULL),(1161,41,'DBA J10','1',NULL),(1162,41,'DBA-AK12','1',NULL),(1163,41,'DBA-C25','1',NULL),(1164,41,'DBA-G11 BLUE BIRD','1',NULL),(1165,41,'DBA-K13','1',NULL),(1166,41,'DBA-NT31','1',NULL),(1167,41,'DBA-SC11','1',NULL),(1168,41,'DBA-SC11-TIIDA LATIO','1',NULL),(1169,41,'DBA-TB17','1',NULL),(1170,41,'DBA-Y12 WINGROAD','1',NULL),(1171,41,'DBA-YE15 JUKE','1',NULL),(1172,41,'DBAE11','1',NULL),(1173,41,'DBAG11','1',NULL),(1174,41,'DBAHC24S','1',NULL),(1175,41,'DBANT32TRAIL','1',NULL),(1176,41,'DBE-VAY12 AD','1',NULL),(1177,41,'E-RIO','1',NULL),(1178,41,'E-WFB12','1',NULL),(1179,41,'EDRIK','1',NULL),(1180,41,'EU14','1',NULL),(1181,41,'FAIRLADY','1',NULL),(1182,41,'FB 13','1',NULL),(1183,41,'FB-14','1',NULL),(1184,41,'FB-15','1',NULL),(1185,41,'FG10','1',NULL),(1186,41,'GC-SK82VN','1',NULL),(1187,41,'GCPD22AX','1',NULL),(1188,41,'GE SK82VN','1',NULL),(1189,41,'GE-VPE25','1',NULL),(1190,41,'GE-VPGE24','1',NULL),(1191,41,'GF-A33','1',NULL),(1192,41,'GF-FB15','1',NULL),(1193,41,'GF-FN15','1',NULL),(1194,41,'GFWFY11','1',NULL),(1195,41,'GG-VFY11','1',NULL),(1196,41,'GGVFY11','1',NULL),(1197,41,'GH-AK11','1',NULL),(1198,41,'GH-K11','1',NULL),(1199,41,'GHAZ10','1',NULL),(1200,41,'GJ-VFY11','1',NULL),(1201,41,'GLORIA','1',NULL),(1202,41,'GS-B15','1',NULL),(1203,41,'H4F23','1',NULL),(1204,41,'HATCH BACK HN12','1',NULL),(1205,41,'HC34','1',NULL),(1206,41,'HOMY','1',NULL),(1207,41,'JUKE','1',NULL),(1208,41,'K-TRAIL 25A','1',NULL),(1209,41,'KING CAB PICKUP','1',NULL),(1210,41,'KRGE24','1',NULL),(1211,41,'LARGO','1',NULL),(1212,41,'LAUREL','1',NULL),(1213,41,'LDF-DW4E16','1',NULL),(1214,41,'LDF-DW4E26','1',NULL),(1215,41,'LDF-VW2E26','1',NULL),(1216,41,'LPHY','1',NULL),(1217,41,'LUCINO','1',NULL),(1218,41,'MARCH','1',NULL),(1219,41,'MARCH AK12','1',NULL),(1220,41,'MARCH K11','1',NULL),(1221,41,'MAXIMA','1',NULL),(1222,41,'MICRA AUTO','1',NULL),(1223,41,'MOCO','1',NULL),(1224,41,'MURANO','1',NULL),(1225,41,'N16','1',NULL),(1226,41,'NAVARA','1',NULL),(1227,41,'NV 330 URVAN','1',NULL),(1228,41,'NV100 CLIPPER','1',NULL),(1229,41,'NV200VANNETTE','1',NULL),(1230,41,'NX','1',NULL),(1231,41,'OC-3K82VM','1',NULL),(1232,41,'PETROL','1',NULL),(1233,41,'PREMERA','1',NULL),(1234,41,'PRESIA','1',NULL),(1235,41,'PRIMASTAR','1',NULL),(1236,41,'PULSAR','1',NULL),(1237,41,'QG18','1',NULL),(1238,41,'ROGUE','1',NULL),(1239,41,'RVY10','1',NULL),(1240,41,'SB13','1',NULL),(1241,41,'SB14','1',NULL),(1242,41,'SEDAN','1',NULL),(1243,41,'SEFIRO','1',NULL),(1244,41,'SENTRA','1',NULL),(1245,41,'SERENA','1',NULL),(1246,41,'SILPHY','1',NULL),(1247,41,'SILVER','1',NULL),(1248,41,'SK22VN','1',NULL),(1249,41,'SKYLINE','1',NULL),(1250,41,'SS28VN','1',NULL),(1251,41,'STANZA','1',NULL),(1252,41,'SU13','1',NULL),(1253,41,'SU14','1',NULL),(1254,41,'SUNNY','1',NULL),(1255,41,'SUNNY 1.6 A','1',NULL),(1256,41,'SUNNY EX SALOON','1',NULL),(1257,41,'SUNNY SUPER SALLON','1',NULL),(1258,41,'SUNNY1.6EXA','1',NULL),(1259,41,'SVUJC22','1',NULL),(1260,41,'SYLPHY UA.SG10','1',NULL),(1261,41,'SYLPHY-TA-FG10','1',NULL),(1262,41,'TA-FB15','1',NULL),(1263,41,'TA-NT30','1',NULL),(1264,41,'TA-QGE25','1',NULL),(1265,41,'TA-TP12','1',NULL),(1266,41,'TA-TP12 PREMERA','1',NULL),(1267,41,'TA-WFY11','1',NULL),(1268,41,'TEANA','1',NULL),(1269,41,'TIIDA','1',NULL),(1270,41,'U -VRGE24','1',NULL),(1271,41,'U-CM89ASD','1',NULL),(1272,41,'URVAN','1',NULL),(1273,41,'UVRGE24','1',NULL),(1274,41,'VANETTE','1',NULL),(1275,41,'VARAVAN','1',NULL),(1276,41,'VB11','1',NULL),(1277,41,'VEC120','1',NULL),(1278,41,'WINGROAD','1',NULL),(1279,41,'X TRAIL','1',NULL),(1280,41,'X-TRAIL JEEP','1',NULL),(1281,41,'XTERRA','1',NULL),(1282,41,'YU41H4','1',NULL),(1283,42,'98','1',NULL),(1284,42,'ACHIEVA','1',NULL),(1285,42,'ALERO','1',NULL),(1286,42,'AURORA','1',NULL),(1287,42,'CALAIS','1',NULL),(1288,42,'CUTLASS','1',NULL),(1289,42,'DELTA 88','1',NULL),(1290,42,'FIRENZA','1',NULL),(1291,42,'INTRIGUE','1',NULL),(1292,42,'ROYALE','1',NULL),(1293,42,'TORONADO','1',NULL),(1294,43,'ASTRA 1.7DR','1',NULL),(1295,43,'ASTRA1.4SE','1',NULL),(1296,43,'WOL00056T8122633','1',NULL),(1297,44,'AFRGEZ','1',NULL),(1298,44,'AHAHIXG','1',NULL),(1299,44,'AXIA','1',NULL),(1300,44,'G1GZ-AXIA','1',NULL),(1301,44,'KANCIL','1',NULL),(1302,44,'KELISA','1',NULL),(1303,44,'KELISA AHIZG','1',NULL),(1304,44,'KELISA GX M','1',NULL),(1305,44,'KENARI','1',NULL),(1306,44,'M8EX VIVA','1',NULL),(1307,44,'MIEZ VIVA','1',NULL),(1308,44,'RENARI','1',NULL),(1309,44,'VIVA','1',NULL),(1310,44,'VIVA ELITE','1',NULL),(1311,44,'VIVA ELITE AMIEZO','1',NULL),(1312,44,'VIVA ELITE AMIEZT','1',NULL),(1313,44,'VIVA ELITE AMIZHG','1',NULL),(1314,44,'VIVA ELITE-AMIGXT','1',NULL),(1315,44,'VIVA-ELITEAMIEZR','1',NULL),(1316,45,'206','1',NULL),(1317,45,'3008','1',NULL),(1318,45,'306','1',NULL),(1319,45,'306XR','1',NULL),(1320,45,'307','1',NULL),(1321,45,'308','1',NULL),(1322,45,'405','1',NULL),(1323,45,'406','1',NULL),(1324,45,'406 LX','1',NULL),(1325,45,'407','1',NULL),(1326,45,'504','1',NULL),(1327,45,'505','1',NULL),(1328,45,'508','1',NULL),(1329,45,'604','1',NULL),(1330,45,'605','1',NULL),(1331,45,'607','1',NULL),(1332,45,'YC06','1',NULL),(1333,46,'ACCLAIM','1',NULL),(1334,46,'ARROW PICKUP','1',NULL),(1335,46,'BREEZE','1',NULL),(1336,46,'CARAVELLE','1',NULL),(1337,46,'CHAMP','1',NULL),(1338,46,'COLT VISTA','1',NULL),(1339,46,'HORIZON','1',NULL),(1340,46,'LASER','1',NULL),(1341,46,'NEON','1',NULL),(1342,46,'RELIANT','1',NULL),(1343,46,'SAPPORO','1',NULL),(1344,46,'SCAMP','1',NULL),(1345,46,'SUNDANCE','1',NULL),(1346,47,'6000 LE','1',NULL),(1347,47,'AZTEK','1',NULL),(1348,47,'BONNEVILLE','1',NULL),(1349,47,'CATALINA','1',NULL),(1350,47,'FIERO','1',NULL),(1351,47,'FIREBIRD','1',NULL),(1352,47,'G6','1',NULL),(1353,47,'GRAND AM','1',NULL),(1354,47,'GRAND PRIX','1',NULL),(1355,47,'LEMANS','1',NULL),(1356,47,'MONTANA','1',NULL),(1357,47,'PARISIENNE','1',NULL),(1358,47,'SOLSTICE','1',NULL),(1359,47,'SUNBIRD','1',NULL),(1360,47,'SUNFIRE','1',NULL),(1361,47,'T1000','1',NULL),(1362,47,'TRANS SPORT','1',NULL),(1363,47,'VIBE','1',NULL),(1364,48,'BOXSTER','1',NULL),(1365,48,'CAYENEE-S','1',NULL),(1366,48,'CAYENNE S HYBRYD','1',NULL),(1367,48,'GF-99666','1',NULL),(1368,48,'PANAMERA SE','1',NULL),(1369,48,'RANAMERA','1',NULL),(1370,49,'GEN','1',NULL),(1371,49,'GEN-2','1',NULL),(1372,49,'OEN 2','1',NULL),(1373,49,'SALOON','1',NULL),(1374,49,'SATRIA NEO','1',NULL),(1375,49,'SAVV','1',NULL),(1376,49,'WAJA','1',NULL),(1377,49,'WAJA-CAMPRO','1',NULL),(1378,49,'WIRA','1',NULL),(1379,49,'WIRA 1','1',NULL),(1380,49,'WIRA 1.3GLI M','1',NULL),(1381,49,'WIRA 1.5 GLI M','1',NULL),(1382,50,'EVOQUE','1',NULL),(1383,51,'18','1',NULL),(1384,51,'420 DCI','1',NULL),(1385,51,'450','1',NULL),(1386,51,'450 DXI','1',NULL),(1387,51,'5','1',NULL),(1388,51,'ALLIANCE','1',NULL),(1389,51,'DXIPRIMEMOVER','1',NULL),(1390,51,'ENCORE','1',NULL),(1391,51,'FUEGO','1',NULL),(1392,51,'LAGUNA','1',NULL),(1393,51,'LE CAR','1',NULL),(1394,51,'MEDALLION','1',NULL),(1395,51,'MEGANE','1',NULL),(1396,51,'SPORTSWAGON','1',NULL),(1397,52,'9-2X','1',NULL),(1398,52,'900','1',NULL),(1399,52,'9000','1',NULL),(1400,53,'KORANDO','1',NULL),(1401,53,'MUSSO','1',NULL),(1402,53,'REXTON','1',NULL),(1403,53,'KYRON','1',NULL),(1404,54,'AURA','1',NULL),(1405,54,'ION','1',NULL),(1406,54,'L100','1',NULL),(1407,54,'L200','1',NULL),(1408,54,'LS2','1',NULL),(1409,54,'OUTLOOK','1',NULL),(1410,54,'RELAY','1',NULL),(1411,54,'SC1','1',NULL),(1412,54,'SC2','1',NULL),(1413,55,'BAJA','1',NULL),(1414,55,'GF','1',NULL),(1415,55,'GF-GC1','1',NULL),(1416,55,'GHGDB','1',NULL),(1417,55,'IMPREZA','1',NULL),(1418,55,'J10GL-SALOON','1',NULL),(1419,55,'J12','1',NULL),(1420,55,'JUSTY','1',NULL),(1421,55,'LA-GD2','1',NULL),(1422,55,'LE-TTI','1',NULL),(1423,55,'LE-TV1','1',NULL),(1424,55,'LEGACY','1',NULL),(1425,55,'LOYALE','1',NULL),(1426,55,'LRCED','1',NULL),(1427,55,'OUTBACK','1',NULL),(1428,55,'RC1','1',NULL),(1429,55,'SAMBAR','1',NULL),(1430,55,'SG5','1',NULL),(1431,55,'TRIBECA','1',NULL),(1432,55,'TT1','1',NULL),(1433,55,'TV1','1',NULL),(1434,55,'UA-RC1','1',NULL),(1435,55,'V-K83','1',NULL),(1436,55,'V-KV','1',NULL),(1437,55,'XT','1',NULL),(1438,56,'ABA-HA23S','1',NULL),(1439,56,'AERIO','1',NULL),(1440,56,'ALTO','1',NULL),(1441,56,'ALTO 800 LXI','1',NULL),(1442,56,'ALTO K10 VXI','1',NULL),(1443,56,'ALTO LXI','1',NULL),(1444,56,'ALTO LXI 800','1',NULL),(1445,56,'ALTO LXIB00','1',NULL),(1446,56,'ALTO VXI','1',NULL),(1447,56,'BACENO','1',NULL),(1448,56,'BALENO','1',NULL),(1449,56,'CARRY','1',NULL),(1450,56,'CBA-HA24S','1',NULL),(1451,56,'CBA-SA24S','1',NULL),(1452,56,'CBA-TD94WESCUDO','1',NULL),(1453,56,'CELERIO AMT','1',NULL),(1454,56,'CELERIO LXI','1',NULL),(1455,56,'CELERIO LXI MT','1',NULL),(1456,56,'CELERIO VXI AMT','1',NULL),(1457,56,'CELERIO ZXI','1',NULL),(1458,56,'CRUZE LA.HR51S','1',NULL),(1459,56,'CULTUS','1',NULL),(1460,56,'D1A-RB21S','1',NULL),(1461,56,'DA52V','1',NULL),(1462,56,'DAA-MH44S','1',NULL),(1463,56,'DAA-MH44S WAGON R','1',NULL),(1464,56,'DAA-MR41S','1',NULL),(1465,56,'DBA YC11S','1',NULL),(1466,56,'DBA-HA24S','1',NULL),(1467,56,'DBA-HA25S','1',NULL),(1468,56,'DBA-YA11S','1',NULL),(1469,56,'DBA-ZC118','1',NULL),(1470,56,'DBA-ZC11S','1',NULL),(1471,56,'DBA-ZC71S','1',NULL),(1472,56,'DBAZ0918','1',NULL),(1473,56,'E-AA34S','1',NULL),(1474,56,'E-TDOIW','1',NULL),(1475,56,'EBD-DA63T','1',NULL),(1476,56,'EBD-DA63T CARRY','1',NULL),(1477,56,'EBD-DA64V','1',NULL),(1478,56,'EBD-DA64V EVERY','1',NULL),(1479,56,'EN-125','1',NULL),(1480,56,'ERTIGA-ZXI','1',NULL),(1481,56,'ESCUDO','1',NULL),(1482,56,'EVERY','1',NULL),(1483,56,'FORENZA','1',NULL),(1484,56,'FREEZER TRUCK','1',NULL),(1485,56,'G10','1',NULL),(1486,56,'GBD-DA64V','1',NULL),(1487,56,'GBDHAZ4V','1',NULL),(1488,56,'GD-BA52V','1',NULL),(1489,56,'GD-DA52T','1',NULL),(1490,56,'GD-DA52T-TRUCK','1',NULL),(1491,56,'GD-DA52V','1',NULL),(1492,56,'GD-DA57V','1',NULL),(1493,56,'GD-DB52V','1',NULL),(1494,56,'GF-GC215','1',NULL),(1495,56,'GIXXER-GSX150','1',NULL),(1496,56,'GN 125H','1',NULL),(1497,56,'GN125','1',NULL),(1498,56,'GRAND ESCUDO','1',NULL),(1499,56,'GRAND VITARA','1',NULL),(1500,56,'GRAND VITARA XL-7','1',NULL),(1501,56,'GS-125','1',NULL),(1502,56,'HA238','1',NULL),(1503,56,'HALF BODY TRUCK','1',NULL),(1504,56,'HBD-DA17V','1',NULL),(1505,56,'HBD-DA64V','1',NULL),(1506,56,'HBD-DA64V EVERY','1',NULL),(1507,56,'HJ-125K','1',NULL),(1508,56,'IGNI51.3AT','1',NULL),(1509,56,'IGNIS','1',NULL),(1510,56,'JA-HT51S','1',NULL),(1511,56,'JA-RA21S','1',NULL),(1512,56,'JARA21S','1',NULL),(1513,56,'JIMNY','1',NULL),(1514,56,'K10','1',NULL),(1515,56,'KBD DA64V','1',NULL),(1516,56,'KC-FRR33L4','1',NULL),(1517,56,'KEI','1',NULL),(1518,56,'KIZASHI','1',NULL),(1519,56,'LA-HA23S','1',NULL),(1520,56,'LA-HT51S','1',NULL),(1521,56,'LA-MA34S','1',NULL),(1522,56,'LA-MA64S','1',NULL),(1523,56,'LA-RB21S','1',NULL),(1524,56,'LA-TD62W','1',NULL),(1525,56,'LAHA238','1',NULL),(1526,56,'LARA21S','1',NULL),(1527,56,'LATX92W','1',NULL),(1528,56,'LE-DA62V','1',NULL),(1529,56,'LE-DA63T','1',NULL),(1530,56,'LEDA62T','1',NULL),(1531,56,'LET\'110','1',NULL),(1532,56,'LET\'S100','1',NULL),(1533,56,'LIANA','1',NULL),(1534,56,'MARUTI ALTO','1',NULL),(1535,56,'MARUTI ALTO 800 LXI (SPORTZ)','1',NULL),(1536,56,'PBA-SA24S','1',NULL),(1537,56,'QN 125H','1',NULL),(1538,56,'RA21S','1',NULL),(1539,56,'RENO','1',NULL),(1540,56,'SAMURAI','1',NULL),(1541,56,'SH42A','1',NULL),(1542,56,'SIDEKICK','1',NULL),(1543,56,'SJ413VX JEEP','1',NULL),(1544,56,'SPLASH','1',NULL),(1545,56,'SX4','1',NULL),(1546,56,'SX4 1.6VVT','1',NULL),(1547,56,'SX4 VVT','1',NULL),(1548,56,'TA-HN22S','1',NULL),(1549,56,'TA-HT81S','1',NULL),(1550,56,'TA-MC225','1',NULL),(1551,56,'TA01V','1',NULL),(1552,56,'TIANA','1',NULL),(1553,56,'TL52W','1',NULL),(1554,56,'UA- H','1',NULL),(1555,56,'UA-HN22S','1',NULL),(1556,56,'UA-HT01S','1',NULL),(1557,56,'UA-HT517','1',NULL),(1558,56,'UA-HT518','1',NULL),(1559,56,'UA-HT51S','1',NULL),(1560,56,'UA-MC22S','1',NULL),(1561,56,'VDE51V','1',NULL),(1562,56,'VERONA','1',NULL),(1563,56,'VITARA','1',NULL),(1564,56,'VOLTY','1',NULL),(1565,56,'XL-7','1',NULL),(1566,56,'ZEN ESTILO','1',NULL),(1567,57,'INDICA','1',NULL),(1568,57,'INDICA LXI','1',NULL),(1569,57,'INDICA VISTA AURA','1',NULL),(1570,57,'INDICA XETA','1',NULL),(1571,57,'INDIGO','1',NULL),(1572,57,'INDIGO -CS','1',NULL),(1573,57,'INDIGO ECS','1',NULL),(1574,57,'INDIGO GLX','1',NULL),(1575,57,'INDIGO MARINA','1',NULL),(1576,57,'INDIKA','1',NULL),(1577,57,'INDIKA LXI','1',NULL),(1578,57,'NANO','1',NULL),(1579,57,'NANO TWIST','1',NULL),(1580,57,'NANO TWIST XT','1',NULL),(1581,57,'SAFARI EX','1',NULL),(1582,57,'SE 1613','1',NULL),(1583,57,'SFC407','1',NULL),(1584,57,'SIERRA','1',NULL),(1585,57,'SINGLE CAB','1',NULL),(1586,57,'XENON','1',NULL),(1587,57,'XENON 3OL','1',NULL),(1588,57,'XENON LIGHT TRUCK','1',NULL),(1589,57,'XETA-GLX','1',NULL),(1590,3,'VITZ','1',NULL),(1591,3,'110','1',NULL),(1592,3,'1210FE','1',NULL),(1593,3,'15 SCATER','1',NULL),(1594,3,'1ST','1',NULL),(1595,3,'4RUNNER','1',NULL),(1596,3,'AA60','1',NULL),(1597,3,'ABFS402M','1',NULL),(1598,3,'ACE','1',NULL),(1599,3,'ADF-KDH201V','1',NULL),(1600,3,'ADF-KDH206V','1',NULL),(1601,3,'ADF-KDH211K','1',NULL),(1602,3,'ADF-KDH221K','1',NULL),(1603,3,'ADF-KDH223B','1',NULL),(1604,3,'ADF-KSH211K','1',NULL),(1605,3,'ADS-KDH221K','1',NULL),(1606,3,'AE100','1',NULL),(1607,3,'AE101','1',NULL),(1608,3,'AE110','1',NULL),(1609,3,'AE111','1',NULL),(1610,3,'ALLEX','1',NULL),(1611,3,'ALLION','1',NULL),(1612,3,'ALLION CBA-NZT240','1',NULL),(1613,3,'ALPHARD','1',NULL),(1614,3,'ALTEZZA','1',NULL),(1615,3,'ANGOGO','1',NULL),(1616,3,'ANGOGO-TANCP20','1',NULL),(1617,3,'AQUA','1',NULL),(1618,3,'AT150','1',NULL),(1619,3,'AT170-CORONA','1',NULL),(1620,3,'AT192','1',NULL),(1621,3,'AVALON','1',NULL),(1622,3,'AVANZA','1',NULL),(1623,3,'AXIO','1',NULL),(1624,3,'AXIO DAA-NKE165','1',NULL),(1625,3,'AXIO HYBRID','1',NULL),(1626,3,'BELTA','1',NULL),(1627,3,'BJ40RV KV','1',NULL),(1628,3,'BJ43','1',NULL),(1629,3,'BU212','1',NULL),(1630,3,'BU66','1',NULL),(1631,3,'BU67','1',NULL),(1632,3,'BU82 OPEN','1',NULL),(1633,3,'BU88','1',NULL),(1634,3,'C V','1',NULL),(1635,3,'C/SPACIO','1',NULL),(1636,3,'CAB-UR1200W 200','1',NULL),(1637,3,'CALDINA','1',NULL),(1638,3,'CAMI-JEEP','1',NULL),(1639,3,'CAMRY','1',NULL),(1640,3,'CAMRY SOLARA','1',NULL),(1641,3,'CAMY GF-J102E','1',NULL),(1642,3,'CAREENA','1',NULL),(1643,3,'CARINA','1',NULL),(1644,3,'CBA TR1120UU PRADO','1',NULL),(1645,3,'CBA-ACU30W','1',NULL),(1646,3,'CBA-J200E','1',NULL),(1647,3,'CBA-J210E','1',NULL),(1648,3,'CBA-NCP60 IST','1',NULL),(1649,3,'CBA-NCP70 WILL CYPHA','1',NULL),(1650,3,'CBA-NZE121','1',NULL),(1651,3,'CBA-NZT240','1',NULL),(1652,3,'CBA-NZT240-ALLION','1',NULL),(1653,3,'CBA-SCP11','1',NULL),(1654,3,'CBA-TRI120W PRADO','1',NULL),(1655,3,'CBA-TRJ120W','1',NULL),(1656,3,'CBA-TRJ140W-PRADO','1',NULL),(1657,3,'CBA-TRJ150W PRADO','1',NULL),(1658,3,'CBA-TRJ150W PRADO','1',NULL),(1659,3,'CBA-TRJ150W-TX','1',NULL),(1660,3,'CBA-UR1200W 200','1',NULL),(1661,3,'CBA-UR1202W 200','1',NULL),(1662,3,'CBA-URJ202W','1',NULL),(1663,3,'CBA-UZJ200W','1',NULL),(1664,3,'CBATRJ150W','1',NULL),(1665,3,'CBF','1',NULL),(1666,3,'CBF-TRH200V','1',NULL),(1667,3,'CBF-TRH200V HIACE','1',NULL),(1668,3,'CDBA-NZE121','1',NULL),(1669,3,'CE100','1',NULL),(1670,3,'CE106','1',NULL),(1671,3,'CE110','1',NULL),(1672,3,'CE110R','1',NULL),(1673,3,'CELICA','1',NULL),(1674,3,'CHERY QQ','1',NULL),(1675,3,'CM35','1',NULL),(1676,3,'CM36','1',NULL),(1677,3,'CM51','1',NULL),(1678,3,'CM56','1',NULL),(1679,3,'CM70','1',NULL),(1680,3,'COASTER','1',NULL),(1681,3,'COMMUTOR','1',NULL),(1682,3,'COROLLA','1',NULL),(1683,3,'COROLLA - KE72','1',NULL),(1684,3,'COROLLA - KE74V','1',NULL),(1685,3,'COROLLA 161','1',NULL),(1686,3,'COROLLA AXIO','1',NULL),(1687,3,'COROLLA TANZE121','1',NULL),(1688,3,'CORONA','1',NULL),(1689,3,'CORSA','1',NULL),(1690,3,'CR27','1',NULL),(1691,3,'CR27V','1',NULL),(1692,3,'CR36','1',NULL),(1693,3,'CR36V','1',NULL),(1694,3,'CR37','1',NULL),(1695,3,'CR41','1',NULL),(1696,3,'CR42','1',NULL),(1697,3,'CRESSIDA','1',NULL),(1698,3,'CREW CAB','1',NULL),(1699,3,'CROWN','1',NULL),(1700,3,'CROWN DELUXE','1',NULL),(1701,3,'CRZ','1',NULL),(1702,3,'CT170','1',NULL),(1703,3,'CT190','1',NULL),(1704,3,'CXR20G','1',NULL),(1705,3,'CYGNUS-GH-UZJ100W','1',NULL),(1706,3,'CYNOS','1',NULL),(1707,3,'DA-KR42V','1',NULL),(1708,3,'DAA-AWS210','1',NULL),(1709,3,'DAA-NHP10','1',NULL),(1710,3,'DAA-NHP10-AQUA','1',NULL),(1711,3,'DAA-NHW20','1',NULL),(1712,3,'DAA-NKE165','1',NULL),(1713,3,'DAA-NKE165 AXIO','1',NULL),(1714,3,'DAA-NKE165G COROLLA','1',NULL),(1715,3,'DAA-NKE165GFIELDER','1',NULL),(1716,3,'DAA-NZT260','1',NULL),(1717,3,'DAA-ZVW20','1',NULL),(1718,3,'DAA-ZVW30','1',NULL),(1719,3,'DAA-ZVW30 PRIUS','1',NULL),(1720,3,'DAA-ZVW40W','1',NULL),(1721,3,'DAA-ZWR80G','1',NULL),(1722,3,'DAA-ZWR80G ESQUIRE','1',NULL),(1723,3,'DAA-ZWR80G VOXY','1',NULL),(1724,3,'DAANHP10','1',NULL),(1725,3,'DBA NCP110','1',NULL),(1726,3,'DBA SCP90','1',NULL),(1727,3,'DBA SCP92','1',NULL),(1728,3,'DBA ZRT260','1',NULL),(1729,3,'DBA ZZT240','1',NULL),(1730,3,'DBA-ACA21W','1',NULL),(1731,3,'DBA-ACA36W','1',NULL),(1732,3,'DBA-ACA36W RAV4','1',NULL),(1733,3,'DBA-ACA38W BANGUARD','1',NULL),(1734,3,'DBA-K3P92','1',NULL),(1735,3,'DBA-KGC10','1',NULL),(1736,3,'DBA-KGC10 PASSO','1',NULL),(1737,3,'DBA-KGC30','1',NULL),(1738,3,'DBA-KSP130','1',NULL),(1739,3,'DBA-KSP130 VTZ','1',NULL),(1740,3,'DBA-KSP90','1',NULL),(1741,3,'DBA-KSP90 VITZ','1',NULL),(1742,3,'DBA-KSP92','1',NULL),(1743,3,'DBA-MCP110','1',NULL),(1744,3,'DBA-NCP60','1',NULL),(1745,3,'DBA-NSP130','1',NULL),(1746,3,'DBA-NZE-161','1',NULL),(1747,3,'DBA-NZE141','1',NULL),(1748,3,'DBA-NZE141 AXIO','1',NULL),(1749,3,'DBA-NZE141 COROLLA','1',NULL),(1750,3,'DBA-NZE141G FIELDER','1',NULL),(1751,3,'DBA-NZE144','1',NULL),(1752,3,'DBA-NZE260','1',NULL),(1753,3,'DBA-NZT-260','1',NULL),(1754,3,'DBA-NZT260','1',NULL),(1755,3,'DBA-NZT260 ALLION','1',NULL),(1756,3,'DBA-NZT260 PREMIO','1',NULL),(1757,3,'DBA-NZT260 PREMIO G SUPERIOR','1',NULL),(1758,3,'DBA-SCP 100','1',NULL),(1759,3,'DBA-SCP100','1',NULL),(1760,3,'DBA-SCP100 RACTIS','1',NULL),(1761,3,'DBA-SCP90','1',NULL),(1762,3,'DBA-SCP90 VITZ','1',NULL),(1763,3,'DBA-SCP92','1',NULL),(1764,3,'DBA-SCP92 BELTA','1',NULL),(1765,3,'DBA-ZSU60W HARRIER','1',NULL),(1766,3,'DBAKGC10','1',NULL),(1767,3,'DBAKOC10','1',NULL),(1768,3,'DBANCP110','1',NULL),(1769,3,'DBANGC30','1',NULL),(1770,3,'DBANZT260','1',NULL),(1771,3,'DBASCP90 VITZ','1',NULL),(1772,3,'DBASCP92','1',NULL),(1773,3,'DEA-FCP97','1',NULL),(1774,3,'DEA-KSP90','1',NULL),(1775,3,'DEVIN','1',NULL),(1776,3,'DHA NZE141','1',NULL),(1777,3,'DJ40RVKV','1',NULL),(1778,3,'DLA-ZBW35','1',NULL),(1779,3,'DLA-ZvW35','1',NULL),(1780,3,'DOUBLE CAB','1',NULL),(1781,3,'DUET','1',NULL),(1782,3,'DUMP TRUCK','1',NULL),(1783,3,'DYNA','1',NULL),(1784,3,'DYNA-HALF BODY','1',NULL),(1785,3,'E-AE100','1',NULL),(1786,3,'E-AE110','1',NULL),(1787,3,'E-AE91','1',NULL),(1788,3,'E-AT130','1',NULL),(1789,3,'E-AT170','1',NULL),(1790,3,'E-AT192','1',NULL),(1791,3,'E-AT211','1',NULL),(1792,3,'E-EE101','1',NULL),(1793,3,'E-EE111','1',NULL),(1794,3,'E-EE90-CLOSED','1',NULL),(1795,3,'E-EL30','1',NULL),(1796,3,'E-EL41','1',NULL),(1797,3,'E-EL51','1',NULL),(1798,3,'E-EP82','1',NULL),(1799,3,'E-EP82-STARLET','1',NULL),(1800,3,'ECHO','1',NULL),(1801,3,'EE 101','1',NULL),(1802,3,'EE08V','1',NULL),(1803,3,'EE100R','1',NULL),(1804,3,'EE104','1',NULL),(1805,3,'EE110R-AEMNS','1',NULL),(1806,3,'EE96V-CLOSED','1',NULL),(1807,3,'EF-111','1',NULL),(1808,3,'EL41','1',NULL),(1809,3,'EL50 R TERCEL','1',NULL),(1810,3,'EL50R-AEMDS','1',NULL),(1811,3,'EL51','1',NULL),(1812,3,'EP71-STARLET','1',NULL),(1813,3,'EP82','1',NULL),(1814,3,'EP91','1',NULL),(1815,3,'ET196','1',NULL),(1816,3,'EX210','1',NULL),(1817,3,'EXZ10','1',NULL),(1818,3,'FIELDER','1',NULL),(1819,3,'FJ CRUISER','1',NULL),(1820,3,'FORTUNE','1',NULL),(1821,3,'FORTUNER','1',NULL),(1822,3,'FREEZER','1',NULL),(1823,3,'G-TOURING','1',NULL),(1824,3,'GA-KR41V','1',NULL),(1825,3,'GA-KR42V','1',NULL),(1826,3,'GC-KR42V','1',NULL),(1827,3,'GE RZH102V','1',NULL),(1828,3,'GE-RZH112V','1',NULL),(1829,3,'GE-RZH183K','1',NULL),(1830,3,'GF-AT210','1',NULL),(1831,3,'GF-AT212','1',NULL),(1832,3,'GF-EE111','1',NULL),(1833,3,'GF-J100E','1',NULL),(1834,3,'GF-J122E','1',NULL),(1835,3,'GF-JT211','1',NULL),(1836,3,'GF-M100A','1',NULL),(1837,3,'GF-SCP10','1',NULL),(1838,3,'GF-UZJ100W','1',NULL),(1839,3,'GFSXU10W','1',NULL),(1840,3,'GG-EE102V','1',NULL),(1841,3,'GG-EE103V','1',NULL),(1842,3,'GH-SCP10','1',NULL),(1843,3,'GHNCP12','1',NULL),(1844,3,'GK-KR42V','1',NULL),(1845,3,'GK-KR42V TOWN ACE','1',NULL),(1846,3,'GK-KR52V','1',NULL),(1847,3,'GKKM70','1',NULL),(1848,3,'GR-JZX100','1',NULL),(1849,3,'GRAND MARK','1',NULL),(1850,3,'GT86','1',NULL),(1851,3,'GX-100','1',NULL),(1852,3,'H113V','1',NULL),(1853,3,'HARRIER','1',NULL),(1854,3,'HARRIER AUTO','1',NULL),(1855,3,'HDB31','1',NULL),(1856,3,'HDJ100R-GNMEX','1',NULL),(1857,3,'HIACE','1',NULL),(1858,3,'HIACE KDH SUPER GL','1',NULL),(1859,3,'HIACE KOH222R','1',NULL),(1860,3,'HIGHLANDER','1',NULL),(1861,3,'HILUX','1',NULL),(1862,3,'HILUX 4WD','1',NULL),(1863,3,'HILUX DLX','1',NULL),(1864,3,'HILUX HL2','1',NULL),(1865,3,'HILUX VIGO','1',NULL),(1866,3,'HILUX VIGO 2.5E','1',NULL),(1867,3,'HILUX VIGO CHAMP','1',NULL),(1868,3,'HYBRID','1',NULL),(1869,3,'HZJ78','1',NULL),(1870,3,'INVINCIBLE','1',NULL),(1871,3,'IST','1',NULL),(1872,3,'JEEP','1',NULL),(1873,3,'JF-AT212','1',NULL),(1874,3,'JTDBW','1',NULL),(1875,3,'JTF55','1',NULL),(1876,3,'KA67V','1',NULL),(1877,3,'KB-CR27V','1',NULL),(1878,3,'KB-CR36V','1',NULL),(1879,3,'KB-CR51V','1',NULL),(1880,3,'KBCM55','1',NULL),(1881,3,'KBCR41V','1',NULL),(1882,3,'KC-FB4JGAT','1',NULL),(1883,3,'KC-LH113V','1',NULL),(1884,3,'KC-LH119V','1',NULL),(1885,3,'KC-LY101','1',NULL),(1886,3,'KC-LY161','1',NULL),(1887,3,'KCBU2121','1',NULL),(1888,3,'KCLH162V','1',NULL),(1889,3,'KD-CT210','1',NULL),(1890,3,'KDH 201V','1',NULL),(1891,3,'KDH-201','1',NULL),(1892,3,'KDH200','1',NULL),(1893,3,'KDH221K','1',NULL),(1894,3,'KDH222R','1',NULL),(1895,3,'KDH223','1',NULL),(1896,3,'KE 72 V','1',NULL),(1897,3,'KF-CM75','1',NULL),(1898,3,'KF-CM80','1',NULL),(1899,3,'KF-CM85','1',NULL),(1900,3,'KF-CR42V','1',NULL),(1901,3,'KG LY132','1',NULL),(1902,3,'KG-L','1',NULL),(1903,3,'KG-LH168V','1',NULL),(1904,3,'KG-LH172K','1',NULL),(1905,3,'KG-LH172V','1',NULL),(1906,3,'KG-LH182K','1',NULL),(1907,3,'KG-LH184B','1',NULL),(1908,3,'KG-LXH43V','1',NULL),(1909,3,'KG-LY202 DYNA','1',NULL),(1910,3,'KG-LY220','1',NULL),(1911,3,'KG-LY230','1',NULL),(1912,3,'KGLH162V','1',NULL),(1913,3,'KGLY230','1',NULL),(1914,3,'KJCM70','1',NULL),(1915,3,'KJCR42V','1',NULL),(1916,3,'KK-LY230','1',NULL),(1917,3,'KK-LY280','1',NULL),(1918,3,'KK-XZU306','1',NULL),(1919,3,'KK-XZU347','1',NULL),(1920,3,'KK-XZU507','1',NULL),(1921,3,'KLUGER','1',NULL),(1922,3,'KR-DDY220 TOYOACE','1',NULL),(1923,3,'KR-KDH200 HIACE','1',NULL),(1924,3,'KR-KDH200K','1',NULL),(1925,3,'KR-KDH200V','1',NULL),(1926,3,'KR-KDH200V HIACE','1',NULL),(1927,3,'KR-KDH200VSUPERGL','1',NULL),(1928,3,'KR-KDH205V','1',NULL),(1929,3,'KR-KDH220K','1',NULL),(1930,3,'KR-KDH222B','1',NULL),(1931,3,'KR-KDY230','1',NULL),(1932,3,'KR41V','1',NULL),(1933,3,'KR42','1',NULL),(1934,3,'KRKDH220KHIACE','1',NULL),(1935,3,'KZH120','1',NULL),(1936,3,'KZJ70','1',NULL),(1937,3,'KZJ85','1',NULL),(1938,3,'L.EE101BOX','1',NULL),(1939,3,'LAND CRUISER','1',NULL),(1940,3,'LAND CRUISER PRADO','1',NULL),(1941,3,'LAND CRUISER PRADO CBA-TRJ150W','1',NULL),(1942,3,'LDF','1',NULL),(1943,3,'LDF-KDH201V','1',NULL),(1944,3,'LDF-KDH201V HIACE','1',NULL),(1945,3,'LDF-KDH221K HIACE','1',NULL),(1946,3,'LDF-KDH223B','1',NULL),(1947,3,'LDS-KDH221K HIACE','1',NULL),(1948,3,'LEXESS','1',NULL),(1949,3,'LH 109','1',NULL),(1950,3,'LH 202 R','1',NULL),(1951,3,'LH102','1',NULL),(1952,3,'LH103','1',NULL),(1953,3,'LH110','1',NULL),(1954,3,'LH112','1',NULL),(1955,3,'LH113','1',NULL),(1956,3,'LH119','1',NULL),(1957,3,'LH120','1',NULL),(1958,3,'LH123','1',NULL),(1959,3,'LH125','1',NULL),(1960,3,'LH130','1',NULL),(1961,3,'LH186','1',NULL),(1962,3,'LH200R-RMBDE','1',NULL),(1963,3,'LH50','1',NULL),(1964,3,'LH51V','1',NULL),(1965,3,'LH60VV','1',NULL),(1966,3,'LH61V','1',NULL),(1967,3,'LITE ACE','1',NULL),(1968,3,'LITE ACE GL','1',NULL),(1969,3,'LJ70 RV KR','1',NULL),(1970,3,'LJ95','1',NULL),(1971,3,'LN106','1',NULL),(1972,3,'LN107','1',NULL),(1973,3,'LN109','1',NULL),(1974,3,'LN145R','1',NULL),(1975,3,'LN65','1',NULL),(1976,3,'LY101','1',NULL),(1977,3,'LY16','1',NULL),(1978,3,'LY211','1',NULL),(1979,3,'LY212','1',NULL),(1980,3,'LY50','1',NULL),(1981,3,'LY51','1',NULL),(1982,3,'LY61','1',NULL),(1983,3,'M-LH113V','1',NULL),(1984,3,'MARINO','1',NULL),(1985,3,'MARK 11','1',NULL),(1986,3,'MARK X','1',NULL),(1987,3,'MARKII TAGX110','1',NULL),(1988,3,'MATRIX','1',NULL),(1989,3,'MILUX','1',NULL),(1990,3,'MR-S','1',NULL),(1991,3,'MR2','1',NULL),(1992,3,'N-LH50V','1',NULL),(1993,3,'N-LH61V','1',NULL),(1994,3,'NHP10R-AHXVB PRIUS C','1',NULL),(1995,3,'NL50','1',NULL),(1996,3,'NLH71V','1',NULL),(1997,3,'NOAH DBA-ZRR70W','1',NULL),(1998,3,'NZE121','1',NULL),(1999,3,'NZE141','1',NULL),(2000,3,'NZT260','1',NULL),(2001,3,'OPEN TRUCK','1',NULL),(2002,3,'PANEL VAN','1',NULL),(2003,3,'PASEO','1',NULL),(2004,3,'PASSO','1',NULL),(2005,3,'PB.XZB50','1',NULL),(2006,3,'PDO-XZB50','1',NULL),(2007,3,'PLATZ','1',NULL),(2008,3,'PRADO','1',NULL),(2009,3,'PRADO TX','1',NULL),(2010,3,'PREMIO','1',NULL),(2011,3,'PREVIA','1',NULL),(2012,3,'PRIUS','1',NULL),(2013,3,'PRIUS ALPHA','1',NULL),(2014,3,'PRIUS C','1',NULL),(2015,3,'PRIUS DAAZVW50','1',NULL),(2016,3,'PRIUS S DAA-ZVW30','1',NULL),(2017,3,'PRIWIS','1',NULL),(2018,3,'QDF-KDH201V','1',NULL),(2019,3,'R-EE96V','1',NULL),(2020,3,'RAUM','1',NULL),(2021,3,'RAUM CAR','1',NULL),(2022,3,'RAV4','1',NULL),(2023,3,'RAV4 J','1',NULL),(2024,3,'RAV4J','1',NULL),(2025,3,'REGIUS','1',NULL),(2026,3,'RUSH','1',NULL),(2027,3,'RUSH ABA-J200E','1',NULL),(2028,3,'RX450 HYBRID','1',NULL),(2029,3,'S-CR26V','1',NULL),(2030,3,'S-CR27V','1',NULL),(2031,3,'S-CR36','1',NULL),(2032,3,'SAI','1',NULL),(2033,3,'SARA-100 JEEP','1',NULL),(2034,3,'SCION TC','1',NULL),(2035,3,'SEQUOIA','1',NULL),(2036,3,'SIENNA','1',NULL),(2037,3,'SL50 R TERCEL','1',NULL),(2038,3,'SOLUNA','1',NULL),(2039,3,'SOLUNA GLIA','1',NULL),(2040,3,'SOLUNA VIOS','1',NULL),(2041,3,'SOLUNA XLI M','1',NULL),(2042,3,'SORINTER','1',NULL),(2043,3,'SPRINTER','1',NULL),(2044,3,'SPRINTER AE100','1',NULL),(2045,3,'STARLET','1',NULL),(2046,3,'SUPER CUSTOM','1',NULL),(2047,3,'SUPER-GL','1',NULL),(2048,3,'SUPRA','1',NULL),(2049,3,'SWFFT','1',NULL),(2050,3,'SX010','1',NULL),(2051,3,'T100','1',NULL),(2052,3,'TA NZE121','1',NULL),(2053,3,'TA-ACA21W','1',NULL),(2054,3,'TA-GX110','1',NULL),(2055,3,'TA-J122E','1',NULL),(2056,3,'TA-LZT240','1',NULL),(2057,3,'TA-NCP13','1',NULL),(2058,3,'TA-NZE120','1',NULL),(2059,3,'TA-VZ1121W','1',NULL),(2060,3,'TA-VZJ121W PRADO','1',NULL),(2061,3,'TACOMA','1',NULL),(2062,3,'TANZE121','1',NULL),(2063,3,'TASCP11','1',NULL),(2064,3,'TC-TRH102V','1',NULL),(2065,3,'TC-TRH112V','1',NULL),(2066,3,'TERCEL','1',NULL),(2067,3,'TIPPING-DUMP TRUCK','1',NULL),(2068,3,'TOWN ACE','1',NULL),(2069,3,'TOWN ACE-KI-CR-42V','1',NULL),(2070,3,'TOYOACE','1',NULL),(2071,3,'TUNDRA','1',NULL),(2072,3,'TUNDRA DOUBLE CAB','1',NULL),(2073,3,'U LH113V','1',NULL),(2074,3,'U-LH1253','1',NULL),(2075,3,'U-LY50','1',NULL),(2076,3,'UA-NCP60','1',NULL),(2077,3,'UA-NZE120','1',NULL),(2078,3,'UA-NZE121','1',NULL),(2079,3,'UA-NZT240','1',NULL),(2080,3,'UA-SCP10','1',NULL),(2081,3,'UA-ZZE122','1',NULL),(2082,3,'UA-ZZT240','1',NULL),(2083,3,'UANZT240','1',NULL),(2084,3,'URJ202W LAND CRUISER','1',NULL),(2085,3,'VAN','1',NULL),(2086,3,'VANCP60','1',NULL),(2087,3,'VANGUARD','1',NULL),(2088,3,'VDJ200R-GNTEZ','1',NULL),(2089,3,'VENZA','1',NULL),(2090,3,'VEROSSA','1',NULL),(2091,3,'VIGO','1',NULL),(2092,3,'VIGO KUN26R','1',NULL),(2093,3,'VIGO KUN36','1',NULL),(2094,3,'VIGSISEA','1',NULL),(2095,3,'VIOS','1',NULL),(2096,3,'VISTA','1',NULL),(2097,3,'VOXY','1',NULL),(2098,3,'VOXY-HYBRID','1',NULL),(2099,3,'WKRS55E','1',NULL),(2100,3,'X-CV30BOX','1',NULL),(2101,3,'XNL40','1',NULL),(2102,3,'YARIS','1',NULL),(2103,3,'ZRE 141','1',NULL),(2104,59,'BEETLE','1',NULL),(2105,59,'CABRIO','1',NULL),(2106,59,'CABRIOLET','1',NULL),(2107,59,'CORRADO','1',NULL),(2108,59,'CRAFTER CR35109','1',NULL),(2109,59,'DASHER','1',NULL),(2110,59,'EUROVAN','1',NULL),(2111,59,'FASSAT','1',NULL),(2112,59,'FOX','1',NULL),(2113,59,'GOLF','1',NULL),(2114,59,'JETTA','1',NULL),(2115,59,'PASSAT','1',NULL),(2116,59,'POLO','1',NULL),(2117,59,'QUANTUM','1',NULL),(2118,59,'RABBIT','1',NULL),(2119,59,'ROUTAN','1',NULL),(2120,59,'SCIROCCO','1',NULL),(2121,59,'TIGUAN','1',NULL),(2122,59,'TOUAREG','1',NULL),(2123,59,'VANAGON','1',NULL),(2124,59,'1300','1',NULL),(2125,59,'BORA','1',NULL),(2126,59,'E6NAHS','1',NULL),(2127,60,'240','1',NULL),(2128,60,'244','1',NULL),(2129,60,'380 3D','1',NULL),(2130,60,'740 GLE','1',NULL),(2131,60,'840','1',NULL),(2132,60,'850','1',NULL),(2133,60,'940','1',NULL),(2134,60,'960','1',NULL),(2135,60,'C70','1',NULL),(2136,60,'DL','1',NULL),(2137,60,'FM-12','1',NULL),(2138,60,'GLE','1',NULL),(2139,60,'HEARSE','1',NULL),(2140,60,'S40','1',NULL),(2141,60,'S60','1',NULL),(2142,60,'S70','1',NULL),(2143,60,'S80','1',NULL),(2144,60,'V70','1',NULL),(2145,60,'XC 90','1',NULL),(2146,60,'XC60','1',NULL),(2147,60,'XC90','1',NULL),(2148,60,'XG-19','1',NULL),(2149,61,'GV','1',NULL),(2150,61,'GVC','1',NULL),(2151,61,'GVL','1',NULL),(2152,61,'GVS','1',NULL),(2153,61,'GVX','1',NULL),(2154,61,'YUOTH','1',NULL),(2155,62,'EXTREME','1',NULL),(2156,62,'NOMAD','1',NULL),(2157,62,'NOMAD 13LB','1',NULL),(2158,62,'NOMAD II','1',NULL);
/*!40000 ALTER TABLE `vehicle_model` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_valivation`
--

LOCK TABLES `vehicle_valivation` WRITE;
/*!40000 ALTER TABLE `vehicle_valivation` DISABLE KEYS */;
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

-- Dump completed on 2016-11-18 10:47:47
