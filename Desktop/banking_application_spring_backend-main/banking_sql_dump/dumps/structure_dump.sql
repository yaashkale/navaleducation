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
-- Table structure for table `account_details`
--

DROP TABLE IF EXISTS `account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_details` (
  `account_id` bigint NOT NULL AUTO_INCREMENT,
  `customer_id` bigint DEFAULT NULL,
  `account_type` varchar(20) DEFAULT NULL,
  `current_balance` decimal(12,2) DEFAULT '0.00',
  `account_status` varchar(20) DEFAULT NULL,
  `opening_date` timestamp NULL DEFAULT NULL,
  `overdraftbalance` int DEFAULT '0',
  `withdrawal_limit` int DEFAULT '0',
  `overdraft_availed` tinyint(1) DEFAULT '0',
  `min_balance` int DEFAULT '0',
  `roi_id` int DEFAULT NULL,
  `minimum_balance` int DEFAULT '1000',
  PRIMARY KEY (`account_id`),
  KEY `acc_customer_id_fk` (`customer_id`),
  KEY `idx_account_type` (`account_type`),
  KEY `fk_roi_id` (`roi_id`),
  CONSTRAINT `acc_customer_id_fk` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`),
  CONSTRAINT `fk_roi_id` FOREIGN KEY (`roi_id`) REFERENCES `roi_details` (`roi_id`),
  CONSTRAINT `account_details_chk_1` CHECK ((`account_type` in (_utf8mb4'Savings',_utf8mb4'SAVINGS',_utf8mb4'Current',_utf8mb4'CURRENT',_utf8mb4'FD'))),
  CONSTRAINT `account_details_chk_2` CHECK ((`account_status` in (_utf8mb4'active',_utf8mb4'inactive',_utf8mb4'disabled',_utf8mb4'suspended',_utf8mb4'not found')))
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
-- Table structure for table `account_update_flags`
--

DROP TABLE IF EXISTS `account_update_flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_update_flags` (
  `account_id` int NOT NULL,
  `update_needed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admin_schema`
--

DROP TABLE IF EXISTS `admin_schema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_schema` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL,
  `passwrd` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_slip`
--

DROP TABLE IF EXISTS `bank_slip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_slip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `creation_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `bank_slip_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account_details` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bank_slip_details`
--

DROP TABLE IF EXISTS `bank_slip_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_slip_details` (
  `bank_slip_id` int NOT NULL AUTO_INCREMENT,
  `bank_slip_status` varchar(20) DEFAULT NULL,
  `bank_slip_date` timestamp NULL DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `slip_no_for_account` int DEFAULT NULL,
  PRIMARY KEY (`bank_slip_id`),
  KEY `fk_account_id` (`account_id`),
  CONSTRAINT `fk_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_details` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cheque_details`
--

DROP TABLE IF EXISTS `cheque_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cheque_details` (
  `cheque_id` bigint NOT NULL AUTO_INCREMENT,
  `sender_account_id` bigint DEFAULT NULL,
  `cheque_amount` decimal(10,2) DEFAULT NULL,
  `cheque_date` timestamp NULL DEFAULT NULL,
  `cheque_status` varchar(20) DEFAULT NULL,
  `bank_slip_id` int DEFAULT NULL,
  `receiver_account_id` int DEFAULT NULL,
  `bank_slip_details` int DEFAULT NULL,
  PRIMARY KEY (`cheque_id`),
  KEY `cheq_account_id_fk` (`sender_account_id`),
  KEY `bank_slip_id` (`bank_slip_id`),
  CONSTRAINT `bank_slip_id` FOREIGN KEY (`bank_slip_id`) REFERENCES `bank_slip_details` (`bank_slip_id`),
  CONSTRAINT `cheq_account_id_fk` FOREIGN KEY (`sender_account_id`) REFERENCES `account_details` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=639 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer_details`
--

DROP TABLE IF EXISTS `customer_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_details` (
  `customer_id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `passwrd` varchar(60) DEFAULT NULL,
  `address_line_1` varchar(50) DEFAULT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `address_line_3` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip` int DEFAULT NULL,
  `phone` bigint DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `account_status` varchar(10) DEFAULT 'inactive',
  `last_login_attempt` timestamp NULL DEFAULT NULL,
  `account_locked` char(1) DEFAULT 'N',
  `login_attempts` int DEFAULT '0',
  `last_activity_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_locked_time` datetime DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_username` (`username`),
  KEY `idx_passwrd` (`passwrd`),
  CONSTRAINT `customer_details_chk_1` CHECK ((char_length(`passwrd`) >= 8)),
  CONSTRAINT `customer_details_chk_2` CHECK ((`email` like _utf8mb4'%@%.%')),
  CONSTRAINT `customer_details_chk_3` CHECK ((`account_locked` in (_utf8mb4'Y',_utf8mb4'N')))
) ENGINE=InnoDB AUTO_INCREMENT=10013 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fd_details`
--

DROP TABLE IF EXISTS `fd_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fd_details` (
  `fd_id` int NOT NULL AUTO_INCREMENT,
  `fd_name` varchar(20) DEFAULT NULL,
  `fd_amount` int DEFAULT NULL,
  `fd_roi_value` decimal(10,2) DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `fd_duration` date DEFAULT NULL,
  PRIMARY KEY (`fd_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `fd_details_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer_details` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `roi_details`
--

DROP TABLE IF EXISTS `roi_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roi_details` (
  `roi_id` int NOT NULL AUTO_INCREMENT,
  `roi_name` varchar(20) DEFAULT NULL,
  `roi_value` decimal(10,2) DEFAULT NULL,
  `roi_duration` int DEFAULT NULL,
  PRIMARY KEY (`roi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheme_details`
--

DROP TABLE IF EXISTS `scheme_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scheme_details` (
  `scheme_id` int NOT NULL AUTO_INCREMENT,
  `scheme_name` varchar(30) DEFAULT NULL,
  `scheme_roi` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`scheme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sso`
--

DROP TABLE IF EXISTS `sso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sso` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `session_token` int DEFAULT NULL,
  `session_start_date` timestamp NULL DEFAULT NULL,
  `session_end_date` timestamp NULL DEFAULT NULL,
  `session_exists` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `temp_overdraft_updates`
--

DROP TABLE IF EXISTS `temp_overdraft_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_overdraft_updates` (
  `account_id` int NOT NULL,
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `transaction_id` int NOT NULL AUTO_INCREMENT,
  `transaction_type` varchar(20) DEFAULT NULL,
  `payee_id` bigint DEFAULT NULL,
  `payer_id` bigint DEFAULT NULL,
  `transaction_amount` bigint NOT NULL,
  `transaction_status` varchar(20) DEFAULT NULL,
  `transaction_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  KEY `payee_account_id_fk` (`payee_id`),
  KEY `payer_account_id_fk` (`payer_id`),
  CONSTRAINT `payee_account_id_fk` FOREIGN KEY (`payee_id`) REFERENCES `account_details` (`account_id`),
  CONSTRAINT `payer_account_id_fk` FOREIGN KEY (`payer_id`) REFERENCES `account_details` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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

-- Dump completed on 2024-08-17  2:21:58
