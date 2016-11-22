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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_quotation`
--

LOCK TABLES `insurance_quotation` WRITE;
/*!40000 ALTER TABLE `insurance_quotation` DISABLE KEYS */;
INSERT INTO `insurance_quotation` VALUES (16,'8V8VSLh67qppK6hrTnO6fKkhtgL-S0SH',1,'CAT','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(22,'8vAgj7Lx1DDlMIwdDGoPVazbperc6yGj',2,'uuu','3333','Mr','chaminda','fernando','hama@gmail.com','0123456789','234567891x','5','2',1,'2011',4000000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(20,'9q85lmQ8282eoa1-urFZ8R0l9JwSX_uT',8,'CAD','9087','Mr','chaminda','fernando','chathu.gg@hh.co.com','0713232222','234567891x','5','2',1,'2012',4500000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(13,'ARD_IxywkkO3eCSD1C6n0aQop6LNis3v',3,'uuu','1234',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(24,'Av-wPFnr8s9esgu9uYOkifvUndROQfIu',6,'CAT','3333','Mr','chaminda','fernando','chathu.gg@hh.co.com','0713232222','123456789x','5','2',2,'2012',5500000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,'78889009','23346',1),(21,'CNTWRtc1vU7kUqCYf9ahPY2lIjVFejIj',1,'uuu','1234','Mr','chaminda','fernando','hama@gmail.com','0123456789','123456789x','5','2',1,'2011',4000000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(10,'IlOITUty-4lBUhM7tpglE0DajnTnGbRt',3,'CAD','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(1,'kZI6Zslrm664zu-xOtLDhh4gtQk2xU9D',1,'CAD','9087','Mr','yoko','name','chathu.gg@hh.co.com','0123456789','234567891x','9','244',NULL,'1912',10000000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(15,'nHldpk7Cy9yVnwzFp9xugYy9iPDhqEHW',1,'CAT','5668',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(28,'r16CrWZACz5YJ1TIpKmDqRthMxpVmxwc',3,'CAD','5668',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(14,'stSRBfanA4FbXVBve9G0yQC5MEZ_Yp1P',2,'uuu','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(19,'TaCP_m5rQ_shWD79KM9KAiUm-0KdJMVt',1,'yub','5668','Mr','Doctor','Strange','chathu.gg@hh.co.com','0123456789','123456789x','5','2',1,'2012',4060000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(17,'U189Lpgdt6WKe6s75PnlhnLU-BEBrTD_',3,'CAT','3333','Mr','chaminda','fernando','menaka@saveyourmonkey.com','0123456789','123456789x','5','2',NULL,'2011',4000000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(11,'UaxVc9TIoGecJ-xucQiPasoM9Hz6BSnK',2,'CAD','5668',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(12,'UfNG1hu5wiCCgOM9G9YtELwjqMxjyGOX',2,'CAT','3333',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1),(23,'uzSlqFwI7MDf_99oR1YhAKc6t-rrvtTR',2,'CAD','5668','Mr','chaminda','fernando','chathu.gg@hh.co.com','0713232222','123456789x','5','2',1,'2011',4000000,20,'2',1,'2016-11-25 12:00:00','2016-11-26 00:00:00',2,5,1,NULL,NULL,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping`
--

