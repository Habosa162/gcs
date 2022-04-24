-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: gcs
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Temporary view structure for view `acceptedtasksview`
--

DROP TABLE IF EXISTS `acceptedtasksview`;
/*!50001 DROP VIEW IF EXISTS `acceptedtasksview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `acceptedtasksview` AS SELECT 
 1 AS `id`,
 1 AS `room`,
 1 AS `problem`,
 1 AS `department_id`,
 1 AS `start_time`,
 1 AS `department_time`,
 1 AS `worker`,
 1 AS `note`,
 1 AS `requested_by`,
 1 AS `status`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `closedtasksview`
--

DROP TABLE IF EXISTS `closedtasksview`;
/*!50001 DROP VIEW IF EXISTS `closedtasksview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `closedtasksview` AS SELECT 
 1 AS `id`,
 1 AS `room`,
 1 AS `problem`,
 1 AS `department`,
 1 AS `status`,
 1 AS `start_time`,
 1 AS `department_time`,
 1 AS `end_time`,
 1 AS `worker`,
 1 AS `duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `task_id` int NOT NULL,
  `body` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (58,10,282,'undefined'),(59,10,283,'undefined'),(60,10,296,'undefined'),(61,10,299,'undefined'),(62,16,301,'undefined');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `get_task` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'IT',0),(2,'Front Office',0),(3,'Engineering',1),(4,'House Keeping',1),(5,'GM',0),(6,'Master',0);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `openedtasks`
--

DROP TABLE IF EXISTS `openedtasks`;
/*!50001 DROP VIEW IF EXISTS `openedtasks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `openedtasks` AS SELECT 
 1 AS `id`,
 1 AS `room`,
 1 AS `depratment`,
 1 AS `problem`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `problem`
--

DROP TABLE IF EXISTS `problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  `time` time NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `problem_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problem`
--

LOCK TABLES `problem` WRITE;
/*!40000 ALTER TABLE `problem` DISABLE KEYS */;
INSERT INTO `problem` VALUES (7,'lamb','00:15:00',3),(8,'towles','00:15:00',4),(9,'Room clean','00:30:00',4),(10,'safe Box','00:34:00',4);
/*!40000 ALTER TABLE `problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `problemview`
--

DROP TABLE IF EXISTS `problemview`;
/*!50001 DROP VIEW IF EXISTS `problemview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `problemview` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `time`,
 1 AS `department_id`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_user_id` int NOT NULL,
  `to_user_id` int NOT NULL,
  `task_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `from_user_id` (`from_user_id`),
  KEY `to_user_id` (`to_user_id`),
  KEY `task_id` (`task_id`),
  CONSTRAINT `request_ibfk_1` FOREIGN KEY (`from_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_ibfk_2` FOREIGN KEY (`to_user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `request_ibfk_3` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `requestedtasks`
--

DROP TABLE IF EXISTS `requestedtasks`;
/*!50001 DROP VIEW IF EXISTS `requestedtasks`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `requestedtasks` AS SELECT 
 1 AS `id`,
 1 AS `room`,
 1 AS `department_id`,
 1 AS `problem`,
 1 AS `department`,
 1 AS `status`,
 1 AS `start_time`,
 1 AS `note`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `dep_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'IT manger',1),(2,'general manager',5),(3,'front office',2),(4,'House keeping O.T',4),(5,'Engineering O.T',3),(6,'Engineering Worker',3),(7,'House keeping Worker',4);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'12c'),(2,'134');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'ASSIGNED'),(2,'IN PROGRESS'),(3,'FIXED'),(4,'CONFIRMED'),(5,'RE OPENED');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `systemusers`
--

DROP TABLE IF EXISTS `systemusers`;
/*!50001 DROP VIEW IF EXISTS `systemusers`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `systemusers` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `username`,
 1 AS `department`,
 1 AS `role`,
 1 AS `hiredate`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `problem_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `fo_id` int DEFAULT NULL,
  `ot_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `room_id` int NOT NULL,
  `opened` int DEFAULT NULL,
  `accepted_department` tinyint(1) DEFAULT '0',
  `confirmed` tinyint(1) DEFAULT '0',
  `reopened` tinyint(1) DEFAULT '0',
  `start_time` datetime DEFAULT NULL,
  `department_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `confirmed_time` datetime DEFAULT NULL,
  `duration_time` datetime DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `problem_id` (`problem_id`),
  KEY `department_id` (`department_id`),
  KEY `fo_id` (`fo_id`),
  KEY `ot_id` (`ot_id`),
  KEY `status_id` (`status_id`),
  KEY `room_id` (`room_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (282,8,4,15,NULL,4,2,0,1,1,1,'2022-02-11 03:25:43','2022-02-11 03:26:10','2022-02-11 03:31:44','2022-02-11 03:32:03',NULL,'undefined'),(283,8,4,15,NULL,5,2,1,1,0,1,'2022-02-11 03:25:45','2022-02-11 03:32:18','2022-02-11 03:32:27',NULL,NULL,'undefined'),(284,10,4,15,NULL,1,2,1,0,0,0,'2022-02-11 03:35:03',NULL,NULL,NULL,NULL,'undefined'),(285,10,4,15,NULL,1,2,1,0,0,0,'2022-02-11 03:35:04',NULL,NULL,NULL,NULL,'undefined'),(286,10,4,15,NULL,1,1,1,0,0,0,'2022-02-11 05:57:33',NULL,NULL,NULL,NULL,'undefined'),(287,8,4,15,NULL,1,2,1,0,0,0,'2022-02-11 05:59:22',NULL,NULL,NULL,NULL,'undefined'),(288,9,4,15,NULL,1,2,1,0,0,0,'2022-02-11 06:02:57',NULL,NULL,NULL,NULL,'undefined'),(289,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:03:34',NULL,NULL,NULL,NULL,'undefined'),(290,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:03:52',NULL,NULL,NULL,NULL,'undefined'),(291,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:03:58',NULL,NULL,NULL,NULL,'undefined'),(292,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:04:00',NULL,NULL,NULL,NULL,'undefined'),(293,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:05:03',NULL,NULL,NULL,NULL,'undefined'),(294,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:05:11',NULL,NULL,NULL,NULL,'undefined'),(295,9,4,15,NULL,1,1,1,0,0,0,'2022-02-11 06:05:12',NULL,NULL,NULL,NULL,'undefined'),(296,9,4,15,NULL,5,2,1,1,0,1,'2022-02-11 06:06:16','2022-02-11 06:06:54','2022-02-11 06:07:31',NULL,NULL,'undefined'),(297,8,4,15,NULL,1,2,1,0,0,0,'2022-02-11 06:08:53',NULL,NULL,NULL,NULL,'undefined'),(298,8,4,15,NULL,1,2,1,0,0,0,'2022-02-11 06:08:53',NULL,NULL,NULL,NULL,'undefined'),(299,10,4,15,NULL,3,2,0,1,0,0,'2022-02-12 06:16:15','2022-02-12 06:16:52','2022-02-12 06:17:14',NULL,NULL,'undefined'),(300,7,3,15,NULL,1,2,1,0,0,0,'2022-04-20 01:12:34',NULL,NULL,NULL,NULL,'this is important room'),(301,7,3,15,NULL,3,2,0,1,0,0,'2022-04-20 01:12:37','2022-04-20 01:15:59','2022-04-20 01:16:28',NULL,NULL,'this is important room');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `taskview`
--

DROP TABLE IF EXISTS `taskview`;
/*!50001 DROP VIEW IF EXISTS `taskview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `taskview` AS SELECT 
 1 AS `id`,
 1 AS `room`,
 1 AS `problem`,
 1 AS `department`,
 1 AS `status`,
 1 AS `opened`,
 1 AS `accepted_department`,
 1 AS `confirmed`,
 1 AS `start_time`,
 1 AS `department_time`,
 1 AS `end_time`,
 1 AS `confirmed_time`,
 1 AS `duration`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `taskworker`
--

DROP TABLE IF EXISTS `taskworker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskworker` (
  `task_id` int NOT NULL,
  `worker_id` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `worker_id` (`worker_id`),
  CONSTRAINT `taskworker_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `taskworker_ibfk_2` FOREIGN KEY (`worker_id`) REFERENCES `worker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskworker`
--

LOCK TABLES `taskworker` WRITE;
/*!40000 ALTER TABLE `taskworker` DISABLE KEYS */;
INSERT INTO `taskworker` VALUES (282,10,18),(283,11,19),(296,11,20),(299,8,21),(301,1,22);
/*!40000 ALTER TABLE `taskworker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role_id` int NOT NULL,
  `dep_id` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `hiredate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_ibfk_1` (`dep_id`),
  KEY `user_ibfk_2` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`dep_id`) REFERENCES `department` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (2,'habosa','mohamed','$2b$06$GrxDd2MkwOtv260sMBAsFuuLGDFeBn.xgxgKpgVZwzg0CFQ8gmSWy',1,1,1,NULL),(3,'habosa1','mohamed','$2b$06$yuxB3JrWllw050iHEeAqB.BK38riV0b6yMN.vEOEBCiPVAh1M9lsm',1,1,1,NULL),(4,'habosa3','mohamed','$2b$06$n7k/PgVmyrBCSQ9Cyx1Oc.swEz4LhbuDRWBN40siTQx1NaY3VirK2',1,1,1,NULL),(7,'hambozo','hambozoo','$2b$06$AE4sj.sEEmXgWuU0tYKTBuFDQSK5cHcIbn3XpbbORXQ3ggwO965TK',6,3,1,NULL),(8,'m.hany','hambozoo','$2b$06$OQNRfbolALMEO9IZDFhMxON9wH/Ql2GEZ1Uk5L1z.95dJ9uuh8Px.',5,3,1,NULL),(9,'sssssssssssss','undefined','$2b$06$lgf/VklXBA6TEBvH.zzgVediRZPXywQMf1aOizusHafM01fA.6Yw.',4,2,1,NULL),(10,'hk1','undefined','$2b$06$m16xEwm/lsBVyx5DJCN05OJ9p1GojvGPm4QAkopoykTqFE9N1meHC',4,4,1,NULL),(11,'ssssssssssssss','undefined','$2b$06$pD26CvB0JB68Yq6GR54Ne.kTUXoe6AB0dxSrN1cREEHKH0HIh3XOG',4,2,1,NULL),(12,'mohamed','undefined','$2b$06$D..neQ19Ry6TnXfuaxTnmOhGs4cHE.zGLHBftr7BGsYn9f9eDzdyG',4,4,1,NULL),(13,'hk3','mohamed','$2b$06$nrtBRaAr1ZB1UhKD0VSy2.3WNy4LaKxz5POQhdmurXJX8Nakw1f8.',4,4,1,NULL),(14,'hk4','mohamed','$2b$06$nm5tZ99mkkrxscpTLxkgBuk1e9pFqKnVbbI8MzDsntX4koxDqaQkS',4,4,1,NULL),(15,'fo1','mahrous','$2b$06$7xRP7tRU6/n5aZZ7TU5YJ.85OsHyPTKS/C9QuR/YXlIw4/SRs.7P2',3,2,1,NULL),(16,'eng1','mohamed hany','$2b$06$Yh.V9U2O55ElKuwhG.IvNupRa22rLi6tQtvrlqb4I4zE3..FtrQmG',5,3,1,NULL),(17,'hk10','mohamed hany','$2b$06$YvPl4T9tShUItcVJ54Vs7eDoVlwEqRZD.BBhhoOccs9n7si5jsMEa',4,4,1,NULL),(18,'fo1','mohamed','$2b$06$aNwcGQxRAvzILUfBMvIoYusiVEPwlmziB6kcSaw.2wxF6MdQNwWbi',3,2,1,NULL),(19,'malak','malak hany','$2b$06$QlzzQp9cpHS19Jb//iTqYuWIfffksW1WsD/arcELJNeMsFpoT.nZK',3,2,1,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userstatus`
--

DROP TABLE IF EXISTS `userstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userstatus` (
  `id` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userstatus`
--

LOCK TABLES `userstatus` WRITE;
/*!40000 ALTER TABLE `userstatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `userstatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `usersview`
--

DROP TABLE IF EXISTS `usersview`;
/*!50001 DROP VIEW IF EXISTS `usersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `usersview` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `username`,
 1 AS `password`,
 1 AS `department_id`,
 1 AS `department`,
 1 AS `role_id`,
 1 AS `role`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `worker`
--

DROP TABLE IF EXISTS `worker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `worker` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `department_id` int NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `worker_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `worker`
--

LOCK TABLES `worker` WRITE;
/*!40000 ALTER TABLE `worker` DISABLE KEYS */;
INSERT INTO `worker` VALUES (1,'mahros','mahros',3,1),(2,'mahmoud11','mahmoud',3,1),(5,'atia22','attia',4,1),(8,'ibrahem77','ibrahem mohamed',4,1),(9,'mohamed','hany sayed',3,1),(10,'fathy1','fathy',4,1),(11,'shawky66','shawky',4,1),(12,'marco44','marco',4,1),(13,'attia16','attia mohamed',4,1),(14,'ibrahem elabyad','ibrahem elabyad',4,1);
/*!40000 ALTER TABLE `worker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `workerview`
--

DROP TABLE IF EXISTS `workerview`;
/*!50001 DROP VIEW IF EXISTS `workerview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `workerview` AS SELECT 
 1 AS `id`,
 1 AS `username`,
 1 AS `name`,
 1 AS `department`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `acceptedtasksview`
--

/*!50001 DROP VIEW IF EXISTS `acceptedtasksview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `acceptedtasksview` AS select `task`.`id` AS `id`,`room`.`number` AS `room`,`problem`.`name` AS `problem`,`task`.`department_id` AS `department_id`,`task`.`start_time` AS `start_time`,`task`.`department_time` AS `department_time`,`worker`.`name` AS `worker`,`task`.`note` AS `note`,`user`.`username` AS `requested_by`,`status`.`name` AS `status`,`department`.`name` AS `department` from (((((((`task` join `taskworker` on((`taskworker`.`task_id` = `task`.`id`))) join `worker` on((`taskworker`.`worker_id` = `worker`.`id`))) join `problem` on((`task`.`problem_id` = `problem`.`id`))) left join `user` on((`task`.`fo_id` = `user`.`id`))) join `room` on((`room`.`id` = `task`.`room_id`))) join `status` on((`status`.`id` = `task`.`status_id`))) join `department` on((`department`.`id` = `task`.`department_id`))) where ((`task`.`accepted_department` = 1) and (`task`.`opened` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `closedtasksview`
--

/*!50001 DROP VIEW IF EXISTS `closedtasksview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `closedtasksview` AS select `task`.`id` AS `id`,`room`.`number` AS `room`,`problem`.`name` AS `problem`,`department`.`name` AS `department`,`status`.`name` AS `status`,`task`.`start_time` AS `start_time`,`task`.`department_time` AS `department_time`,`task`.`end_time` AS `end_time`,`worker`.`name` AS `worker`,timediff(`task`.`end_time`,`task`.`department_time`) AS `duration` from ((((((`task` join `department` on((`task`.`department_id` = `department`.`id`))) join `problem` on((`task`.`problem_id` = `problem`.`id`))) join `taskworker` on((`taskworker`.`task_id` = `task`.`id`))) join `worker` on((`worker`.`id` = `taskworker`.`worker_id`))) join `room` on((`room`.`id` = `task`.`room_id`))) join `status` on((`status`.`id` = `task`.`status_id`))) where ((`task`.`opened` = 0) and (`task`.`confirmed` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `openedtasks`
--

/*!50001 DROP VIEW IF EXISTS `openedtasks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `openedtasks` AS select `task`.`id` AS `id`,`room`.`number` AS `room`,`department`.`name` AS `depratment`,`problem`.`name` AS `problem`,`status`.`name` AS `status` from ((((`task` join `room` on((`room`.`id` = `task`.`room_id`))) join `department` on((`department`.`id` = `task`.`department_id`))) join `problem` on((`problem`.`id` = `task`.`problem_id`))) join `status` on((`status`.`id` = `task`.`status_id`))) where (`task`.`opened` <> 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `problemview`
--

/*!50001 DROP VIEW IF EXISTS `problemview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `problemview` AS select `problem`.`id` AS `id`,`problem`.`name` AS `name`,`problem`.`time` AS `time`,`problem`.`department_id` AS `department_id`,`department`.`name` AS `department` from (`problem` join `department` on((`department`.`id` = `problem`.`department_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `requestedtasks`
--

/*!50001 DROP VIEW IF EXISTS `requestedtasks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `requestedtasks` AS select `task`.`id` AS `id`,`room`.`number` AS `room`,`task`.`department_id` AS `department_id`,`problem`.`name` AS `problem`,`department`.`name` AS `department`,`status`.`name` AS `status`,`task`.`start_time` AS `start_time`,`task`.`note` AS `note` from ((((`task` join `department` on((`task`.`department_id` = `department`.`id`))) join `problem` on((`task`.`problem_id` = `problem`.`id`))) join `room` on((`room`.`id` = `task`.`room_id`))) join `status` on((`status`.`id` = `task`.`status_id`))) where ((`task`.`opened` = 1) and (`task`.`accepted_department` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `systemusers`
--

/*!50001 DROP VIEW IF EXISTS `systemusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `systemusers` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`user`.`username` AS `username`,`department`.`name` AS `department`,`role`.`name` AS `role`,`user`.`hiredate` AS `hiredate`,`user`.`active` AS `active` from ((`user` join `department` on((`department`.`id` = `user`.`dep_id`))) join `role` on((`role`.`id` = `user`.`role_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `taskview`
--

/*!50001 DROP VIEW IF EXISTS `taskview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `taskview` AS select `task`.`id` AS `id`,`room`.`number` AS `room`,`problem`.`name` AS `problem`,`department`.`name` AS `department`,`status`.`name` AS `status`,`task`.`opened` AS `opened`,`task`.`accepted_department` AS `accepted_department`,`task`.`confirmed` AS `confirmed`,`task`.`start_time` AS `start_time`,`task`.`department_time` AS `department_time`,`task`.`end_time` AS `end_time`,`task`.`confirmed_time` AS `confirmed_time`,`task`.`duration_time` AS `duration` from ((((`task` join `room` on((`room`.`id` = `task`.`room_id`))) join `department` on((`department`.`id` = `task`.`department_id`))) join `status` on((`status`.`id` = `task`.`status_id`))) join `problem` on((`problem`.`id` = `task`.`problem_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `usersview`
--

/*!50001 DROP VIEW IF EXISTS `usersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `usersview` AS select `user`.`id` AS `id`,`user`.`name` AS `name`,`user`.`username` AS `username`,`user`.`password` AS `password`,`user`.`dep_id` AS `department_id`,`department`.`name` AS `department`,`role`.`id` AS `role_id`,`role`.`name` AS `role` from ((`user` join `department` on((`user`.`dep_id` = `department`.`id`))) join `role` on((`user`.`role_id` = `role`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `workerview`
--

/*!50001 DROP VIEW IF EXISTS `workerview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `workerview` AS select `worker`.`id` AS `id`,`worker`.`username` AS `username`,`worker`.`name` AS `name`,`department`.`name` AS `department` from (`worker` join `department` on((`department`.`id` = `worker`.`department_id`))) */;
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

-- Dump completed on 2022-04-24 15:21:45
