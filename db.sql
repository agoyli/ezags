-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: ezags_db
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_log` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint unsigned DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint unsigned DEFAULT NULL,
  `properties` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `subject` (`subject_type`,`subject_id`),
  KEY `causer` (`causer_type`,`causer_id`),
  KEY `activity_log_log_name_index` (`log_name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
INSERT INTO `activity_log` VALUES (1,'default','updated','App\\Models\\Human',17,'App\\Models\\User',1,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": 2, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 1, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 2, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 1, \"last_name\": null, \"mother_id\": null, \"first_name\": \"Amanow\", \"middle_name\": null}}','2021-08-08 03:32:16','2021-08-08 03:32:16'),(2,'default','created','App\\Models\\Human',18,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:08:26','2021-08-08 04:08:26'),(3,'default','created','App\\Models\\Human',19,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:08:57','2021-08-08 04:08:57'),(4,'default','created','App\\Models\\Human',20,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:10:49','2021-08-08 04:10:49'),(5,'default','created','App\\Models\\Human',21,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:15:29','2021-08-08 04:15:29'),(6,'default','created','App\\Models\\Human',22,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:16:23','2021-08-08 04:16:23'),(7,'default','updated','App\\Models\\Human',22,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": null, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": 2, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:16:30','2021-08-08 04:16:30'),(8,'default','updated','App\\Models\\Human',22,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": null, \"mother_id\": 2, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 2, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:16:30','2021-08-08 04:16:30'),(9,'default','updated','App\\Models\\Human',22,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 2, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 2, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:16:30','2021-08-08 04:16:30'),(10,'default','updated','App\\Models\\Human',22,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 2, \"first_name\": null, \"middle_name\": \"Amanowna\"}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 2, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:16:30','2021-08-08 04:16:30'),(11,'default','created','App\\Models\\Human',23,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:19:09','2021-08-08 04:19:09'),(12,'default','created','App\\Models\\Human',24,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"parent\", \"birthday\": \"1984-05-04T00:00:00.000000Z\", \"passport\": \"I-AS9876543\", \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:19:09','2021-08-08 04:19:09'),(13,'default','updated','App\\Models\\Human',24,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"parent\", \"birthday\": \"1984-05-04T00:00:00.000000Z\", \"passport\": \"I-AS9876543\", \"father_id\": null, \"is_orphan\": null, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"parent\", \"birthday\": \"1984-05-04T00:00:00.000000Z\", \"passport\": \"I-AS9876543\", \"father_id\": null, \"is_orphan\": 0, \"last_name\": \"Amanowa\", \"mother_id\": null, \"first_name\": \"Meretgul\", \"middle_name\": \"Myradowna\"}}','2021-08-08 04:19:09','2021-08-08 04:19:09'),(14,'default','created','App\\Models\\Human',25,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:20:23','2021-08-08 04:20:23'),(15,'default','updated','App\\Models\\Human',24,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"parent\", \"birthday\": \"1984-05-04T00:00:00.000000Z\", \"passport\": \"I-AS9876543\", \"father_id\": null, \"is_orphan\": 0, \"last_name\": \"Amanowa\", \"mother_id\": null, \"first_name\": \"Meretgul\", \"middle_name\": \"Myradowna\"}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"parent\", \"birthday\": \"2021-08-06T00:00:00.000000Z\", \"passport\": \"I-AS9876543\", \"father_id\": null, \"is_orphan\": 0, \"last_name\": \"Amanowa\", \"mother_id\": null, \"first_name\": \"Meretgul\", \"middle_name\": \"Myradowna\"}}','2021-08-08 04:20:23','2021-08-08 04:20:23'),(16,'default','updated','App\\Models\\Human',25,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": null, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:20:29','2021-08-08 04:20:29'),(17,'default','updated','App\\Models\\Human',25,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:20:29','2021-08-08 04:20:29'),(18,'default','updated','App\\Models\\Human',25,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:20:29','2021-08-08 04:20:29'),(19,'default','updated','App\\Models\\Human',25,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:20:29','2021-08-08 04:20:29'),(20,'default','created','App\\Models\\Human',26,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 2, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:29:10','2021-08-08 04:29:10'),(21,'default','created','App\\Models\\Human',27,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:32:26','2021-08-08 04:32:26'),(22,'default','updated','App\\Models\\Human',27,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": null, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:32:26','2021-08-08 04:32:26'),(23,'default','updated','App\\Models\\Human',27,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:32:26','2021-08-08 04:32:26'),(24,'default','updated','App\\Models\\Human',27,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:32:26','2021-08-08 04:32:26'),(25,'default','updated','App\\Models\\Human',27,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-08-08T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:32:26','2021-08-08 04:32:26'),(26,'default','created','App\\Models\\Human',28,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:33:34','2021-08-08 04:33:34'),(27,'default','updated','App\\Models\\Human',28,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": null, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:33:34','2021-08-08 04:33:34'),(28,'default','updated','App\\Models\\Human',28,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:33:34','2021-08-08 04:33:34'),(29,'default','updated','App\\Models\\Human',28,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:33:34','2021-08-08 04:33:34'),(30,'default','updated','App\\Models\\Human',28,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-07-31T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:33:34','2021-08-08 04:33:34'),(31,'default','created','App\\Models\\Human',29,'App\\Models\\User',10,'{\"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:34:48','2021-08-08 04:34:48'),(32,'default','updated','App\\Models\\Human',29,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": null, \"is_orphan\": null, \"last_name\": null, \"mother_id\": null, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:34:59','2021-08-08 04:34:59'),(33,'default','updated','App\\Models\\Human',29,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": null, \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}}','2021-08-08 04:34:59','2021-08-08 04:34:59'),(34,'default','updated','App\\Models\\Human',29,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": null}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:34:59','2021-08-08 04:34:59'),(35,'default','updated','App\\Models\\Human',29,'App\\Models\\User',10,'{\"old\": {\"notes\": null, \"state\": null, \"gender\": \"1\", \"nation\": null, \"region\": null, \"status\": \"birth\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": null, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}, \"attributes\": {\"notes\": null, \"state\": null, \"gender\": 1, \"nation\": null, \"region\": null, \"status\": \"new-name\", \"birthday\": \"2021-08-07T00:00:00.000000Z\", \"passport\": null, \"father_id\": 3, \"is_orphan\": 0, \"last_name\": \"Geldiyewa\", \"mother_id\": 24, \"first_name\": null, \"middle_name\": \"Amanowna\"}}','2021-08-08 04:34:59','2021-08-08 04:34:59');
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_rows`
--

DROP TABLE IF EXISTS `data_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_rows` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_rows`
--