LOCK TABLES `shipping` WRITE;
/*!40000 ALTER TABLE `shipping` DISABLE KEYS */;
INSERT INTO `shipping` VALUES (1,'apE69X3Am2WEo27VhdQzBmmaH5HPV3x_',1,'menaka','fernando','gajma','kattuwa','44','negombo','other','11203','711656570','','','','','','','','','',222835,NULL),(2,'WAKfjPXO11Rxf7SlLzriaxxoXid1_8Ys',2,'menaka','fernando','new company','kattuwa','44','negombo','US','11203','711656570','','','','','','','','','',350000,NULL),(4,'gqrKoEFhcL1a9hNCyXqxAbwu8WgGjM6p',1,'menaka2','fernando','rrr','kattuwa','23','negombo','US','11203','711656570','','','','','','','','','',21780,NULL),(5,'bluhSZzD3uM6nswO2eVX3U5QTkddMsvs',2,'menaka','fernando','rrr','kattuwa','44','negombo','US','11203','711656570','','','','','','','','','',350000,NULL),(6,'M-Y37esE0T6P0g4ta-m8CFq7knPeRWt0',2,'kamal','perara','kasper','nuwara','66','nuwara','other','998','0987654321','kamal','perara','kasper','nuwara','66','nuwara','other','998','0987654321',3333330,NULL),(7,'_zONclI7jnpTCahpCK9GLlOsye58PcwG',2,'jon','snow','castle black','north','99','wall','US','5578','0117654234','jon','snow','king of the north','winterfell','1','north','US','77','0746734251',3712000,NULL),(8,'-9CZqxXdT28jtRY9X1PXPXAajRM4hy9B',2,'jon','snow','nights watch','castle black','1','north','US','4567','711656570','jon','snow','king of the north','winterfell','99','north','US','11203','711656570',490000,NULL),(9,'6iXWrYmFMASOYVugI0Te7S00BB-GPhbB',2,'menjgjg','men','SYN','kollupitiuya','234','yamana2346','other','456','07143267','menjgjg','men','SYN','kollupitiuya','234','yamana2346','other','456','07143267',20736,NULL),(10,'WbIIPTSXf2v4RaAwuVMjSPZTm_CpjaiV',2,'men','tyu','SYN','kollupitiuya','7657','yamana2346','US','456','45676578','men','tyu','SYN','kollupitiuya','7657','yamana2346','US','456','45676578',4072608,NULL),(11,'y_QAtXHwY2bIFuUC3rip12-ViAvgkKrn',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3936854,4),(17,'VXmp4uDA4eFPonthHqvGKfWvgWAEtLIH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140658,2),(18,'NisQA8jJ6RmZQDrqPF2RBzQnkUxDiEW6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(19,'R6VxKiz-mcPot-tq-EpyDAYy30hvJiPH',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(20,'j6jAopzS__6cwU5rfudcQdwLra2e0DTF',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,478068,2),(21,'BoESAzz4D4d42WJ4gue0Kh8J3ok-QBTE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,264289,4),(24,'6oGI4wCXr3YSPNbBCvXgz3GBP4gXTD7K',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4716446,3),(25,'_B-NVpLkBmlnUVbjCRUrqAE_Fa5BxPUV',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,105494,5),(26,'z9icGNC2_M8Vqck7C6FkMx1v9LUkglWw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4042668,2),(27,'y5wFggtqG54JYjzhJZ7JKeoi9zlZ2Ht7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,264289,4),(28,'Tbb_A-MXBknDkl6z4cnyWWuQAuAEECHw',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17280,1),(29,'ja8c74LSn35Glpj5f3M6EMcs7s_9pMKB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,135969,4),(30,'ypu3hH1OE4P2a4N-PqnGrxDdhTlsLuvW',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,117215,1),(31,'RXlkOYkOrh5khBJZLodCyKI3UIGg5hWS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,140658,2),(32,'8e-r8T4eEXWX3uduMeS87vt9_DQzRElX',2,NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','456','07143267',NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','456',NULL,4042668,2),(33,'Kyh_b2_i9x1FzRT-PAkc4FFfJkOpjMyP',1,NULL,NULL,NULL,'kollupitiuya','24','colombo','Ketchup','456','07143267',NULL,NULL,NULL,'kollupitiuya','24','colombo','Ketchup','456',NULL,6000,2),(34,'XhzAy4LGDEQlcDvmUcSa9VKHlNWQyK_v',1,NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456','45676578',NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456',NULL,500000,1),(35,'f115r0SDo21VxiG4tkY7a54bnenKqdcE',1,NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','783459','0711656570',NULL,NULL,NULL,'kollupitiuya','234','yamana','Ketchup','783459',NULL,40426680,2),(45,'4tqjti_IfOnI6qHR_D81h9LegoXiMHQA',1,NULL,NULL,NULL,'kollupitiuya','234','yamana','Relish','456','0714326700',NULL,NULL,NULL,'kollupitiuya','234','yamana','Relish','456',NULL,40426680,2),(46,'uP7atEj8QjarGxP3HVX5nkzKlipDn8o4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,474000,2),(47,'uM9lKLisX6Z_dfqZooiouXfvd2AivSzw',1,NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456','0714326700',NULL,NULL,NULL,'kollupitiuya','234','yamana2346','Ketchup','456',NULL,5340000,2),(48,'dLcumJaGpv5THcgSthINfkoal5tY7piU',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,335000,1),(50,'-MPRQGGsDptUKS3vFyhM0GDC2H6OF6B7',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3360000,2),(51,'orEX3Of0_jNREmTE99UC3Pu_HFuvyVdu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50000,1),(52,'oUQQ-RllVuDpwvfXlyezfoiq2PPWeWKe',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3000000,1),(55,'nSHeZCslJK-4sM6tPMertGc2y3LLU8-y',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000,2),(56,'nvblgkSjK5xxBFS6r6eXmWFIVQp22V_O',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,240000,2),(57,'GVJUEr71xydlkQXIsVHXhCRZBY99-x7I',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4734000,2),(58,'T107PN-xPHFMCwvpARbArzPJlyQ4F8TW',2,NULL,NULL,NULL,'etet','34','sdfsdf','Ketchup','4567','0123456789',NULL,NULL,NULL,'etet','34','sdfsdf','Ketchup','4567',NULL,407400,2),(59,'JZbet7wpU_1AIJBUrnRLK53jYrmzXRPQ',1,NULL,NULL,NULL,'uybyiun','90','hinmki','Ketchup','8990','0987654321',NULL,NULL,NULL,'uybyiun','90','hinmki','Ketchup','8990',NULL,7000000,3),(60,'2yPZ5WYIfI2zDMsD8X3u2DWq1muPdb9A',1,NULL,NULL,NULL,'sdfsdf','23','sdsdf','Relish','324','0987654321',NULL,NULL,NULL,'sdfsdf','23','sdsdf','Relish','324',NULL,20000000,1),(61,'ZidsUzBji9aB57cH5g375FGHCCod-T29',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40600000,4),(63,'idH4alL3pENx_JRBL3nLAZulHiOc7vzr',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,400000,1),(64,'aqa07DMyKxJAXcbJ1vaXlhB_AXzIPnnP',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,350000,1),(65,'bKBb-43j__F2GX1AZVatVrOIrJuyI7Lj',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5000000,1),(66,'kZI6Zslrm664zu-xOtLDhh4gtQk2xU9D',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2900000,4),(73,'Av-wPFnr8s9esgu9uYOkifvUndROQfIu',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27500000,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_model`
--

LOCK TABLES `vehicle_model` WRITE;
/*!40000 ALTER TABLE `vehicle_model` DISABLE KEYS */;
INSERT INTO `vehicle_model` VALUES (1,64,'A4','1',1),(2,5,'X1','1',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_valivation`
--

LOCK TABLES `vehicle_valivation` WRITE;
/*!40000 ALTER TABLE `vehicle_valivation` DISABLE KEYS */;
INSERT INTO `vehicle_valivation` VALUES (1,1,1,2014,8000000),(2,2,1,2011,4000000),(3,2,1,2012,4500000),(4,2,1,2013,5000000),(5,2,1,2014,5000000),(6,2,2,2011,5000000),(7,2,2,2012,5500000),(8,2,2,2013,6000000),(9,2,2,2014,6500000);
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

-- Dump completed on 2016-11-22 14:37:53
