-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: blood_bank
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `blood_sample`
--

DROP TABLE IF EXISTS `blood_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blood_sample` (
  `sample_id` int NOT NULL,
  `sample_bgroup` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `sample_status` enum('Pure','Contaminated') NOT NULL,
  `p_id` int NOT NULL,
  `donor_id` int NOT NULL,
  PRIMARY KEY (`sample_id`),
  KEY `p_id_idx` (`p_id`),
  KEY `donor_id_idx` (`donor_id`),
  CONSTRAINT `donor_id` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`),
  CONSTRAINT `p_id` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blood_sample`
--

LOCK TABLES `blood_sample` WRITE;
/*!40000 ALTER TABLE `blood_sample` DISABLE KEYS */;
INSERT INTO `blood_sample` VALUES (500,'AB-','Pure',1,100),(501,'O+','Pure',2,101),(502,'O-','Pure',3,103),(503,'B+','Contaminated',4,104);
/*!40000 ALTER TABLE `blood_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `blood_sample_summary`
--

DROP TABLE IF EXISTS `blood_sample_summary`;
/*!50001 DROP VIEW IF EXISTS `blood_sample_summary`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `blood_sample_summary` AS SELECT 
 1 AS `sample_id`,
 1 AS `sample_bgroup`,
 1 AS `sample_status`,
 1 AS `p_id`,
 1 AS `donor_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL,
  `department_name` varchar(45) NOT NULL,
  `department_phNo` varchar(10) NOT NULL,
  `hosp_id` int NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `hosp_id_idx` (`hosp_id`),
  CONSTRAINT `hosp_id` FOREIGN KEY (`hosp_id`) REFERENCES `hospital` (`hosp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Εντατική','2313307000',20),(2,'Ογκολογικό','2313301111',20),(3,'Ορθοπεδικό','2313312000',21),(4,'Παθολογικό','2310400000',21);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `emp_id` int NOT NULL,
  `doc_specialty` varchar(45) NOT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `emploid` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (10,'Καρδιολόγος'),(11,'Δερματολόγος'),(12,'Ογκολόγος'),(13,'Παθολόγος');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `doctor_info`
--

DROP TABLE IF EXISTS `doctor_info`;
/*!50001 DROP VIEW IF EXISTS `doctor_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `doctor_info` AS SELECT 
 1 AS `emp_id`,
 1 AS `emp_name`,
 1 AS `emp_gender`,
 1 AS `emp_phNo`,
 1 AS `doc_specialty`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donor_id` int NOT NULL,
  `donor_name` varchar(45) NOT NULL,
  `donor_age` int NOT NULL,
  `donor_gender` enum('Male','Female') NOT NULL,
  `donor_bgroup` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `donor_phNo` varchar(10) NOT NULL,
  `donor_address` varchar(45) NOT NULL,
  `emp_id` int NOT NULL,
  PRIMARY KEY (`donor_id`),
  KEY `emp_id_idx` (`emp_id`),
  CONSTRAINT `emp_id` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES (100,'Νίκος',18,'Male','A+','6994531112','Ευζώνων 10',10),(101,'Ευάγγελος',39,'Male','AB+','6934568913','Κανάκη 38',11),(103,'Μάριος',24,'Male','A-','6963890089','Μεραρχίας 32',12),(104,'Διογένης',22,'Male','O+','6903059867','Διογένη 7',13);
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int NOT NULL,
  `emp_name` varchar(45) NOT NULL,
  `emp_gender` enum('Male','Female') NOT NULL,
  `emp_age` int NOT NULL,
  `emp_phNo` varchar(10) NOT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (10,'Αντιγόνη Δημητριάδου','Female',34,'6945122457'),(11,'Δήμητρα Κουρλιου','Female',26,'6937869568'),(12,'Χρήστος Ιωαννίδης','Male',43,'6966783890'),(13,'Ιωάννης Δημητρίου','Male',39,'6903059568'),(14,'Λεωνίδας Αλεξιάδης','Male',51,'6956478778');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hospital`
--

DROP TABLE IF EXISTS `hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hospital` (
  `hosp_id` int NOT NULL,
  `hosp_name` varchar(45) NOT NULL,
  `hosp_phNo` varchar(10) NOT NULL,
  `hosp_address` varchar(45) NOT NULL,
  PRIMARY KEY (`hosp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hospital`
--

LOCK TABLES `hospital` WRITE;
/*!40000 ALTER TABLE `hospital` DISABLE KEYS */;
INSERT INTO `hospital` VALUES (20,'Αγ. Παπανικολάου','2313307000','Εξοχή, 570 10'),(21,'Θεαγένειο','2313301111','Αλ. Συμεωνίδη 2'),(22,'Ιπποκράτειο','2313312000','Α. Παπαναστασίου 50'),(23,'Διαβαλκανικό','2310400000','Λαγκαδά 196');
/*!40000 ALTER TABLE `hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nurse`
--

DROP TABLE IF EXISTS `nurse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nurse` (
  `emp_id` int NOT NULL,
  `shift_time` varchar(45) NOT NULL,
  PRIMARY KEY (`emp_id`),
  CONSTRAINT `emplid` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nurse`
--

LOCK TABLES `nurse` WRITE;
/*!40000 ALTER TABLE `nurse` DISABLE KEYS */;
INSERT INTO `nurse` VALUES (10,'Πρωινή Βάρδια'),(11,'Πρωινή Βάρδια'),(12,'Βραδινή Βάρδια');
/*!40000 ALTER TABLE `nurse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `p_id` int NOT NULL,
  `p_name` varchar(45) NOT NULL,
  `p_gender` enum('Male','Female') NOT NULL,
  `p_bgroup` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') NOT NULL,
  `p_age` int NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `department_id_idx` (`department_id`),
  CONSTRAINT `department_id` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Πέτρος Αγγέλου','Male','A+',45,1),(2,'Κυριάκος Ανδρέου','Male','O-',34,2),(3,'Άννα Σολωμού','Female','O+',56,3),(4,'Βασιλική Σαββίδου','Female','AB+',23,4);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `pay_id` int NOT NULL,
  `pay_amount` int NOT NULL,
  `pay_date` datetime NOT NULL,
  `p_id` int NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pid_idx` (`p_id`),
  CONSTRAINT `pid` FOREIGN KEY (`p_id`) REFERENCES `patient` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,5000,'2022-12-19 00:00:00',1),(2,1000,'2023-05-26 00:00:00',2),(3,500,'2023-10-10 00:00:00',3),(4,1300,'2023-10-17 00:00:00',4);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary`
--

DROP TABLE IF EXISTS `salary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary` (
  `sal_amount` int NOT NULL,
  `sal_date` date NOT NULL,
  `emp_id` int NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `empid_idx` (`emp_id`),
  CONSTRAINT `empid` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary`
--

LOCK TABLES `salary` WRITE;
/*!40000 ALTER TABLE `salary` DISABLE KEYS */;
INSERT INTO `salary` VALUES (800,'2022-11-30',10),(800,'2023-06-30',11),(1000,'2023-08-31',12),(2000,'2023-02-01',13);
/*!40000 ALTER TABLE `salary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `staff_info`
--

DROP TABLE IF EXISTS `staff_info`;
/*!50001 DROP VIEW IF EXISTS `staff_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `staff_info` AS SELECT 
 1 AS `emp_id`,
 1 AS `emp_name`,
 1 AS `emp_gender`,
 1 AS `emp_age`,
 1 AS `emp_phNo`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `blood_sample_summary`
--

/*!50001 DROP VIEW IF EXISTS `blood_sample_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `blood_sample_summary` AS select `blood_sample`.`sample_id` AS `sample_id`,`blood_sample`.`sample_bgroup` AS `sample_bgroup`,`blood_sample`.`sample_status` AS `sample_status`,`blood_sample`.`p_id` AS `p_id`,`blood_sample`.`donor_id` AS `donor_id` from `blood_sample` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `doctor_info`
--

/*!50001 DROP VIEW IF EXISTS `doctor_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `doctor_info` AS select `doctor`.`emp_id` AS `emp_id`,`employees`.`emp_name` AS `emp_name`,`employees`.`emp_gender` AS `emp_gender`,`employees`.`emp_phNo` AS `emp_phNo`,`doctor`.`doc_specialty` AS `doc_specialty` from (`employees` join `doctor`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `staff_info`
--

/*!50001 DROP VIEW IF EXISTS `staff_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `staff_info` AS select `employees`.`emp_id` AS `emp_id`,`employees`.`emp_name` AS `emp_name`,`employees`.`emp_gender` AS `emp_gender`,`employees`.`emp_age` AS `emp_age`,`employees`.`emp_phNo` AS `emp_phNo` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-16 13:48:32