LOCK TABLES `data_rows` WRITE;
/*!40000 ALTER TABLE `data_rows` DISABLE KEYS */;
INSERT INTO `data_rows` VALUES (1,1,'id','number','ID',1,0,0,0,0,0,NULL,1),(2,1,'name','text','Name',1,1,1,1,1,1,NULL,2),(3,1,'email','text','Email',1,1,1,1,1,1,NULL,3),(4,1,'password','password','Password',1,0,0,1,1,0,NULL,4),(5,1,'remember_token','text','Remember Token',0,0,0,0,0,0,NULL,5),(6,1,'created_at','timestamp','Created At',0,1,1,0,0,0,NULL,6),(7,1,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,7),(8,1,'avatar','image','Avatar',0,1,1,1,1,1,NULL,8),(9,1,'user_belongsto_role_relationship','relationship','Role',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}',10),(10,1,'user_belongstomany_role_relationship','relationship','Roles',0,1,1,1,1,0,'{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}',11),(11,1,'settings','hidden','Settings',0,0,0,0,0,0,NULL,12),(12,2,'id','number','ID',1,0,0,0,0,0,NULL,1),(13,2,'name','text','Name',1,1,1,1,1,1,NULL,2),(14,2,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(15,2,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(16,3,'id','number','ID',1,0,0,0,0,0,NULL,1),(17,3,'name','text','Name',1,1,1,1,1,1,NULL,2),(18,3,'created_at','timestamp','Created At',0,0,0,0,0,0,NULL,3),(19,3,'updated_at','timestamp','Updated At',0,0,0,0,0,0,NULL,4),(20,3,'display_name','text','Display Name',1,1,1,1,1,1,NULL,5),(21,1,'role_id','text','Role',1,1,1,1,1,1,NULL,9),(22,5,'id','text','Id',1,0,0,0,0,0,'{}',1),(23,5,'number','text','Belgi',1,1,1,1,1,1,'{}',2),(24,5,'birthday','date','Doglan senesi',1,0,1,1,1,1,'{}',3),(25,5,'gender','select_dropdown','Jynsy',1,1,1,1,1,1,'{\"default\":\"\",\"options\":{\"1\":\"Gyz\",\"2\":\"Oglan\"}}',4),(26,5,'first_name','text','Ady',0,1,1,1,1,1,'{}',5),(27,5,'last_name','text','Familiýasy',0,1,1,1,1,1,'{}',6),(28,5,'middle_name','text','Atasynyň ady',0,1,1,1,1,1,'{}',7),(29,5,'nation','text','Milleti',0,0,1,1,1,1,'{}',8),(30,5,'state','text','Welaýat',0,0,1,1,1,1,'{}',9),(31,5,'region','text','Etrap',0,0,1,1,1,1,'{}',10),(32,5,'passport','text','Passport belgi',0,0,1,1,1,1,'{}',11),(33,5,'mother_id','select_dropdown','Ejesi',0,0,1,1,1,1,'{\"relationship\":{\"key\":\"id\",\"label\":\"full_name\"},\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- \\u00ddok --\"}}',12),(34,5,'father_id','select_dropdown','Kakasy',0,0,1,1,1,1,'{\"relationship\":{\"key\":\"id\",\"label\":\"full_name\"},\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- \\u00ddok --\"}}',13),(35,5,'status','select_dropdown','Ýagdaýy',1,1,1,1,1,1,'{\"default\":\"\",\"options\":{\"birth\":\"Hasaba alyn\\u00fdar\",\"new-name\":\"T\\u00e4ze at dakyl\\u00fdar\",\"check\":\"Tassyklanyl\\u00fdar\",\"child\":\"Tassyklanan\",\"orphan\":\"\\u00ddetim galan\",\"parent\":\"Ene-ata\"}}',14),(36,5,'notes','text_area','Bellikler',0,0,1,1,1,1,'{}',15),(37,5,'created_at','timestamp','Döredilen wagty',0,0,1,1,0,1,'{}',16),(38,5,'updated_at','timestamp','Üýtgedilen wagty',0,0,0,0,0,0,'{}',17),(39,5,'is_orphan','checkbox','Ýetim',1,1,1,1,1,1,'{}',18),(40,7,'id','text','Id',1,0,0,0,0,0,'{}',1),(41,7,'log_name','text','Hereket kanaly',0,0,1,1,1,1,'{}',2),(42,7,'description','text','Hereket',1,1,1,1,1,1,'{}',3),(43,7,'subject_type','select_dropdown','Obýekt',0,1,1,1,1,1,'{\"relationship\":{\"key\":\"id\",\"label\":\"toString\"},\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- \\u00ddok --\"}}',4),(44,7,'subject_id','text','Obýekt id',0,0,1,1,1,1,'{}',5),(45,7,'causer_type','text','Ýerine ýetiriji',0,0,1,1,1,1,'{}',6),(46,7,'causer_id','text','Ýerine ýetiriji id',0,0,1,1,1,1,'{}',7),(47,7,'properties','text','Atributlar',0,0,1,1,1,1,'{}',8),(48,7,'created_at','timestamp','Döredilen wagty',0,1,1,1,0,1,'{}',9),(49,7,'updated_at','timestamp','Üýtgedilen wagty',0,0,0,0,0,0,'{}',10),(50,7,'activity_log_belongsto_user_relationship','relationship','Ulanyjy',0,1,1,1,1,1,'{\"model\":\"\\\\App\\\\Models\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"causer_id\",\"key\":\"id\",\"label\":\"email\",\"pivot_table\":\"activity_log\",\"pivot\":\"0\",\"taggable\":\"0\"}',11);
/*!40000 ALTER TABLE `data_rows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_types`
--

DROP TABLE IF EXISTS `data_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_types`
--

LOCK TABLES `data_types` WRITE;
/*!40000 ALTER TABLE `data_types` DISABLE KEYS */;
INSERT INTO `data_types` VALUES (1,'users','users','User','Users','voyager-person','TCG\\Voyager\\Models\\User','TCG\\Voyager\\Policies\\UserPolicy','TCG\\Voyager\\Http\\Controllers\\VoyagerUserController','',1,0,NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(2,'menus','menus','Menu','Menus','voyager-list','TCG\\Voyager\\Models\\Menu',NULL,'','',1,0,NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(3,'roles','roles','Role','Roles','voyager-lock','TCG\\Voyager\\Models\\Role',NULL,'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController','',1,0,NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(5,'humans','humans','Raýat','Raýatlar','voyager-group','App\\Models\\Human',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-08-08 01:44:17','2021-08-08 01:56:28'),(7,'activity_log','activity-log','Hereket','Hereketler','voyager-flashlight','Spatie\\Activitylog\\Models\\Activity',NULL,NULL,NULL,1,0,'{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}','2021-08-08 03:39:04','2021-08-08 04:01:01');
/*!40000 ALTER TABLE `data_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `files` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `human_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'ACB1245','judgment','2021-08-02','[]',10,'2021-08-07 15:59:57','2021-08-07 15:59:57'),(2,'ACB1245','judgment','2021-08-02','[]',11,'2021-08-07 16:00:33','2021-08-07 16:00:33'),(3,'ACB1245','judgment','2021-08-02','[]',12,'2021-08-07 16:00:52','2021-08-07 16:00:52'),(4,'ACB1245','judgment','2021-08-02','[\"YO8A2JmZ5vhwfU20RyvhyNhOtXxNXhNPFRHyARkn.jpg\",\"smLC1EHEawNaGkE4p4IHSnBg4EHyRkFwfAtaFEcG.jpg\"]',13,'2021-08-07 16:03:25','2021-08-07 16:03:25'),(5,'AB123123','judgment','2021-08-03','[]',13,'2021-08-07 16:03:25','2021-08-07 16:03:25'),(6,'ACB1245','judgment','2021-08-02','[\"z1xdo7ngcJFJlnwKOJxk2vqnybj8dTLml3H66HjR.jpg\",\"jwVaQvecP33CSeM0dsMEMy7j1PMtnDUCRopH54WU.jpg\"]',14,'2021-08-07 16:03:40','2021-08-07 16:03:40'),(7,'AB123123','judgment','2021-08-03','[]',14,'2021-08-07 16:03:40','2021-08-07 16:03:40'),(8,'ACB1245','judgment','2021-08-02','[\"hw9j8quJSqbODgPK6VM1Zt9qOmiapoURIA7uOKE7.jpg\",\"9Td5X3peRwXBH2v5Uy6L7p6t8wOpElBsauZsXW3X.jpg\"]',15,'2021-08-07 16:04:07','2021-08-07 16:04:07'),(9,'AB123123','judgment','2021-08-03','[]',15,'2021-08-07 16:04:07','2021-08-07 16:04:07'),(10,'ACB1245','judgment','2021-08-02','[\"storage\\/documents\\/AVhuskftf6cpMh5M5YeajbLIKhyzT5WsjJKnsTRs.jpg\",\"storage\\/documents\\/4obkeNXaMGoKumQDQchbPWthly3elhzLq7s2rDQs.jpg\"]',16,'2021-08-07 16:04:56','2021-08-07 16:04:56'),(11,'AB123123','judgment','2021-08-03','[\"storage\\/documents\\/31QbjmmGT5d5wYyCLbHox2RTSSQinVZbfqlD4GbL.jpg\"]',16,'2021-08-07 16:04:56','2021-08-07 16:04:56'),(12,'ACB1245','judgment','2021-08-07','[]',17,'2021-08-07 16:44:31','2021-08-07 16:44:31');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `humans`
--

DROP TABLE IF EXISTS `humans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `humans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` int NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `passport` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother_id` bigint unsigned DEFAULT NULL,
  `father_id` bigint unsigned DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'birth',
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_orphan` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `humans_number_unique` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `humans`
--

LOCK TABLES `humans` WRITE;
/*!40000 ALTER TABLE `humans` DISABLE KEYS */;
INSERT INTO `humans` VALUES (1,'2021-1','2021-08-02',1,'Aýgül','Geldiyewa','Amanowna','TM','Ahal','Ak bugdaý etraby',NULL,2,3,'check',NULL,'2021-08-07 13:34:11','2021-08-07 14:31:10',0),(2,'1980-1','1980-01-31',1,'Merjen','Geldiyewa','Tuwakowna',NULL,NULL,NULL,'I-AS554433',NULL,NULL,'parent',NULL,'2021-08-07 13:34:11','2021-08-07 13:34:11',0),(3,'1979-1','1979-11-29',2,'Aman','Geldiyew','Jumayewic',NULL,NULL,NULL,'I-AS112233',NULL,NULL,'parent',NULL,'2021-08-07 13:34:11','2021-08-07 13:34:11',0),(4,'2021-2','2021-08-03',1,'Aýbölek','Geldiyewa','Amanowna',NULL,NULL,NULL,NULL,2,3,'child',NULL,'2021-08-07 13:41:35','2021-08-07 14:25:19',0),(5,'2021-3','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 15:56:12','2021-08-07 15:56:12',0),(6,'2021-4','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 15:56:48','2021-08-07 15:56:48',0),(7,'2021-5','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 15:57:17','2021-08-07 15:57:17',0),(8,'2021-6','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 15:59:14','2021-08-07 15:59:14',0),(9,'2021-7','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 15:59:23','2021-08-07 15:59:23',0),(10,'2021-8','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 15:59:57','2021-08-07 15:59:57',0),(11,'2021-9','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 16:00:33','2021-08-07 16:00:33',0),(12,'2021-10','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 16:00:52','2021-08-07 16:00:52',0),(13,'2021-11','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 16:03:25','2021-08-07 16:03:25',0),(14,'2021-12','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-07 16:03:40','2021-08-07 16:03:40',0),(15,'2021-13','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'new-name',NULL,'2021-08-07 16:04:07','2021-08-07 16:04:07',0),(16,'2021-14','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'new-name',NULL,'2021-08-07 16:04:56','2021-08-07 16:04:56',0),(17,'2021-15','2021-08-08',2,'Amanow',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'new-name',NULL,'2021-08-07 16:44:00','2021-08-08 03:32:16',1),(18,'2021-16','2021-08-06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-08 04:08:26','2021-08-08 04:08:26',0),(19,'2021-17','2021-08-06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-08 04:08:57','2021-08-08 04:08:57',0),(20,'2021-18','2021-08-06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-08 04:10:49','2021-08-08 04:10:49',0),(21,'2021-19','2021-08-06',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-08 04:15:29','2021-08-08 04:15:29',0),(22,'2021-20','2021-08-06',1,NULL,'Geldiyewa','Amanowna',NULL,NULL,NULL,NULL,2,3,'new-name',NULL,'2021-08-08 04:16:23','2021-08-08 04:16:30',0),(23,'2021-21','2021-08-07',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-08 04:19:09','2021-08-08 04:19:09',0),(24,'1984-1','2021-08-06',1,'Meretgul','Amanowa','Myradowna',NULL,NULL,NULL,'I-AS9876543',NULL,NULL,'parent',NULL,'2021-08-08 04:19:09','2021-08-08 04:20:23',0),(25,'2021-22','2021-08-08',1,NULL,'Geldiyewa','Amanowna',NULL,NULL,NULL,NULL,24,3,'new-name',NULL,'2021-08-08 04:20:23','2021-08-08 04:20:29',0),(26,'2021-23','2021-08-07',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'birth',NULL,'2021-08-08 04:29:10','2021-08-08 04:29:10',0),(27,'2021-24','2021-08-08',1,NULL,'Geldiyewa','Amanowna',NULL,NULL,NULL,NULL,24,3,'new-name',NULL,'2021-08-08 04:32:26','2021-08-08 04:32:26',0),(28,'2021-25','2021-07-31',1,NULL,'Geldiyewa','Amanowna',NULL,NULL,NULL,NULL,24,3,'new-name',NULL,'2021-08-08 04:33:34','2021-08-08 04:33:34',0),(29,'2021-26','2021-08-07',1,NULL,'Geldiyewa','Amanowna',NULL,NULL,NULL,NULL,24,3,'new-name',NULL,'2021-08-08 04:34:48','2021-08-08 04:34:59',0);
/*!40000 ALTER TABLE `humans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,1,'Dolandyryş paneli','','_self','voyager-boat','#000000',NULL,1,'2021-08-06 06:09:44','2021-08-07 11:59:51','voyager.dashboard','null'),(2,1,'Mediýa','','_self','voyager-images','#000000',5,1,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.media.index','null'),(3,1,'Ulanyjylar','','_self','voyager-person','#000000',13,2,'2021-08-06 06:09:44','2021-08-08 01:58:47','voyager.users.index','null'),(4,1,'Rollar','','_self','voyager-lock','#000000',13,1,'2021-08-06 06:09:44','2021-08-08 01:58:45','voyager.roles.index','null'),(5,1,'Gurallar','','_self','voyager-tools','#000000',NULL,4,'2021-08-06 06:09:44','2021-08-08 01:58:59',NULL,''),(6,1,'Menu Builder','','_self','voyager-list',NULL,5,2,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.menus.index',NULL),(7,1,'Database','','_self','voyager-data',NULL,5,3,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.database.index',NULL),(8,1,'Compass','','_self','voyager-compass',NULL,5,4,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.compass.index',NULL),(9,1,'BREAD','','_self','voyager-bread',NULL,5,5,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.bread.index',NULL),(10,1,'Sazlamalar','','_self','voyager-settings','#000000',NULL,5,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.settings.index','null'),(11,1,'Hooks','','_self','voyager-hook',NULL,5,6,'2021-08-06 06:09:44','2021-08-08 01:58:59','voyager.hooks',NULL),(12,1,'Raýatlar','','_self','voyager-group',NULL,NULL,3,'2021-08-08 01:44:17','2021-08-08 01:58:41','voyager.humans.index',NULL),(13,1,'Administrasiýa','','_self','voyager-person','#000000',NULL,2,'2021-08-08 01:58:36','2021-08-08 01:58:41',NULL,''),(14,1,'Hereketler','','_self','voyager-flashlight',NULL,NULL,6,'2021-08-08 03:39:04','2021-08-08 03:39:04','voyager.activity-log.index',NULL);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'admin','2021-08-06 06:09:44','2021-08-06 06:09:44');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2016_01_01_000000_add_voyager_user_fields',1),(5,'2016_01_01_000000_create_data_types_table',1),(6,'2016_05_19_173453_create_menu_table',1),(7,'2016_10_21_190000_create_roles_table',1),(8,'2016_10_21_190000_create_settings_table',1),(9,'2016_11_30_135954_create_permission_table',1),(10,'2016_11_30_141208_create_permission_role_table',1),(11,'2016_12_26_201236_data_types__add__server_side',1),(12,'2017_01_13_000000_add_route_to_menu_items_table',1),(13,'2017_01_14_005015_create_translations_table',1),(14,'2017_01_15_000000_make_table_name_nullable_in_permissions_table',1),(15,'2017_03_06_000000_add_controller_to_data_types_table',1),(16,'2017_04_21_000000_add_order_to_data_rows_table',1),(17,'2017_07_05_210000_add_policyname_to_data_types_table',1),(18,'2017_08_05_000000_add_group_to_settings_table',1),(19,'2017_11_26_013050_add_user_role_relationship',1),(20,'2017_11_26_015000_create_user_roles_table',1),(21,'2018_03_11_000000_add_user_settings',1),(22,'2018_03_14_000000_add_details_to_data_types_table',1),(23,'2018_03_16_000000_make_settings_value_nullable',1),(24,'2019_08_19_000000_create_failed_jobs_table',1),(25,'2019_12_14_000001_create_personal_access_tokens_table',1),(26,'2020_05_21_100000_create_teams_table',1),(27,'2020_05_21_200000_create_team_user_table',1),(28,'2020_05_21_300000_create_team_invitations_table',1),(29,'2021_08_06_110737_create_sessions_table',1),(36,'2021_08_06_132334_create_humans_table',2),(37,'2021_08_07_071011_add_human_to_users',2),(38,'2021_08_07_200757_create_documents_table',3),(39,'2021_08_07_214111_add_orphan_to_humans',4),(40,'2021_08_08_082358_create_activity_log_table',5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_role`
--

DROP TABLE IF EXISTS `permission_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_role` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_role`
--

LOCK TABLES `permission_role` WRITE;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_admin',NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(2,'browse_bread',NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(3,'browse_database',NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(4,'browse_media',NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(5,'browse_compass',NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(6,'browse_menus','menus','2021-08-06 06:09:44','2021-08-06 06:09:44'),(7,'read_menus','menus','2021-08-06 06:09:44','2021-08-06 06:09:44'),(8,'edit_menus','menus','2021-08-06 06:09:44','2021-08-06 06:09:44'),(9,'add_menus','menus','2021-08-06 06:09:44','2021-08-06 06:09:44'),(10,'delete_menus','menus','2021-08-06 06:09:44','2021-08-06 06:09:44'),(11,'browse_roles','roles','2021-08-06 06:09:44','2021-08-06 06:09:44'),(12,'read_roles','roles','2021-08-06 06:09:44','2021-08-06 06:09:44'),(13,'edit_roles','roles','2021-08-06 06:09:44','2021-08-06 06:09:44'),(14,'add_roles','roles','2021-08-06 06:09:44','2021-08-06 06:09:44'),(15,'delete_roles','roles','2021-08-06 06:09:44','2021-08-06 06:09:44'),(16,'browse_users','users','2021-08-06 06:09:44','2021-08-06 06:09:44'),(17,'read_users','users','2021-08-06 06:09:44','2021-08-06 06:09:44'),(18,'edit_users','users','2021-08-06 06:09:44','2021-08-06 06:09:44'),(19,'add_users','users','2021-08-06 06:09:44','2021-08-06 06:09:44'),(20,'delete_users','users','2021-08-06 06:09:44','2021-08-06 06:09:44'),(21,'browse_settings','settings','2021-08-06 06:09:44','2021-08-06 06:09:44'),(22,'read_settings','settings','2021-08-06 06:09:44','2021-08-06 06:09:44'),(23,'edit_settings','settings','2021-08-06 06:09:44','2021-08-06 06:09:44'),(24,'add_settings','settings','2021-08-06 06:09:44','2021-08-06 06:09:44'),(25,'delete_settings','settings','2021-08-06 06:09:44','2021-08-06 06:09:44'),(26,'browse_hooks',NULL,'2021-08-06 06:09:44','2021-08-06 06:09:44'),(27,'browse_humans','humans','2021-08-08 01:44:17','2021-08-08 01:44:17'),(28,'read_humans','humans','2021-08-08 01:44:17','2021-08-08 01:44:17'),(29,'edit_humans','humans','2021-08-08 01:44:17','2021-08-08 01:44:17'),(30,'add_humans','humans','2021-08-08 01:44:17','2021-08-08 01:44:17'),(31,'delete_humans','humans','2021-08-08 01:44:17','2021-08-08 01:44:17'),(32,'browse_activity_log','activity_log','2021-08-08 03:39:04','2021-08-08 03:39:04'),(33,'read_activity_log','activity_log','2021-08-08 03:39:04','2021-08-08 03:39:04'),(34,'edit_activity_log','activity_log','2021-08-08 03:39:04','2021-08-08 03:39:04'),(35,'add_activity_log','activity_log','2021-08-08 03:39:04','2021-08-08 03:39:04'),(36,'delete_activity_log','activity_log','2021-08-08 03:39:04','2021-08-08 03:39:04');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Administrator','2021-08-06 06:09:44','2021-08-06 06:09:44'),(3,'parent','Ene-ata','2021-08-06 07:19:28','2021-08-07 11:57:26'),(4,'children-service','Çagalar öýi','2021-08-06 07:19:28','2021-08-07 11:57:31'),(5,'marriage-registry','Zags wekili','2021-08-06 07:19:28','2021-08-07 11:57:44'),(6,'hospital','Lukman','2021-08-06 07:20:03','2021-08-07 11:57:20');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('1uBQ0hD7ULAbJVVLmNBm1GHG9QHtRzKkHXYEP0eb',1,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiTUtudGNpNFRGbmhudWVMcFRqcEVPWVJFR3I2SzE1Q3FOa0lpOVo5SiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI3OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvYWRtaW4iO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkTzM4eVVsY2pSZjhrSTlKYi8vS2hhT3VUWERRTXpqNDB2ZEpzS1luTnMxV2x3cVdkc0F3Uk8iO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJE8zOHlVbGNqUmY4a0k5SmIvL0toYU91VFhEUU16ajQwdmRKc0tZbk5zMVdsd3FXZHNBd1JPIjt9',1628413406),('n2pcf75R8Nob7walWp2yOimxwrMt99i64st4XMuv',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','YTo4OntzOjY6Il90b2tlbiI7czo0MDoiMW5HSG8xU29WV1JnWURzZ0xvM21mamNVOWpYT1ZaS015aWxQbHBHayI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMyOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvaHVtYW4vbGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToibG9naW4iO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkbGRWc29xaHBUcEQ4OVR2WUdDOXZBZUFvU1FPVWttM09wME9RT01Xb0ozTms5UzQ4RlM2Z08iO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGxkVnNvcWhwVHBEODlUdllHQzl2QWVBb1NRT1VrbTNPcDBPUU9NV29KM05rOVM0OEZTNmdPIjt9',1628414429),('NLH2hrh8cNfw74Xteq6x294OQbT7sxAO9wFLLApH',NULL,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoick14TWYweHBlRnhCb1daU2FrZzNvMUlmYlFDdzhzNnNrWVNrenJxYyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2FkbWluIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1628415425),('wszkmtCFlu8uKmOE7H6FKBGNG9wc2Al8DJnCXtvZ',10,'127.0.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','YTo4OntzOjY6Il90b2tlbiI7czo0MDoidWNNd04xZVMzSUgyQ09VUE9ZOHZpQTBFSk9PVDFjeXlhM2hoQmJMViI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMyOiJodHRwOi8vbG9jYWxob3N0OjgwMDAvaHVtYW4vbGlzdCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NToibG9naW4iO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkbGRWc29xaHBUcEQ4OVR2WUdDOXZBZUFvU1FPVWttM09wME9RT01Xb0ozTms5UzQ4RlM2Z08iO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJGxkVnNvcWhwVHBEODlUdllHQzl2QWVBb1NRT1VrbTNPcDBPUU9NV29KM05rOVM0OEZTNmdPIjt9',1628415299);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'site.title','Site Title','Site Title','','text',1,'Site'),(2,'site.description','Site Description','Site Description','','text',2,'Site'),(3,'site.logo','Site Logo','','','image',3,'Site'),(4,'site.google_analytics_tracking_id','Google Analytics Tracking ID',NULL,'','text',4,'Site'),(5,'admin.bg_image','Admin Background Image','','','image',5,'Admin'),(6,'admin.title','Admin Title','Admin','','text',1,'Admin'),(7,'admin.description','Admin Description','Welcome to Voyager. The Missing Admin for Laravel','','text',2,'Admin'),(8,'admin.loader','Admin Loader','','','image',3,'Admin'),(9,'admin.icon_image','Admin Icon Image','','','image',4,'Admin'),(10,'admin.google_analytics_client_id','Google Analytics Client ID (used for admin dashboard)',NULL,'','text',1,'Admin');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `human_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Agoyli','agoyliq@gmail.com','users/default.png',NULL,'$2y$10$O38yUlcjRf8kI9Jb//KhaOuTXDQMzj40vdJsKYnNs1WlwqWdsAwRO',NULL,NULL,NULL,'{\"locale\":\"en\"}',NULL,NULL,'2021-08-06 06:10:44','2021-08-07 11:56:32',NULL),(9,3,'Geldiyewa Merjen Tuwakowna','agoyliq@ya.ru','users/default.png',NULL,'$2y$10$ldVsoqhpTpD89TvYGC9vAeAoSQOUkm3Op0OQOMWoJ3Nk9S48FS6gO',NULL,NULL,NULL,'{\"locale\":\"en\"}',NULL,NULL,'2021-08-07 04:54:21','2021-08-07 11:56:25',2),(10,6,'Geldiyew Aman Jumayewic','lukman@mail.com','users/default.png',NULL,'$2y$10$ldVsoqhpTpD89TvYGC9vAeAoSQOUkm3Op0OQOMWoJ3Nk9S48FS6gO','eyJpdiI6Ii8wMkY4REpPdVY4c1crbm05ZVdSNUE9PSIsInZhbHVlIjoiWmtncWdGb29kZjlzY0w1OTJRZ0xWSFcreXhwckwzdFBYVkhNWGkxenhiWT0iLCJtYWMiOiI3MjJkYzNjMTAxZjU5MmQ0ZTdlNWFkMjM1NmJjOWNlZmFkZDI2MjY3MmNjMzYzMDNmZGU5NWE3NmE0Yjk5N2YzIn0=','eyJpdiI6IkMxbzZPcllMYlBVdldZaW16a3FpUmc9PSIsInZhbHVlIjoiQ3dIbjRRUlZsZ05WVG9Gblcza1dzRUdqT3dJSXF1MDRvTUhWeDZtSC9vRDlUaWNsYlNMZWZEbEt6bk9Sa2gwSk9kMU1mYy9UUDAvQ2M0MVRoSUtpdUxFekNlOWgwQkQwd0k3OUxhSUxETzBzTFdNZmNHa1I5WDUrZTEzY3hiMEhJRFl4ck5qcUJvN3lkMm4wSFgzeFJWZFVxSkdWc2ZBY241b2ZLS04rdjNhK3BjS2lkM0pna1UyLy9MU2lZQks1SDFpWUNvMlI0MUZyVTlkMy82WlVCYkEzVHNoNkV0eVh4TE9EVi81NDVQV2Z1S2lzTkJxZitLZzAvQmlFK3VOOUxKSm1td3luQ0RYYWpxVUtuR241ZUE9PSIsIm1hYyI6IjVkZmQ4ZDNkZjhiMThkZDU3YzVlNWZhMmJkZjA5ZThjMjkxZWUzNzkwOWMyY2JlZTQ3ZGRiOGE5YzVlN2U2NTkifQ==',NULL,NULL,NULL,NULL,'2021-08-07 09:11:27','2021-08-07 12:04:40',NULL),(11,4,'Meredowa Amangözel','cagalar@mail.com','users/default.png',NULL,'$2y$10$ZYG2kxuP2M1Zwj.q00pfre3w..kyO81Zeykq86AqpCaeQYT107pAS',NULL,NULL,NULL,'{\"locale\":\"en\"}',NULL,NULL,'2021-08-07 11:58:35','2021-08-07 11:58:35',NULL),(12,5,'Magtymow Myrat','zags@mail.com','users/default.png',NULL,'$2y$10$mdXKJM1BbSLJMQPkkgAwi.u3cSh6evqYQzcwu.MctMLsOidX/3tAe',NULL,NULL,NULL,'{\"locale\":\"en\"}',NULL,NULL,'2021-08-07 11:59:12','2021-08-07 11:59:12',NULL),(13,3,'Geldiyewa Merjen Tuwakowna','agoyliq@yandex.tm','users/default.png',NULL,'$2y$10$tiofUt9nrkQ/aqxJh2ifOu8wgmSY2tw3CcQD0z/TyqWYVFai3pfYW',NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-07 13:34:11','2021-08-07 13:34:11',2),(14,3,'Geldiyew Aman Jumayewic','agoyliq@yandex.ua','users/default.png',NULL,'$2y$10$iL12lCeC9ed0qbFlFPXLYOMufnyoOQc9Hslqo9CV420kL1uMw5NTG',NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-07 13:34:11','2021-08-07 13:34:11',3),(19,3,'Amanowa Meretgul Myradowna','agoyliq@yandex.com','users/default.png',NULL,'$2y$10$2dChs51Vm.gOgVY3nJFfMeyt.Bg1eSe/U.2VcwxQuO8lXo7d58kHG',NULL,NULL,NULL,NULL,NULL,NULL,'2021-08-08 04:34:48','2021-08-08 04:34:48',24);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-08 14:38:14
