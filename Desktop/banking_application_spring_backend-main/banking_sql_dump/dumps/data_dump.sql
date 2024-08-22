-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: banking_system_db
-- ------------------------------------------------------
-- Server version	8.0.38

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `account_details`
--

LOCK TABLES `account_details` WRITE;
/*!40000 ALTER TABLE `account_details` DISABLE KEYS */;
INSERT INTO `account_details` VALUES (89,10001,'Savings',581134.00,'active','2024-07-29 18:30:00',0,750000,0,5000,NULL,1000),(90,10004,'Current',60000.00,'active','2024-07-29 18:30:00',45000,200000,1,0,NULL,1000),(91,10007,'Current',10000.00,'active','2024-07-29 18:30:00',0,200000,0,0,NULL,1000),(92,10001,'Current',679206.00,'active','2024-07-30 18:30:00',45000,200000,1,0,NULL,1000),(93,10007,'Savings',476.00,'active','2024-07-30 18:30:00',0,750000,0,5000,NULL,1000),(94,10004,'Savings',169990.00,'active','2024-08-13 11:52:53',0,0,0,0,NULL,1000),(95,10004,'Current',0.00,'active','2024-08-13 11:53:09',0,0,0,0,NULL,1000),(96,10004,'Current',0.00,'active','2024-08-14 04:58:36',0,0,0,0,NULL,1000),(97,10004,'Current',0.00,'active','2024-08-14 05:00:01',0,0,0,0,NULL,1000),(98,10004,'Current',0.00,'active','2024-08-14 05:01:40',0,250000,0,2500,NULL,1000),(99,10004,'Current',0.00,'active','2024-08-14 05:02:04',0,250000,0,2500,NULL,1000),(100,10004,'Current',0.00,'active','2024-08-14 05:02:26',0,250000,0,2500,NULL,1000),(101,10004,'Current',0.00,'active','2024-08-14 05:02:31',0,250000,0,2500,NULL,1000),(102,10004,'Current',0.00,'active','2024-08-14 05:06:21',45000,250000,1,5000,NULL,1000),(103,10004,'Current',0.00,'active','2024-08-14 05:06:48',0,250000,0,2500,NULL,1000),(104,10004,'Current',0.00,'active','2024-08-14 06:03:21',0,250000,0,2500,NULL,1000),(105,10004,'Current',0.00,'active','2024-08-14 06:03:31',45000,250000,1,5000,NULL,1000),(106,10004,'Savings',-50.00,'active','2024-08-14 06:03:40',0,750000,1,0,NULL,1000),(107,10004,'Savings',0.00,'active','2024-08-14 06:03:52',0,750000,0,0,NULL,1000),(108,10004,'Savings',0.00,'active','2024-08-14 06:20:08',0,750000,0,0,NULL,1000),(109,10004,'Savings',0.00,'active','2024-08-14 06:22:31',0,750000,0,0,NULL,1000),(110,10004,'Savings',0.00,'active','2024-08-14 06:23:55',0,750000,1,0,NULL,1000),(111,10004,'Current',0.00,'active','2024-08-14 06:24:07',45000,250000,1,5000,NULL,1000),(112,10004,'Current',0.00,'active','2024-08-14 06:24:15',0,250000,0,2500,NULL,1000),(113,10004,'Current',0.00,'active','2024-08-16 11:58:02',0,0,0,0,NULL,1000),(115,10004,'Savings',0.00,'active','2024-08-16 17:34:44',0,0,0,0,NULL,1000),(116,10004,'Savings',0.00,'active','2024-08-16 20:47:15',0,0,0,0,NULL,1000);
/*!40000 ALTER TABLE `account_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `account_creation_trigger` AFTER INSERT ON `account_details` FOR EACH ROW BEGIN
    CALL issue_checks(NEW.customer_id);
    
    IF NEW.account_type = 'Current' THEN
        INSERT INTO temp_overdraft_updates (account_id) VALUES (NEW.account_id)
        ON DUPLICATE KEY UPDATE account_id = NEW.account_id;
        
        INSERT INTO account_update_flags (account_id, update_needed)
        VALUES (NEW.account_id, TRUE)
        ON DUPLICATE KEY UPDATE update_needed = TRUE;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping data for table `account_update_flags`
--

LOCK TABLES `account_update_flags` WRITE;
/*!40000 ALTER TABLE `account_update_flags` DISABLE KEYS */;
INSERT INTO `account_update_flags` VALUES (90,1),(91,1),(92,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(111,1),(112,1),(113,1);
/*!40000 ALTER TABLE `account_update_flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `admin_schema`
--

LOCK TABLES `admin_schema` WRITE;
/*!40000 ALTER TABLE `admin_schema` DISABLE KEYS */;
INSERT INTO `admin_schema` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `admin_schema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bank_slip`
--

LOCK TABLES `bank_slip` WRITE;
/*!40000 ALTER TABLE `bank_slip` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_slip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bank_slip_details`
--

LOCK TABLES `bank_slip_details` WRITE;
/*!40000 ALTER TABLE `bank_slip_details` DISABLE KEYS */;
INSERT INTO `bank_slip_details` VALUES (5,'active','2024-08-16 15:43:39',93,1),(6,'active','2024-08-16 15:43:44',93,2),(7,'active','2024-08-16 16:09:40',89,1),(8,'active','2024-08-16 17:39:06',89,2),(9,'active','2024-08-16 19:35:46',93,3);
/*!40000 ALTER TABLE `bank_slip_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cheque_details`
--

LOCK TABLES `cheque_details` WRITE;
/*!40000 ALTER TABLE `cheque_details` DISABLE KEYS */;
INSERT INTO `cheque_details` VALUES (181,89,3590.00,'2024-08-16 14:30:00','deposited',6,93,NULL),(182,89,19000.00,'2024-08-17 14:30:00','deposited',6,90,NULL),(183,89,NULL,NULL,'pending',6,NULL,NULL),(184,89,NULL,NULL,'pending',NULL,NULL,NULL),(185,89,70000.00,'2024-08-16 14:30:00','deposited',7,94,NULL),(186,89,19990.00,'2024-08-16 14:30:00','deposited',8,94,NULL),(187,89,10.00,'2024-08-16 14:30:00','deposited',8,94,NULL),(188,89,NULL,NULL,'pending',NULL,NULL,NULL),(189,89,NULL,NULL,'pending',NULL,NULL,NULL),(190,89,150000.00,'2024-08-16 14:30:00','deposited',8,94,NULL),(191,90,NULL,NULL,'pending',NULL,NULL,NULL),(192,90,NULL,NULL,'pending',NULL,NULL,NULL),(193,90,NULL,NULL,'pending',NULL,NULL,NULL),(194,90,NULL,NULL,'pending',NULL,NULL,NULL),(195,90,NULL,NULL,'pending',NULL,NULL,NULL),(196,90,NULL,NULL,'pending',NULL,NULL,NULL),(197,90,NULL,NULL,'pending',NULL,NULL,NULL),(198,90,NULL,NULL,'pending',NULL,NULL,NULL),(199,90,NULL,NULL,'pending',NULL,NULL,NULL),(200,90,NULL,NULL,'pending',NULL,NULL,NULL),(201,91,NULL,NULL,'pending',NULL,NULL,NULL),(202,91,NULL,NULL,'pending',NULL,NULL,NULL),(203,91,NULL,NULL,'pending',NULL,NULL,NULL),(204,91,NULL,NULL,'pending',NULL,NULL,NULL),(205,91,NULL,NULL,'pending',NULL,NULL,NULL),(206,91,NULL,NULL,'pending',NULL,NULL,NULL),(207,91,NULL,NULL,'pending',NULL,NULL,NULL),(208,91,NULL,NULL,'pending',NULL,NULL,NULL),(209,91,NULL,NULL,'pending',NULL,NULL,NULL),(210,91,NULL,NULL,'pending',NULL,NULL,NULL),(211,92,NULL,NULL,'pending',NULL,NULL,NULL),(212,92,NULL,NULL,'pending',NULL,NULL,NULL),(213,92,NULL,NULL,'pending',NULL,NULL,NULL),(214,92,NULL,NULL,'pending',NULL,NULL,NULL),(215,92,NULL,NULL,'pending',NULL,NULL,NULL),(216,92,NULL,NULL,'pending',NULL,NULL,NULL),(217,92,NULL,NULL,'pending',NULL,NULL,NULL),(218,92,NULL,NULL,'pending',NULL,NULL,NULL),(219,92,NULL,NULL,'pending',NULL,NULL,NULL),(220,92,NULL,NULL,'pending',NULL,NULL,NULL),(221,93,NULL,NULL,'pending',NULL,NULL,NULL),(222,93,NULL,NULL,'pending',NULL,NULL,NULL),(223,93,NULL,NULL,'pending',NULL,NULL,NULL),(224,93,NULL,NULL,'pending',NULL,NULL,NULL),(225,93,NULL,NULL,'pending',NULL,NULL,NULL),(226,93,NULL,NULL,'pending',NULL,NULL,NULL),(227,93,NULL,NULL,'pending',NULL,NULL,NULL),(228,93,NULL,NULL,'pending',NULL,NULL,NULL),(229,93,NULL,NULL,'pending',NULL,NULL,NULL),(230,93,NULL,NULL,'pending',NULL,NULL,NULL),(231,94,NULL,NULL,'pending',NULL,NULL,NULL),(232,94,NULL,NULL,'pending',NULL,NULL,NULL),(233,94,NULL,NULL,'pending',NULL,NULL,NULL),(234,94,NULL,NULL,'pending',NULL,NULL,NULL),(235,94,NULL,NULL,'pending',NULL,NULL,NULL),(236,94,NULL,NULL,'pending',NULL,NULL,NULL),(237,94,NULL,NULL,'pending',NULL,NULL,NULL),(238,94,NULL,NULL,'pending',NULL,NULL,NULL),(239,94,NULL,NULL,'pending',NULL,NULL,NULL),(240,94,NULL,NULL,'pending',NULL,NULL,NULL),(241,95,NULL,NULL,'pending',NULL,NULL,NULL),(242,95,NULL,NULL,'pending',NULL,NULL,NULL),(243,95,NULL,NULL,'pending',NULL,NULL,NULL),(244,95,NULL,NULL,'pending',NULL,NULL,NULL),(245,95,NULL,NULL,'pending',NULL,NULL,NULL),(246,95,NULL,NULL,'pending',NULL,NULL,NULL),(247,95,NULL,NULL,'pending',NULL,NULL,NULL),(248,95,NULL,NULL,'pending',NULL,NULL,NULL),(249,95,NULL,NULL,'pending',NULL,NULL,NULL),(250,95,NULL,NULL,'pending',NULL,NULL,NULL),(251,96,NULL,NULL,'pending',NULL,NULL,NULL),(252,96,NULL,NULL,'pending',NULL,NULL,NULL),(253,96,NULL,NULL,'pending',NULL,NULL,NULL),(254,96,NULL,NULL,'pending',NULL,NULL,NULL),(255,96,NULL,NULL,'pending',NULL,NULL,NULL),(256,96,NULL,NULL,'pending',NULL,NULL,NULL),(257,96,NULL,NULL,'pending',NULL,NULL,NULL),(258,96,NULL,NULL,'pending',NULL,NULL,NULL),(259,96,NULL,NULL,'pending',NULL,NULL,NULL),(260,96,NULL,NULL,'pending',NULL,NULL,NULL),(261,97,NULL,NULL,'pending',NULL,NULL,NULL),(262,97,NULL,NULL,'pending',NULL,NULL,NULL),(263,97,NULL,NULL,'pending',NULL,NULL,NULL),(264,97,NULL,NULL,'pending',NULL,NULL,NULL),(265,97,NULL,NULL,'pending',NULL,NULL,NULL),(266,97,NULL,NULL,'pending',NULL,NULL,NULL),(267,97,NULL,NULL,'pending',NULL,NULL,NULL),(268,97,NULL,NULL,'pending',NULL,NULL,NULL),(269,97,NULL,NULL,'pending',NULL,NULL,NULL),(270,97,NULL,NULL,'pending',NULL,NULL,NULL),(271,98,NULL,NULL,'pending',NULL,NULL,NULL),(272,98,NULL,NULL,'pending',NULL,NULL,NULL),(273,98,NULL,NULL,'pending',NULL,NULL,NULL),(274,98,NULL,NULL,'pending',NULL,NULL,NULL),(275,98,NULL,NULL,'pending',NULL,NULL,NULL),(276,98,NULL,NULL,'pending',NULL,NULL,NULL),(277,98,NULL,NULL,'pending',NULL,NULL,NULL),(278,98,NULL,NULL,'pending',NULL,NULL,NULL),(279,98,NULL,NULL,'pending',NULL,NULL,NULL),(280,98,NULL,NULL,'pending',NULL,NULL,NULL),(281,99,NULL,NULL,'pending',NULL,NULL,NULL),(282,99,NULL,NULL,'pending',NULL,NULL,NULL),(283,99,NULL,NULL,'pending',NULL,NULL,NULL),(284,99,NULL,NULL,'pending',NULL,NULL,NULL),(285,99,NULL,NULL,'pending',NULL,NULL,NULL),(286,99,NULL,NULL,'pending',NULL,NULL,NULL),(287,99,NULL,NULL,'pending',NULL,NULL,NULL),(288,99,NULL,NULL,'pending',NULL,NULL,NULL),(289,99,NULL,NULL,'pending',NULL,NULL,NULL),(290,99,NULL,NULL,'pending',NULL,NULL,NULL),(291,100,NULL,NULL,'pending',NULL,NULL,NULL),(292,100,NULL,NULL,'pending',NULL,NULL,NULL),(293,100,NULL,NULL,'pending',NULL,NULL,NULL),(294,100,NULL,NULL,'pending',NULL,NULL,NULL),(295,100,NULL,NULL,'pending',NULL,NULL,NULL),(296,100,NULL,NULL,'pending',NULL,NULL,NULL),(297,100,NULL,NULL,'pending',NULL,NULL,NULL),(298,100,NULL,NULL,'pending',NULL,NULL,NULL),(299,100,NULL,NULL,'pending',NULL,NULL,NULL),(300,100,NULL,NULL,'pending',NULL,NULL,NULL),(301,101,NULL,NULL,'pending',NULL,NULL,NULL),(302,101,NULL,NULL,'pending',NULL,NULL,NULL),(303,101,NULL,NULL,'pending',NULL,NULL,NULL),(304,101,NULL,NULL,'pending',NULL,NULL,NULL),(305,101,NULL,NULL,'pending',NULL,NULL,NULL),(306,101,NULL,NULL,'pending',NULL,NULL,NULL),(307,101,NULL,NULL,'pending',NULL,NULL,NULL),(308,101,NULL,NULL,'pending',NULL,NULL,NULL),(309,101,NULL,NULL,'pending',NULL,NULL,NULL),(310,101,NULL,NULL,'pending',NULL,NULL,NULL),(311,102,NULL,NULL,'pending',NULL,NULL,NULL),(312,102,NULL,NULL,'pending',NULL,NULL,NULL),(313,102,NULL,NULL,'pending',NULL,NULL,NULL),(314,102,NULL,NULL,'pending',NULL,NULL,NULL),(315,102,NULL,NULL,'pending',NULL,NULL,NULL),(316,102,NULL,NULL,'pending',NULL,NULL,NULL),(317,102,NULL,NULL,'pending',NULL,NULL,NULL),(318,102,NULL,NULL,'pending',NULL,NULL,NULL),(319,102,NULL,NULL,'pending',NULL,NULL,NULL),(320,102,NULL,NULL,'pending',NULL,NULL,NULL),(321,103,NULL,NULL,'pending',NULL,NULL,NULL),(322,103,NULL,NULL,'pending',NULL,NULL,NULL),(323,103,NULL,NULL,'pending',NULL,NULL,NULL),(324,103,NULL,NULL,'pending',NULL,NULL,NULL),(325,103,NULL,NULL,'pending',NULL,NULL,NULL),(326,103,NULL,NULL,'pending',NULL,NULL,NULL),(327,103,NULL,NULL,'pending',NULL,NULL,NULL),(328,103,NULL,NULL,'pending',NULL,NULL,NULL),(329,103,NULL,NULL,'pending',NULL,NULL,NULL),(330,103,NULL,NULL,'pending',NULL,NULL,NULL),(331,104,NULL,NULL,'pending',NULL,NULL,NULL),(332,104,NULL,NULL,'pending',NULL,NULL,NULL),(333,104,NULL,NULL,'pending',NULL,NULL,NULL),(334,104,NULL,NULL,'pending',NULL,NULL,NULL),(335,104,NULL,NULL,'pending',NULL,NULL,NULL),(336,104,NULL,NULL,'pending',NULL,NULL,NULL),(337,104,NULL,NULL,'pending',NULL,NULL,NULL),(338,104,NULL,NULL,'pending',NULL,NULL,NULL),(339,104,NULL,NULL,'pending',NULL,NULL,NULL),(340,104,NULL,NULL,'pending',NULL,NULL,NULL),(341,105,NULL,NULL,'pending',NULL,NULL,NULL),(342,105,NULL,NULL,'pending',NULL,NULL,NULL),(343,105,NULL,NULL,'pending',NULL,NULL,NULL),(344,105,NULL,NULL,'pending',NULL,NULL,NULL),(345,105,NULL,NULL,'pending',NULL,NULL,NULL),(346,105,NULL,NULL,'pending',NULL,NULL,NULL),(347,105,NULL,NULL,'pending',NULL,NULL,NULL),(348,105,NULL,NULL,'pending',NULL,NULL,NULL),(349,105,NULL,NULL,'pending',NULL,NULL,NULL),(350,105,NULL,NULL,'pending',NULL,NULL,NULL),(351,106,NULL,NULL,'pending',NULL,NULL,NULL),(352,106,NULL,NULL,'pending',NULL,NULL,NULL),(353,106,NULL,NULL,'pending',NULL,NULL,NULL),(354,106,NULL,NULL,'pending',NULL,NULL,NULL),(355,106,NULL,NULL,'pending',NULL,NULL,NULL),(356,106,NULL,NULL,'pending',NULL,NULL,NULL),(357,106,NULL,NULL,'pending',NULL,NULL,NULL),(358,106,NULL,NULL,'pending',NULL,NULL,NULL),(359,106,NULL,NULL,'pending',NULL,NULL,NULL),(360,106,NULL,NULL,'pending',NULL,NULL,NULL),(361,107,NULL,NULL,'pending',NULL,NULL,NULL),(362,107,NULL,NULL,'pending',NULL,NULL,NULL),(363,107,NULL,NULL,'pending',NULL,NULL,NULL),(364,107,NULL,NULL,'pending',NULL,NULL,NULL),(365,107,NULL,NULL,'pending',NULL,NULL,NULL),(366,107,NULL,NULL,'pending',NULL,NULL,NULL),(367,107,NULL,NULL,'pending',NULL,NULL,NULL),(368,107,NULL,NULL,'pending',NULL,NULL,NULL),(369,107,NULL,NULL,'pending',NULL,NULL,NULL),(370,107,NULL,NULL,'pending',NULL,NULL,NULL),(371,108,NULL,NULL,'pending',NULL,NULL,NULL),(372,108,NULL,NULL,'pending',NULL,NULL,NULL),(373,108,NULL,NULL,'pending',NULL,NULL,NULL),(374,108,NULL,NULL,'pending',NULL,NULL,NULL),(375,108,NULL,NULL,'pending',NULL,NULL,NULL),(376,108,NULL,NULL,'pending',NULL,NULL,NULL),(377,108,NULL,NULL,'pending',NULL,NULL,NULL),(378,108,NULL,NULL,'pending',NULL,NULL,NULL),(379,108,NULL,NULL,'pending',NULL,NULL,NULL),(380,108,NULL,NULL,'pending',NULL,NULL,NULL),(381,109,NULL,NULL,'pending',NULL,NULL,NULL),(382,109,NULL,NULL,'pending',NULL,NULL,NULL),(383,109,NULL,NULL,'pending',NULL,NULL,NULL),(384,109,NULL,NULL,'pending',NULL,NULL,NULL),(385,109,NULL,NULL,'pending',NULL,NULL,NULL),(386,109,NULL,NULL,'pending',NULL,NULL,NULL),(387,109,NULL,NULL,'pending',NULL,NULL,NULL),(388,109,NULL,NULL,'pending',NULL,NULL,NULL),(389,109,NULL,NULL,'pending',NULL,NULL,NULL),(390,109,NULL,NULL,'pending',NULL,NULL,NULL),(391,110,NULL,NULL,'pending',NULL,NULL,NULL),(392,110,NULL,NULL,'pending',NULL,NULL,NULL),(393,110,NULL,NULL,'pending',NULL,NULL,NULL),(394,110,NULL,NULL,'pending',NULL,NULL,NULL),(395,110,NULL,NULL,'pending',NULL,NULL,NULL),(396,110,NULL,NULL,'pending',NULL,NULL,NULL),(397,110,NULL,NULL,'pending',NULL,NULL,NULL),(398,110,NULL,NULL,'pending',NULL,NULL,NULL),(399,110,NULL,NULL,'pending',NULL,NULL,NULL),(400,110,NULL,NULL,'pending',NULL,NULL,NULL),(401,111,NULL,NULL,'pending',NULL,NULL,NULL),(402,111,NULL,NULL,'pending',NULL,NULL,NULL),(403,111,NULL,NULL,'pending',NULL,NULL,NULL),(404,111,NULL,NULL,'pending',NULL,NULL,NULL),(405,111,NULL,NULL,'pending',NULL,NULL,NULL),(406,111,NULL,NULL,'pending',NULL,NULL,NULL),(407,111,NULL,NULL,'pending',NULL,NULL,NULL),(408,111,NULL,NULL,'pending',NULL,NULL,NULL),(409,111,NULL,NULL,'pending',NULL,NULL,NULL),(410,111,NULL,NULL,'pending',NULL,NULL,NULL),(411,112,NULL,NULL,'pending',NULL,NULL,NULL),(412,112,NULL,NULL,'pending',NULL,NULL,NULL),(413,112,NULL,NULL,'pending',NULL,NULL,NULL),(414,112,NULL,NULL,'pending',NULL,NULL,NULL),(415,112,NULL,NULL,'pending',NULL,NULL,NULL),(416,112,NULL,NULL,'pending',NULL,NULL,NULL),(417,112,NULL,NULL,'pending',NULL,NULL,NULL),(418,112,NULL,NULL,'pending',NULL,NULL,NULL),(419,112,NULL,NULL,'pending',NULL,NULL,NULL),(420,112,NULL,NULL,'pending',NULL,NULL,NULL),(421,92,NULL,NULL,'pending',NULL,NULL,NULL),(422,92,NULL,NULL,'pending',NULL,NULL,NULL),(423,92,NULL,NULL,'pending',NULL,NULL,NULL),(424,92,NULL,NULL,'pending',NULL,NULL,NULL),(425,92,NULL,NULL,'pending',NULL,NULL,NULL),(426,92,NULL,NULL,'pending',NULL,NULL,NULL),(427,92,NULL,NULL,'pending',NULL,NULL,NULL),(428,92,NULL,NULL,'pending',NULL,NULL,NULL),(429,92,NULL,NULL,'pending',NULL,NULL,NULL),(430,92,NULL,NULL,'pending',NULL,NULL,NULL),(474,92,NULL,NULL,'pending',NULL,NULL,NULL),(475,92,NULL,NULL,'pending',NULL,NULL,NULL),(476,92,NULL,NULL,'pending',NULL,NULL,NULL),(477,92,NULL,NULL,'pending',NULL,NULL,NULL),(478,92,NULL,NULL,'pending',NULL,NULL,NULL),(479,92,NULL,NULL,'pending',NULL,NULL,NULL),(480,92,NULL,NULL,'pending',NULL,NULL,NULL),(481,92,NULL,NULL,'pending',NULL,NULL,NULL),(482,92,NULL,NULL,'pending',NULL,NULL,NULL),(483,92,NULL,NULL,'pending',NULL,NULL,NULL),(484,92,NULL,NULL,'pending',NULL,NULL,NULL),(485,92,NULL,NULL,'pending',NULL,NULL,NULL),(486,92,NULL,NULL,'pending',NULL,NULL,NULL),(487,92,NULL,NULL,'pending',NULL,NULL,NULL),(488,92,NULL,NULL,'pending',NULL,NULL,NULL),(489,92,NULL,NULL,'pending',NULL,NULL,NULL),(490,92,NULL,NULL,'pending',NULL,NULL,NULL),(491,92,NULL,NULL,'pending',NULL,NULL,NULL),(492,92,NULL,NULL,'pending',NULL,NULL,NULL),(493,92,NULL,NULL,'pending',NULL,NULL,NULL),(514,89,NULL,NULL,'pending',NULL,NULL,NULL),(515,89,NULL,NULL,'pending',NULL,NULL,NULL),(516,89,NULL,NULL,'pending',NULL,NULL,NULL),(517,89,NULL,NULL,'pending',NULL,NULL,NULL),(518,89,NULL,NULL,'pending',NULL,NULL,NULL),(519,89,NULL,NULL,'pending',NULL,NULL,NULL),(520,89,NULL,NULL,'pending',NULL,NULL,NULL),(521,89,NULL,NULL,'pending',NULL,NULL,NULL),(522,89,NULL,NULL,'pending',NULL,NULL,NULL),(523,89,NULL,NULL,'pending',NULL,NULL,NULL),(524,89,NULL,NULL,'pending',NULL,NULL,NULL),(525,89,NULL,NULL,'pending',NULL,NULL,NULL),(526,89,NULL,NULL,'pending',NULL,NULL,NULL),(527,89,NULL,NULL,'pending',NULL,NULL,NULL),(528,89,NULL,NULL,'pending',NULL,NULL,NULL),(529,89,NULL,NULL,'pending',NULL,NULL,NULL),(530,89,NULL,NULL,'pending',NULL,NULL,NULL),(531,89,NULL,NULL,'pending',NULL,NULL,NULL),(532,89,NULL,NULL,'pending',NULL,NULL,NULL),(533,89,NULL,NULL,'pending',NULL,NULL,NULL),(534,89,NULL,NULL,'pending',NULL,NULL,NULL),(535,89,NULL,NULL,'pending',NULL,NULL,NULL),(536,89,NULL,NULL,'pending',NULL,NULL,NULL),(537,89,NULL,NULL,'pending',NULL,NULL,NULL),(538,89,NULL,NULL,'pending',NULL,NULL,NULL),(539,89,NULL,NULL,'pending',NULL,NULL,NULL),(540,89,NULL,NULL,'pending',NULL,NULL,NULL),(541,89,NULL,NULL,'pending',NULL,NULL,NULL),(542,89,NULL,NULL,'pending',NULL,NULL,NULL),(543,89,NULL,NULL,'pending',NULL,NULL,NULL),(544,93,NULL,NULL,'pending',NULL,NULL,NULL),(545,93,NULL,NULL,'pending',NULL,NULL,NULL),(546,93,NULL,NULL,'pending',NULL,NULL,NULL),(547,93,NULL,NULL,'pending',NULL,NULL,NULL),(548,93,NULL,NULL,'pending',NULL,NULL,NULL),(549,93,NULL,NULL,'pending',NULL,NULL,NULL),(550,93,NULL,NULL,'pending',NULL,NULL,NULL),(551,93,NULL,NULL,'pending',NULL,NULL,NULL),(552,93,NULL,NULL,'pending',NULL,NULL,NULL),(553,93,NULL,NULL,'pending',NULL,NULL,NULL),(556,93,NULL,NULL,'pending',NULL,NULL,NULL),(557,93,NULL,NULL,'pending',NULL,NULL,NULL),(558,93,NULL,NULL,'pending',NULL,NULL,NULL),(559,93,NULL,NULL,'pending',NULL,NULL,NULL),(560,93,NULL,NULL,'pending',NULL,NULL,NULL),(561,93,NULL,NULL,'pending',NULL,NULL,NULL),(562,93,NULL,NULL,'pending',NULL,NULL,NULL),(563,93,NULL,NULL,'pending',NULL,NULL,NULL),(564,93,NULL,NULL,'pending',NULL,NULL,NULL),(565,93,NULL,NULL,'pending',NULL,NULL,NULL),(566,113,NULL,NULL,'pending',NULL,NULL,NULL),(567,113,NULL,NULL,'pending',NULL,NULL,NULL),(568,113,NULL,NULL,'pending',NULL,NULL,NULL),(569,113,NULL,NULL,'pending',NULL,NULL,NULL),(570,113,NULL,NULL,'pending',NULL,NULL,NULL),(571,113,NULL,NULL,'pending',NULL,NULL,NULL),(572,113,NULL,NULL,'pending',NULL,NULL,NULL),(573,113,NULL,NULL,'pending',NULL,NULL,NULL),(574,113,NULL,NULL,'pending',NULL,NULL,NULL),(575,113,NULL,NULL,'pending',NULL,NULL,NULL),(577,89,NULL,NULL,'pending',NULL,NULL,NULL),(578,89,NULL,NULL,'pending',NULL,NULL,NULL),(579,89,NULL,NULL,'pending',NULL,NULL,NULL),(580,89,NULL,NULL,'pending',NULL,NULL,NULL),(581,89,NULL,NULL,'pending',NULL,NULL,NULL),(582,89,NULL,NULL,'pending',NULL,NULL,NULL),(583,89,NULL,NULL,'pending',NULL,NULL,NULL),(584,89,NULL,NULL,'pending',NULL,NULL,NULL),(585,89,NULL,NULL,'pending',NULL,NULL,NULL),(586,89,NULL,NULL,'pending',NULL,NULL,NULL),(587,106,NULL,NULL,'pending',NULL,NULL,NULL),(588,106,NULL,NULL,'pending',NULL,NULL,NULL),(589,106,NULL,NULL,'pending',NULL,NULL,NULL),(590,106,NULL,NULL,'pending',NULL,NULL,NULL),(591,106,NULL,NULL,'pending',NULL,NULL,NULL),(592,106,NULL,NULL,'pending',NULL,NULL,NULL),(593,106,NULL,NULL,'pending',NULL,NULL,NULL),(594,106,NULL,NULL,'pending',NULL,NULL,NULL),(595,106,NULL,NULL,'pending',NULL,NULL,NULL),(596,106,NULL,NULL,'pending',NULL,NULL,NULL),(597,89,NULL,NULL,'pending',NULL,NULL,NULL),(598,89,NULL,NULL,'pending',NULL,NULL,NULL),(599,89,NULL,NULL,'pending',NULL,NULL,NULL),(600,89,NULL,NULL,'pending',NULL,NULL,NULL),(601,89,NULL,NULL,'pending',NULL,NULL,NULL),(602,89,NULL,NULL,'pending',NULL,NULL,NULL),(603,89,NULL,NULL,'pending',NULL,NULL,NULL),(604,89,NULL,NULL,'pending',NULL,NULL,NULL),(605,89,NULL,NULL,'pending',NULL,NULL,NULL),(606,89,NULL,NULL,'pending',NULL,NULL,NULL),(607,115,NULL,NULL,'pending',NULL,NULL,NULL),(608,115,NULL,NULL,'pending',NULL,NULL,NULL),(609,115,NULL,NULL,'pending',NULL,NULL,NULL),(610,115,NULL,NULL,'pending',NULL,NULL,NULL),(611,115,NULL,NULL,'pending',NULL,NULL,NULL),(612,115,NULL,NULL,'pending',NULL,NULL,NULL),(613,115,NULL,NULL,'pending',NULL,NULL,NULL),(614,115,NULL,NULL,'pending',NULL,NULL,NULL),(615,115,NULL,NULL,'pending',NULL,NULL,NULL),(616,115,NULL,NULL,'pending',NULL,NULL,NULL),(617,89,NULL,NULL,'pending',NULL,NULL,NULL),(618,89,NULL,NULL,'pending',NULL,NULL,NULL),(619,89,NULL,NULL,'pending',NULL,NULL,NULL),(620,89,NULL,NULL,'pending',NULL,NULL,NULL),(621,89,NULL,NULL,'pending',NULL,NULL,NULL),(622,89,NULL,NULL,'pending',NULL,NULL,NULL),(623,89,NULL,NULL,'pending',NULL,NULL,NULL),(624,89,NULL,NULL,'pending',NULL,NULL,NULL),(625,89,NULL,NULL,'pending',NULL,NULL,NULL),(626,89,NULL,NULL,'pending',NULL,NULL,NULL),(629,116,NULL,NULL,'pending',NULL,NULL,NULL),(630,116,NULL,NULL,'pending',NULL,NULL,NULL),(631,116,NULL,NULL,'pending',NULL,NULL,NULL),(632,116,NULL,NULL,'pending',NULL,NULL,NULL),(633,116,NULL,NULL,'pending',NULL,NULL,NULL),(634,116,NULL,NULL,'pending',NULL,NULL,NULL),(635,116,NULL,NULL,'pending',NULL,NULL,NULL),(636,116,NULL,NULL,'pending',NULL,NULL,NULL),(637,116,NULL,NULL,'pending',NULL,NULL,NULL),(638,116,NULL,NULL,'pending',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cheque_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `customer_details`
--

LOCK TABLES `customer_details` WRITE;
/*!40000 ALTER TABLE `customer_details` DISABLE KEYS */;
INSERT INTO `customer_details` VALUES (10001,'yash','kale','yashkale711','$2a$10$q73l413H5z1EGY54Z4Hds.rtmZl7XxroQG93Cgl188aU6q0y/d6lq','Flat no 10, Omkar society,','R.T.O road, Four Bungalows,','Andheri West','Mumbai','Maharashtra',400053,NULL,'yash.kale@gmail.com','active','2024-07-22 19:59:16','N',0,'2024-07-30 19:38:34','2024-07-30 15:32:21'),(10002,'sarika','kale','sarikakale','$2a$10$nyfbIyuqzVMGjGhuWkHlJ.obCaQRsNuqKUkpFfDabpEQL6Tc2guFK','Some village','In a village','Sindewai','Nagpur','Maharashtra',50067,NULL,'sarika.kale@gmail.com','active','2024-07-23 04:25:22','N',0,'2024-07-30 08:57:32','2024-07-24 12:07:51'),(10003,'sanjay','kale','sanjaykale','$2a$10$gKdXf8mfQlfJMW8.AChHAu2gn1.H6ffmLK6j.RXySeLqmafMw8reW','Flat no 10, Omkar society,','R.T.O road, Four Bungalows,','Andheri West, Mumbai.','Mumbai','Maharashtra',400053,NULL,'sanj.kale@gmail.com','active','2024-07-24 05:22:26','N',0,'2024-07-29 08:11:35',NULL),(10004,'karthik','kaimaparambil','kskarthik','123123123','Not in Mumbai','Somewhere in Thane','Thanekar','Thane','Maharashtra',400606,NULL,'kskarthik@gmail.com','active','2024-07-24 05:24:30','N',0,'2024-07-30 11:21:47',NULL),(10005,'kartik nambiar','nambiar','kartiknambiar','$2a$10$UgjcijoCDAITf8Wwu8Hw8OrZoGP.pJqW3G.PSZfLffhcTrIpTNZJa','near oberoi','goregaon','mumbai','Mumbai','Maharashtra',400063,NULL,'kartiknambiar@gmail.com','active','2024-07-24 05:28:54','N',0,'2024-07-24 05:28:54',NULL),(10006,'Aashta','Bhatia','assthabhatia','$2a$10$j28R.6kLeNJ0KeIE9ewXquIRDtLaTb9Qq.2CdMrdfMqz1whfP8xjq','versova village','somewhere in village','andheri west','mumbai','Maharashtra',400053,NULL,'asstha.bhatia@gmail.com','active','2024-07-24 05:31:24','N',0,'2024-07-30 06:34:42',NULL),(10007,'Leelesh','Shitty','leeleshshitty','$2a$10$INjC0CoddXPKa9/X16f5N.NUNhmxwVCwrE30xz44I5ItsRh.dZQWu','Four Bungalows','Andheri West','','Mumbai','Maharashtra',400053,NULL,'leelesh.shitty@gmail.com','active','2024-07-24 05:35:25','N',0,'2024-07-24 05:35:25',NULL),(10008,'raj','majgaokar','bhikmangya','$2a$10$0SqaLsPkKD5KGZM1O5fwzegHbUlFudMqPEG1CjuBvtVl3SwvSDD1C','Somwhere on the streets','','','Mumbai','Maharashtra',400053,NULL,'bhikmangya.raj@gmail.com','active','2024-07-24 05:37:31','N',0,'2024-07-24 05:37:31',NULL),(10009,'Iron','Man','ironman','$2a$10$lCRqsu4wDeAkthHgTQ94uubndzbb2E8gKo02kxaEoNSHu2gLzv1/2','None','None','LA','LALA','LAAAA',400056,NULL,'iron.man@gmail.com','active','2024-07-30 10:42:07','N',0,'2024-07-30 10:42:07',NULL),(10010,'nitin','virutkar','nitinvirutkar','$2a$10$7k4VwfNurs7jyoeZ.KXqNuT2iUr5Q8vf27y4tCA449MbB7uMgmjnC',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'inactive','2024-08-13 10:02:54','N',0,'2024-08-13 10:02:54',NULL),(10012,'qutub','khan','qutubkhan','$2a$10$CtaGVKCFRAsGh/1hAJGSB.gPzd4es45cPOabYorscvz.8oYYWeiii','Mehboob studio','Carter road','Bandra','Mumbai','Maharashtra',400057,NULL,'qutub.khan@gmail.com','inactive','2024-08-13 10:40:23','N',0,'2024-08-13 10:40:23',NULL);
/*!40000 ALTER TABLE `customer_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `fd_details`
--

LOCK TABLES `fd_details` WRITE;
/*!40000 ALTER TABLE `fd_details` DISABLE KEYS */;
INSERT INTO `fd_details` VALUES (1,'fd_2_year',100,5.00,10001,'2024-07-31');
/*!40000 ALTER TABLE `fd_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `roi_details`
--

LOCK TABLES `roi_details` WRITE;
/*!40000 ALTER TABLE `roi_details` DISABLE KEYS */;
INSERT INTO `roi_details` VALUES (1,'fd_1_year',4.50,360),(2,'fd_2_year',5.00,720),(3,'fd_3_year',5.50,1080),(4,'overdraft_interest',10.00,1),(5,'savings_interest',6.00,30);
/*!40000 ALTER TABLE `roi_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `scheme_details`
--

LOCK TABLES `scheme_details` WRITE;
/*!40000 ALTER TABLE `scheme_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheme_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `sso`
--

LOCK TABLES `sso` WRITE;
/*!40000 ALTER TABLE `sso` DISABLE KEYS */;
/*!40000 ALTER TABLE `sso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `temp_overdraft_updates`
--

LOCK TABLES `temp_overdraft_updates` WRITE;
/*!40000 ALTER TABLE `temp_overdraft_updates` DISABLE KEYS */;
INSERT INTO `temp_overdraft_updates` VALUES (90),(91),(92),(95),(96),(97),(98),(99),(100),(101),(102),(103),(104),(105),(111),(112),(113);
/*!40000 ALTER TABLE `temp_overdraft_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES (46,'deposit',89,89,1000,'completed','2024-07-30 06:58:58'),(47,'deposit',89,89,1000,'completed','2024-07-30 07:13:59'),(48,'deposit',89,89,1000000,'completed','2024-07-30 07:14:32'),(49,'withdraw',89,89,800000,'completed','2024-07-30 07:14:58'),(50,'deposit',89,89,1000000,'completed','2024-07-30 07:47:37'),(51,'withdraw',89,89,800000,'completed','2024-07-30 07:48:01'),(52,'deposit',89,89,1000000,'completed','2024-07-30 08:01:28'),(53,'transact',93,92,1000,'completed','2024-07-31 09:43:03'),(54,'deposit',92,92,10500,'completed','2024-07-31 09:43:28'),(55,'transact',92,89,169696,'completed','2024-07-31 09:55:20'),(56,'transact',92,89,500000,'completed','2024-07-31 09:55:44'),(57,'deposit',90,90,1000,'completed','2024-08-14 07:23:23'),(58,'withdraw',90,90,1000,'completed','2024-08-14 08:37:01'),(59,'withdraw',93,93,1000,'completed','2024-08-14 08:38:50'),(60,'deposit',93,93,10000,'completed','2024-08-14 08:47:25'),(61,'withdraw',93,93,1000,'completed','2024-08-14 08:47:59'),(62,'withdraw',93,93,1000,'completed','2024-08-14 08:52:04'),(63,'withdraw',93,93,1000,'completed','2024-08-14 08:57:22'),(64,'deposit',93,93,1567,'completed','2024-08-14 08:57:55'),(65,'deposit',93,93,1000,'completed','2024-08-14 09:11:35'),(66,'deposit',93,93,1059,'completed','2024-08-14 09:16:09'),(67,'transact',91,93,10000,'completed','2024-08-14 09:43:51'),(68,'withdraw',90,90,10000,'completed','2024-08-14 09:59:22'),(69,'deposit',90,90,35000,'completed','2024-08-14 09:59:57'),(70,'deposit',90,90,35000,'completed','2024-08-14 10:01:24'),(71,'transact',92,93,10,'completed','2024-08-16 11:53:36'),(72,'withdraw',89,89,150000,'completed','2024-08-16 20:37:45');
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'banking_system_db'
--

--
-- Dumping routines for database 'banking_system_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_cheque_to_slip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_cheque_to_slip`(
    IN p_bank_slip_id INT,
    IN p_cheque_id INT,
    IN p_cheque_amount INT,
    IN p_cheque_status VARCHAR(50),
    IN p_receiver_account_id INT,
    IN p_cheque_date TIMESTAMP
)
BEGIN
    -- Assuming you want to update the cheque details with these values
    UPDATE cheque_details
    SET bank_slip_id = p_bank_slip_id,
        cheque_amount = p_cheque_amount,
        cheque_status = p_cheque_status,
        receiver_account_id = p_receiver_account_id,
        cheque_date = p_cheque_date
    WHERE cheque_id = p_cheque_id;
    
    UPDATE account_details
    SET current_balance = current_balance + p_cheque_amount
    WHERE account_id = p_receiver_account_id;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `issue_checks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `issue_checks`(IN p_customer_id BIGINT)
BEGIN
    DECLARE i INT DEFAULT 1;

    WHILE i <= 10 DO
        INSERT INTO cheque_details (sender_account_id, cheque_status)
        VALUES (
            (SELECT MAX(account_id) FROM account_details WHERE customer_id = p_customer_id), 
            'pending'
        );

        SET i = i + 1;
    END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `issue_checks_by_account_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `issue_checks_by_account_id`(IN p_account_id INT)
BEGIN
    DECLARE i INT DEFAULT 1;
   

   

    

    -- Loop to issue 10 checks with the new bank slip id
    WHILE i <= 10 DO
        INSERT INTO cheque_details (sender_account_id, cheque_status)
        VALUES (p_account_id, 'pending');

        SET i = i + 1;
    END WHILE;

    -- Deduct 50 from the account balance
    UPDATE account_details
    SET current_balance = current_balance - 50
    WHERE account_id = p_account_id;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `login_auth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `login_auth`(
    IN p_username VARCHAR(50),
    IN p_password VARCHAR(255)
)
BEGIN
    DECLARE d_stored_password VARCHAR(255);
    DECLARE d_login_attempts INT;
    DECLARE d_account_locked CHAR(1);
    DECLARE p_flag INT DEFAULT 0;

    -- Attempt to retrieve password, login attempts, and account lock status
    SELECT passwrd, login_attempts, account_locked
    INTO d_stored_password, d_login_attempts, d_account_locked
    FROM customer_details
    WHERE username = p_username;

    -- Check if no rows were returned (username not found)
    IF d_stored_password IS NULL THEN
        SET p_flag = 0; -- Username not found
    ELSE
        -- Check if the account is locked
        IF d_account_locked = 'Y' THEN
            SET p_flag = 0; -- Account is locked
        ELSE
            -- Verify the password
            IF d_stored_password = p_password THEN
                SET p_flag = 1; -- Password is correct
            ELSE
                SET p_flag = 0; -- Password is incorrect
            END IF;
        END IF;
    END IF;

    -- Return the flag as the result
    SELECT p_flag AS result;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `slip_creation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `slip_creation`(
    IN p_bank_slip_id INT,
    IN p_account_id INT,
    IN p_bank_slip_date TIMESTAMP,
    IN p_bank_slip_status VARCHAR(50)
)
BEGIN
    DECLARE v_slip_no_for_account INT DEFAULT 1;

    -- Retrieve the maximum slip number for the given account ID
    SELECT COALESCE(MAX(slip_no_for_account), 0) + 1 INTO v_slip_no_for_account
    FROM bank_slip_details
    WHERE account_id = p_account_id;

   
    INSERT INTO bank_slip_details (bank_slip_id, account_id, bank_slip_date, bank_slip_status, slip_no_for_account)
    VALUES (p_bank_slip_id, p_account_id, p_bank_slip_date, p_bank_slip_status, v_slip_no_for_account);
    
    
    UPDATE account_details
    SET current_balance = current_balance - 10
    WHERE account_id = p_account_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_overdraft_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_overdraft_balance`()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE acc_id INT;

    DECLARE cur CURSOR FOR 
    SELECT account_id FROM temp_overdraft_updates;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur;

    read_loop: LOOP
        FETCH cur INTO acc_id;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Update overdraftbalance and minimum_balance for all accounts listed in temp_overdraft_updates
        UPDATE account_details
        SET overdraftbalance = 5000,
            minimum_balance = 0
        WHERE account_id = acc_id AND overdraft_availed = TRUE;

        DELETE FROM temp_overdraft_updates WHERE account_id = acc_id;
    END LOOP;

    CLOSE cur;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_transact` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_transact`(
    IN p_payee_id INT,
    IN p_payer_id INT,
    IN p_transaction_amount INT,
    IN p_transaction_type VARCHAR(20),
    IN p_overdraftbalance INT,
    IN p_account_type VARCHAR(20),
    IN p_withdrawal_limit INT
)
BEGIN
    DECLARE v_current_balance INT;

    -- Start a transaction
    START TRANSACTION;

    -- Handle different transaction types
    IF p_transaction_type = 'deposit' THEN
        IF p_overdraftbalance < 45000 AND p_overdraftbalance + p_transaction_amount >= 45000 AND p_account_type = 'Current' THEN
            -- Partial payment towards overdraft balance
            UPDATE account_details
            SET current_balance = current_balance + (p_transaction_amount - (45000 - p_overdraftbalance)),
                overdraftbalance = 45000
            WHERE account_id = p_payee_id;
        ELSEIF p_overdraftbalance < 45000 AND p_overdraftbalance + p_transaction_amount < 45000 AND p_account_type = 'Current' THEN
            -- Full payment towards overdraft balance
            UPDATE account_details
            SET overdraftbalance = p_overdraftbalance + p_transaction_amount
            WHERE account_id = p_payee_id;
        ELSE
            -- Direct deposit to current balance
            UPDATE account_details
            SET current_balance = current_balance + p_transaction_amount
            WHERE account_id = p_payee_id;
        END IF;

        -- Insert transaction details
        INSERT INTO transaction_details (transaction_type, payee_id, payer_id, transaction_amount, transaction_status, transaction_time)
        VALUES ('deposit', p_payee_id, p_payer_id, p_transaction_amount, 'completed', NOW());

    ELSEIF p_transaction_type = 'withdraw' THEN
        -- Ensure there are sufficient funds before withdrawing
        SELECT current_balance INTO v_current_balance
        FROM account_details
        WHERE account_id = p_payer_id;

        -- Check if the transaction amount is within the withdrawal limit
        IF p_transaction_amount > p_withdrawal_limit THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction amount exceeds withdrawal limit';
        ELSEIF p_transaction_amount <= (v_current_balance + p_overdraftbalance) THEN
            IF p_transaction_amount > v_current_balance AND p_account_type = 'Current' THEN
                -- Overdraft situation
                UPDATE account_details
                SET current_balance = 0,
                    overdraftbalance = p_overdraftbalance - (p_transaction_amount - v_current_balance)
                WHERE account_id = p_payer_id;
            ELSE
                -- Sufficient balance without overdraft
                UPDATE account_details
                SET current_balance = current_balance - p_transaction_amount
                WHERE account_id = p_payer_id;
            END IF;

            -- Insert transaction details
            INSERT INTO transaction_details (transaction_type, payee_id, payer_id, transaction_amount, transaction_status, transaction_time)
            VALUES ('withdraw', p_payer_id, p_payer_id, p_transaction_amount, 'completed', NOW());
        ELSE
            -- Rollback if insufficient funds
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds';
        END IF;

    ELSEIF p_transaction_type = 'transact' THEN
        -- Ensure there are sufficient funds before withdrawing for a transaction
        SELECT current_balance INTO v_current_balance
        FROM account_details
        WHERE account_id = p_payer_id;

        -- Check if the transaction amount is within the withdrawal limit
        IF p_transaction_amount > p_withdrawal_limit THEN
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Transaction amount exceeds withdrawal limit';
        ELSEIF p_transaction_amount <= (v_current_balance + p_overdraftbalance) THEN
            IF p_transaction_amount > v_current_balance THEN
                -- Overdraft situation for transaction
                UPDATE account_details
                SET current_balance = 0,
                    overdraftbalance = p_overdraftbalance - (p_transaction_amount - v_current_balance)
                WHERE account_id = p_payer_id;

                UPDATE account_details
                SET current_balance = current_balance + p_transaction_amount
                WHERE account_id = p_payee_id;
            ELSE
                -- Sufficient balance without overdraft for transaction
                UPDATE account_details
                SET current_balance = current_balance - p_transaction_amount
                WHERE account_id = p_payer_id;

                UPDATE account_details
                SET current_balance = current_balance + p_transaction_amount
                WHERE account_id = p_payee_id;
            END IF;

            -- Insert transaction details
            INSERT INTO transaction_details (transaction_type, payee_id, payer_id, transaction_amount, transaction_status, transaction_time)
            VALUES ('transact', p_payee_id, p_payer_id, p_transaction_amount, 'completed', NOW());
        ELSE
            -- Rollback if insufficient funds
            ROLLBACK;
            SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient funds';
        END IF;

    ELSE
        -- Handle invalid transaction type
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid transaction type';
    END IF;

    -- Commit the transaction if successful
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-17  2:22:20
